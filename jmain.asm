;compile to this filename
!to "jmain.prg",cbm

;define constants here
VIC_SPRITE_X_POS        = $d000
VIC_SPRITE_Y_POS        = $d001
VIC_SPRITE_X_EXTEND     = $d010
VIC_SPRITE_ENABLE       = $d015
VIC_CONTROL             = $d016
VIC_MEMORY_CONTROL      = $d018

VIC_BACKGROUND_COLOR    = $d021
VIC_CHARSET_MULTICOLOR_1= $d022
VIC_CHARSET_MULTICOLOR_2= $d023

CIA_PRA                 = $dd00

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

;offset from calculated char pos to true sprite pos
SPRITE_CENTER_OFFSET_X  = 8
SPRITE_CENTER_OFFSET_Y  = 11


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
          sta VIC_SPRITE_ENABLE
          
          ;set charset
          lda #$3c
          sta VIC_MEMORY_CONTROL

          ;VIC bank
          lda CIA_PRA
          and #$fc
          sta CIA_PRA

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
          sta VIC_BACKGROUND_COLOR
          
          ;set charset multi colors
          lda #12
          sta VIC_CHARSET_MULTICOLOR_1
          lda #8
          sta VIC_CHARSET_MULTICOLOR_2
          ;enable multi color charset
          lda VIC_CONTROL
          ora #$10
          sta VIC_CONTROL
          
          ;setup level
          lda #0
          sta LEVEL_NR
          jsr BuildScreen
          
          ;set sprite flags
          lda #0
          sta VIC_SPRITE_X_EXTEND
          
          ;init sprite 1 pos
          lda #1
          sta PARAM1						; char x
          lda #2
          sta PARAM2						; char y
          ldx #0							; x = sprite index
          
          jsr CalcSpritePosFromCharPos
          
          lda #100
          ;sta VIC_SPRITE_X_POS
          ;sta VIC_SPRITE_Y_POS
          ;sta SPRITE_POS_X
          ;sta SPRITE_POS_Y
          
          ;set sprite image
          lda #SPRITE_PLAYER
          sta SPRITE_POINTER_BASE
          
          ;enable sprite 1
          lda #1
          sta VIC_SPRITE_ENABLE
          

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

;------------------------------------------------------------
;PlayerMoveLeft
;------------------------------------------------------------
!zone PlayerMoveLeft
PlayerMoveLeft
          ldx #0
          
          lda SPRITE_CHAR_POS_X_DELTA				; sprite 0, always player (tricky)
          beq .CheckCanMoveLeft						; is the sprite at a character edge?
          											; we only check when we're at an edge
.CanMoveLeft
          dec SPRITE_CHAR_POS_X_DELTA				; decrease in-character delta
          
          jsr MoveSpriteLeft						; and move the sprite left
          rts
          
.CheckCanMoveLeft
          lda SPRITE_CHAR_POS_Y_DELTA				; get the Y in-char delta
          beq .NoThirdCharCheckNeeded				; are we at a vertical edge?
          											; if so, check the bottom left first
          ldy SPRITE_CHAR_POS_Y						; get the char y pos
          lda SCREEN_LINE_OFFSET_TABLE_LO,y			; get the address of char 1 of line
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          lda SPRITE_CHAR_POS_X						; get the char x pos
          clc										; add 39 (down and left)
          adc #39									; check at our feet
          tay
          
          lda (ZEROPAGE_POINTER_1),y				; get the char there
          
          jsr IsCharBlocking						; is it blocking?
          bne .BlockedLeft
          
.NoThirdCharCheckNeeded          					; either from feet or middle UP
          ldy SPRITE_CHAR_POS_Y						; get the char y pos
          dey										; decrease (1 line up)
          lda SCREEN_LINE_OFFSET_TABLE_LO,y			; get the address of char 1 of line
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X						; get the char x pos
          dey										; decrease (1 left)
          
          lda (ZEROPAGE_POINTER_1),y				; get the character there
          
          jsr IsCharBlocking						; is it blocking?
          bne .BlockedLeft
          
          tya										; and then 1 line down
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedLeft
          
          
          lda #8									; we were always flush
          sta SPRITE_CHAR_POS_X_DELTA				; so set delta to 8
          dec SPRITE_CHAR_POS_X						; decrease x position
          jmp .CanMoveLeft							; can move left will dec delta to 7
          
.BlockedLeft
          rts

          
;------------------------------------------------------------
;PlayerMoveRight
;------------------------------------------------------------
!zone PlayerMoveRight
PlayerMoveRight
          ldx #0								; init x to 0 (sprite#?)
          
          lda SPRITE_CHAR_POS_X_DELTA			; get the player x delta
          beq .CheckCanMoveRight				; if we're flush then check
          
