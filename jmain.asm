;compile to this filename
!to "jmain.prg",cbm

;define constants here

;placeholder for various temp parameters
PARAM1                  = $03
PARAM2                  = $04
PARAM3                  = $05
PARAM4                  = $06
PARAM5                  = $07

;placeholder for zero page pointers
ZEROPAGE_POINTER_1      = $17
ZEROPAGE_POINTER_2      = $19
ZEROPAGE_POINTER_3      = $21
ZEROPAGE_POINTER_4      = $23

;address of the screen buffer
SCREEN_CHAR             = $CC00

;address of color ram
SCREEN_COLOR            = $D800

;address of sprite pointers
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4 = 1

;sprite number constant
SPRITE_BASE             = 64

SPRITE_PLAYER           = SPRITE_BASE + 0


;level data constants
LD_END                  = 0
LD_LINE_H               = 1
LD_LINE_V               = 2

;this creates a basic start
*=$0801

          ;SYS 2064
          !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00

          ;init sprite registers
          ;no visible sprites
          lda #0
          sta 53248 + 21
          
          ;set charset
          lda #$3c
          sta 53272

          ;VIC bank
          lda 56576
          and #$fc
          sta 56576

          ;----------------------------------
          ;copy charset and sprites to target          
          ;----------------------------------
          
          ;block interrupts 
          ;since we turn ROMs off this would result in crashes if we didn't
          sei
          
          ;save old configuration
          lda $01
          sta PARAM1
          
          ;only RAM
          ;to copy under the IO rom
          lda #%00110000
          sta $01
          
          ;take source address from CHARSET
          LDA #<CHARSET
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET
          STA ZEROPAGE_POINTER_1 + 1
          
          ;now copy
          jsr CopyCharSet
          
          ;take source address from SPRITES
          lda #<SPRITES
          sta ZEROPAGE_POINTER_1
          lda #>SPRITES
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr CopySprites
          
          ;restore ROMs
          lda PARAM1
          sta $01
          
          cli
          
          ;background black
          lda #0			
          sta 53281
          
          ;set charset multi colors
          lda #12
          sta 53282
          lda #8
          sta 53283
          ;enable multi color charset
          lda 53270
          ora #$10
          sta 53270
          
          ;setup level
          lda #0			; start with level 0
          sta LEVEL_NR		; this is a global variable
          jsr BuildScreen	; build this screen
          
          ;init sprite 1 pos
          lda #100
          sta 53248
          sta 53248 + 1
          sta SPRITE_POS_X
          sta SPRITE_POS_Y
          
          ;set sprite image
          lda #SPRITE_PLAYER
          sta SPRITE_POINTER_BASE
          
          ;enable sprite 1
          lda #1
          sta 53248 + 21
          

;------------------------------------------------------------
;the main game loop
;------------------------------------------------------------

GameLoop  
          jsr WaitFrame

          jsr PlayerControl
          
          jmp GameLoop          
          
          
;------------------------------------------------------------
;check joystick (player control)
;------------------------------------------------------------
!zone PlayerControl
PlayerControl
          lda #$02
          bit $dc00
          bne .NotDownPressed
          jsr PlayerMoveDown
          
.NotDownPressed          
          lda #$01
          bit $dc00
          bne .NotUpPressed
          jsr PlayerMoveUp
          
.NotUpPressed          
          lda #$04
          bit $dc00
          bne .NotLeftPressed
          jsr PlayerMoveLeft
          
.NotLeftPressed
          lda #$08
          bit $dc00
          bne .NotRightPressed
          jsr PlayerMoveRight

.NotRightPressed
          rts

PlayerMoveLeft
          ldx #0
          jsr MoveSpriteLeft
          rts
          
PlayerMoveRight
          ldx #0
          jsr MoveSpriteRight
          rts

PlayerMoveUp
          ldx #0
          jsr MoveSpriteUp
          rts
          
PlayerMoveDown
          ldx #0
          jsr MoveSpriteDown
          rts

;------------------------------------------------------------
;Move Sprite Left
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteLeft
MoveSpriteLeft
          dec SPRITE_POS_X,x
          bpl .NoChangeInExtendedFlag
          
          lda BIT_TABLE,x
          eor #$ff
          and SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta 53248 + 16
          
.NoChangeInExtendedFlag     
          txa
          asl
          tay
          
          lda SPRITE_POS_X,x
          sta 53248,y
          rts  

;------------------------------------------------------------
;Move Sprite Right
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteRight
MoveSpriteRight
          inc SPRITE_POS_X,x
          lda SPRITE_POS_X,x
          bne .NoChangeInExtendedFlag
          
          lda BIT_TABLE,x
          ora SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta 53248 + 16
          
