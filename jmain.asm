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
SCREEN_CHAR          = $CC00 ;52224

;address of color ram
SCREEN_COLOR            = $d800

;address of sprite pointers
; The screen memory is a 1K block of data. Only 1.000 bytes are used
; on screen. Leaving 24 bytes at the end of screen memory. The LAST
; 8 bytes are sprite pointers. So starting from SCREEN_CHAR you add
; 1016 bytes (24 bytes - 8 = 16) to get to sprite pointer base.
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4 = 1

;sprite number constants
; Each sprite pointer is multiplied by 64 to give the memory location
; of the sprite data, starting from VIC start ($C000 in our case).
; Each sprite has (21*3=)63 bytes, with one wasted at the end.
SPRITE_BASE             = 64

SPRITE_PLAYER           = SPRITE_BASE + 0 ; 64 * 64 = $1000. $C000+$1000=$D000
											; Characters $F000


;this creates a basic start
*=$0801

          ;SYS 2064
          !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00

          ;init sprite registers
          ;no visible sprites
          lda #%00000000 ; 0
          sta $D015 ; 53248 + 21
          
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
          lda #%00110000 ; NOTE! This makes ALL RAM, including $D000!!!!
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

          ;set sprite 1 pos          
          lda #100
          sta $D000 ; x pos sprite 0 (53248)
          sta $D001 ; y pos sprite 0 (53248 + 1)
          ;set sprite image
          lda #SPRITE_PLAYER       ; value 64 -> 64*64=$1000. $C000+$1000=$D000
          sta SPRITE_POINTER_BASE  ; sprite pointer sprite #0
          ;enable sprite 1
          lda #%00000001 ; 1
          sta $D015      ; sprite enable register: 53248 + 21
          

          ;the main game loop
GameLoop  
          ;border flashing
          inc 53280
          
          jsr WaitFrame

          jmp GameLoop          
          
          
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
          
		  ; Copy to $D000, which is RAM at this moment in time.
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
          

CHARSET
          !binary "j.chr"
          
SPRITES
          !binary "j.spr"