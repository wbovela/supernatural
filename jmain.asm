;compile to this filename
!to "jmain.prg",cbm

;define constants here

;address of the screen buffer
SCREEN_CHAR      = 52224

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

          ;the main game loop
GameLoop  
          ;border flashing
          inc 53280
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