.NoChangeInExtendedFlag     
          txa
          asl
          tay
          
          lda SPRITE_POS_X,x
          sta 53248,y
          rts  

;------------------------------------------------------------
;Move Sprite Up
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteUp
MoveSpriteUp
          dec SPRITE_POS_Y,x
          
          txa
          asl
          tay
          
          lda SPRITE_POS_Y,x
          sta 53249,y
          rts  

;------------------------------------------------------------
;Move Sprite Down
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteDown
MoveSpriteDown
          inc SPRITE_POS_Y,x
          
          txa
          asl
          tay
          
          lda SPRITE_POS_Y,x
          sta 53249,y
          rts  


;------------------------------------------------------------
;BuildScreen
;creates a screen from level data
;------------------------------------------------------------
!zone BuildScreen
BuildScreen
          lda #0						; a = character (this must be defined as empty)
          ldy #6						; y = color (6 = green)
          jsr ClearPlayScreen

          ;get pointer to real level data from table
          ldx LEVEL_NR					; this is the global level nr
          lda SCREEN_DATA_TABLE,x		; get the low byte of the address of the data
          sta ZEROPAGE_POINTER_1		; store in ZP pointer 1
          lda SCREEN_DATA_TABLE + 1,x 	; same for the high part
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr .BuildLevel				; then build the level

          ;get pointer to real level data from table
          lda #<LEVEL_BORDER_DATA		; get the low byte of the address of level border data
          sta ZEROPAGE_POINTER_1		; but do it directly because it's always the same
          lda #>LEVEL_BORDER_DATA
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr .BuildLevel				; build level means push it to the screen...
          rts							; and we're done
          
.BuildLevel
          ;work through data
          ldy #255						; whatever we do, do it 256 times. 
          
.LevelDataLoop
          iny							; on first pass y goes to 0 here.
          								; levels are coded to save space. We 'decode' them.
          lda (ZEROPAGE_POINTER_1),y 	; get the data from zp_1 indexed by y
          cmp #LD_END					; are we at the end byte yet? must be marked!
          beq .LevelComplete			; we're done
          cmp #LD_LINE_H				; drawing a horizontal line?
          beq .LineH					; then do that
          cmp #LD_LINE_V				; a vertical line?
          beq .LineV					; then do that
          
.LevelComplete          
          rts							; anything else means we're done
          
.NextLevelData
          pla							; a becomes the index into the level data table
          
          ;adjust pointers so we're able to access more 
          ;than 256 bytes of level data
          clc
          adc #1						; increase the index by 1
          adc ZEROPAGE_POINTER_1		; ZP1 is the level data. add the low byte
          sta ZEROPAGE_POINTER_1		; store it back into ZP1
          lda ZEROPAGE_POINTER_1 + 1	; get the high byte
          adc #0						; add (with carry!) so a + 0 + Carry
          sta ZEROPAGE_POINTER_1 + 1	; and store the result in the high part of ZP1
          ldy #255						; get y ready at $ff (like before) and start over
          
          jmp .LevelDataLoop

.LineH									; this draws a horizontal line
          ;X pos
          iny							; increase the index
          lda (ZEROPAGE_POINTER_1),y	; this address holds the x coordinate
          sta PARAM1 					; PARAM1 is x coordinate
          
          ;Y pos
          iny							; next item in data is Y pos
          lda (ZEROPAGE_POINTER_1),y	; get it from the table
          sta PARAM2					; PARAM2 is y coordinate

          ;width
          iny							; next item in datatable
          lda (ZEROPAGE_POINTER_1),y	; how wide is the horizontal line?
          sta PARAM3					; store it in PARAM3
          
          ;char
          iny							; next item in datatable
          lda (ZEROPAGE_POINTER_1),y	; which character are we drawing?
          sta PARAM4					; PARAM4 is the character
          
          ;color
          iny							; next item is color
          lda (ZEROPAGE_POINTER_1),y	; get it
          sta PARAM5					; PARAM5 is color
          
          ;store target pointers to screen and color ram
          ldx PARAM2						; PARAM2 is the Y position
          lda SCREEN_LINE_OFFSET_TABLE_LO,x	; low byte of address first char on this line
          sta ZEROPAGE_POINTER_2			; store in ZP2 and ZP3
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x	; high byte of address first char on this line
          sta ZEROPAGE_POINTER_2 + 1		; store in ZP2
          clc								; clear the carry
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8 ; ???
		  ; the result is always a fixed number: 
		  ; (($D800-$CC00)&0XFF00)>>8
		  ; ($C00 & 0XFF00) >> 8
		  ; $C00 >> 8
		  ; $0C ... always the same, why?
          sta ZEROPAGE_POINTER_3 + 1
		  ; so, if A holds $CC (hi part of address first char on screen) and we add $0c
		  ; we get $d8 for the hi part of the first address of the color ram. which is correct
		  ; This way the code is portable: SCREEN_CHAR can be changed, code will still work.
          
          tya								; save y (index into level data table)
          pha								; to the stack
          
          ldy PARAM1						; make y the x coordinate
