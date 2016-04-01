;compile to this filename
!to "jmain.prg",cbm

;define constants here

;address of the screen buffer
SCREEN_CHAR      = 52224
CIA2_PORTA		= $DD00
VIC_START		= $D000
VIC_SPRITE_EN	= $D015
VIC_MEMORY		= $D018
VIC_BORDER_COL	= $D020

;this creates a basic start
*=$0801

          ;10 SYS 2064
          !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00

          ;init sprite registers
          ;no visible sprites
          lda #0
          sta VIC_SPRITE_EN
          
          ;set charset
          lda #%00111100		; Bits 1-3 select character dot data location 
          sta VIC_MEMORY		; so %1100=12, 12*1024=$3000, character location = $c000 + $3000 = $f000 

          ;VIC bank
          lda CIA2_PORTA
          and #%11111100		; Bit 0 and 1 select Bank 3: $C000-$FFFF 
          sta CIA2_PORTA

          ;the main game loop
GameLoop  
          ;border flashing
          inc VIC_BORDER_COL
          ;top left char
          inc SCREEN_CHAR
          
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