.CanMoveRight									; not at a char edge
          inc SPRITE_CHAR_POS_X_DELTA			; inc x delta by 1 pixel
          
          lda SPRITE_CHAR_POS_X_DELTA			; load it
          cmp #8								; full char now?
          bne .NoCharStep						; no, then nothing
          
          lda #0								; yes, set x delta to 0
          sta SPRITE_CHAR_POS_X_DELTA			; store
          inc SPRITE_CHAR_POS_X					; inc char x position
          
.NoCharStep          
          jsr MoveSpriteRight					; move the sprite
          rts
          
.CheckCanMoveRight
          lda SPRITE_CHAR_POS_Y_DELTA			; first get the y delta
          beq .NoThirdCharCheckNeeded			; third char check?
          
		  ; the code below appears to check what is blocking our feet/
		  ; lower part of the hit box. One below and to the right.
          ldy SPRITE_CHAR_POS_Y					; get char y coordinate
          iny									; increase it (next line)
          lda SCREEN_LINE_OFFSET_TABLE_LO,y		; get the address
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X					; get char x coordinate
          iny									; increase it (right)
          
          lda (ZEROPAGE_POINTER_1),y			; get the character there
          
          jsr IsCharBlocking					; does it block?
          bne .BlockedRight
          
.NoThirdCharCheckNeeded          

		  ; the code below checks if the char to our right and above
		  ; blocks or not
          ldy SPRITE_CHAR_POS_Y					; get our char y coordinate
          dey									; decrease it (1 line up)
          lda SCREEN_LINE_OFFSET_TABLE_LO,y		; get the screen address
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X					; get the char x coordinate
          iny									; increase it (up & right)
          lda (ZEROPAGE_POINTER_1),y			; get the character there
          
          jsr IsCharBlocking					; does it block?
          bne .BlockedRight
          
          tya									; y was our x position
          clc
          adc #40								; add 40 (right & 1 line down)
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedRight
          
          jmp .CanMoveRight
          
.BlockedRight
          rts
          

;------------------------------------------------------------
;PlayerMoveUp
;------------------------------------------------------------
!zone PlayerMoveUp
PlayerMoveUp
          ldx #0
          
          lda SPRITE_CHAR_POS_Y_DELTA
          beq .CheckCanMoveUp
          
.CanMoveUp
          dec SPRITE_CHAR_POS_Y_DELTA
          
          lda SPRITE_CHAR_POS_Y_DELTA
          cmp #$ff
          bne .NoCharStep
          
          dec SPRITE_CHAR_POS_Y
          lda #7
          sta SPRITE_CHAR_POS_Y_DELTA
          
.NoCharStep          
          jsr MoveSpriteUp
          rts
          
.CheckCanMoveUp
          lda SPRITE_CHAR_POS_X_DELTA
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y
          dey
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedUp
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y
          dey
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedUp
          
          jmp .CanMoveUp
          
.BlockedUp
          rts
          
          
;------------------------------------------------------------
;PlayerMoveDown
;------------------------------------------------------------
!zone PlayerMoveDown
PlayerMoveDown
          ldx #0
          
          lda SPRITE_CHAR_POS_Y_DELTA
          beq .CheckCanMoveDown
          
.CanMoveDown
          inc SPRITE_CHAR_POS_Y_DELTA
          
          lda SPRITE_CHAR_POS_Y_DELTA
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA
          inc SPRITE_CHAR_POS_Y
          
.NoCharStep          
          jsr MoveSpriteDown
          rts
          
.CheckCanMoveDown
          lda SPRITE_CHAR_POS_X_DELTA
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedDown
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedDown
          
          jmp .CanMoveDown
          
.BlockedDown
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
          sta VIC_SPRITE_X_EXTEND
          
.NoChangeInExtendedFlag     
          txa
          asl
          tay
          
          lda SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
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
          sta VIC_SPRITE_X_EXTEND
          
.NoChangeInExtendedFlag     
          txa
          asl
          tay
          
          lda SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
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
;IsCharBlocking
;checks if a char is blocking
;PARAM1 = char_pos_x
;PARAM2 = char_pos_y
;returns 1 for blocking, 0 for not blocking
;------------------------------------------------------------
!zone IsCharBlocking
IsCharBlocking
          cmp #128
          bpl .Blocking
          
          lda #0
          rts
          
.Blocking
          lda #1
          rts