.NextChar          
          lda PARAM4						; PARAM4 is the character
          sta (ZEROPAGE_POINTER_2),y		; screenline, add x-coordinate
          lda PARAM5						; PARAM5 is the color
          sta (ZEROPAGE_POINTER_3),y		; color, add x-coordinate
          iny								; loop through the number of characters
          dec PARAM3						; PARAM3 is the number of chars to print
          bne .NextChar						; page boundary check not required. 0>=y<=255
          
          jmp .NextLevelData
          
.LineV
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;height
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          
          ;char
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM4
          
          ;color
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM5
          
          ;store target pointers to screen and color ram
          ldx PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          
          tya
          pha
          
          ldy PARAM1								; x-position
.NextCharV         
          lda PARAM4								; char
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5								; color
          sta (ZEROPAGE_POINTER_3),y
          
          ;adjust pointer
          lda ZEROPAGE_POINTER_2					; vertical line so 
          clc										; add 40 
          adc #40
          sta ZEROPAGE_POINTER_2					; this takes care of the low bytes
          sta ZEROPAGE_POINTER_3					; of color and character pointers
          lda ZEROPAGE_POINTER_2 + 1				; now the high bytes
          adc #0									; add with carry again
          sta ZEROPAGE_POINTER_2 + 1				; for when we cross a page boundary
          clc										; do the same for the color pointer
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1				; this works like explained before (detour)
          
          dec PARAM3								; do this for the amount of characters
          bne .NextCharV							; required.
          
          jmp .NextLevelData
          
          
!zone WaitFrame
          ;wait for the raster to reach line $f8
          ;this is keeping our timing stable
          
          ;are we on line $F8 already? if so, wait for the next full screen
          ;prevents mistimings if called too fast
WaitFrame 
          lda $d012
          cmp #$F8
          beq WaitFrame

          ;wait for the raster to reach line $f8 (should be closer to the start of this line this way)
.WaitStep2
          lda $d012
          cmp #$F8
          bne .WaitStep2
          
          rts


;------------------------------------------------------------
;clears the play area of the screen
;A = char
;Y = color
;------------------------------------------------------------

!zone ClearPlayScreen
ClearPlayScreen
            ldx #$00
.ClearLoop          
            sta SCREEN_CHAR,x
            sta SCREEN_CHAR + 220,x
            sta SCREEN_CHAR + 440,x
            sta SCREEN_CHAR + 660,x
            inx
            cpx #220
            bne .ClearLoop
            
            tya
            ldx #$00
.ColorLoop          
            sta $d800,x
            sta $d800 + 220,x
            sta $d800 + 440,x
            sta $d800 + 660,x
            inx
            cpx #220							; the play screen is smaller than 
            bne .ColorLoop						; 1000 bytes (1000-880=120 or 3 lines of 40)
            
            rts


;------------------------------------------------------------
;copies charset from ZEROPAGE_POINTER_1 to ZEROPAGE_POINTER_2
;------------------------------------------------------------

!zone CopyCharSet
CopyCharSet
          ;set target address ($F000)
          lda #$00
          sta ZEROPAGE_POINTER_2
          lda #$F0
          sta ZEROPAGE_POINTER_2 + 1

          ldx #$00
          ldy #$00
          lda #0
          sta PARAM2

.NextLine
          lda (ZEROPAGE_POINTER_1),Y
          sta (ZEROPAGE_POINTER_2),Y
          inx
          iny
          cpx #$08
          bne .NextLine
          cpy #$00
          bne .PageBoundaryNotReached
          
          ;we've reached the next 256 bytes, inc high byte
          inc ZEROPAGE_POINTER_1 + 1
          inc ZEROPAGE_POINTER_2 + 1

.PageBoundaryNotReached

          ;only copy 254 chars to keep irq vectors intact
          inc PARAM2
          lda PARAM2
          cmp #254
          beq .CopyCharsetDone
          ldx #$00
          jmp .NextLine

.CopyCharsetDone
          rts


