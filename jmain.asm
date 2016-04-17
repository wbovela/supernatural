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
SCREEN_CHAR          = 52224

;address of color ram
SCREEN_COLOR            = $d800

;address of sprite pointers
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4 = 1

;sprite number constants
SPRITE_BASE             = 64

SPRITE_PLAYER           = SPRITE_BASE + 0


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
          
          ;test charset
          lda #'H'
          sta SCREEN_CHAR
          lda #'E'
          sta SCREEN_CHAR + 1
          lda #'L'
          sta SCREEN_CHAR + 2
          sta SCREEN_CHAR + 3
          lda #'O'
          sta SCREEN_CHAR + 4
          
          ;set char color to white
          lda #1
          sta SCREEN_COLOR
          sta SCREEN_COLOR + 1
          sta SCREEN_COLOR + 2
          sta SCREEN_COLOR + 3
          sta SCREEN_COLOR + 4
          
          
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
          bpl .NoChangeInExtendedFlag ; %11111111
          
          ; player sprite NEVER moves to x=0 at left of screen due to level design
          ; sprite has moved left across x=255 limit
          ; clear the appropriate bit in SPRITE_POS_X_EXTEND to 0
          lda BIT_TABLE,x 
          eor #$ff
          and SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta $D010 ; 53248 + 16 holds ninth bit for each sprite's x position 
          
.NoChangeInExtendedFlag     
          txa ; move x to a
          asl ; multiply a by two
          tay ; move a to y. y now points to correct register for sprite's coordinate
          
          lda SPRITE_POS_X,x
          sta 53248,y ; each sprite has x,y (two bytes)
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
          
          ; player sprite NEVER moves to max screen position due to level design
          ; sprite has moved right across x=255 limit
          ; set appropriate bit in SPRITE_POS_X_EXTEND to 1
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
          asl ; %00000001 -> asl -> %00000010  
          tay
          
          lda SPRITE_POS_Y,x
          sta 53249,y   ; $D000 = x sprite 0, $D001 = y sprite 0, $D002=x, $D0003=y
          rts  

          
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
;game variables
;------------------------------------------------------------

SPRITE_POS_X
          !byte 0,0,0,0,0,0,0,0
SPRITE_POS_X_EXTEND
          !byte 0
SPRITE_POS_Y
          !byte 0,0,0,0,0,0,0,0
BIT_TABLE
          !byte 1,2,4,8,16,32,64,128
		  ; %00000001=1
		  ; %00000010=2
		  ; %00000100=4

CHARSET
          !binary "j.chr"
          
SPRITES
          !binary "j.spr"