;------------------------------------------------------------
;CalcSpritePosFromCharPos
;calculates the real sprite coordinates from screen char pos
;PARAM1 = char_pos_x
;PARAM2 = char_pos_y
;X      = sprite index
;------------------------------------------------------------
!zone CalcSpritePosFromCharPos    
CalcSpritePosFromCharPos

          ;offset screen to border 24,50
		  ; the first visible dot is at x=24, y=50
          lda BIT_TABLE,x						; first clear the extend bit
          eor #$ff								; for this sprite.
          and SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND				; extend beyond x=$ff bit per sprite
          
          ;need extended x bit?
          lda PARAM1							; take the x pos (char)
          sta SPRITE_CHAR_POS_X,x				; store it in our table
          cmp #30								; compare to 30
          bcc .NoXBit							; smaller? no extend, otherwise yes
          
          lda BIT_TABLE,x						; get the correct bit value (again)
          ora SPRITE_POS_X_EXTEND				; or it with the current value
          sta SPRITE_POS_X_EXTEND				; and store it in our table
          sta VIC_SPRITE_X_EXTEND				; tell VIC2 as well
          
.NoXBit   
          ;calculate sprite positions (offset from border)
          txa										; sprite index * 2 
          asl										; for the correct address to store
          tay										; sprite coordinate in
          
		  											; 
          lda PARAM1								; x position (character)
          asl										; times 8 (8 bits per char)
          asl										; 
          asl
          clc										; add the border offset
          adc #( 24 - SPRITE_CENTER_OFFSET_X )		; sub the center offset
          sta SPRITE_POS_X,x						; store x in our table
          sta VIC_SPRITE_X_POS,y					; tell VIC2 as well
          
          lda PARAM2								; same story for y 
          sta SPRITE_CHAR_POS_Y,x
          asl
          asl
          asl
          clc
          adc #( 50 - SPRITE_CENTER_OFFSET_Y )
          sta SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS, y 					; 53249
          
          lda #0									; set the x and y delta
          sta SPRITE_CHAR_POS_X_DELTA,x				; to zero for this sprite
          sta SPRITE_CHAR_POS_Y_DELTA,x
          rts

;------------------------------------------------------------
;BuildScreen
;creates a screen from level data
;------------------------------------------------------------
!zone BuildScreen
BuildScreen
          lda #0
          ldy #6
          jsr ClearPlayScreen

          ;get pointer to real level data from table
          ldx LEVEL_NR
          lda SCREEN_DATA_TABLE,x
          sta ZEROPAGE_POINTER_1
          lda SCREEN_DATA_TABLE + 1,x
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr .BuildLevel

          ;get pointer to real level data from table
          lda #<LEVEL_BORDER_DATA
          sta ZEROPAGE_POINTER_1
          lda #>LEVEL_BORDER_DATA
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr .BuildLevel
          rts
          
.BuildLevel
          ;work through data
          ldy #255
          
.LevelDataLoop
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          cmp #LD_END
          beq .LevelComplete
          cmp #LD_LINE_H
          beq .LineH
          cmp #LD_LINE_V
          beq .LineV
          
.LevelComplete          
          rts
          
.NextLevelData
          pla
          
          ;adjust pointers so we're able to access more 
          ;than 256 bytes of level data
          clc
          adc #1
          adc ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_1
          lda ZEROPAGE_POINTER_1 + 1
          adc #0
          sta ZEROPAGE_POINTER_1 + 1
          ldy #255
          
          jmp .LevelDataLoop

.LineH
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;width
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
          
          ldy PARAM1
.NextChar          
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          iny
          dec PARAM3
          bne .NextChar
          
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
          
          ldy PARAM1
.NextCharV         
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          
          ;adjust pointer
          lda ZEROPAGE_POINTER_2
          clc
          adc #40
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda ZEROPAGE_POINTER_2 + 1
          adc #0
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          
          dec PARAM3
          bne .NextCharV
          
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
            cpx #220
            bne .ColorLoop
            
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
          !word LEVEL_1
          !word 0
          
          
LEVEL_1
          !byte LD_LINE_H,5,5,10,128,9
          !byte LD_LINE_H,30,12,9,129,9
          !byte LD_LINE_H,10,19,20,128,9
          !byte LD_LINE_V,7,6,4,128,9
          !byte LD_END


LEVEL_BORDER_DATA
          !byte LD_LINE_H,0,0,40,128,9
          !byte LD_LINE_H,1,22,38,129,9
          !byte LD_LINE_V,0,1,22,128,9
          !byte LD_LINE_V,39,1,22,129,9
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
SPRITE_CHAR_POS_X
          !byte 0,0,0,0,0,0,0,0
SPRITE_CHAR_POS_X_DELTA
          !byte 0,0,0,0,0,0,0,0
SPRITE_CHAR_POS_Y
          !byte 0,0,0,0,0,0,0,0
SPRITE_CHAR_POS_Y_DELTA
          !byte 0,0,0,0,0,0,0,0
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