;------------------------------------------------------------
;copies sprites from ZEROPAGE_POINTER_1 to ZEROPAGE_POINTER_2
;       sprites are copied in numbers of four
;------------------------------------------------------------

!zone CopySprites
CopySprites
          ldy #$00
          ldx #$00
          
          lda #00
          sta ZEROPAGE_POINTER_2
          lda #$d0
          sta ZEROPAGE_POINTER_2 + 1
          
          ;4 sprites per loop
.SpriteLoop
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_2),y
          iny
          bne .SpriteLoop
          inx
          inc ZEROPAGE_POINTER_1+1
          inc ZEROPAGE_POINTER_2+1
          cpx #NUMBER_OF_SPRITES_DIV_4
          bne .SpriteLoop

          rts
          
;------------------------------------------------------------
;screen data
;------------------------------------------------------------
SCREEN_DATA_TABLE
          !word LEVEL_2
          !word 0
                    
LEVEL_1
          !byte LD_LINE_H,5,5,10,128,9
          !byte LD_LINE_H,30,12,9,129,9
          !byte LD_LINE_H,10,19,20,128,9
          !byte LD_LINE_V,7,6,4,128,9
          !byte LD_END

LEVEL_2
          !byte LD_LINE_H,1,5,30,128,9
          !byte LD_LINE_H,1,6,30,128,9
          !byte LD_LINE_H,1,7,30,128,9		  
          !byte LD_END
		  
LEVEL_BORDER_DATA
          !byte LD_LINE_H,0,0,40,129,9
          !byte LD_LINE_H,1,22,38,129,9
          !byte LD_LINE_V,0,1,22,128,9
          !byte LD_LINE_V,39,1,22,128,9
          !byte LD_END

;------------------------------------------------------------
;game variables
;------------------------------------------------------------

LEVEL_NR  
          !byte 0
SPRITE_POS_X
          !byte 0,0,0,0,0,0,0,0
SPRITE_POS_X_EXTEND
          !byte 0
SPRITE_POS_Y
          !byte 0,0,0,0,0,0,0,0
BIT_TABLE
          !byte 1,2,4,8,16,32,64,128
          
SCREEN_LINE_OFFSET_TABLE_LO
          !byte ( SCREEN_CHAR +   0 ) & 0x00ff
          !byte ( SCREEN_CHAR +  40 ) & 0x00ff
          !byte ( SCREEN_CHAR +  80 ) & 0x00ff
          !byte ( SCREEN_CHAR + 120 ) & 0x00ff
          !byte ( SCREEN_CHAR + 160 ) & 0x00ff
          !byte ( SCREEN_CHAR + 200 ) & 0x00ff
          !byte ( SCREEN_CHAR + 240 ) & 0x00ff
          !byte ( SCREEN_CHAR + 280 ) & 0x00ff
          !byte ( SCREEN_CHAR + 320 ) & 0x00ff
          !byte ( SCREEN_CHAR + 360 ) & 0x00ff
          !byte ( SCREEN_CHAR + 400 ) & 0x00ff
          !byte ( SCREEN_CHAR + 440 ) & 0x00ff
          !byte ( SCREEN_CHAR + 480 ) & 0x00ff
          !byte ( SCREEN_CHAR + 520 ) & 0x00ff
          !byte ( SCREEN_CHAR + 560 ) & 0x00ff
          !byte ( SCREEN_CHAR + 600 ) & 0x00ff
          !byte ( SCREEN_CHAR + 640 ) & 0x00ff
          !byte ( SCREEN_CHAR + 680 ) & 0x00ff
          !byte ( SCREEN_CHAR + 720 ) & 0x00ff
          !byte ( SCREEN_CHAR + 760 ) & 0x00ff
          !byte ( SCREEN_CHAR + 800 ) & 0x00ff
          !byte ( SCREEN_CHAR + 840 ) & 0x00ff
          !byte ( SCREEN_CHAR + 880 ) & 0x00ff
          !byte ( SCREEN_CHAR + 920 ) & 0x00ff
          !byte ( SCREEN_CHAR + 960 ) & 0x00ff
SCREEN_LINE_OFFSET_TABLE_HI
          !byte ( ( SCREEN_CHAR +   0 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR +  40 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR +  80 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 120 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 160 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 200 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 240 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 280 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 320 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 360 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 400 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 440 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 480 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 520 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 560 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 600 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 640 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 680 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 720 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 760 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 800 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 840 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 880 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 920 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 960 ) & 0xff00 ) >> 8

CHARSET
          !binary "j.chr"
          
SPRITES
          !binary "j.spr"