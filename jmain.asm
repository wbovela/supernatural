;compile to this filename
!to "jmain.prg",cbm

;define constants here
KERNAL_GETIN            = $ffe4
KERNAL_SETMSG           = $ff90
KERNAL_SETLFS           = $ffba
KERNAL_SETNAM           = $ffbd
KERNAL_LOAD             = $ffd5

VIC_SPRITE_X_POS        = $d000
VIC_SPRITE_Y_POS        = $d001
VIC_SPRITE_X_EXTEND     = $d010
VIC_SPRITE_ENABLE       = $d015
VIC_CONTROL             = $d016
VIC_MEMORY_CONTROL      = $d018
VIC_SPRITE_MULTICOLOR   = $d01c
VIC_SPRITE_MULTICOLOR_1 = $d025
VIC_SPRITE_MULTICOLOR_2 = $d026
VIC_SPRITE_COLOR        = $d027

VIC_BORDER_COLOR        = $d020
VIC_BACKGROUND_COLOR    = $d021
VIC_CHARSET_MULTICOLOR_1= $d022
VIC_CHARSET_MULTICOLOR_2= $d023

JOYSTICK_PORT_II        = $dc00

CIA_PRA                 = $dd00

;placeholder for various temp parameters
PARAM1                  = $03
PARAM2                  = $04
PARAM3                  = $05
PARAM4                  = $06
PARAM5                  = $07
PARAM6                  = $08

;placeholder for zero page pointers
ZEROPAGE_POINTER_1      = $17
ZEROPAGE_POINTER_2      = $19
ZEROPAGE_POINTER_3      = $21
ZEROPAGE_POINTER_4      = $23

;address of the screen buffer
SCREEN_CHAR             = $CC00

;address of color ram
SCREEN_COLOR            = $D800

;address of the screen backbuffer
SCREEN_BACK_CHAR        = $C800

;address of the screen backbuffer
SCREEN_BACK_COLOR       = $C400


;address of sprite pointers
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4       = 17

;sprite number constant
SPRITE_BASE                   = 64

SPRITE_PLAYER                 = SPRITE_BASE + 0
SPRITE_BAT_1                  = SPRITE_BASE + 1
SPRITE_PLAYER_STAND_R         = SPRITE_BASE + 2
SPRITE_PLAYER_STAND_L         = SPRITE_BASE + 3
SPRITE_PLAYER_STAND_RECOIL_R  = SPRITE_BASE + 4
SPRITE_PLAYER_STAND_RECOIL_L  = SPRITE_BASE + 5
SPRITE_PLAYER_WALK_R_1        = SPRITE_BASE + 6
SPRITE_PLAYER_WALK_L_1        = SPRITE_BASE + 7
SPRITE_PLAYER_WALK_R_2        = SPRITE_BASE + 8
SPRITE_PLAYER_WALK_L_2        = SPRITE_BASE + 9
SPRITE_PLAYER_WALK_R_3        = SPRITE_BASE + 10
SPRITE_PLAYER_WALK_L_3        = SPRITE_BASE + 11
SPRITE_PLAYER_WALK_R_4        = SPRITE_BASE + 12
SPRITE_PLAYER_WALK_L_4        = SPRITE_BASE + 13
SPRITE_PLAYER_JUMP_R          = SPRITE_BASE + 6
SPRITE_PLAYER_JUMP_L          = SPRITE_BASE + 7
SPRITE_PLAYER_FALL_R          = SPRITE_BASE + 12
SPRITE_PLAYER_FALL_L          = SPRITE_BASE + 13
SPRITE_PLAYER_JUMP_RECOIL_R   = SPRITE_BASE + 14
SPRITE_PLAYER_JUMP_RECOIL_L   = SPRITE_BASE + 15
SPRITE_PLAYER_FALL_RECOIL_R   = SPRITE_BASE + 20
SPRITE_PLAYER_FALL_RECOIL_L   = SPRITE_BASE + 21
SPRITE_BAT_2                  = SPRITE_BASE + 22
SPRITE_BAT_3                  = SPRITE_BASE + 23
SPRITE_MUMMY_R_1              = SPRITE_BASE + 24
SPRITE_MUMMY_L_1              = SPRITE_BASE + 25
SPRITE_MUMMY_R_2              = SPRITE_BASE + 26
SPRITE_MUMMY_L_2              = SPRITE_BASE + 27
SPRITE_MUMMY_ATTACK_R         = SPRITE_BASE + 28
SPRITE_MUMMY_ATTACK_L         = SPRITE_BASE + 29
SPRITE_PLAYER_RELOAD_R        = SPRITE_BASE + 30
SPRITE_PLAYER_RELOAD_L        = SPRITE_BASE + 31
SPRITE_ZOMBIE_WALK_R_1        = SPRITE_BASE + 32
SPRITE_ZOMBIE_WALK_L_1        = SPRITE_BASE + 33
SPRITE_ZOMBIE_WALK_R_2        = SPRITE_BASE + 34
SPRITE_ZOMBIE_WALK_L_2        = SPRITE_BASE + 35
SPRITE_ZOMBIE_COLLAPSE_R_1    = SPRITE_BASE + 36
SPRITE_ZOMBIE_COLLAPSE_L_1    = SPRITE_BASE + 37
SPRITE_ZOMBIE_COLLAPSE_R_2    = SPRITE_BASE + 38
SPRITE_ZOMBIE_COLLAPSE_L_2    = SPRITE_BASE + 39
SPRITE_INVISIBLE              = SPRITE_BASE + 40
SPRITE_BAT_VANISH             = SPRITE_BASE + 41
SPRITE_ZOMBIE_JUMP_R          = SPRITE_BASE + 42
SPRITE_ZOMBIE_JUMP_L          = SPRITE_BASE + 43
SPRITE_SPIDER_STAND           = SPRITE_BASE + 44
SPRITE_SPIDER_WALK_1          = SPRITE_BASE + 45
SPRITE_SPIDER_WALK_2          = SPRITE_BASE + 46
SPRITE_EXPLOSION_1            = SPRITE_BASE + 47
SPRITE_EXPLOSION_2            = SPRITE_BASE + 48
SPRITE_EXPLOSION_3            = SPRITE_BASE + 49
SPRITE_PLAYER_DEAD            = SPRITE_BASE + 50
SPRITE_PLAYER_SAM_STAND_R     = SPRITE_BASE + 51
SPRITE_PLAYER_SAM_STAND_L     = SPRITE_BASE + 52
SPRITE_PLAYER_SAM_WALK_R_1    = SPRITE_BASE + 55
SPRITE_PLAYER_SAM_WALK_L_1    = SPRITE_BASE + 56
SPRITE_PLAYER_SAM_WALK_R_2    = SPRITE_BASE + 57
SPRITE_PLAYER_SAM_WALK_L_2    = SPRITE_BASE + 58
SPRITE_PLAYER_SAM_WALK_R_3    = SPRITE_BASE + 59
SPRITE_PLAYER_SAM_WALK_L_3    = SPRITE_BASE + 60
SPRITE_PLAYER_SAM_WALK_R_4    = SPRITE_BASE + 61
SPRITE_PLAYER_SAM_WALK_L_4    = SPRITE_BASE + 62
SPRITE_PLAYER_SAM_JUMP_R      = SPRITE_BASE + 55
SPRITE_PLAYER_SAM_JUMP_L      = SPRITE_BASE + 56
SPRITE_PLAYER_SAM_FALL_R      = SPRITE_BASE + 61
SPRITE_PLAYER_SAM_FALL_L      = SPRITE_BASE + 62
SPRITE_PLAYER_SAM_POWER_R     = SPRITE_BASE + 63
SPRITE_PLAYER_SAM_POWER_L     = SPRITE_BASE + 64

;offset from calculated char pos to true sprite pos
SPRITE_CENTER_OFFSET_X  = 8
SPRITE_CENTER_OFFSET_Y  = 11

;entries of jump table
JUMP_TABLE_SIZE         = 10

;entries of fall table
FALL_TABLE_SIZE         = 10

;bytes (digits) per score entry
HIGHSCORE_ENTRY_COUNT   = 8
HIGHSCORE_SCORE_SIZE    = 8
HIGHSCORE_NAME_SIZE     = 12


;level data constants
LD_END                  = 0
LD_LINE_H               = 1     ;data contains x,y,width,char,color
LD_LINE_V               = 2     ;data contains x,y,height,char,color
LD_OBJECT               = 3     ;data contains x,y,type
LD_AREA                 = 4     ;data contains x,y,width,height,char,color
LD_LINE_H_ALT           = 5     ;data contains x,y,width,char,color
LD_LINE_V_ALT           = 6     ;data contains x,y,height,char,color
LD_QUAD                 = 7     ;data contains x,y,quad_id

;object type constants
TYPE_PLAYER_DEAN        = 1
TYPE_BAT_DIAG           = 2
TYPE_BAT_UD             = 3
TYPE_BAT_8              = 4
TYPE_MUMMY              = 5
TYPE_ZOMBIE             = 6
TYPE_BAT_VANISH         = 7
TYPE_SPIDER             = 8
TYPE_EXPLOSION          = 9
TYPE_PLAYER_SAM         = 10

OBJECT_HEIGHT           = 8 * 2

;item type constants
ITEM_BULLET             = 0
ITEM_HEALTH             = 1
ITEM_FAST_RELOAD        = 2
ITEM_INVINCIBLE         = 3
ITEM_NONE               = 255

;number of possible items
ITEM_COUNT              = 8

;game mode types
GT_SINGLE_PLAYER_DEAN   = 0
GT_SINGLE_PLAYER_SAM    = 1
GT_COOP                 = 2

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

          ;check last used drive (or set to default)
          lda $ba
          sta DRIVE_NUMBER
          bne .NoDefaultDriveNeeded
          
          lda #8
          sta DRIVE_NUMBER
.NoDefaultDriveNeeded          
          jsr LoadScores

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
          sta VIC_BORDER_COLOR
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

          ;set sprite flags
          lda #0
          sta VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_ENABLE
          sta VIC_SPRITE_MULTICOLOR
          
          ;sprite multi colors
          lda #11
          sta VIC_SPRITE_MULTICOLOR_1
          lda #1
          sta VIC_SPRITE_MULTICOLOR_2
          
          ;bitmap multicolor          
          lda #$18
          sta $d016
          
;------------------------------------------------------------
;the title screen game loop
;------------------------------------------------------------
!zone TitleScreen
TitleScreen
          jsr InitTitleIRQ
          
TitleScreenWithoutIRQ          
          ldx #0
          stx BUTTON_PRESSED
          stx BUTTON_RELEASED
          stx VIC_SPRITE_ENABLE
          
          ;clear screen
          lda #32
          ldy #1
          jsr ClearScreen
          
          ;display start text
          lda #<TEXT_FIRE_TO_START
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_FIRE_TO_START
          sta ZEROPAGE_POINTER_1 + 1
          lda #11
          sta PARAM1
          lda #23
          sta PARAM2
          jsr DisplayText

          ldx GAME_MODE				; get the game mode into x
          lda TEXT_GAME_MODE_LO,x		; load address for the appropriate text 
          sta ZEROPAGE_POINTER_1
          lda TEXT_GAME_MODE_HI,x
          sta ZEROPAGE_POINTER_1 + 1
          lda #11
          sta PARAM1
          lda #21
          sta PARAM2
          jsr DisplayText			
          
          ;display high scores
          ;x,y pos of name
          lda #6
          sta PARAM1
          lda #10
          sta PARAM2

          lda #<HIGHSCORE_NAME
          sta ZEROPAGE_POINTER_1
          lda #>HIGHSCORE_NAME
          sta ZEROPAGE_POINTER_1 + 1

          jsr DisplayText

          ;x,y pos of score          
          lda #25
          sta PARAM1
          lda #10
          sta PARAM2

          lda #<HIGHSCORE_SCORE
          sta ZEROPAGE_POINTER_1
          lda #>HIGHSCORE_SCORE
          sta ZEROPAGE_POINTER_1 + 1

          jsr DisplayText
          
          ldx #0
.FillColor      
          lda TITLE_LOGO_COLORRAM,x
          sta SCREEN_COLOR,x
          inx
          bne .FillColor

.FillColor2
          lda TITLE_LOGO_COLORRAM + 256,x
          sta SCREEN_COLOR + 256,x
          inx
          cpx #( 320 - 256 )
          bne .FillColor2
          
          ;init color fade counter          
          lda #0
          sta COLOR_FADE_POS
          
.TitleLoop
          jsr WaitFrame

          ;apply color fade
          inc COLOR_FADE_POS
          lda COLOR_FADE_POS
          and #( COLOR_FADE_LENGTH - 1 )
          sta COLOR_FADE_POS
          
          lda #0
          sta PARAM1

.FadeLine        
          lda PARAM1
          clc
          adc #10
          tay
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          clc
          adc #( ( ( SCREEN_COLOR - SCREEN_CHAR ) & $ff00 ) >> 8 )
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy #6
          lda COLOR_FADE_POS
          clc
          adc PARAM1
          and #( COLOR_FADE_LENGTH - 1 )
          tax
          
.FadeColorNextChar          
          lda COLOR_FADE_1,x
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          cpy #35
          beq .FadeColorLineDone
          inx
          cpx #COLOR_FADE_LENGTH
          bne .FadeColorNextChar
          ldx #0
          jmp .FadeColorNextChar
          
.FadeColorLineDone          
          inc PARAM1
          lda PARAM1
          cmp #8
          bne .FadeLine

;if (Joystick2Read() !== up) {
;	if (up_released) {
;	   gamemode = mod(++gamemode, 3)
;	   printGameMode(gamemode)
;	   up_released = false
;	} else {
;	   up_released = up_released
;	}
;} else {
;	up_released = true
;}		
		
          lda #$01				; bit #0 is set when nothing happens
          bit JOYSTICK_PORT_II	; bit does a bit#0 AND $01 and sets Z flag. 0&0=0 0&1=0 1&0=0 1&1=1
          bne .NotUpPressed		; 1 and 1 = 1, Z clear so jump and set UP_RELEASED. 
							; 	(bne only jumps when Z is set.)
          					; 0 and 1 = 0, so up pressed
          lda UP_RELEASED		; now check UP_RELEASED (was just set to 1)
          beq .UpPressed			; if UP_RELEASED===false, jump away
          					
          inc GAME_MODE			; now change game mode
          lda GAME_MODE			; make sure we don't wrap over 3 modes
          cmp #3
          bne .NoGameModeWrap
          
          lda #0				
          sta GAME_MODE
.NoGameModeWrap
          ;redisplay game mode
          ldx GAME_MODE				; print the game mode text
          lda TEXT_GAME_MODE_LO,x
          sta ZEROPAGE_POINTER_1
          lda TEXT_GAME_MODE_HI,x
          sta ZEROPAGE_POINTER_1 + 1
          lda #11
          sta PARAM1
          lda #21
          sta PARAM2
          jsr DisplayText
          
          lda #0					; make sure UP_RELEASED = 0 
          jmp .UpPressed

.NotUpPressed          
          lda #1
.UpPressed          
          sta UP_RELEASED

          lda #$10
          bit JOYSTICK_PORT_II
          bne .ButtonNotPressed
          
          ;button pushed
          lda BUTTON_RELEASED
          bne .Restart
          
          jmp .TitleLoop
          

.ButtonNotPressed
          lda #1
          sta BUTTON_RELEASED
          jmp .TitleLoop
          
.Restart
          jsr WaitFrame
          jsr ReleaseTitleIRQ


          ;game start values
          lda #3
          sta PLAYER_LIVES
          sta PLAYER_LIVES + 1
          
          ;setup level
          jsr StartLevel
          
          lda #9
          sta LEVEL_NR
          jsr BuildScreen
          
          jsr CopyLevelToBackBuffer
          
          lda #40
          sta LEVEL_START_DELAY
          lda #0
          sta SPRITE_JUMP_POS
          
          jsr DisplayGetReady
          
          ;score display according to game mode
          lda GAME_MODE
          cmp #GT_SINGLE_PLAYER_DEAN
          beq .DeanOnly
          cmp #GT_SINGLE_PLAYER_SAM
          beq .SamOnly

          lda #<TEXT_DISPLAY_DEAN_AND_SAM
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_DISPLAY_DEAN_AND_SAM
          sta ZEROPAGE_POINTER_1 + 1
          jmp .DisplayDisplay

.DeanOnly        
          lda #0
          sta PLAYER_LIVES

          lda #<TEXT_DISPLAY_DEAN_ONLY
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_DISPLAY_DEAN_ONLY
          sta ZEROPAGE_POINTER_1 + 1
          jmp .DisplayDisplay

.SamOnly        
          lda #0
          sta PLAYER_LIVES + 1
          
          lda #<TEXT_DISPLAY_SAM_ONLY
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_DISPLAY_SAM_ONLY
          sta ZEROPAGE_POINTER_1 + 1
          jmp .DisplayDisplay

.DisplayDisplay
          lda #0
          sta PARAM1
          lda #23
          sta PARAM2
          jsr DisplayText
          jsr DisplayLevelNumber
          
          ;settings per game mode
          ;default ports
          lda #0						; set player 0 to port 0 and player 1 to 1
          sta PLAYER_JOYSTICK_PORT			; 0 will indicate port 2, 1 will indicate port 1 :)
          lda #1
          sta PLAYER_JOYSTICK_PORT + 1
          
          lda GAME_MODE					; but if sam is the only player, set him to 0
          cmp #GT_SINGLE_PLAYER_SAM
          bne .NoPortChange
          lda #0
          sta PLAYER_JOYSTICK_PORT + 1
.NoPortChange          
          
          ;full shells
          lda #2
          sta SCREEN_COLOR + 23 * 40 + 19
          sta SCREEN_COLOR + 23 * 40 + 20
          lda #7
          sta SCREEN_COLOR + 24 * 40 + 19
          sta SCREEN_COLOR + 24 * 40 + 20

          lda #2
          sta PLAYER_SHELLS
          sta PLAYER_SHELLS_MAX

          lda #0
          sta PLAYER_FAST_RELOAD
          sta PLAYER_INVINCIBLE          
          sta SPRITE_STATE
          
;------------------------------------------------------------
;the main game loop
;------------------------------------------------------------

GameLoop  
          jsr WaitFrame
          
          ;lda #1
          ;sta VIC_BORDER_COLOR
          
          lda LEVEL_START_DELAY
          beq .GameIsOn
          dec LEVEL_START_DELAY
          beq .RemoveGetReady
          jmp GameLoop

.GameIsOn
          jsr GameFlowControl
          lda LEVEL_START_DELAY
          bne GameLoop

          jsr ObjectControl
          
          ;check for Dean
          lda GAME_MODE					; make sure we don't check for collissions
          cmp #GT_SINGLE_PLAYER_SAM		; for a player that doesn't exist
          beq .NoCollisionCheckForDean
          
          ldx #0						; note that CheckCollisions now has a parameter x
          jsr CheckCollisions				; indicating the player number to check for
          
.NoCollisionCheckForDean          
          ;check for Sam needed?
          lda GAME_MODE
          cmp #GT_SINGLE_PLAYER_DEAN
          beq .NoCollisionCheckForSam

          ;check for Sam
          ldx #1
          jsr CheckCollisions
          
.NoCollisionCheckForSam
          jmp GameLoop          
          
.RemoveGetReady          
          ;remove restart message
          ldy #11
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_2 + 1
          sec
          sbc #( ( SCREEN_COLOR - SCREEN_BACK_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          sec
          sbc #( ( SCREEN_BACK_CHAR - SCREEN_BACK_COLOR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_4 + 1
          
          ldy #14
          
.ReplaceChar          
          lda (ZEROPAGE_POINTER_4),y
          sta (ZEROPAGE_POINTER_2),y
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          cpy #10
          bne .ReplaceChar
          
          tya
          clc
          adc #30
          tay

.ReplaceChar2ndRow          
          lda (ZEROPAGE_POINTER_4),y
          sta (ZEROPAGE_POINTER_2),y
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          cpy #10
          bne .ReplaceChar2ndRow
          jmp GameLoop

;-----------------------------------
;init IRQ
;-----------------------------------
!zone InitTitleIRQ
InitTitleIRQ
         
          ;wait for exact frame so we don't end up on the wrong
          ;side of the raster
          jsr WaitFrame
          sei

          lda #$37 ; make sure that IO regs at $dxxx
          sta $01 ;are visible

          lda #$7f ;disable cia #1 generating timer irqs
          sta $dc0d ;which are used by the system to flash cursor, etc

          lda #$01 ;tell VIC we want him generate raster irqs
          sta $d01a

          lda #$10 ;nr of rasterline we want our irq occur at
          sta $d012

          lda #$1b ;MSB of d011 is the MSB of the requested rasterline
          sta $d011 ;as rastercounter goes from 0-312

          ;set irq vector to point to our routine
          lda #<IrqSetBitmapMode
          sta $0314
          lda #>IrqSetBitmapMode
          sta $0315

          ;acknowledge any pending cia timer interrupts
          ;this is just so we're 100% safe
          lda $dc0d 
          lda $dd0d 

          cli
          rts


;-----------------------------------
;release IRQ
;-----------------------------------
!zone ReleaseTitleIRQ
ReleaseTitleIRQ
            
          sei

          lda #$37 ; make sure that IO regs at $dxxx
          sta $01 ;are visible

          lda #$ff ;enable cia #1 generating timer irqs
          sta $dc0d ;which are used by the system to flash cursor, etc

          ;no more raster irqs
          lda #$00 
          sta $d01a

          lda #$31
          sta $0314
          lda #$EA
          sta $0315

          ;acknowledge any pending cia timer interrupts
          ;this is just so we're 100% safe
          lda $dc0d 
          lda $dd0d 

          cli
          rts


;-----------------------------------
;IRQ Title - set bitmap mode
;-----------------------------------
!zone IrqSetBitmapMode
IrqSetBitmapMode
          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install top part
          lda #<IrqSetTextMode
          sta $0314
          lda #>IrqSetTextMode
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #$70 
          sta $d012

          ;bitmap modus an
          lda #$3b
          sta $D011 

          ;set VIC to bank 0
          lda $DD00
          and #$fc
          ora #$03
          sta $dd00

          ;bitmap to lower half, screen char pos at 3 * 1024 ( + 16384)
          lda #%10111000
          sta $D018

          JMP $ea31


;-----------------------------------
;IRQ Title - set text mode
;-----------------------------------
!zone IrqSetTextMode
IrqSetTextMode

          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install next state
          lda #<IrqSetBitmapMode
          sta $0314
          lda #>IrqSetBitmapMode
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #$10
          sta $d012

          ;disable bitmap mode
          lda #$1b
          sta $D011 

          ;set VIC to bank 3
          lda $DD00
          and #$fc
          sta $dd00

          ;bitmap to lower half, screen char pos at 3 * 1024 ( + 16384)
          lda #%00111100
          sta $D018

          jmp $ea31


;------------------------------------------------------------
;controls the game flow
;------------------------------------------------------------
!zone GameFlowControl
GameFlowControl
          ;let items dissolve
          ldx #0
.ItemLoop
          lda ITEM_ACTIVE,x
          cmp #ITEM_NONE
          beq .NextItem
          
          inc ITEM_TIME,x
          bne .NextItem
          
          ;remove item 
          lda #ITEM_NONE
          sta ITEM_ACTIVE,x
          txa
          tay
          jsr RemoveItemImage
          
.NextItem
          inx
          cpx #ITEM_COUNT
          bne .ItemLoop
          
          ;slow events
          inc DELAYED_GENERIC_COUNTER
          lda DELAYED_GENERIC_COUNTER
          cmp #8
          bne .NoTimedActionYet
          lda #0
          sta DELAYED_GENERIC_COUNTER

          ;level done delay
          lda NUMBER_ENEMIES_ALIVE
          bne .NotDoneYet

          inc LEVEL_DONE_DELAY
          lda LEVEL_DONE_DELAY
          cmp #20
          beq .GoToNextLevel
          
.NotDoneYet        

          
          
.NoTimedActionYet          
          rts


.GoToNextLevel
          jsr StartLevel
          
          inc LEVEL_NR
          jsr BuildScreen
          
          jsr CopyLevelToBackBuffer
          jsr DisplayGetReady
          rts


;------------------------------------------------------------
;sets up variables for new level
;------------------------------------------------------------
!zone StartLevel
StartLevel
          lda #0
          sta VIC_SPRITE_ENABLE

          ;reset variables
          lda #0
          sta NUMBER_ENEMIES_ALIVE
          sta LEVEL_DONE_DELAY
          sta SPRITE_POS_X_EXTEND
          sta PLAYER_STAND_STILL_TIME			; this variable is named confusingly
          sta PLAYER_STAND_STILL_TIME + 1		; it doesn't store a time. more like a count.
          sta PLAYER_FAST_RELOAD
          sta PLAYER_INVINCIBLE
          sta PLAYER_INVINCIBLE + 1
          sta PLAYER_FIRE_PRESSED_TIME + 1		; same here, no time but a count
          sta SPRITE_HELD					; only one sprite can be held at a time, so a sprite number
          
          ;reset all items
          ldx #0
          lda #ITEM_NONE
.ClearItemLoop
          sta ITEM_ACTIVE,x
          inx
          cpx #ITEM_COUNT
          bne .ClearItemLoop
          
          
          rts
          


;------------------------------------------------------------
;check if the player got a new highscore entry
;------------------------------------------------------------
!zone CheckForHighscore
CheckForHighscore

          lda #0
          sta PARAM1
          ldy #0
          
.CheckScoreEntry          
          ldx #0
          sty PARAM2
          
.CheckNextDigit          
          lda SCREEN_CHAR + ( 23 * 40 + 8 ),x
          cmp HIGHSCORE_SCORE,y
          bcc .NotHigher
          bne .IsHigher
          
          ;need to check next digit
          iny
          inx
          cpx #HIGHSCORE_SCORE_SIZE
          beq .IsHigher
          jmp .CheckNextDigit
          
.NotHigher
          inc PARAM1
          lda PARAM1
          cmp #HIGHSCORE_ENTRY_COUNT
          beq .NoNewHighscore
          
          ;y points somewhere inside the score, recalc next line pos
          lda PARAM2
          clc
          adc #( HIGHSCORE_SCORE_SIZE + 1 )
          tay
          jmp .CheckScoreEntry

.NoNewHighscore
          jmp TitleScreen
          
.IsHigher
          ;shift older entries down, add new entry
          lda #( HIGHSCORE_ENTRY_COUNT - 1 )
          sta PARAM2
          
          ;y carries the offset in the score text, position at start of second last entry
          ldy #( ( HIGHSCORE_SCORE_SIZE + 1 ) * ( HIGHSCORE_ENTRY_COUNT - 2 ) )
          
.CopyScore          
          lda PARAM2
          cmp PARAM1
          beq .SetNewScore
          
          ;copy score
          ldx #0
          
.CopyNextScoreDigit          
          lda HIGHSCORE_SCORE,y
          sta HIGHSCORE_SCORE + ( HIGHSCORE_SCORE_SIZE + 1 ),y
          
          iny
          inx
          cpx #HIGHSCORE_SCORE_SIZE
          bne .CopyNextScoreDigit
          
          tya
          sec
          sbc #( HIGHSCORE_SCORE_SIZE + HIGHSCORE_SCORE_SIZE + 1 )
          tay
          dec PARAM2
          jmp .CopyScore
          
.SetNewScore
          ;y points at score above the new entry
          tya
          clc
          adc #( HIGHSCORE_SCORE_SIZE + 1 )
          tay
          
          ldx #0
          
.SetNextScoreDigit          
          lda SCREEN_CHAR + ( 23 * 40 + 8 ),x
          sta HIGHSCORE_SCORE,y
          
          iny
          inx
          cpx #HIGHSCORE_SCORE_SIZE
          bne .SetNextScoreDigit
          
          ;move names down
          ;shift older entries down, add new entry
          lda #( HIGHSCORE_ENTRY_COUNT - 1 )
          sta PARAM2
          
          ;y carries the offset in the score text, position at start of second last entry
          ldy #( ( HIGHSCORE_NAME_SIZE + 1 ) * ( HIGHSCORE_ENTRY_COUNT - 2 ) )
          
.CopyName
          lda PARAM2
          cmp PARAM1
          beq .SetNewName
          
          ;copy name
          ldx #0
          
.CopyNextNameChar
          lda HIGHSCORE_NAME,y
          sta HIGHSCORE_NAME + ( HIGHSCORE_NAME_SIZE + 1 ),y
          
          iny
          inx
          cpx #HIGHSCORE_NAME_SIZE
          bne .CopyNextNameChar
          
          tya
          sec
          sbc #( HIGHSCORE_NAME_SIZE + HIGHSCORE_NAME_SIZE + 1 )
          tay
          dec PARAM2
          jmp .CopyName


.SetNewName
          ;calc y for new name offset inside name data
          ldy PARAM1
          
          lda #0
.AddNameOffset          
          cpy #0
          beq .NameOffsetFound
          clc
          adc #( HIGHSCORE_NAME_SIZE + 1 )
          dey
          jmp .AddNameOffset
          
.NameOffsetFound          
          tay  

          ;clear old name
          ldx #0
          sty PARAM3
          lda #32
          
.ClearNextChar
          sta HIGHSCORE_NAME,y
          iny
          inx
          cpx #HIGHSCORE_NAME_SIZE
          bne .ClearNextChar

          ;name entry starts here
          
          ;calc cursor pos
          
          ;y pos on screen
          lda PARAM1
          clc
          adc #10
          tay
          
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_4 + 1
          
          ;prepare display
          lda #0
          sta VIC_SPRITE_ENABLE
          
          ;clear screen
          lda #32
          ldy #0
          jsr ClearScreen

          ;display "Enter your name"
          lda #<TEXT_ENTER_NAME
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_ENTER_NAME
          sta ZEROPAGE_POINTER_1 + 1
          lda #12
          sta PARAM1
          lda #23
          sta PARAM2
          jsr DisplayText
          
          ;display scores
          lda #25
          sta PARAM1
          lda #10
          sta PARAM2

          lda #<HIGHSCORE_SCORE
          sta ZEROPAGE_POINTER_1
          lda #>HIGHSCORE_SCORE
          sta ZEROPAGE_POINTER_1 + 1
          jsr DisplayText
          
          
          jsr InitTitleIRQ
          
          ldy PARAM3
          
          ldx #0
          stx PARAM3
          jmp .ShowChar
          
.GetNextChar
          sty PARAM4
          
          ;blink cursor
          jsr WaitFrame
          
          lda PARAM3
          clc
          adc #6
          tay
          lda (ZEROPAGE_POINTER_4),y
          eor #123
          sta (ZEROPAGE_POINTER_4),y
          
          ;restore Y
          ldy PARAM4
          
          ;use ROM routines, read char
          jsr KERNAL_GETIN
          beq .GetNextChar

          ;return pressed?
          cmp #13
          beq .EnterPressed

          ;DEL pressed?
          cmp #20
          bne .NotDel
          
          ;DEL pressed
          ldy PARAM4
          ldx PARAM3
          beq .GetNextChar
          dec PARAM3
          dey
          dex
          lda #32
          sta HIGHSCORE_NAME,y
          jmp .ShowChar

.NotDel   
          ldy PARAM4
          ;pressed key >= 32 or <= 96?
          cmp #32
          bcc .GetNextChar
          cmp #96
          bcs .GetNextChar

          ;max length reached already?
          ldx PARAM3
          cpx #HIGHSCORE_NAME_SIZE
          bcs .GetNextChar
          
          ;save text
          sta HIGHSCORE_NAME,y
          iny
          inx
          
.ShowChar           
          stx PARAM3
          sty PARAM4

          ;display high scores
          ;x,y pos of name
          lda #6
          sta PARAM1
          lda #10
          sta PARAM2

          lda #<HIGHSCORE_NAME
          sta ZEROPAGE_POINTER_1
          lda #>HIGHSCORE_NAME
          sta ZEROPAGE_POINTER_1 + 1

          jsr DisplayText

          ldx PARAM3
          ldy PARAM4

          jmp .GetNextChar

.EnterPressed      
          ;fill entry with blanks
          lda #32
          ldx PARAM3
          ldy PARAM4
          
.FillNextChar          
          cpx #HIGHSCORE_NAME_SIZE
          beq .FilledUp
          sta HIGHSCORE_NAME,y
          iny
          inx
          jmp .FillNextChar          

.FilledUp
          jsr SaveScores
          jmp TitleScreenWithoutIRQ
          
text     
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0
          
          

;------------------------------------------------------------
;check object collisions (enemy vs. player etc.)
;x is sprite number. 
;------------------------------------------------------------
!zone CheckCollisions
CheckCollisions
          lda SPRITE_ACTIVE,x		; this used to not have the x index, but now we have to 
          bne .PlayerIsAlive		; check more than 1 player. x can be 0 or 1 for players.
          rts          
          
.PlayerIsAlive          
          lda SPRITE_STATE,x
          cmp #128
          bmi .IsVulnerable
          rts          
          
.IsVulnerable          
          stx PARAM6
          
          ;start with sprite 0 (Sam usually is at index 1)
          ldx #0				; this makes no sense here. Sprite #0 is NEVER an enemy. 
							; Sprite #1 might be an enemy if we're in coop mode so it makes sense
							; to start at sprite #1.
          
.CollisionLoop          
          lda SPRITE_ACTIVE,x
          bne .CheckObject
          
.NextObject          
          inx
          cpx #8
          bne .CollisionLoop          
          rts
          
.CheckObject
          ;is an enemy?
          tay
          lda IS_TYPE_ENEMY,y
          beq .NextObject
          
          ;only objects with states >= 128 are deadly
          
          lda SPRITE_STATE,x
          cmp #128
          bcs .NextObject
          
          stx PARAM2
          ldy PARAM6
          jsr IsEnemyCollidingWithPlayer
          bne .PlayerCollidedWithEnemy
          ldx PARAM2
          jmp .NextObject
          
.PlayerCollidedWithEnemy          
          ;player killed
          ldx PARAM6
          lda #129
          sta SPRITE_STATE,x
          
          lda #SPRITE_PLAYER_DEAD
          sta SPRITE_POINTER_BASE,x
          
          lda #0
          sta SPRITE_MOVE_POS,x
          
          lda SPRITE_ACTIVE,x
          cmp #TYPE_PLAYER_SAM			; if the player was killed AND he was of type SAM
          bne .PlayerWasDean				; we need to reset some things specific to him (SPRITE_HELD)
          
          ;reset Sam specific variables
          lda #0
          sta SPRITE_HELD
          
.PlayerWasDean          
          rts
          

;------------------------------------------------------------
;check object collision with player (object in y)
;x = enemy index
;y = player index
;return a = 1 when colliding, a = 0 when not
;------------------------------------------------------------

!zone IsEnemyCollidingWithPlayer


.CalculateSimpleXPos
          ;Returns a with simple x pos (x halved + 128 if > 256)
          ;modifies y
          lda BIT_TABLE,x
          and SPRITE_POS_X_EXTEND
          beq .NoXBit
          
          lda SPRITE_POS_X,x
          lsr
          clc
          adc #128
          rts
          
.NoXBit          
          lda SPRITE_POS_X,x
          lsr
          rts

IsEnemyCollidingWithPlayer
          ;modifies X
          ;check y pos
          lda SPRITE_POS_Y,x
          sec
          sbc #( OBJECT_HEIGHT )      ;offset to bottom
          cmp SPRITE_POS_Y,y
          bcs .NotTouching
          clc
          adc #( OBJECT_HEIGHT + OBJECT_HEIGHT - 1 )
          cmp SPRITE_POS_Y,y
          bcc .NotTouching
          
          ;X = Index in enemy-table
          jsr .CalculateSimpleXPos
          sta PARAM1
          ;vs. player X				; what? this used to be LDX #$00 but now Y holds the 
          tya						; player number so we transfer Y to X via A (only way possible)
          tax
          jsr .CalculateSimpleXPos
          
          sec
          sbc #4
          ;position X-Anfang Player - 12 Pixel
          cmp PARAM1
          bcs .NotTouching
          adc #8
          cmp PARAM1
          bcc .NotTouching
          
          lda #1
          rts
          
.NotTouching
          lda #0
          rts
          
          
;------------------------------------------------------------
;check joystick (player control)
;------------------------------------------------------------
!zone PlayerControl					; this is not the entry point for this function
.PlayerIsDying
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          cmp #64
          beq .PlayerRespawn
          
          and #$03
          bne .NoUpMove
          jsr MoveSpriteUp
          
.NoUpMove          
          rts
          

.PlayerRespawn
          dec PLAYER_LIVES,x
          jsr DisplayLiveNumber
          
          ;game over?
          lda PLAYER_LIVES,x
          bne .RestartPlayer
          
          ;is other player alive?
          lda PLAYER_LIVES			; simply add both player lives counters and
          clc						; check for zero. Be sure to clear the carry before adding
          adc PLAYER_LIVES + 1
          bne .OtherPlayerStillAlive
          jmp CheckForHighscore		; this is game over
          
.OtherPlayerStillAlive
          jsr RemoveObject			; otherwise just remove the deceased player
          rts
          
.RestartPlayer          
          lda SPRITE_ACTIVE,x
          cmp #TYPE_PLAYER_SAM
          bne .PlayerIsNotDean
          
          ;refill shells
          ldy #0
.RefillShellImage          					; Sam doesn't use bullets so we can skip this
          lda #2							; in case of sam.
          sta SCREEN_COLOR + 23 * 40 + 19,y
          lda #7
          sta SCREEN_COLOR + 24 * 40 + 19,y
          
          iny
          cpy PLAYER_SHELLS_MAX
          bne .RefillShellImage

          lda PLAYER_SHELLS_MAX
          sta PLAYER_SHELLS
          
.PlayerIsNotDean
          ;respawn at correct position
          lda PLAYER_START_POS_X,x				; for both players, get their starting positions
          sta PARAM1 
          lda PLAYER_START_POS_Y,x
          sta PARAM2

          ;PARAM1 and PARAM2 hold x,y already
          jsr CalcSpritePosFromCharPos			; calculate their sprite coordinates
          
          ;enable sprite
          lda BIT_TABLE,x					; enable the correct one
          ora VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE
          
          ;initialise enemy values				; weird comment here (enemy), we're in player control
          lda #SPRITE_PLAYER					; apparently each player looks like Dean in the init
          sta SPRITE_POINTER_BASE,x
          lda #0							; reset player related values
          sta PLAYER_FAST_RELOAD,x
          sta PLAYER_INVINCIBLE,x
          sta SPRITE_STATE,x
          sta PLAYER_FIRE_PRESSED_TIME,x
          
          ;look right per default
          lda #0
          sta SPRITE_DIRECTION,x
          
          lda #0
          sta SPRITE_JUMP_POS,x
          sta SPRITE_FALLING,x
          rts

PlayerControl							; note that this function's entry point is here
          lda SPRITE_STATE,x				; and not at the top. This is due to branching limitations
          cmp #129						; of the 6510: 128 bytes forward and 127 bytes back.
          bne .NotDying					; start by testing if we're dying (floating up animation)
          jmp .PlayerIsDying
          
.NotDying          						; we're still alive
          lda PLAYER_INVINCIBLE,x			; check if we're invincible
          beq .NotInvincible
          
          ;count down invincibility
          inc VIC_SPRITE_COLOR,x			; if we are we flash
          dec PLAYER_INVINCIBLE,x			; decrease the counter for invincibility
          bne .NotInvincible				; if it's 0 we're done being invincible

          lda #0						; restore sprite state and colour
          sta SPRITE_STATE,x
          lda #10
          sta VIC_SPRITE_COLOR,x
          
.NotInvincible          
          ;check if the player collected an item
          ldy #0
.ItemLoop
          lda ITEM_ACTIVE,y
          cmp #ITEM_NONE
          beq .NextItem
          
          lda ITEM_POS_X,y
          cmp SPRITE_CHAR_POS_X,x
          beq .MatchX

          clc
          adc #1
          cmp SPRITE_CHAR_POS_X,x
          beq .MatchX

          sec
          sbc #2
          cmp SPRITE_CHAR_POS_X,x
          beq .MatchX
          
          jmp .NextItem
          
.MatchX          
          lda ITEM_POS_Y,y
          clc
          adc #1
          cmp SPRITE_CHAR_POS_Y,x
          bne .NextItem
          
          ;pick item!
          jsr PickItem
          
.NextItem
          iny
          cpy #ITEM_COUNT
          beq .LastItemReached
          jmp .ItemLoop
          
.LastItemReached

          ;check if player moved
          ldy PLAYER_JOYSTICK_PORT,x		; load y with the port index (0 or 1)
          lda JOYSTICK_PORT_II,y			; $dc00 is port #2, $dc01 is port #1. 
          and #$1f
          cmp #$1f
          bne .PlayerMoved
          
          ;don't reload while recoil
          lda PLAYER_SHOT_PAUSE,x
          bne .PlayerMoved

          lda PLAYER_FAST_RELOAD,x
          beq .NoFastReload
          dec PLAYER_FAST_RELOAD,x
          inc PLAYER_STAND_STILL_TIME,x
.NoFastReload          
          inc PLAYER_STAND_STILL_TIME,x
          lda PLAYER_STAND_STILL_TIME,x
          cmp #40
          bmi .HandleFire
          
          ;reload
          lda #1
          sta PLAYER_STAND_STILL_TIME,x
          
          ;already fully loaded?
          lda PLAYER_SHELLS
          cmp PLAYER_SHELLS_MAX
          beq .HandleFire
          
          inc PLAYER_SHELLS
          
          ;display loaded shells
          ldy PLAYER_SHELLS
          lda #2
          sta SCREEN_COLOR + 23 * 40 + 18,y
          lda #7
          sta SCREEN_COLOR + 24 * 40 + 18,y
          jmp .HandleFire
          
.PlayerMoved
          lda #0
          sta PLAYER_STAND_STILL_TIME,x
          
.HandleFire          
          cpx #1						; if x=1 we're SAM and we handle his firing
          beq .FireSam
          
          ;handle shooting/shoot pause
          lda PLAYER_SHOT_PAUSE,x			; remember how easy Dean was?
          bne .CannotShoot
          
          lda PLAYER_SHELLS
          beq .FireDone
                    
          ldy PLAYER_JOYSTICK_PORT,x
          lda JOYSTICK_PORT_II,y
          and #$10
          bne .NotFirePushed
          
          jsr FireShot
          jmp .FireDone

.FireSam
          ldy PLAYER_JOYSTICK_PORT,x		; check the correct port for if fire is pushed
          lda JOYSTICK_PORT_II,y			; this happens every frame!
          and #$10
          bne .SamNotFirePushed			; if not, just reset some values and rts
          
          lda #1						; we use PLAYER_FIRE_PRESSED_TIME as a toggle
          sta PLAYER_FIRE_PRESSED_TIME,x	; not a counter
          
          stx PARAM6					; store the sprite number
          
          jsr SamUseForce				; while pressed, sam uses his force and holds enemies
          beq .NoEnemyHeld				; no enemy held is basically .FireDone 
          
          ;Sam needs to keep pressed
          inc PLAYER_SHOT_PAUSE,x			; we use PLAYER_SHOT_PAUSE here do measure if sam	
          							; has pressed fire for 40 cycles
          lda PLAYER_SHOT_PAUSE,x
          cmp #40
          beq .EnemyHurtBySam				; if so, the enemy was actually hurt
          
          ldy SPRITE_HELD				; otherwise set the enemy's sprite colour to red 
          dey							; notice we have to adjust the table index here..boo!
          lda #2
          sta VIC_SPRITE_COLOR,y
          
.NoEnemyHeld          
.EnemyWasHurt    
          ;restore sprite index
          ldx PARAM6
          jmp .NotFirePushed
          
.EnemyHurtBySam						; when the enemy was hurt by sam, reset the 
          lda #0						; PLAYER_SHOT_PAUSE counter for sam
          sta PLAYER_SHOT_PAUSE,x
          
          ldx SPRITE_HELD				; reset the enemy sprite colour
          dex
          
          lda #0
          sta VIC_SPRITE_COLOR,x
          
          dec SPRITE_HP,x				; and decrease its HP
          bne .EnemyWasHurt				; not dead yet, continue to an rts
          
.EnemyKilledBySam          
          lda #5						; we killed the enemy, so increase score by 5
          jsr IncreaseScore
          
          ldx SPRITE_HELD				; get the enemy sprite number and kill it
          dex

          jsr KillEnemy
          
          ldx PARAM6					; set sprite held back to 0 and rts out
          lda #0
          sta SPRITE_HELD
          jmp .NotFirePushed
          
          
.SamNotFirePushed
          lda #0
          sta SPRITE_HELD
          sta PLAYER_SHOT_PAUSE,x
          sta PLAYER_FIRE_PRESSED_TIME,x
          jmp .NotFirePushed

.CannotShoot
          dec PLAYER_SHOT_PAUSE

.FireDone
.NotFirePushed
          lda SPRITE_JUMP_POS,x
          beq .NotJumping
          jmp .PlayerIsJumping

.NotJumping
          jsr UpdateSpriteFall
          bne .NotUpPressed
          
          ldy PLAYER_JOYSTICK_PORT,x
          lda JOYSTICK_PORT_II,y
          and #$01
          bne .NotUpPressed
          
          jmp .PlayerIsJumping
          
.NotUpPressed          
.JumpStopped
.JumpComplete								; this is where all the moving is done...
          cpx #1							; when moving sam we have to check if he's 
          bne .PlayerIsDean					; using the force
          
          ;if Sam is powering up he cannot move
          lda PLAYER_FIRE_PRESSED_TIME,x		; so if this toggle is not on, continue
          beq .SamIsNotPowering
          
          lda #SPRITE_PLAYER_SAM_POWER_R		; otherwise just reset his sprite and direction
          clc								; and rts out
          adc SPRITE_DIRECTION + 1
          sta SPRITE_POINTER_BASE + 1
          rts
          
.SamIsNotPowering
.PlayerIsDean          
          ldy PLAYER_JOYSTICK_PORT,x
          lda JOYSTICK_PORT_II,y
          and #$04
          bne .NotLeftPressed
          jsr PlayerMoveLeft
          jsr PlayerMoveLeft
          
          ;animate player
          lda SPRITE_FALLING,x
          bne .NoAnimLNeeded
          lda SPRITE_JUMP_POS,x
          bne .NoAnimLNeeded
          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #8
          bne .NoAnimLNeeded
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
.NoAnimLNeeded
.NotLeftPressed
          ldy PLAYER_JOYSTICK_PORT,x
          lda JOYSTICK_PORT_II,y
          and #$08
          bne .NotRightPressed
          jsr PlayerMoveRight
          jsr PlayerMoveRight

          ;animate player
          lda SPRITE_FALLING,x
          bne .NoAnimRNeeded
          lda SPRITE_JUMP_POS,x
          bne .NoAnimRNeeded
          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #8
          bne .NoAnimRNeeded
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x

.NoAnimRNeeded          
.NotRightPressed
          ;update player animation
          lda PLAYER_STAND_STILL_TIME,x
          beq .PlayerMoving
          cmp #10
          bmi .NotReloading
          cmp #30
          bpl .NotReloading
          
          ;don't show reload sprites for Sam
          cpx #1							; only Dean gets the reloading animation
          beq .NotReloading					; skip over it for Sam
          
          ;set reload anim
          lda PLAYER_SHELLS
          cmp PLAYER_SHELLS_MAX
          beq .NotReloading
          
          lda #SPRITE_PLAYER_RELOAD_R
          clc
          adc SPRITE_DIRECTION,x
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.NotReloading
          lda #SPRITE_PLAYER_STAND_R
          clc
          adc SPRITE_DIRECTION,x
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.PlayerMoving
          lda SPRITE_FALLING,x
          bne .AnimFalling

          lda SPRITE_JUMP_POS,x
          bne .AnimJumping
          
          ;is player shooting?
          lda PLAYER_SHOT_PAUSE,x
          beq .AnimNoRecoil

          ;recoil anim          
          lda SPRITE_ANIM_POS,x
          asl
          clc
          adc SPRITE_DIRECTION,x
          adc #SPRITE_PLAYER_WALK_R_1
          adc #8
          sta SPRITE_POINTER_BASE,x
          
.NoUpdateNeeded          
          rts
          
.AnimNoRecoil          
          lda SPRITE_ANIM_POS,x
          asl
          clc
          adc SPRITE_DIRECTION,x
          adc #SPRITE_PLAYER_WALK_R_1
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.AnimFalling
          lda PLAYER_SHOT_PAUSE,x
          bne .AnimFallingNoRecoil

          lda #SPRITE_PLAYER_FALL_R
          clc
          adc SPRITE_DIRECTION,x
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.AnimFallingNoRecoil          
          lda #SPRITE_PLAYER_FALL_RECOIL_R
          clc
          adc SPRITE_DIRECTION,x
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.AnimJumping          
          lda PLAYER_SHOT_PAUSE,x
          bne .AnimJumpingNoRecoil

          lda #SPRITE_PLAYER_JUMP_R
          clc
          adc SPRITE_DIRECTION,x
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.AnimJumpingNoRecoil          
          lda #SPRITE_PLAYER_JUMP_RECOIL_R
          clc
          adc SPRITE_DIRECTION,x
          adc PLAYER_SPRITE_BASE,x
          sta SPRITE_POINTER_BASE,x
          rts

.PlayerIsJumping
          jsr UpdateSpriteJump
          jmp .JumpComplete

;------------------------------------------------------------
;pick item = remove item and apply effect
;X = player index
;Y = item index
;------------------------------------------------------------
!zone PickItem
PickItem    
          stx PARAM6
          
          lda ITEM_ACTIVE,y
          cmp #ITEM_BULLET
          beq .EffectBullet
          cmp #ITEM_HEALTH
          beq .EffectHealth
          cmp #ITEM_FAST_RELOAD
          beq .EffectFastReload
          cmp #ITEM_INVINCIBLE
          beq .EffectInvincible
          
.SamDoesNotUseBullets          
.SamDoesNotUseFastReload
.RemoveItem          
          ldx PARAM6
          lda #ITEM_NONE
          sta ITEM_ACTIVE,y
          
          lda #3
          jsr IncreaseScore

          jsr RemoveItemImage
          
          ldx PARAM6
          rts

.EffectBullet
          cpx #1
          beq .SamDoesNotUseBullets
          
          lda PLAYER_SHELLS_MAX
          cmp #5
          beq .RemoveItem
          
          ldx PLAYER_SHELLS_MAX
          
          lda #224
          sta SCREEN_CHAR + 23 * 40 + 19,x
          lda #225
          sta SCREEN_CHAR + 24 * 40 + 19,x
          lda #6
          sta SCREEN_COLOR + 23 * 40 + 19,x
          sta SCREEN_COLOR + 24 * 40 + 19,x
          
          inc PLAYER_SHELLS_MAX
          jmp .RemoveItem
          
.EffectHealth
          lda PLAYER_LIVES,x
          cmp #99
          beq .RemoveItem
          
          inc PLAYER_LIVES,x
          sty PARAM1
          jsr DisplayLiveNumber
          ldy PARAM1
          jmp .RemoveItem
          
.EffectFastReload          
          cpx #1
          beq .SamDoesNotUseFastReload
          
          lda #200
          sta PLAYER_FAST_RELOAD
          jmp .RemoveItem
          
.EffectInvincible          
          lda #200
          sta PLAYER_INVINCIBLE,x
          lda #128
          sta SPRITE_STATE,x
          jmp .RemoveItem
          
;------------------------------------------------------------
;put item image on screen
;X = item index
;------------------------------------------------------------
!zone PutItemImage
PutItemImage
          
          ldy ITEM_POS_Y,x
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_2
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_2 + 1
          
          ldy ITEM_POS_X,x
          
          lda ITEM_ACTIVE,x
          tax
          ;put item 
          lda ITEM_CHAR_UL,x
          sta (ZEROPAGE_POINTER_1),y
          lda ITEM_COLOR_UL,x
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          lda ITEM_CHAR_UR,x
          sta (ZEROPAGE_POINTER_1),y
          lda ITEM_COLOR_UR,x
          sta (ZEROPAGE_POINTER_2),y
          
          tya
          clc
          adc #39
          tay
          
          lda ITEM_CHAR_LL,x
          sta (ZEROPAGE_POINTER_1),y
          lda ITEM_COLOR_LL,x
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          lda ITEM_CHAR_LR,x
          sta (ZEROPAGE_POINTER_1),y
          lda ITEM_COLOR_LR,x
          sta (ZEROPAGE_POINTER_2),y
          
          rts
          

;------------------------------------------------------------
;remove item image from screen
;Y = item index
;------------------------------------------------------------
!zone RemoveItemImage
RemoveItemImage
          sty PARAM2
          stx PARAM3
          
          lda ITEM_POS_Y,y
          tay
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_2 + 1
          sec
          sbc #( ( SCREEN_COLOR - SCREEN_BACK_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          sec
          sbc #( ( SCREEN_BACK_CHAR - SCREEN_BACK_COLOR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_4 + 1
          
          ldx PARAM2
          ldy ITEM_POS_X,x
          
          lda (ZEROPAGE_POINTER_4),y
          sta (ZEROPAGE_POINTER_2),y
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          lda (ZEROPAGE_POINTER_4),y
          sta (ZEROPAGE_POINTER_2),y
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y

          tya
          clc
          adc #39
          tay
          lda (ZEROPAGE_POINTER_4),y
          sta (ZEROPAGE_POINTER_2),y
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          lda (ZEROPAGE_POINTER_4),y
          sta (ZEROPAGE_POINTER_2),y
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y
          
          ;repaint other items to avoid broken overlapped items
          ldx #0
.RepaintLoop
          lda ITEM_ACTIVE,x
          cmp #ITEM_NONE
          beq .RepaintNextItem
          
          txa
          pha
          jsr PutItemImage
          pla
          tax
          
.RepaintNextItem
          inx
          cpx #ITEM_COUNT
          bne .RepaintLoop
          
          ldy PARAM2
          ldx PARAM3
          rts


;------------------------------------------------------------
;player fires shot
;------------------------------------------------------------
!zone FireShot
FireShot
          stx PARAM6
          
          dec PLAYER_SHELLS
          ldy PLAYER_SHELLS
          
          lda #6
          sta SCREEN_COLOR + 23 * 40 + 19,y
          sta SCREEN_COLOR + 24 * 40 + 19,y
          
          ;frame delay until next shot
          lda #20
          sta PLAYER_SHOT_PAUSE
          
          ldy SPRITE_CHAR_POS_Y
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X
          
.ShotContinue
          lda SPRITE_DIRECTION
          beq .ShootRight

          ;shooting left          
          dey
          
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          beq .CheckHitEnemy

.ShotDone
          ldx PARAM6
          rts
          
.ShootRight
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .ShotDone
          
.CheckHitEnemy          
          ;hit an enemy?
          ldx #1
          
.CheckEnemy          
          stx PARAM2
          lda SPRITE_ACTIVE,x
          beq .CheckNextEnemy

          tax
          lda IS_TYPE_ENEMY,x
          beq .CheckNextEnemy

          ldx PARAM2
          ;is vulnerable?          
          lda SPRITE_STATE,x
          cmp #128
          bpl .CheckNextEnemy

          ;sprite pos matches on x?
          sty PARAM1
          lda SPRITE_CHAR_POS_X,x
          cmp PARAM1
          bne .CheckNextEnemy
          
          ;sprite pos matches on y?
          lda SPRITE_CHAR_POS_Y,x
          cmp SPRITE_CHAR_POS_Y
          beq .EnemyHit

          ;sprite pos matches on y + 1?
          clc
          adc #1
          cmp SPRITE_CHAR_POS_Y
          beq .EnemyHit

          ;sprite pos matches on y - 1?
          sec
          sbc #2
          cmp SPRITE_CHAR_POS_Y
          bne .CheckNextEnemy
          
.EnemyHit          
          ;enemy hit!
          lda #1
          jsr IncreaseScore
          
          dec SPRITE_HP,x
          lda SPRITE_HP,x
          beq .EnemyKilled
          
          ;call enemy hit behaviour
          ldy SPRITE_ACTIVE,x
          ;enemy is active
          dey
          dey
          lda ENEMY_HIT_BEHAVIOUR_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda ENEMY_HIT_BEHAVIOUR_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ;set up return address for rts
          lda #>( .ShotDone - 1 )
          pha 
          lda #<( .ShotDone - 1 )
          pha
          
          jmp (ZEROPAGE_POINTER_1)
          
.CheckNextEnemy     
          ldx PARAM2
          inx
          cpx #8
          beq .NoEnemyHit
          jmp .CheckEnemy

.NoEnemyHit
          jmp .ShotContinue

.EnemyKilled
          lda #5
          jsr IncreaseScore

          jsr KillEnemy
          jmp .ShotDone
          

;------------------------------------------------------------
;kill off enemy (remove object, generate item)
;x = enemy index
;------------------------------------------------------------
!zone KillEnemy
KillEnemy
          ;is the enemy currently held?
          ldy SPRITE_HELD		; if an enemy was being held
          dey					; (fix index, boo! and compare with currently active enemy)
          tya
          cmp SPRITE_ACTIVE,x
          bne .WasNotHeld
          
          lda #0				; set SPRITE_HELD to 0 again
          sta SPRITE_HELD
          
.WasNotHeld          
          ldy SPRITE_ACTIVE,x		; check if the sprite was an actual enemy
          lda IS_TYPE_ENEMY,y		; (we assume the caller does not check for this)
          beq .NoEnemy
          
          dec NUMBER_ENEMIES_ALIVE	; decrease the number of enemies alive
          
.NoEnemy          
          lda #TYPE_EXPLOSION		; ensue the explosion routine, regardless of we're
          sta SPRITE_ACTIVE,x		; destroying a non enemy sprite (fascinating)
          
          lda #15				; set the enemy sprite colour to 15 (grey)
          sta VIC_SPRITE_COLOR,x
          
          lda BIT_TABLE,x		; turn multicolour on
          ora VIC_SPRITE_MULTICOLOR
          sta VIC_SPRITE_MULTICOLOR
          
          lda #SPRITE_EXPLOSION_1	; change shape to explosion
          sta SPRITE_POINTER_BASE,x
          
          lda #0				; set animation delay and step to 0
          sta SPRITE_ANIM_DELAY,x
          sta SPRITE_ANIM_POS,x
          
          ;only spawn item randomly
          jsr GenerateRandomNumber	; generate a 'random' number 
          cmp #5
          bpl .CreateNoItem
          jsr SpawnItem			; if it's 5, spawn an item
.CreateNoItem          
          rts
          
          
;------------------------------------------------------------
;sam uses power
;returns 1 when holding an enemy
;------------------------------------------------------------
!zone SamUseForce
SamUseForce
          lda SPRITE_HELD			; check if we're already holding a sprite
          beq .NoSpriteHeldNow
          
          lda #1					; if so, just set a to 1 and rts
          rts
          
.NoSpriteHeldNow          			; if not, save the x (player sprite number)
          stx PARAM6
          
          ldy SPRITE_CHAR_POS_Y,x		; get our char y position
          dey						; adjust the index and get the char coordinates
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x		; get our x position
          
.ShotContinue
          ;y contains shot X pos
          ;PARAM6 contains x sprite index of player
          ldx PARAM6				; check which direction we're shooting in
          lda SPRITE_DIRECTION,x
          beq .ShootRight

          ;shooting left          
          dey						; our shot goes left (dec x position)
          
          lda (ZEROPAGE_POINTER_1),y	; get whatever's there
          jsr IsCharBlocking			; check if there's anything blocking our shot
          beq .CheckHitEnemy			; if not, check if we've hit an enemy

          ldx PARAM6				; otherwise return and set a to 0 
.ShotDoneMiss          				; so we're not holding anything
          lda #0
.ShotDoneHit          
          rts
          
.ShootRight
          iny						; same for right
          
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .ShotDoneMiss			; missed, then we're ready
          
.CheckHitEnemy          
          ;hit an enemy?
          ldx #0					; now check if we've hit any enemy
          
.CheckEnemy          
          stx PARAM2				; store our values
          sty PARAM1
          lda SPRITE_ACTIVE,x			; loop through the active sprites
          beq .CheckNextEnemy

          tax						; is this sprite an enemy?
          lda IS_TYPE_ENEMY,x
          beq .CheckNextEnemy

          ldx PARAM2
          ;is vulnerable?          
          lda SPRITE_STATE,x			; is it vulnerable?
          cmp #128
          bpl .CheckNextEnemy

          ;sprite pos matches on x?
          lda SPRITE_CHAR_POS_X,x		; do the shot and enemy line up (x and y)
          cmp PARAM1
          bne .CheckNextEnemy
          
          ;sprite pos matches on y?
          ldy PARAM6
          lda SPRITE_CHAR_POS_Y,x
          cmp SPRITE_CHAR_POS_Y,y
          beq .EnemyHit

          ;sprite pos matches on y + 1?
          clc						; also check for the lines above and below the shot
          adc #1
          cmp SPRITE_CHAR_POS_Y,y
          beq .EnemyHit

          ;sprite pos matches on y - 1?
          sec
          sbc #2
          cmp SPRITE_CHAR_POS_Y,y
          bne .CheckNextEnemy
          
.EnemyHit          					; enemy is hit, so 
          ;enemy hit!
          stx SPRITE_HELD			; store its sprite number in SPRITE_HELD
          inc SPRITE_HELD			; and fix its index (boo!)
          
          ;call enemy hit behaviour
          ldy SPRITE_ACTIVE,x			; when the enemy's hit, call its hit behaviour function
          ;enemy is active
          dey
          dey
          lda ENEMY_HIT_BEHAVIOUR_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda ENEMY_HIT_BEHAVIOUR_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ;set up return address for rts
          lda #>( .ShotDoneHit - 1 )
          pha 
          lda #<( .ShotDoneHit - 1 )
          pha
          
          ldx PARAM6
          ;1 as return value
          lda #1
          jmp (ZEROPAGE_POINTER_1)
          
.CheckNextEnemy     
          ldx PARAM2
          ldy PARAM1
          inx
          cpx #8
          beq .NoEnemyHit
          
          jmp .CheckEnemy

.NoEnemyHit
          jmp .ShotContinue
          
          
;------------------------------------------------------------
;spawns an item at char position from object x
;X = object index
;------------------------------------------------------------
!zone SpawnItem
SpawnItem
          ;find free item slot
          ldy #0
          
.CheckNextItemSlot          
          lda ITEM_ACTIVE,y
          cmp #ITEM_NONE
          beq .FreeSlotFound
          iny
          cpy #ITEM_COUNT
          bne .CheckNextItemSlot
          rts
          
.FreeSlotFound          
          jsr GenerateRandomNumber
          and #$03
          
          sta ITEM_ACTIVE,y
          sta PARAM1
          
          lda #0
          sta ITEM_TIME,y
          
          lda SPRITE_CHAR_POS_X,x
          sta ITEM_POS_X,y
          ;keep item in bounds
          cmp #37
          bmi .XIsOk
          lda #37
          sta ITEM_POS_X,y
.XIsOk          
          lda SPRITE_CHAR_POS_Y,x
          sec
          sbc #1
          sta ITEM_POS_Y,y
          cmp #21
          bne .YIsOk
          lda #20
          sta ITEM_POS_X,y
.YIsOk
          stx PARAM5
          tya
          tax
          jsr PutItemImage
          
          ldx PARAM5
          rts
          
          
;------------------------------------------------------------
;PlayerMoveLeft
;------------------------------------------------------------
!zone PlayerMoveLeft
PlayerMoveLeft  
          lda #1
          sta SPRITE_DIRECTION,x
          ;fall through


;------------------------------------------------------------
;move object left if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveLeftBlocking
ObjectMoveLeftBlocking
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveLeft
          
.CanMoveLeft
          dec SPRITE_CHAR_POS_X_DELTA,x
          
          jsr MoveSpriteLeft
          lda #1
          rts
          
.CheckCanMoveLeft
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .NoThirdCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          lda SPRITE_CHAR_POS_X,x
          clc
          adc #39
          tay
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedLeft
          
.NoThirdCharCheckNeeded          
          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          dey
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedLeft
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedLeft
          
          
          lda #8
          sta SPRITE_CHAR_POS_X_DELTA,x
          dec SPRITE_CHAR_POS_X,x
          jmp .CanMoveLeft
          
.BlockedLeft
          lda #0
          rts

          
;------------------------------------------------------------
;move object left
;x = object index
;------------------------------------------------------------
!zone ObjectMoveLeft
ObjectMoveLeft
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          bne .NoCharStep
          
          lda #8
          sta SPRITE_CHAR_POS_X_DELTA,x
          dec SPRITE_CHAR_POS_X,x
          
.NoCharStep
          dec SPRITE_CHAR_POS_X_DELTA,x
          
          jsr MoveSpriteLeft
          rts
          
          
;------------------------------------------------------------
;walk object left if not blocked and do not fall off
;x = object index
;------------------------------------------------------------
!zone ObjectWalkLeft
ObjectWalkLeft          
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveLeft
          
.CanMoveLeft
          dec SPRITE_CHAR_POS_X_DELTA,x
          
          jsr MoveSpriteLeft
          lda #1
          rts
          
.CheckCanMoveLeft
          jsr CanWalkLeft
          beq .Blocked
          
          lda #8
          sta SPRITE_CHAR_POS_X_DELTA,x
          dec SPRITE_CHAR_POS_X,x
          
          jmp .CanMoveLeft
          
.Blocked          
          rts


;------------------------------------------------------------
;checks if an object can walk left
;x = object index
;returns 0 if blocked
;returns 1 if possible
;------------------------------------------------------------
!zone CanWalkLeft
CanWalkLeft
          ldy SPRITE_CHAR_POS_Y,x
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          lda SPRITE_CHAR_POS_X,x
          clc
          adc #39
          tay
          
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlockingFall
          beq .BlockedLeft
          
          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          dey
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedLeft
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedLeft
          
          lda #1
          rts
          
          
.BlockedLeft
          lda #0
          rts
          
          
;------------------------------------------------------------
;PlayerMoveRight
;------------------------------------------------------------
!zone PlayerMoveRight
PlayerMoveRight
          lda #0
          sta SPRITE_DIRECTION,x
          ;fall through
          
                    
;------------------------------------------------------------
;move object right if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveRightBlocking
ObjectMoveRightBlocking
                    
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveRight
          
.CanMoveRight
          inc SPRITE_CHAR_POS_X_DELTA,x
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          inc SPRITE_CHAR_POS_X,x
          
.NoCharStep          
          jsr MoveSpriteRight
          lda #1
          rts
          
.CheckCanMoveRight
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .NoThirdCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedRight
          
.NoThirdCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedRight
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedRight
          
          jmp .CanMoveRight
          
.BlockedRight 
          lda #0
          rts
          

;------------------------------------------------------------
;move object right
;x = object index
;------------------------------------------------------------
!zone ObjectMoveRight
ObjectMoveRight
                    
          inc SPRITE_CHAR_POS_X_DELTA,x
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          inc SPRITE_CHAR_POS_X,x
          
.NoCharStep          
          jsr MoveSpriteRight
          rts
          
          
;------------------------------------------------------------
;walk object right if not blocked, do not fall off
;x = object index
;------------------------------------------------------------
!zone ObjectWalkRight
ObjectWalkRight
                    
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveRight
          
.CanMoveRight
          inc SPRITE_CHAR_POS_X_DELTA,x
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          inc SPRITE_CHAR_POS_X,x
          
.NoCharStep          
          jsr MoveSpriteRight
          lda #1
          rts
          
.CheckCanMoveRight
          jsr CanWalkRight
          bne .CanMoveRight
          rts
          
          
;------------------------------------------------------------
;checks if an object can walk to the right
;x = object index
;returns 0 if blocked
;returns 1 if possible
;------------------------------------------------------------
!zone CanWalkRight
CanWalkRight
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny

          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlockingFall
          beq .BlockedRight
          
          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedRight
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedRight
          
          lda #1
          rts
          
.BlockedRight          
          lda #0
          rts


;------------------------------------------------------------
;walk object left if could fall off jump if blocked turn
;x = object index
;------------------------------------------------------------
!zone ObjectWalkOrJumpLeft
ObjectWalkOrJumpLeft          
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveLeft
          
.CanMoveLeft
          dec SPRITE_CHAR_POS_X_DELTA,x
          
          jsr MoveSpriteLeft
          lda #1
          rts
          
.CheckCanMoveLeft
          jsr CanWalkOrJumpLeft
          beq .Blocked
          
          cmp #1
          beq .WalkLeft

          ;jump
          lda SPRITE_JUMP_POS,x
          bne .WalkLeft
          
          lda #1
          sta SPRITE_JUMP_POS,x
          
.WalkLeft          
          lda #8
          sta SPRITE_CHAR_POS_X_DELTA,x
          dec SPRITE_CHAR_POS_X,x
          
          jmp .CanMoveLeft
          
.Blocked          
          rts


;------------------------------------------------------------
;checks if an object can walk or jump left (jump if would fall off)
;x = object index
;returns 0 if blocked
;returns 1 if possible
;returns 2 if jump required (not blocked, but in front of hole)
;------------------------------------------------------------
!zone CanWalkOrJumpLeft
CanWalkOrJumpLeft
          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          dey
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedLeft
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedLeft

          ;is a hole in front          
          ldy SPRITE_CHAR_POS_Y,x
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          lda SPRITE_CHAR_POS_X,x
          clc
          adc #39
          tay
          
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlockingFall
          bne .NoHole

          lda #2
          rts
          
.NoHole          
          lda #1
          rts
          
          
.BlockedLeft
          lda #0
          rts
          
          
;------------------------------------------------------------
;walk object right if could fall off jump if blocked turn
;x = object index
;------------------------------------------------------------
!zone ObjectWalkOrJumpRight
ObjectWalkOrJumpRight
                    
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveRight
          
.CanMoveRight
          inc SPRITE_CHAR_POS_X_DELTA,x
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          inc SPRITE_CHAR_POS_X,x
          
.NoCharStep          
          jsr MoveSpriteRight
          lda #1
          rts
          
.CheckCanMoveRight
          jsr CanWalkOrJumpRight
          beq .Blocked
          
          cmp #1
          beq .CanMoveRight

          ;jump
          lda SPRITE_JUMP_POS,x
          bne .CanMoveRight
          
          lda #1
          sta SPRITE_JUMP_POS,x
          jmp .CanMoveRight
          
.Blocked          
          rts
          
          
;------------------------------------------------------------
;checks if an object can walk or jump right (jump if would fall off)
;x = object index
;returns 0 if blocked
;returns 1 if possible
;------------------------------------------------------------
!zone CanWalkOrJumpRight
CanWalkOrJumpRight
          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedRight
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedRight

          ;is a hole in front?
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          iny

          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlockingFall
          bne .NoHole

          lda #2
          rts
          
.NoHole          
          lda #1
          rts
          
.BlockedRight          
          lda #0
          rts


;------------------------------------------------------------
;PlayerMoveUp
;------------------------------------------------------------
!zone PlayerMoveUp
PlayerMoveUp
          ldx #0
          jmp ObjectMoveUpBlocking
          
          
;------------------------------------------------------------
;move object up if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveUpBlocking
ObjectMoveUpBlocking
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .CheckCanMoveUp
          
.CanMoveUp
          dec SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #$ff
          bne .NoCharStep
          
          dec SPRITE_CHAR_POS_Y,x
          lda #7
          sta SPRITE_CHAR_POS_Y_DELTA,x
          
.NoCharStep          
          jsr MoveSpriteUp
          lda #1
          rts
          
.CheckCanMoveUp
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          dey
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedUp
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          dey
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedUp
          
          jmp .CanMoveUp
          
.BlockedUp
          lda #0
          rts
          
          
;------------------------------------------------------------
;move object up
;x = object index
;------------------------------------------------------------
!zone ObjectMoveUp
ObjectMoveUp
          
          dec SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #$ff
          bne .NoCharStep
          
          dec SPRITE_CHAR_POS_Y,x
          lda #7
          sta SPRITE_CHAR_POS_Y_DELTA,x
          
.NoCharStep          
          jsr MoveSpriteUp
          rts
          
          
;------------------------------------------------------------
;move object down if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveDownBlocking
ObjectMoveDownBlocking
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .CheckCanMoveDown
          
.CanMoveDown
          inc SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA,x
          inc SPRITE_CHAR_POS_Y,x
          
.NoCharStep          
          jsr MoveSpriteDown
          lda #1
          rts
          
.CheckCanMoveDown
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlockingFall
          bne .BlockedDown
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_BACK_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlockingFall
          bne .BlockedDown
          
          jmp .CanMoveDown
          
.BlockedDown
          lda #0
          rts
          

;------------------------------------------------------------
;move object down
;x = object index
;------------------------------------------------------------
!zone ObjectMoveDown
ObjectMoveDown
          
          inc SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA,x
          inc SPRITE_CHAR_POS_Y,x
          
.NoCharStep          
          jsr MoveSpriteDown
          rts


;------------------------------------------------------------
;Enemy Behaviour
;------------------------------------------------------------
!zone ObjectControl
ObjectControl
          ldx #0
          
.ObjectLoop          
          ;object does not move when held
          lda SPRITE_HELD				; looping through all objects, check if one matches SPRITE_HELD
          sta PARAM1					; if so, skip it because it can't move.
          dec PARAM1
          cpx PARAM1
          beq .NextObject
          
          ;does object exist?
          ldy SPRITE_ACTIVE,x
          beq .NextObject
          
          ;enemy is active
          dey								; don't forget the players are moved by this as well! 
          lda ENEMY_BEHAVIOUR_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda ENEMY_BEHAVIOUR_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ;set up return address for rts
          lda #>( .NextObject - 1 )
          pha 
          lda #<( .NextObject - 1 )
          pha
          
          jmp (ZEROPAGE_POINTER_1)
          
.NextObject          
          inx
          cpx #8
          bne .ObjectLoop
          rts
          

;------------------------------------------------------------
;simply move diagonal
;------------------------------------------------------------
!zone BehaviourBatDiagonal
BehaviourBatDiagonal
          lda DELAYED_GENERIC_COUNTER
          and #$03
          bne .NoAnimUpdate
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda BAT_ANIMATION,y
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate          
          lda SPRITE_DIRECTION,x
          beq .MoveRight
          
          ;move left
          jsr ObjectMoveLeftBlocking
          beq .ToggleDirection
          jmp .MoveY
          
.MoveRight
          jsr ObjectMoveRightBlocking
          beq .ToggleDirection
          jmp .MoveY
          
.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          
.MoveY
          lda SPRITE_DIRECTION_Y,x
          beq .MoveDown
          
          ;move up
          jsr ObjectMoveUpBlocking
          beq .ToggleDirectionY
          rts
          
.MoveDown
          jsr ObjectMoveDownBlocking
          beq .ToggleDirectionY
          rts
          
.ToggleDirectionY
          lda SPRITE_DIRECTION_Y,x
          eor #1
          sta SPRITE_DIRECTION_Y,x
          rts
 
 
;------------------------------------------------------------
;simply move up/down
;------------------------------------------------------------
!zone BehaviourBatUD
BehaviourBatUD
          lda DELAYED_GENERIC_COUNTER
          and #$03
          bne .NoAnimUpdate
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda BAT_ANIMATION,y
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate          
          lda SPRITE_DIRECTION,x
          beq .MoveDown
          
          ;move up
          jsr ObjectMoveUpBlocking
          beq .ToggleDirection
          rts
          
.MoveDown
          jsr ObjectMoveDownBlocking
          beq .ToggleDirection
          rts
          
.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          rts
          

;------------------------------------------------------------
;move in flat 8
;------------------------------------------------------------
!zone BehaviourBat8
BehaviourBat8
          lda DELAYED_GENERIC_COUNTER
          and #$03
          bne .NoAnimUpdate
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda BAT_ANIMATION,y
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate          

          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          and #31
          sta SPRITE_MOVE_POS,x
          
          tay
          lda PATH_8_DX,y
          beq .NoXMoveNeeded
          sta PARAM1
          and #$80
          beq .MoveRight
          
          ;move left
          lda PARAM1
          and #$7f
          sta PARAM1
.MoveLeft          
          jsr ObjectMoveLeft
          dec PARAM1
          bne .MoveLeft
          jmp .XMoveDone
          
.MoveRight
          jsr ObjectMoveRight
          dec PARAM1
          bne .MoveRight
          
.NoXMoveNeeded          
.XMoveDone
          ldy SPRITE_MOVE_POS,x
          lda PATH_8_DY,y
          beq .NoYMoveNeeded
          sta PARAM1
          and #$80
          beq .MoveDown
          
          ;move up
          lda PARAM1
          and #$7f
          sta PARAM1
.MoveUp   
          jsr ObjectMoveUp
          dec PARAM1
          bne .MoveUp
          rts
          
.MoveDown
          jsr ObjectMoveDown
          dec PARAM1
          bne .MoveDown

.NoYMoveNeeded
          rts
          
 
;------------------------------------------------------------
;simply walk left/right, don't fall off
;------------------------------------------------------------
!zone BehaviourMummy
BehaviourMummy
          lda SPRITE_HITBACK,x
          beq .NoHitBack

          dec SPRITE_HITBACK,x
          lda SPRITE_HITBACK_DIRECTION,x
          beq .HitBackRight
          
          ;move left
          jsr ObjectMoveLeftBlocking
          rts
          
.HitBackRight          
          jsr ObjectMoveRightBlocking
          rts
          
.NoHitBack          
          jsr ObjectMoveDownBlocking
          beq .NotFalling
          rts
          
.NotFalling          
          lda SPRITE_CHAR_POS_Y,x
          cmp SPRITE_CHAR_POS_Y
          bne .NoPlayerInSight
          
          ;player on same height
          ;looking at the player?
          jsr LookingAtPlayer
          beq .NoPlayerInSight

          lda #SPRITE_MUMMY_ATTACK_R
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          
          lda SPRITE_DIRECTION,x
          beq .AttackRight
          
          ;attack to left
          jsr ObjectMoveLeftBlocking
          jsr ObjectMoveLeftBlocking
          beq .ToggleDirection
          rts
          
.AttackRight
          ;attack to left
          jsr ObjectMoveRightBlocking
          jsr ObjectMoveRightBlocking
          beq .ToggleDirection
          rts

.NoPlayerInSight
          lda DELAYED_GENERIC_COUNTER
          and #$03
          beq .MovementUpdate
          rts
          
.MovementUpdate
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          and #$03
          sta SPRITE_MOVE_POS,x
          
          cmp #2
          
          bpl .CanMove

          lda #SPRITE_MUMMY_R_2
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          rts

.CanMove
          lda #SPRITE_MUMMY_R_1
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          
          lda SPRITE_DIRECTION,x
          beq .MoveRight
          
          ;move left
          jsr ObjectWalkLeft
          beq .ToggleDirection
          rts
          
.MoveRight
          jsr ObjectWalkRight
          beq .ToggleDirection
          rts
          
.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          clc
          adc #SPRITE_MUMMY_R_1
          sta SPRITE_POINTER_BASE,x
          rts
 
 
;------------------------------------------------------------
;simply walk left/right, don't fall off
;------------------------------------------------------------
!zone BehaviourZombie
BehaviourZombie
          lda SPRITE_HITBACK,x
          beq .NoHitBack

          dec SPRITE_HITBACK,x
          lda SPRITE_HITBACK_DIRECTION,x
          beq .HitBackRight
          
          ;move left
          jsr ObjectMoveLeftBlocking
          rts
          
.HitBackRight          
          jsr ObjectMoveRightBlocking
          rts
          
.NoHitBack          
          lda SPRITE_JUMP_POS,x
          bne .IsJumping
          jsr ObjectMoveDownBlocking
          bne .Falling
          
.IsJumping          
          lda DELAYED_GENERIC_COUNTER
          and #$03
          beq .MovementUpdate
          rts
          
.Falling  
          rts
          
.MovementUpdate
          lda SPRITE_JUMP_POS,x
          bne .UpdateJump
          lda SPRITE_STATE,x
          bne .OtherStates

          jsr GenerateRandomNumber
          cmp #17
          beq .Jump
          jmp .NormalWalk
          
.OtherStates          
          ;collapsing?
          cmp #128
          beq .Collapsing1
          cmp #129
          beq .Collapsing2
          cmp #131
          bne .NotWakeUp1
          jmp .WakeUp1
.NotWakeUp1          
          cmp #132
          bne .NotWakeUp2
          jmp .WakeUp2
.NotWakeUp2          
          cmp #130
          bne .NotHidden
          jmp .Hidden
          
.NotHidden          
          rts          
          
.Jump
          ;start jump
          lda #SPRITE_ZOMBIE_JUMP_R
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          
.UpdateJump
          jsr UpdateSpriteJump
          rts

.Collapsing1
          lda #SPRITE_ZOMBIE_COLLAPSE_R_2
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          inc SPRITE_STATE,x
          rts
          
.Collapsing2
          lda #SPRITE_INVISIBLE
          sta SPRITE_POINTER_BASE,x
          
          inc SPRITE_STATE,x

          ;generate hidden time
          jsr GenerateRandomNumber
          and #$31
          clc
          adc #25
          sta SPRITE_MOVE_POS,x
          
          ;normalise position on full char
          ldy SPRITE_CHAR_POS_X_DELTA,x
          sty PARAM5
.CheckXPos          
          beq .XPosClear
          jsr ObjectMoveLeft
          dec PARAM5
          jmp .CheckXPos
          
.XPosClear          
          ldy SPRITE_CHAR_POS_Y_DELTA,x
          sty PARAM5
.CheckYPos          
          beq .YPosClear
          jsr ObjectMoveUp
          dec PARAM5
          jmp .CheckYPos
.YPosClear          
          rts
          
          
.WakeUp1
          lda #SPRITE_ZOMBIE_COLLAPSE_R_1
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          inc SPRITE_STATE,x
          rts
          
.WakeUp2
          lda #SPRITE_ZOMBIE_WALK_R_1
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          
          lda #0
          sta SPRITE_STATE,x
          sta SPRITE_MOVE_POS,x
          rts
          
          
.NormalWalk          
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          and #$07
          sta SPRITE_MOVE_POS,x
          cmp #4
          
          bpl .CanMove
          
          lda #SPRITE_ZOMBIE_WALK_R_1
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          rts

.CanMove
          lda #SPRITE_ZOMBIE_WALK_R_2
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          
          lda SPRITE_DIRECTION,x
          beq .MoveRight
          
          ;move left
          jsr ObjectMoveLeftBlocking
          beq .ToggleDirection
          
          lda SPRITE_ANNOYED,x
          beq .NotAnnoyed
          jsr ObjectMoveLeftBlocking
          beq .ToggleDirection
.NotAnnoyed          
          rts
          
.MoveRight
          jsr ObjectMoveRightBlocking
          beq .ToggleDirection
          lda SPRITE_ANNOYED,x
          beq .NotAnnoyed
          jsr ObjectMoveRightBlocking
          beq .ToggleDirection
          rts
          
.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          rts
 
.Hidden
          ;are we apt to wake up?
          dec SPRITE_MOVE_POS,x
          bne .RandomMove

          ;wake up          
          inc SPRITE_STATE,x
          lda #SPRITE_ZOMBIE_COLLAPSE_R_2
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          rts
          
.RandomMove          
          ;move randomly left/right
          jsr GenerateRandomNumber
          and #$01
          beq .MoveLeft

          ;move right if possible          
          jsr CanWalkRight
          beq .Blocked
          
          inc SPRITE_CHAR_POS_X,x
          
          ldy #8
          sty PARAM5
          
.MoveSpriteRight          
          jsr MoveSpriteRight
          dec PARAM5
          bne .MoveSpriteRight
          rts          
          
.MoveLeft          
          jsr CanWalkLeft
          beq .Blocked
          
          dec SPRITE_CHAR_POS_X,x
          
          ldy #8
          sty PARAM5
          
.MoveSpriteLeft
          jsr MoveSpriteLeft
          dec PARAM5
          bne .MoveSpriteLeft
          rts          

.Blocked
          rts
          
 
;------------------------------------------------------------
;vanishing bat
;------------------------------------------------------------
!zone BehaviourBatVanishing
BehaviourBatVanishing
          lda SPRITE_STATE,x
          bne .NotNormal
          jmp .NormalUpdate
          
.NotNormal
          cmp #128
          beq .Vanish1
          cmp #129
          beq .Hidden
          cmp #130
          beq .Spawn
          cmp #1
          bne .NoSpecialBehaviour
          jmp .AttackFlight
          
.NoSpecialBehaviour          
          rts
          
.Vanish1
          lda DELAYED_GENERIC_COUNTER
          and #$07
          bne .NoSpecialBehaviour
          
          lda #SPRITE_INVISIBLE
          sta SPRITE_POINTER_BASE,x
          
          inc SPRITE_STATE,x
          jsr GenerateRandomNumber
          adc #24
          sta SPRITE_MOVE_POS,x
          rts
          
.Spawn          
          lda DELAYED_GENERIC_COUNTER
          and #$07
          bne .NoSpecialBehaviour
          
          lda #1
          sta SPRITE_STATE,x
          lda #SPRITE_BAT_1
          sta SPRITE_POINTER_BASE,x
          rts

.Hidden
          dec SPRITE_MOVE_POS,x
          beq .Unhide
          rts
          
.Unhide

          ;position diagonal above/below player
          lda SPRITE_CHAR_POS_X
          cmp #10
          bcc .SpawnOnRight
          cmp #30
          bcs .SpawnOnLeft
          
          ;randomly choose
          jsr GenerateRandomNumber
          and #$01
          beq .SpawnOnRight
          
          
.SpawnOnLeft
          lda SPRITE_CHAR_POS_X
          sec
          sbc #5
          sta PARAM1
          
          lda #0
          sta SPRITE_DIRECTION,x
          jmp .FindYSpawnPos

          
.SpawnOnRight          
          lda SPRITE_CHAR_POS_X
          clc
          adc #5
          sta PARAM1

          lda #1
          sta SPRITE_DIRECTION,x

.FindYSpawnPos
          lda SPRITE_CHAR_POS_Y
          cmp #5
          bcc .SpawnBelow
          cmp #15
          bcs .SpawnAbove
          
          ;randomly choose
          jsr GenerateRandomNumber
          and #$01
          beq .SpawnAbove

.SpawnBelow         
          lda SPRITE_CHAR_POS_Y
          clc
          adc #5
          sta PARAM2
          
          lda #0
          sta SPRITE_FALLING,x
          jmp .Reposition

.SpawnAbove
          lda SPRITE_CHAR_POS_Y
          sec
          sbc #5
          sta PARAM2

          lda #1
          sta SPRITE_FALLING,x
          
.Reposition
          jsr CalcSpritePosFromCharPos
          
          inc SPRITE_STATE,x
          
          lda #SPRITE_BAT_VANISH
          sta SPRITE_POINTER_BASE,x
          rts

.AnimateBat
          lda DELAYED_GENERIC_COUNTER
          and #$03
          bne .NoAnimUpdate
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda BAT_ANIMATION,y
          sta SPRITE_POINTER_BASE,x
.NoAnimUpdate          
          rts
          
.NormalUpdate          
          lda SPRITE_STATE,x
          bne .NoAction
          
          lda SPRITE_DIRECTION,x
          beq .MoveRight
          
          ;move left
          jsr ObjectMoveLeftBlocking
          beq .ToggleDirection
          jmp .AnimateBat
          
.MoveRight
          jsr ObjectMoveRightBlocking
          beq .ToggleDirection
          jmp .AnimateBat
          rts
          
.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
.NoAction 
          rts
 
 
.AttackFlight
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          cmp #80
          beq .AttackDone
          cmp #40
          beq .ChangeFlyDirection
          
          ;fly towards player
          lda SPRITE_DIRECTION,x
          beq .FlyRight
          
          stx PARAM5
          jsr ObjectMoveLeft
          jmp .FlyUpDown
          
.FlyRight
          stx PARAM5
          jsr ObjectMoveRight
          
.FlyUpDown          
          ldx PARAM5
          lda SPRITE_FALLING,x
          beq .FlyUp
          
          jsr ObjectMoveDown
          jmp .AnimateBat
          
.FlyUp
          jsr ObjectMoveUp
          jmp .AnimateBat
          
.ChangeFlyDirection
          ;change direction to avoid flying out of the screen
          lda SPRITE_CHAR_POS_Y,x
          cmp #5
          bcc .ChangeY
          cmp #18
          bcc .CheckXDir
          
.ChangeY
          lda SPRITE_FALLING,x
          eor #$01
          sta SPRITE_FALLING,x
          
.CheckXDir          
          lda SPRITE_CHAR_POS_X,x
          cmp #5
          bcc .ChangeX
          cmp #32
          bcs .ChangeX
          rts
          
.ChangeX
          lda SPRITE_DIRECTION,x
          eor #$01
          sta SPRITE_DIRECTION,x
          rts

.AttackDone
          ;auto-vanish
          lda #0
          sta SPRITE_STATE,x
          jmp HitBehaviourVanish
          
 
;------------------------------------------------------------
;run left/right, jump off directional
;------------------------------------------------------------
!zone BehaviourSpider
BehaviourSpider
          lda SPRITE_HITBACK,x
          beq .NoHitBack

          dec SPRITE_HITBACK,x
          lda SPRITE_HITBACK_DIRECTION,x
          beq .HitBackRight
          
          ;move left
          jsr ObjectMoveLeftBlocking
          rts
          
.HitBackRight          
          jsr ObjectMoveRightBlocking
          rts
          
.NoHitBack          
          ;animate spider
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #2
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda SPIDER_ANIMATION_TABLE,y
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate          
          lda SPRITE_JUMP_POS,x
          bne .NoFallHandling
          
          jsr UpdateSpriteFall
          sta SPRITE_FALLING,x
          
          bne .IsFalling
          
          ;neither jumping nor falling
          jsr GenerateRandomNumber
          and #$0f
          cmp #02
          bpl .IsFalling
          
          ;random jump
          jmp .Jumping
          
.IsFalling          
.NoFallHandling

          lda #3
          sta PARAM6
.MoveStep
          dec PARAM6
          beq .MoveDone

          lda SPRITE_DIRECTION,x
          beq .MoveRight
          
          ;move left
          lda SPRITE_JUMP_POS,x
          ora SPRITE_FALLING,x
          bne .OnlyMoveLeft
          
          jsr ObjectWalkOrJumpLeft
          beq .ToggleDirection
          jmp .MoveStep

.MoveDone
          lda SPRITE_JUMP_POS,x
          beq .NotJumping
          
.Jumping          
          jsr UpdateSpriteJump
.NotJumping          
          rts
          
.OnlyMoveLeft
          jsr ObjectMoveLeftBlocking
          beq .ToggleDirection
          jmp .MoveStep
          
.MoveRight
          lda SPRITE_JUMP_POS,x
          ora SPRITE_FALLING,x
          bne .OnlyMoveRight
          
          jsr ObjectWalkOrJumpRight
          beq .ToggleDirection
          jmp .MoveStep

.OnlyMoveRight
          jsr ObjectMoveRightBlocking
          beq .ToggleDirection
          jmp .MoveStep

.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          jmp .MoveStep
          
 
;------------------------------------------------------------
;explosion
;------------------------------------------------------------
!zone BehaviourExplosion
BehaviourExplosion
          jsr MoveSpriteUp
          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #3
          beq .UpdateAnimation
          rts
          
.UpdateAnimation          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #3
          beq .ExplosionDone
         
          clc
          adc #SPRITE_EXPLOSION_1
          sta SPRITE_POINTER_BASE,x
          rts
          

.ExplosionDone
          jsr RemoveObject
          rts
          

;------------------------------------------------------------
;determins if object is looking at player
;X = sprite index
;returns 1 if looking at player, 0 if not
;------------------------------------------------------------
!zone LookingAtPlayer
LookingAtPlayer
          lda SPRITE_DIRECTION,x
          beq .LookingRight

          lda SPRITE_CHAR_POS_X,x
          cmp SPRITE_CHAR_POS_X
          bpl .LookingAtPlayer
          jmp .NoPlayerInSight

.LookingRight
          lda SPRITE_CHAR_POS_X,x
          cmp SPRITE_CHAR_POS_X
          bmi .LookingAtPlayer
          jmp .NoPlayerInSight
          
.LookingAtPlayer
          lda #1
          rts
 
.NoPlayerInSight
          lda #0
          rts

;------------------------------------------------------------
;hit behaviour getting hurt
;------------------------------------------------------------
!zone HitBehaviourHurt
HitBehaviourHurt
          lda #8
          sta SPRITE_HITBACK,x

          ;hitback dir determined from player dir (equal shot dir)          
          lda SPRITE_DIRECTION
          sta SPRITE_HITBACK_DIRECTION,x
          
          inc SPRITE_ANNOYED,x
          
          ldy SPRITE_ACTIVE,x
          lda TYPE_ANNOYED_COLOR,y
          sta VIC_SPRITE_COLOR,x
          rts
          
 
;------------------------------------------------------------
;hit behaviour getting hurt and turn towards the player
;------------------------------------------------------------
!zone HitBehaviourHurtTurn
HitBehaviourHurtTurn
          lda #8
          sta SPRITE_HITBACK,x

          ;hitback dir determined from player dir (equal shot dir)          
          lda SPRITE_DIRECTION
          sta SPRITE_HITBACK_DIRECTION,x
          
          ;looking at the player?
          jsr LookingAtPlayer
          bne .AlreadySeeingPlayer
          
          ;turn around
          lda SPRITE_DIRECTION,x
          eor #$01
          sta SPRITE_DIRECTION,x
          
.AlreadySeeingPlayer          
          inc SPRITE_ANNOYED,x
          
          ldy SPRITE_ACTIVE,x
          lda TYPE_ANNOYED_COLOR,y
          sta VIC_SPRITE_COLOR,x
          rts
          
 
;------------------------------------------------------------
;hit behaviour crumbling (zombie)
;------------------------------------------------------------
!zone HitBehaviourCrumble
HitBehaviourCrumble
          lda #8
          sta SPRITE_HITBACK,x

          ;hitback dir determined from player dir (equal shot dir)          
          lda SPRITE_DIRECTION
          sta SPRITE_HITBACK_DIRECTION,x

          lda SPRITE_STATE,x
          bne .NoHit
          
          inc SPRITE_ANNOYED,x
          
          ldy SPRITE_ACTIVE,x
          lda TYPE_ANNOYED_COLOR,y
          sta VIC_SPRITE_COLOR,x
          
          lda #SPRITE_ZOMBIE_COLLAPSE_R_1
          clc
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
          
          lda #128
          sta SPRITE_STATE,x
          
.NoHit          
          rts
          
 
;------------------------------------------------------------
;hit behaviour vanishing bat
;------------------------------------------------------------
!zone HitBehaviourVanish
HitBehaviourVanish
          lda SPRITE_STATE,x
          bne .NoHit
          
          lda #1
          sta SPRITE_ANNOYED,x
          
          ldy SPRITE_ACTIVE,x
          lda TYPE_ANNOYED_COLOR,y
          sta VIC_SPRITE_COLOR,x
          
          lda #SPRITE_BAT_VANISH
          sta SPRITE_POINTER_BASE,x
          
          lda #128
          sta SPRITE_STATE,x
          
.NoHit          
          rts
          
 
 
;------------------------------------------------------------
;update sprite jump
;expect x as sprite index (0 to 7)
;returns 0 if blocked/done
;returns 1 if jump continues
;------------------------------------------------------------
 
!zone UpdateSpriteJump
UpdateSpriteJump
          inc SPRITE_JUMP_POS,x
          lda SPRITE_JUMP_POS,x
          cmp #JUMP_TABLE_SIZE
          bne .JumpOn
          
          ;jump done
          jmp .JumpBlocked
          
.JumpOn          
          ldy SPRITE_JUMP_POS,x
          lda JUMP_TABLE,y
          bne .KeepJumping
          
          lda #1
          rts
          
.KeepJumping          
          sta PARAM5
          
.JumpContinue          
          jsr ObjectMoveUpBlocking
          beq .JumpBlocked
          
          dec PARAM5
          bne .JumpContinue
          
          lda #1
          rts
          
.JumpBlocked
          lda #0
          sta SPRITE_JUMP_POS,x
          rts

 
;------------------------------------------------------------
;update sprite fall
;expect x as sprite index (0 to 7)
;returns 0 if not falling
;returns 1 if falling
;------------------------------------------------------------
 
!zone UpdateSpriteFall
UpdateSpriteFall
          jsr ObjectMoveDownBlocking
          beq .NotFalling
          
          ;fell one pixel
          lda #1
          sta SPRITE_FALLING,x
          
          ldy SPRITE_FALL_POS,x
          lda FALL_SPEED_TABLE,y
          beq .FallComplete
          sta PARAM5

.FallLoop          
          dec PARAM5
          beq .FallComplete
          
          jsr ObjectMoveDownBlocking
          jmp .FallLoop
          
.FallComplete
          lda SPRITE_FALL_POS,x
          cmp #( FALL_TABLE_SIZE - 1 )
          beq .FallSpeedAtMax
          
          inc SPRITE_FALL_POS,x
          
.FallSpeedAtMax          
          lda #1
          rts
          
.NotFalling          
          lda #0
          sta SPRITE_FALL_POS,x
          sta SPRITE_FALLING,x
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
          sta VIC_SPRITE_Y_POS,y
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
          sta VIC_SPRITE_Y_POS,y
          rts  


;------------------------------------------------------------
;displays get ready
;------------------------------------------------------------
!zone DisplayGetReady
DisplayGetReady

          lda #40
          sta LEVEL_START_DELAY
          lda #0
          sta SPRITE_JUMP_POS
          
          lda #<TEXT_GET_READY
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_GET_READY
          sta ZEROPAGE_POINTER_1 + 1
          lda #15
          sta PARAM1
          lda #11
          sta PARAM2
          jsr DisplayText
          rts


;------------------------------------------------------------
;BuildScreen
;creates a screen from level data
;------------------------------------------------------------
!zone BuildScreen
BuildScreen
          ;reset all objects
          ldx #0
          lda #0
.ClearObjectLoop
          sta SPRITE_ACTIVE,x
          sta SPRITE_FALLING,x
          sta SPRITE_DIRECTION,x
          sta SPRITE_DIRECTION_Y,x
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          inx
          cpx #8
          bne .ClearObjectLoop
          
          ;clear screen
          lda #0
          ldy #6
          jsr ClearPlayScreen

          ;get pointer to real level data from table
          lda LEVEL_NR
          asl
          tax
          lda SCREEN_DATA_TABLE,x
          sta ZEROPAGE_POINTER_1
          lda SCREEN_DATA_TABLE + 1,x
          sta ZEROPAGE_POINTER_1 + 1
          beq .NoMoreLevels
          
          jsr .BuildLevel

          ;draw level border
          lda #<LEVEL_BORDER_DATA
          sta ZEROPAGE_POINTER_1
          lda #>LEVEL_BORDER_DATA
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr .BuildLevel
          
          jsr DisplayLevelNumber
          
          rts
          
.NoMoreLevels
          ;loop from first screen
          jsr StartLevel
          
          lda #0
          sta LEVEL_NR
          jsr BuildScreen
          rts
          
.BuildLevel
          ;work through data
          ldy #255
          
.LevelDataLoop
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          tax
          
          lda LEVEL_ELEMENT_TABLE_LO,x
          sta ZEROPAGE_POINTER_4
          lda LEVEL_ELEMENT_TABLE_HI,x
          sta ZEROPAGE_POINTER_4 + 1
          
          jmp (ZEROPAGE_POINTER_4)
          
LEVEL_ELEMENT_TABLE_LO
          !byte <.LevelComplete
          !byte <LevelLineH
          !byte <LevelLineV
          !byte <LevelObject
          !byte <LevelArea
          !byte <LevelLineHAlternating
          !byte <LevelLineVAlternating
          !byte <LevelQuad
          
LEVEL_ELEMENT_TABLE_HI
          !byte >.LevelComplete
          !byte >LevelLineH
          !byte >LevelLineV
          !byte >LevelObject
          !byte >LevelArea
          !byte >LevelLineHAlternating
          !byte >LevelLineVAlternating
          !byte >LevelQuad

.LevelComplete          
          rts
          
NextLevelData
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

!zone LevelLineH
LevelLineH
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
          
          jmp NextLevelData


;place the data at a valid bitmap position, this avoids copying the data        
* = $2000        
TITLE_LOGO_BMP_DATA
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,98
        !byte 0,0,0,0,0,42,37,85,0,0,0,0,0,0,128,85,0,0,0,0,0,0,0,64,0,0,0,0,0,0,128,84
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,1,0,0,0,0,0,0,32,80
        !byte 0,0,0,0,0,0,0,1,0,0,0,0,0,0,32,88,0,0,0,0,0,0,0,1,0,0,0,0,0,0,136,85
        !byte 0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
        !byte 0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,52,60,60,31,31,223,160,5,9,5,1,1,85,85
        !byte 1,1,1,1,1,5,5,9,0,144,144,156,148,148,148,164,9,1,1,0,8,0,0,0,97,72,77,105,65,64,130,128
        !byte 89,235,235,235,235,235,233,233,106,218,250,246,246,254,246,246,129,148,162,166,165,165,170,170,170,170,170,169,169,168,168,169
        !byte 168,170,10,9,9,1,0,0,0,0,0,0,0,64,0,0,255,247,255,239,255,255,239,239,84,101,25,89,89,89,21,23
        !byte 0,0,0,0,0,0,0,0,85,105,105,105,107,106,110,102,2,2,130,98,98,90,218,218,84,164,100,100,84,92,80,28
        !byte 0,1,1,1,1,1,1,1,108,100,167,171,171,171,169,169,1,10,11,10,11,139,66,65,85,174,149,149,85,85,69,69
        !byte 85,151,148,149,149,148,148,148,68,129,145,133,69,65,1,1,0,96,216,248,244,244,244,244,9,11,1,1,1,0,0,0
        !byte 66,224,128,64,64,64,128,128,5,191,31,31,31,31,31,31,80,149,70,85,117,117,85,69,0,0,64,144,144,144,144,144
        !byte 0,0,0,0,0,0,0,0,0,148,20,117,85,85,85,85,0,0,0,0,0,0,64,64,0,8,8,4,4,4,5,5
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21,21,22,22,5,1,1,3,84,85,165,173,106,106,90,90
        !byte 5,5,101,101,85,85,213,213,164,164,164,164,164,164,180,180,0,0,0,0,0,0,1,5,64,64,64,64,65,64,64,64
        !byte 107,107,107,107,106,106,107,107,91,91,95,95,255,254,104,96,166,166,162,146,146,66,2,2,170,170,170,170,170,165,165,165
        !byte 0,0,128,0,92,0,192,0,0,0,0,0,1,1,1,1,101,101,101,101,102,102,101,101,85,89,89,85,151,151,167,101
        !byte 0,0,0,0,0,0,0,0,102,38,37,37,37,45,33,33,149,181,165,165,169,105,107,106,16,24,90,90,82,88,88,88
        !byte 1,173,43,11,135,167,39,39,90,218,218,250,250,218,170,170,192,192,240,240,112,176,176,176,5,5,9,9,9,9,11,5
        !byte 148,148,148,148,148,148,148,148,9,1,9,9,9,1,1,1,167,172,164,164,167,167,164,164,0,0,0,0,0,0,0,0
        !byte 64,64,64,64,64,64,64,64,26,26,26,26,26,26,26,26,85,85,85,86,123,233,89,89,144,80,144,208,64,64,64,64
        !byte 3,3,3,3,1,1,1,2,215,214,150,85,85,85,85,85,96,96,64,96,96,80,80,80,5,5,5,37,38,31,31,31
        !byte 0,0,0,0,64,96,64,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,35,15,22,22,22,22,6,214,214,25
        !byte 149,149,149,149,93,127,127,67,164,164,167,167,165,101,101,90,8,2,7,167,167,94,94,252,64,64,1,65,1,64,0,0
        !byte 107,107,235,235,235,235,251,55,64,64,128,128,128,0,0,0,2,2,2,2,5,5,1,1,165,165,165,165,173,237,237,235
        !byte 0,0,10,169,102,87,87,111,1,1,162,226,209,208,208,80,101,101,101,101,101,101,101,100,107,107,235,233,218,218,218,250
        !byte 128,128,72,104,88,80,88,240,16,16,16,16,176,48,16,16,90,90,22,22,6,7,7,1,88,88,212,212,248,250,248,248
        !byte 57,57,57,249,201,245,228,228,246,246,254,254,61,15,15,3,148,148,148,148,180,164,164,228,13,13,15,15,11,11,11,3
        !byte 164,156,164,164,156,156,144,144,1,1,1,1,2,0,0,0,167,167,167,167,100,101,101,25,0,0,0,0,1,2,130,244
        !byte 64,64,0,0,128,0,0,0,26,26,26,218,26,26,26,25,86,86,86,86,85,85,85,69,240,240,112,176,176,188,188,164
        !byte 15,15,12,4,4,8,8,0,5,5,1,1,1,1,1,0,80,80,88,84,116,116,116,116,26,26,30,22,26,26,26,26
        !byte 80,80,80,80,90,90,85,85,0,0,0,0,160,120,120,244,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,245,4,160,0,0,0,0,0
        !byte 64,0,0,0,0,0,0,0,159,37,41,0,0,0,0,0,250,88,168,32,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 21,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,0,0,0,0,0,170,85,85,255,240,0,0,0
        !byte 170,85,85,48,0,0,0,0,64,96,160,0,0,0,0,0,144,128,32,0,0,0,0,0,22,53,13,3,0,0,0,0
        !byte 160,80,112,0,0,0,0,0,16,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,216,128,128,0,0,0,0,0
        !byte 152,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,152,160,0,0,0,0,0,0,1,0,0,0,0,0,0,0
        !byte 96,128,128,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,164,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,57,48,0,0,0,0,0,0,129,1,0,0,0,0,0,0,168,84,84,192,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,12,8,0,0,0,0,0,58,21,53,51,15,0,0,0
        !byte 170,85,93,240,0,0,0,0,248,88,80,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


        ;here is some free memory in between!
TITLE_LOGO_COLORRAM
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,11,0,12,9,9,0,0,0,0,9,12
        !byte 0,12,8,11,0,9,8,12,12,0,8,12,8,8,11,0,0,8,0,0,0,0,0,0,0,0,11,12,8,12,0,0
        !byte 12,8,0,0,11,0,0,11,0,11,12,0,8,9,9,12,0,0,11,0,0,0,12,12,9,12,0,8,0,0,0,0
        !byte 0,0,11,11,11,11,8,0,11,0,0,12,8,8,0,9,8,8,12,8,11,9,12,9,11,0,11,9,0,11,0,9
        !byte 9,0,8,12,0,8,0,0,0,0,0,12,0,8,8,0,0,0,0,11,11,0,0,11,11,0,0,12,0,0,0,0
        !byte 0,0,0,0,0,11,0,11,0,0,9,11,11,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

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
          
SCREEN_BACK_LINE_OFFSET_TABLE_HI
          !byte ( ( SCREEN_BACK_CHAR +   0 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR +  40 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR +  80 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 120 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 160 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 200 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 240 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 280 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 320 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 360 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 400 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 440 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 480 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 520 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 560 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 600 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 640 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 680 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 720 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 760 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 800 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 840 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 880 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 920 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_BACK_CHAR + 960 ) & 0xff00 ) >> 8

* = $2c00
TITLE_LOGO_SCREEN_CHAR
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,176,0,176,0,144,155,139,139,176,139,0,0,144,0,176,144,176,155,176,155,144,155
        !byte 144,0,0,176,176,144,144,0,0,0,0,0,0,0,0,0,0,0,203,155,155,152,155,155,200,200,184,184,200,176,200,152
        !byte 0,152,155,152,144,200,155,152,152,152,155,155,155,155,152,152,0,155,144,155,0,0,0,0,0,0,152,152,155,152,176,176
        !byte 152,155,184,152,200,144,152,152,0,152,152,155,155,200,200,155,152,155,152,0,144,152,152,152,203,155,155,155,155,0,0,0
        !byte 0,0,200,152,152,152,155,176,152,155,184,152,155,155,152,200,155,203,152,155,152,200,152,203,152,155,152,203,155,152,152,200
        !byte 203,144,155,152,155,155,0,0,0,0,203,155,176,155,155,0,176,0,155,152,152,155,155,152,152,192,176,155,203,176,201,176
        !byte 155,0,201,156,0,152,155,152,0,0,203,152,152,155,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


!zone LevelLineV          
LevelLineV
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
          
          jmp NextLevelData
       

!zone LevelObject       
LevelObject
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          
          ;store y for later
          tya
          pha

          ;disable players not suitable for game mode
          lda PARAM3			; are we drawing Dean or Sam?
          cmp #TYPE_PLAYER_SAM
          bne .NoProblemSam
          
          ;it's Sam				; if sam, are we in single player dean mode?
          lda GAME_MODE
          cmp #GT_SINGLE_PLAYER_DEAN
          beq .DoNotSpawnObject	; then don't draw sam at all
          
          ;make sure Sam starts in slot 1
          ldx #1				; otherwise (sam or coop mode) draw sam in slot 1 (not 0)
          jsr FindEmptySpriteSlotWithStartingX
          jmp .LookedForSpriteSlot          
          
.DoNotSpawnObject
          jmp NextLevelData

.NoProblemSam
          lda PARAM3			; are we drawing dean then?
          cmp #TYPE_PLAYER_DEAN
          bne .NoProblemDean

          lda GAME_MODE
          cmp #GT_SINGLE_PLAYER_SAM	; drawing Dean in single player sam mode?
          beq .DoNotSpawnObject		; then don't draw Dean at all

.NoProblemDean
          ;add object to sprite array
          jsr FindEmptySpriteSlot		; otherwise add Dean to the first free slot (0 probably)
.LookedForSpriteSlot          
          bne .FreeSlotFound
          jmp NextLevelData
          
.FreeSlotFound          
          lda PARAM3				; check if we're drawin sam or dean
          sta SPRITE_ACTIVE,x			
          cmp #TYPE_PLAYER_DEAN
          beq .IsPlayer
          cmp #TYPE_PLAYER_SAM
          bne .IsNotPlayer

.IsPlayer
          lda PARAM1				; and draw them in their starting positions
          sta PLAYER_START_POS_X,x
          lda PARAM2
          sta PLAYER_START_POS_Y,x
          
.IsNotPlayer          
          ;PARAM1 and PARAM2 hold x,y already
          jsr CalcSpritePosFromCharPos
          
          ;enable sprite
          lda BIT_TABLE,x
          ora VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE

          ;sprite color
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_COLOR,y
          sta VIC_SPRITE_COLOR,x
          
          lda TYPE_START_MULTICOLOR,y
          beq .NoMulticolor
          
          lda BIT_TABLE,x
          ora VIC_SPRITE_MULTICOLOR
          sta VIC_SPRITE_MULTICOLOR
          jmp .MultiColorDone
          
.NoMulticolor          
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_MULTICOLOR
          sta VIC_SPRITE_MULTICOLOR

.MultiColorDone      
          
          ;initialise enemy values
          lda TYPE_START_SPRITE,y
          sta SPRITE_POINTER_BASE,x
          
          lda TYPE_START_HP,y
          sta SPRITE_HP,x
          
          ;look right per default
          lda #0
          sta SPRITE_DIRECTION,x
          sta SPRITE_DIRECTION_Y,x
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          sta SPRITE_MOVE_POS,x
          sta SPRITE_STATE,x
          sta SPRITE_ANNOYED,x
          sta SPRITE_HITBACK,x
          
          ;use start direction
          lda TYPE_START_DIRECTION,y
          and #$03
          cmp #2
          bne .SetDirX
          
          jsr GenerateRandomNumber
          and #$01
.SetDirX
          sta SPRITE_DIRECTION,x

          lda TYPE_START_DIRECTION,y
          and #%00001100
          lsr
          lsr
          cmp #2
          bne .SetDirY
          
          jsr GenerateRandomNumber
          and #$01
.SetDirY
          sta SPRITE_DIRECTION_Y,x

          ;adjust enemy counter
          ldx PARAM3
          lda IS_TYPE_ENEMY,x
          beq .NoEnemy
          
          inc NUMBER_ENEMIES_ALIVE
          
.NoEnemy
          
.NoFreeSlot                    
          jmp NextLevelData


!zone LevelArea
LevelArea
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          tax
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1

          ;width
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          sta PARAM6
          
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
          tya
          pha
          
.NextLineArea          
          ldy PARAM1
.NextCharArea
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          iny
          dec PARAM2
          bne .NextCharArea
          
          dec PARAM3
          beq .AreaDone
          
          ;move pointers down a line
          tya
          sec
          sbc #40
          tay
          
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
          
          lda PARAM6
          sta PARAM2
          jmp .NextLineArea
          
.AreaDone          
          jmp NextLevelData



!zone LevelLineHAlternating
LevelLineHAlternating
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
          beq .LineDone
          
          inc PARAM4
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          iny
          dec PARAM3
          beq .LineDone
          
          dec PARAM4
          jmp .NextChar
          
.LineDone          
          jmp NextLevelData


!zone LevelLineVAlternating          
LevelLineVAlternating
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
          
          ldx #1
          
          ldy PARAM1
.NextCharV     
          txa
          eor #$01
          tax
          
          clc
          adc PARAM4
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
          
          jmp NextLevelData


!zone LevelQuad          
LevelQuad
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;item
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          
          ;store y for next data
          tya
          pha
          
          ldy PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          
          ldy PARAM1
          ldx PARAM3
          
          ;put image
          lda BLOCK_TABLE_UL_LOCATION0,x
          sta (ZEROPAGE_POINTER_2),y
          lda BLOCK_TABLE_UL_COLOR_LOCATION0,x
          sta (ZEROPAGE_POINTER_3),y
          
          iny
          lda BLOCK_TABLE_UR_LOCATION0,x
          sta (ZEROPAGE_POINTER_2),y
          lda BLOCK_TABLE_UR_COLOR_LOCATION0,x
          sta (ZEROPAGE_POINTER_3),y
          
          tya
          clc
          adc #39
          tay
          
          lda BLOCK_TABLE_LL_LOCATION0,x
          sta (ZEROPAGE_POINTER_2),y
          lda BLOCK_TABLE_LL_COLOR_LOCATION0,x
          sta (ZEROPAGE_POINTER_3),y
          
          iny
          lda BLOCK_TABLE_LR_LOCATION0,x
          sta (ZEROPAGE_POINTER_2),y
          lda BLOCK_TABLE_LR_COLOR_LOCATION0,x
          sta (ZEROPAGE_POINTER_3),y
          jmp NextLevelData

;------------------------------------------------------------
;wait for the raster to reach line $f8
;this is keeping our timing stable
;------------------------------------------------------------
!zone WaitFrame
WaitFrame 
          ;are we on line $F8 already? if so, wait for the next full screen
          ;prevents mistimings if called too fast
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
;Looks for an empty sprite slot, returns in X
;#1 in A when empty slot found, #0 when full
;------------------------------------------------------------

!zone FindEmptySpriteSlot
FindEmptySpriteSlot
          ldx #0
FindEmptySpriteSlotWithStartingX	; simply do not set x to 0 :)

.CheckSlot          
          lda SPRITE_ACTIVE,x
          beq .FoundSlot
          
          inx
          cpx #8
          bne .CheckSlot
          
          lda #0
          rts
          
.FoundSlot
          lda #1
          rts


;------------------------------------------------------------
;Removed object from array
;X = index of object
;------------------------------------------------------------

!zone RemoveObject
RemoveObject
          ;remove from array
          lda #0
          sta SPRITE_ACTIVE,x

          ;disable sprite          
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE
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
;clears the screen
;A = char
;Y = color
;------------------------------------------------------------

!zone ClearScreen
ClearScreen
          ldx #$00
.ClearLoop          
          sta SCREEN_CHAR,x
          sta SCREEN_CHAR + 250,x
          sta SCREEN_CHAR + 500,x
          sta SCREEN_CHAR + 750,x
          inx
          cpx #250
          bne .ClearLoop

          tya
          ldx #$00
.ColorLoop          
          sta $d800,x
          sta $d800 + 250,x
          sta $d800 + 500,x
          sta $d800 + 750,x
          inx
          cpx #250
          bne .ColorLoop

          rts


;------------------------------------------------------------
;displays a line of text
;ZEROPAGE_POINTER_1 = pointer to text
;PARAM1 = X
;PARAM2 = Y;
;modifies ZEROPAGE_POINTER_2 and ZEROPAGE_POINTER_3

!zone DisplayText
DisplayText
          ldx PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1

          lda ZEROPAGE_POINTER_2
          clc
          adc PARAM1
          sta ZEROPAGE_POINTER_2
          lda ZEROPAGE_POINTER_2 + 1
          adc #0
          sta ZEROPAGE_POINTER_2 + 1
          lda ZEROPAGE_POINTER_3
          clc
          adc PARAM1
          sta ZEROPAGE_POINTER_3
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1

          ldy #0
.InLineLoop
          lda (ZEROPAGE_POINTER_1),y
          beq .SkipChar
          cmp #$2A
          beq .EndMarkerReached
          cmp #45
          beq .LineBreak
          sta (ZEROPAGE_POINTER_2),y
          lda #1
          sta (ZEROPAGE_POINTER_3),y
.SkipChar          
          iny
          jmp .InLineLoop
        
.LineBreak
          iny
          tya
          clc
          adc ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_1
          lda #0
          adc ZEROPAGE_POINTER_1 + 1
          sta ZEROPAGE_POINTER_1 + 1

          inc PARAM2
          jmp DisplayText
            
.EndMarkerReached
          rts


;------------------------------------------------------------
;increases score by A
;note that the score is only shown; not held in a variable
;------------------------------------------------------------
!zone IncreaseScore
IncreaseScore
          sta PARAM1
          stx PARAM2
          sty PARAM3
          
.IncreaseBy1          
          ldx #6
          
.IncreaseDigit          
          inc SCREEN_CHAR + ( 23 * 40 + 8 ),x
          lda SCREEN_CHAR + ( 23 * 40 + 8 ),x
          cmp #58
          bne .IncreaseBy1Done
          
          ;looped digit, increase next
          lda #48
          sta SCREEN_CHAR + ( 23 * 40 + 8 ),x
          dex
          ;TODO - this might overflow
          jmp .IncreaseDigit
          
.IncreaseBy1Done          
          dec PARAM1
          bne .IncreaseBy1
          
          ;increase complete, restore x,y
          ldx PARAM2
          ldy PARAM3
          rts


;------------------------------------------------------------
;displays level number
;------------------------------------------------------------
!zone DisplayLevelNumber
DisplayLevelNumber
          lda LEVEL_NR
          clc
          adc #1
          jsr DivideBy10
          
          pha
          
          ;10 digit
          tya
          clc
          adc #48
          sta SCREEN_CHAR + ( 23 * 40 + 37 )
          
          pla
          clc
          adc #48
          sta SCREEN_CHAR + ( 23 * 40 + 38 )
          
          rts
          

;------------------------------------------------------------
;displays live number
;------------------------------------------------------------
!zone DisplayLiveNumber
DisplayLiveNumber
          cpx #1
          beq DisplayLiveNumberSam		; check x for determining where to draw this info
          
          ;fall through

!zone DisplayLiveNumberDean
DisplayLiveNumberDean
          lda PLAYER_LIVES
          jsr DivideBy10
          
          pha
          
          ;10 digit
          tya
          clc
          adc #48
          sta SCREEN_CHAR + ( 24 * 40 + 37 )
          
          pla
          clc
          adc #48
          sta SCREEN_CHAR + ( 24 * 40 + 38 )
          rts
          

!zone DisplayLiveNumberSam
DisplayLiveNumberSam
          lda PLAYER_LIVES + 1
          jsr DivideBy10
          
          pha
          
          ;10 digit
          tya
          clc
          adc #48
          sta SCREEN_CHAR + ( 24 * 40 + 8 )
          
          pla
          clc
          adc #48
          sta SCREEN_CHAR + ( 24 * 40 + 9 )
          rts
          

;------------------------------------------------------------
;generates a sometimes random number
;------------------------------------------------------------
!zone GenerateRandomNumber
GenerateRandomNumber
          lda $dc04
          eor $dc05
          eor $dd04
          adc $dd05
          eor $dd06
          eor $dd07
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
;divides A by 10
;returns remainder in A
;returns result in Y
;------------------------------------------------------------
!zone DivideBy10
DivideBy10
          sec
          ldy #$FF
.divloop
          iny
          sbc #10
          bcs .divloop
          adc #10
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
;IsCharBlockingFall
;checks if a char is blocking a fall (downwards)
;PARAM1 = char_pos_x
;PARAM2 = char_pos_y
;returns 1 for blocking, 0 for not blocking
;------------------------------------------------------------
!zone IsCharBlockingFall
IsCharBlockingFall
          cmp #96
          bpl .Blocking
          
          lda #0
          rts
          
.Blocking
          lda #1
          rts


;------------------------------------------------------------
;CalcSpritePosFromCharPos
;calculates the real sprite coordinates from screen char pos
;and sets them directly
;PARAM1 = char_pos_x
;PARAM2 = char_pos_y
;X      = sprite index
;------------------------------------------------------------
!zone CalcSpritePosFromCharPos    
CalcSpritePosFromCharPos

          ;offset screen to border 24,50
          lda BIT_TABLE,x
          eor #$ff
          and SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
          ;need extended x bit?
          lda PARAM1
          sta SPRITE_CHAR_POS_X,x
          cmp #30
          bcc .NoXBit
          
          lda BIT_TABLE,x
          ora SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
.NoXBit   
          ;calculate sprite positions (offset from border)
          txa
          asl
          tay
          
          lda PARAM1
          asl
          asl
          asl
          clc
          adc #( 24 - SPRITE_CENTER_OFFSET_X )
          sta SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          
          lda PARAM2
          sta SPRITE_CHAR_POS_Y,x
          asl
          asl
          asl
          clc
          adc #( 50 - SPRITE_CENTER_OFFSET_Y )
          sta SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          sta SPRITE_CHAR_POS_Y_DELTA,x
          rts


;------------------------------------------------------------
;copies the screen data to the back buffer area
;------------------------------------------------------------
!zone CopyLevelToBackBuffer
CopyLevelToBackBuffer

          ldx #$00
.ClearLoop          
          lda SCREEN_CHAR,x
          sta SCREEN_BACK_CHAR,x
          lda SCREEN_CHAR + 230,x
          sta SCREEN_BACK_CHAR + 230,x
          lda SCREEN_CHAR + 460,x
          sta SCREEN_BACK_CHAR + 460,x
          lda SCREEN_CHAR + 690,x
          sta SCREEN_BACK_CHAR + 690,x
          inx
          cpx #230
          bne .ClearLoop

          ldx #$00
.ColorLoop          
          lda SCREEN_COLOR,x
          sta SCREEN_BACK_COLOR,x
          lda SCREEN_COLOR + 230,x
          sta SCREEN_BACK_COLOR + 230,x
          lda SCREEN_COLOR + 460,x
          sta SCREEN_BACK_COLOR + 460,x
          lda SCREEN_COLOR + 690,x
          sta SCREEN_BACK_COLOR + 690,x
          inx
          cpx #230
          bne .ColorLoop
          
          rts


;--------------------------------------------------
;load high scores
;returns 1 if ok, 0 otherwise
;--------------------------------------------------
!zone LoadScores
LoadScores
          ;disable kernal messages (don't want to see load error etc.)
          lda #$00
          jsr KERNAL_SETMSG
          
          ;set logical file parameters
          lda #15 
          ldx DRIVE_NUMBER
          ldy #0
          jsr KERNAL_SETLFS
          
          ;set filename
          lda #9
          ldx #<HIGHSCORE_FILENAME
          ldy #>HIGHSCORE_FILENAME
          jsr KERNAL_SETNAM
          
          ;load to address
          lda #$00                             ; 0 = load
          ldx #<HIGHSCORE_SCORE
          ldy #>HIGHSCORE_SCORE
          jsr KERNAL_LOAD
          bcs .LoadError                        ; Flag ob ok oder nicht steht im Carry
          lda #1
          rts

.LoadError
          lda #0
          rts

          
;--------------------------------------------------
;save high scores
;--------------------------------------------------
!zone SaveScores
SaveScores

          ;delete old save file first
          lda #HIGHSCORE_DELETE_FILENAME_END - HIGHSCORE_DELETE_FILENAME
          ldx #<HIGHSCORE_DELETE_FILENAME 
          ldy #>HIGHSCORE_DELETE_FILENAME

          jsr KERNAL_SETNAM
          
          lda #$0F      ; file number 15
          ldx DRIVE_NUMBER
          ldy #$0F      ; secondary address 15
          jsr KERNAL_SETLFS

          jsr $FFC0     ; call OPEN
          ; if carry set, the file could not be opened
          bcs .ErrorDelete

          ldx #$0F      ; filenumber 15
          jsr $FFC9     ; call CHKOUT (file 15 now used as output)

.close
          lda #$0F      ; filenumber 15
          jsr $FFC3     ; call CLOSE

          ldx #$00      ; filenumber 0
          jsr $FFC9     ; call CHKOUT (reset output device)

          jmp .SaveNow

.ErrorDelete
          ;Akkumulator contains BASIC error code

          ;most likely errors:
          ;A = $05 (DEVICE NOT PRESENT)

          ;... error handling for open errors ...
          lda #65
          sta $cc00
          jmp .close    ; even if OPEN failed, the file has to be closed

.SaveNow
          lda #9
          ldx #<HIGHSCORE_FILENAME
          ldy #>HIGHSCORE_FILENAME
          jsr KERNAL_SETNAM
          
          lda #$00
          ldx DRIVE_NUMBER
          ldy #$00
          jsr KERNAL_SETLFS

          lda #<HIGHSCORE_SCORE
          sta $C1
          lda #>HIGHSCORE_SCORE
          sta $C2

          ldx #<HIGHSCORE_DATA_END
          ldy #>HIGHSCORE_DATA_END
          lda #$C1      ; start address located in $C1/$C2
          jsr $FFD8     ; call SAVE
          
          ;if carry set, a save error has happened
          ;bcs .SaveError    
          rts


;------------------------------------------------------------
;game variables
;------------------------------------------------------------

LEVEL_NR  
          !byte 0
BUTTON_PRESSED
          !byte 0
BUTTON_RELEASED
          !byte 0
UP_RELEASED
          !byte 0
DOWN_RELEASED
          !byte 0
          
JUMP_TABLE
          !byte 8,8,7,5,3,2,1,1,1,0
FALL_SPEED_TABLE
          !byte 1,1,2,2,3,3,3,3,3,3
PLAYER_SHOT_PAUSE
          !byte 0,0
PLAYER_FIRE_PRESSED_TIME
          !byte 0,0
PLAYER_LIVES
          !byte 0,0
PLAYER_SHELLS
          !byte 2
PLAYER_SHELLS_MAX
          !byte 2
PLAYER_STAND_STILL_TIME
          !byte 0,0
PLAYER_FAST_RELOAD
          !byte 0,0
PLAYER_INVINCIBLE          
          !byte 0,0
PLAYER_JOYSTICK_PORT
          !byte 0,1

SPRITE_HP
          !byte 0,0,0,0,0,0,0,0
          
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
SPRITE_ACTIVE
          !byte 0,0,0,0,0,0,0,0
SPRITE_DIRECTION
          !byte 0,0,0,0,0,0,0,0
SPRITE_DIRECTION_Y
          !byte 0,0,0,0,0,0,0,0
SPRITE_JUMP_POS
          !byte 0,0,0,0,0,0,0,0
SPRITE_FALL_POS
          !byte 0,0,0,0,0,0,0,0
SPRITE_FALLING
          !byte 0,0,0,0,0,0,0,0
SPRITE_ANIM_POS
          !byte 0,0,0,0,0,0,0,0
SPRITE_ANIM_DELAY
          !byte 0,0,0,0,0,0,0,0
SPRITE_MOVE_POS
          !byte 0,0,0,0,0,0,0,0
SPRITE_STATE
          !byte 0,0,0,0,0,0,0,0
SPRITE_ANNOYED
          !byte 0,0,0,0,0,0,0,0
SPRITE_HITBACK
          !byte 0,0,0,0,0,0,0,0
SPRITE_HITBACK_DIRECTION
          !byte 0,0,0,0,0,0,0,0
SPRITE_HELD
          !byte 0

          
ITEM_ACTIVE
          !fill ITEM_COUNT,ITEM_NONE
ITEM_POS_X
          !fill ITEM_COUNT,0
ITEM_POS_Y
          !fill ITEM_COUNT,0
ITEM_TIME
          !fill ITEM_COUNT,0
          
ENEMY_BEHAVIOUR_TABLE_LO          
          !byte <PlayerControl
          !byte <BehaviourBatDiagonal
          !byte <BehaviourBatUD
          !byte <BehaviourBat8
          !byte <BehaviourMummy
          !byte <BehaviourZombie
          !byte <BehaviourBatVanishing
          !byte <BehaviourSpider
          !byte <BehaviourExplosion
          !byte <PlayerControl
          
ENEMY_BEHAVIOUR_TABLE_HI
          !byte >PlayerControl
          !byte >BehaviourBatDiagonal
          !byte >BehaviourBatUD
          !byte >BehaviourBat8
          !byte >BehaviourMummy
          !byte >BehaviourZombie
          !byte >BehaviourBatVanishing
          !byte >BehaviourSpider
          !byte >BehaviourExplosion
          !byte >PlayerControl
          
;behaviour for an enemy being hit          
ENEMY_HIT_BEHAVIOUR_TABLE_LO          
          !byte <HitBehaviourHurt     ;bat diagonal
          !byte <HitBehaviourHurt     ;bat UD
          !byte <HitBehaviourHurt     ;bat8
          !byte <HitBehaviourHurtTurn ;mummy
          !byte <HitBehaviourCrumble  ;zombie
          !byte <HitBehaviourVanish   ;bat vanish
          !byte <HitBehaviourHurt     ;spider
          !byte <HitBehaviourHurt     ;explosion
          !byte <HitBehaviourHurt     ;dummy entry sam
          
ENEMY_HIT_BEHAVIOUR_TABLE_HI
          !byte >HitBehaviourHurt     ;bat diagonal
          !byte >HitBehaviourHurt     ;bat UD
          !byte >HitBehaviourHurt     ;bat8
          !byte >HitBehaviourHurtTurn ;mummy
          !byte >HitBehaviourCrumble  ;zombie
          !byte >HitBehaviourVanish   ;bat vanish
          !byte >HitBehaviourHurt     ;spider
          !byte >HitBehaviourHurt     ;explosion
          !byte >HitBehaviourHurt     ;dummy entry sam
          
IS_TYPE_ENEMY
          !byte 0     ;dummy entry for inactive object
          !byte 0     ;player dean
          !byte 1     ;bat_diagonal
          !byte 1     ;bat_ud
          !byte 1     ;bat 8
          !byte 1     ;mummy
          !byte 1     ;zombie
          !byte 1     ;bat vanish
          !byte 1     ;spider
          !byte 0     ;explosion
          !byte 0     ;player sam
          
TYPE_START_SPRITE
          !byte 0     ;dummy entry for inactive object
          !byte SPRITE_PLAYER_STAND_R
          !byte SPRITE_BAT_1
          !byte SPRITE_BAT_1
          !byte SPRITE_BAT_2
          !byte SPRITE_MUMMY_R_1
          !byte SPRITE_ZOMBIE_WALK_R_1
          !byte SPRITE_BAT_1
          !byte SPRITE_SPIDER_STAND
          !byte SPRITE_EXPLOSION_1
          !byte SPRITE_PLAYER_SAM_STAND_R
          
TYPE_START_COLOR
          !byte 0
          !byte 10
          !byte 3
          !byte 3
          !byte 8
          !byte 1
          !byte 5
          !byte 3
          !byte 7
          !byte 15    ;explosion
          !byte 10    ;player sam
          
TYPE_START_MULTICOLOR
          !byte 0
          !byte 1
          !byte 0
          !byte 0
          !byte 0
          !byte 0
          !byte 1
          !byte 0
          !byte 1
          !byte 1     ;explosion
          !byte 1     ;player sam
          
TYPE_START_HP
          !byte 0
          !byte 1
          !byte 5
          !byte 5
          !byte 5
          !byte 10
          !byte 8
          !byte 3
          !byte 5
          !byte 0     ;explosion
          !byte 1     ;player sam
          
TYPE_ANNOYED_COLOR
          !byte 0     ;dummy
          !byte 10    ;player
          !byte 2     ;bat diagonal
          !byte 2     ;bat up down
          !byte 4     ;bat 8
          !byte 2     ;mummy
          !byte 13    ;zombie
          !byte 2     ;bat vanish
          !byte 2     ;spider
          !byte 0     ;explosion
          !byte 10    ;player sam
          
          
;enemy start direction, 2 bits per dir.
;        NNNNyyxx
;              xx: start direction in x
;              00: move right
;              01: move left
;              02: random left or right
;            yy   : start direction in y
;            00   : move down
;            01   : move up
;            02   : random up or down
TYPE_START_DIRECTION
          !byte 0             ;dummy
          !byte 0             ;player
          !byte %00001010     ;bat diag.
          !byte %00001010     ;bat up/ down
          !byte 2             ;bat 8
          !byte 2             ;mummy
          !byte 2             ;zombie
          !byte 2             ;bat vanish
          !byte 2             ;spider
          !byte 0             ;explosion
          !byte 0             ;player sam
          
BAT_ANIMATION
          !byte SPRITE_BAT_1
          !byte SPRITE_BAT_2
          !byte SPRITE_BAT_3
          !byte SPRITE_BAT_2

SPIDER_ANIMATION_TABLE
          !byte SPRITE_SPIDER_STAND
          !byte SPRITE_SPIDER_WALK_1
          !byte SPRITE_SPIDER_STAND
          !byte SPRITE_SPIDER_WALK_2

PATH_8_DX
          !byte $86
          !byte $86
          !byte $85
          !byte $84
          !byte $83
          !byte $82
          !byte $81
          !byte 0
          
          !byte 0
          !byte 1
          !byte 2
          !byte 3
          !byte 4
          !byte 5
          !byte 6
          !byte 6

          !byte 6
          !byte 6
          !byte 5
          !byte 4
          !byte 3
          !byte 2
          !byte 1
          !byte 0
          
          !byte 0
          !byte $81
          !byte $82
          !byte $83
          !byte $84
          !byte $85
          !byte $86
          !byte $86
          
PATH_8_DY
          !byte 0
          !byte 1
          !byte 2
          !byte 3
          !byte 4
          !byte 5
          !byte 6
          !byte 6

          !byte 6
          !byte 6
          !byte 5
          !byte 4
          !byte 3
          !byte 2
          !byte 1
          !byte 0
          
          !byte 0
          !byte $81
          !byte $82
          !byte $83
          !byte $84
          !byte $85
          !byte $86
          !byte $86
          
          !byte $86
          !byte $86
          !byte $85
          !byte $84
          !byte $83
          !byte $82
          !byte $81
          !byte 0
          
NUMBER_ENEMIES_ALIVE
          !byte 0
LEVEL_DONE_DELAY
          !byte 0
DELAYED_GENERIC_COUNTER
          !byte 0
          
ITEM_CHAR_UL
          !byte 4,8,16,20
ITEM_COLOR_UL
          !byte 7,2,1,1
ITEM_CHAR_UR
          !byte 5,9,17,21
ITEM_COLOR_UR
          !byte 4,2,2,7
ITEM_CHAR_LL
          !byte 6,10,18,22
ITEM_COLOR_LL
          !byte 7,2,2,7
ITEM_CHAR_LR
          !byte 7,11,19,23
ITEM_COLOR_LR
          !byte 4,2,2,4
          
PLAYER_START_POS_X
          !byte 0,0
PLAYER_START_POS_Y
          !byte 0,0
PLAYER_SPRITE_BASE
          !byte 0,49

LEVEL_START_DELAY
          !byte 0
          
BIT_TABLE
          !byte 1,2,4,8,16,32,64,128
XBIT_TABLE
          !byte 0,128
          
TEXT_PRESS_FIRE          
          !text "PRESS FIRE TO RESTART*"
TEXT_DISPLAY_DEAN_ONLY
          !text " SCORE: 00000000   ",224,224,"         LEVEL: 00                    ",225,225,"         LIVES: 03 *"
TEXT_DISPLAY_SAM_ONLY
          !text " SCORE: 00000000              LEVEL: 00  LIVES: 03                              *"
TEXT_DISPLAY_DEAN_AND_SAM
          !text " SCORE: 00000000   ",224,224,"         LEVEL: 00  LIVES: 03         ",225,225,"         LIVES: 03 *"

TEXT_GAME_MODE_LO
          !byte <TEXT_GAME_MODE_SINGLE_DEAN, <TEXT_GAME_MODE_SINGLE_SAM, <TEXT_GAME_MODE_COOP
TEXT_GAME_MODE_HI
          !byte >TEXT_GAME_MODE_SINGLE_DEAN, >TEXT_GAME_MODE_SINGLE_SAM, >TEXT_GAME_MODE_COOP

TEXT_GAME_MODE_SINGLE_DEAN
          !text "SINGLE PLAYER DEAN*"
TEXT_GAME_MODE_SINGLE_SAM
          !text "SINGLE PLAYER SAM *"
TEXT_GAME_MODE_COOP
          !text " COOPERATIVE PLAY*"
          
TEXT_FIRE_TO_START
          !text "PRESS FIRE TO PLAY*"
TEXT_ENTER_NAME
          !text "ENTER YOUR NAME*"
          
TEXT_GET_READY
          !text 226,228,230,0,232,228,234,235,237,231,"-"
          !text 227,229,231,0,233,229,233,236,231,238,"*"
          
COLOR_FADE_POS
          !byte 0
          
DRIVE_NUMBER
          !byte 8
          
HIGHSCORE_FILENAME
          !text "HIGHSCORE"
          
HIGHSCORE_DELETE_FILENAME          
          !text "S0:HIGHSCORE"
HIGHSCORE_DELETE_FILENAME_END
          
          
HIGHSCORE_SCORE
          !text "00050000-"
          !text "00040000-"
          !text "00030000-"
          !text "00020000-"
          !text "00010000-"
          !text "00001000-"
          !text "00000300-"
          !text "00000100*"
          
HIGHSCORE_NAME
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL-"
          !text "SUPERNATURAL*"
HIGHSCORE_DATA_END          

COLOR_FADE_LENGTH = 16

COLOR_FADE_1
          !byte 0,0,6,6,3,3,1,1,1,1,1,1,3,3,6,6

GAME_MODE
          !byte GT_SINGLE_PLAYER_DEAN



;------------------------------------------------------------
;tile data
;include from editor generated file
;------------------------------------------------------------

!source "tiles.asm"



;------------------------------------------------------------
;screen data
;------------------------------------------------------------
SCREEN_DATA_TABLE
          !word LEVEL_1
          !word LEVEL_2
          !word LEVEL_3
          !word LEVEL_4
          !word LEVEL_5
          !word LEVEL_6
          !word LEVEL_7
          !word LEVEL_8
          !word LEVEL_9
          !word LEVEL_10
          !word 0
          
          
LEVEL_1
          !byte LD_LINE_H,5,5,10,96,13
          !byte LD_LINE_H,12,7,8,96,13
          !byte LD_LINE_H,30,12,9,97,13
          !byte LD_LINE_H_ALT,10,19,20,96,13
          !byte LD_LINE_V_ALT,7,6,4,128,9
          !byte LD_LINE_H,19,8,3,96,13
          !byte LD_LINE_H,24,10,4,96,13
          !byte LD_LINE_H,20,11,4,96,13
          !byte LD_QUAD,20,4,0
          !byte LD_QUAD,25,6,0
          !byte LD_LINE_H,16,12,4,96,13
          !byte LD_LINE_H,12,13,4,96,13
          !byte LD_LINE_H,8,14,4,96,13
          !byte LD_LINE_H,6,16,5,96,13
          !byte LD_OBJECT,5,4,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,34,4,TYPE_PLAYER_SAM
          !byte LD_OBJECT,34,11,TYPE_BAT_DIAG
          !byte LD_OBJECT,31,12,TYPE_BAT_8
          !byte LD_OBJECT,10,18,TYPE_BAT_UD
          !byte LD_OBJECT,20,18,TYPE_MUMMY
          !byte LD_AREA,2,8,7,5,96,13
          !byte LD_END

LEVEL_2
          !byte LD_LINE_H,5,5,10,96,13
          !byte LD_LINE_H,1,21,38,96,13
          !byte LD_LINE_H,7,7,3,96,13
          !byte LD_LINE_H,9,9,3,96,13
          !byte LD_LINE_H,11,11,3,96,13
          !byte LD_LINE_H,13,13,3,96,13
          !byte LD_LINE_H,15,15,3,96,13
          !byte LD_LINE_H,17,17,3,96,13
          !byte LD_LINE_H,19,19,3,96,13
          !byte LD_OBJECT,19,20,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,22,20,TYPE_PLAYER_SAM
          !byte LD_OBJECT,4,5,TYPE_BAT_DIAG
          !byte LD_OBJECT,4,20,TYPE_ZOMBIE
          !byte LD_END

LEVEL_3
          !byte LD_LINE_H,25,15,10,96,13
          !byte LD_LINE_H,17,18,8,96,13
          !byte LD_LINE_H,5,15,10,96,13
          !byte LD_LINE_H,25,21,8,96,13
          !byte LD_OBJECT,30,14,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,10,14,TYPE_PLAYER_SAM
          !byte LD_OBJECT,9,12,TYPE_BAT_VANISH
          !byte LD_END

LEVEL_4
          !byte LD_AREA,1,1,38,21,2,13
          !byte LD_LINE_H_ALT,1,5,20,96,13
          !byte LD_LINE_H_ALT,25,5,14,96,13
          !byte LD_LINE_H_ALT,1,8,10,96,13
          !byte LD_LINE_H_ALT,15,8,24,96,13
          !byte LD_LINE_H_ALT,1,11,18,96,13
          !byte LD_LINE_H_ALT,23,11,16,96,13
          !byte LD_LINE_H_ALT,1,14,33,96,13
          !byte LD_LINE_H_ALT,38,14,2,96,13
          !byte LD_LINE_H_ALT,6,17,33,96,13
          !byte LD_LINE_H_ALT,12,20,6,96,13
          !byte LD_OBJECT,3,21,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,36,21,TYPE_PLAYER_SAM
          !byte LD_OBJECT,33,4,TYPE_ZOMBIE
          !byte LD_OBJECT,23,7,TYPE_ZOMBIE
          !byte LD_OBJECT,10,10,TYPE_ZOMBIE
          !byte LD_OBJECT,30,13,TYPE_ZOMBIE
          !byte LD_OBJECT,20,16,TYPE_ZOMBIE
          !byte LD_OBJECT,35,21,TYPE_ZOMBIE
          !byte LD_END

LEVEL_5
          !byte LD_LINE_H_ALT,5,7,4,96,13
          !byte LD_LINE_H_ALT,5,10,9,96,13
          !byte LD_LINE_H_ALT,4,13,3,96,13
          !byte LD_LINE_H_ALT,1,16,3,96,13
          !byte LD_LINE_H_ALT,10,19,6,96,13
          !byte LD_LINE_H_ALT,16,10,4,96,13
          !byte LD_LINE_H_ALT,22,10,4,96,13
          !byte LD_LINE_H_ALT,24,7,15,96,13
          !byte LD_LINE_H_ALT,24,13,11,96,13
          !byte LD_LINE_H_ALT,24,16,11,96,13
          !byte LD_LINE_H_ALT,28,19,4,96,13
          
          !byte LD_OBJECT,13,18,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,26,18,TYPE_PLAYER_SAM
          !byte LD_OBJECT,18,5,TYPE_BAT_DIAG
          !byte LD_OBJECT,34,8,TYPE_BAT_DIAG  
          !byte LD_OBJECT,9,11,TYPE_BAT_DIAG  
          !byte LD_OBJECT,15,14,TYPE_BAT_DIAG  
          !byte LD_OBJECT,25,17,TYPE_BAT_DIAG  
          !byte LD_END

LEVEL_6
          !byte LD_LINE_H_ALT,1,10,5,96,13
          !byte LD_LINE_H_ALT,1,13,9,96,13
          !byte LD_LINE_H_ALT,1,16,13,96,13
          !byte LD_LINE_H_ALT,1,19,17,96,13
          !byte LD_LINE_H_ALT,34,10,5,96,13
          !byte LD_LINE_H_ALT,30,13,9,96,13
          !byte LD_LINE_H_ALT,26,16,13,96,13
          !byte LD_LINE_H_ALT,22,19,17,96,13
          
          !byte LD_OBJECT,19,21,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,21,21,TYPE_PLAYER_SAM
          !byte LD_OBJECT,5,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,15,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,25,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,35,5,TYPE_BAT_DIAG  
          !byte LD_END

LEVEL_7
          !byte LD_LINE_H_ALT,1,5,5,96,13
          !byte LD_LINE_H_ALT,1,8,5,96,13
          !byte LD_LINE_H_ALT,1,11,5,96,13
          !byte LD_LINE_H_ALT,1,14,5,96,13
          !byte LD_LINE_H_ALT,1,17,5,96,13
          !byte LD_LINE_H_ALT,1,20,5,96,13
          
          !byte LD_LINE_H_ALT,34,5,5,96,13
          !byte LD_LINE_H_ALT,34,8,5,96,13
          !byte LD_LINE_H_ALT,34,11,5,96,13
          !byte LD_LINE_H_ALT,34,14,5,96,13
          !byte LD_LINE_H_ALT,34,17,5,96,13
          !byte LD_LINE_H_ALT,34,20,5,96,13
          
          !byte LD_LINE_V_ALT,6,8,11,128,9
          !byte LD_LINE_V_ALT,33,8,11,128,9
          
          !byte LD_OBJECT,19,21,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,21,21,TYPE_PLAYER_SAM
          !byte LD_OBJECT,15,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,20,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,25,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,17,9,TYPE_BAT_DIAG  
          !byte LD_OBJECT,23,9,TYPE_BAT_DIAG  
          !byte LD_END

LEVEL_8
          !byte LD_LINE_H_ALT,1,5,5,96,13
          !byte LD_LINE_H_ALT,10,5,20,96,13
          !byte LD_LINE_H_ALT,34,5,5,96,13
          !byte LD_LINE_H_ALT,1,8,5,96,13
          !byte LD_LINE_H_ALT,10,8,20,96,13
          !byte LD_LINE_H_ALT,34,8,5,96,13
          !byte LD_LINE_V_ALT,10,6,3,2,13
          !byte LD_LINE_V_ALT,16,6,3,2,13
          !byte LD_LINE_V_ALT,23,6,3,2,13
          !byte LD_LINE_V_ALT,29,6,3,2,13
          !byte LD_LINE_H_ALT,5,11,7,96,13
          !byte LD_LINE_H_ALT,28,11,7,96,13
          !byte LD_LINE_H_ALT,10,14,20,96,13
          !byte LD_LINE_H_ALT,5,17,7,96,13
          !byte LD_LINE_H_ALT,28,17,7,96,13
          !byte LD_LINE_H_ALT,10,20,20,96,13
          !byte LD_OBJECT,19,21,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,21,21,TYPE_PLAYER_SAM
          !byte LD_OBJECT,15,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,20,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,25,5,TYPE_BAT_DIAG  
          !byte LD_OBJECT,17,9,TYPE_BAT_DIAG  
          !byte LD_OBJECT,23,9,TYPE_BAT_DIAG  
          !byte LD_END

LEVEL_9
          !byte LD_LINE_H_ALT,1,19,12,96,13
          !byte LD_LINE_H_ALT,14,19,12,96,13
          !byte LD_LINE_H_ALT,29,19,12,96,13
          !byte LD_OBJECT,19,21,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,21,21,TYPE_PLAYER_SAM          
          !byte LD_OBJECT,37,18,TYPE_SPIDER
          !byte LD_END

LEVEL_10
          !byte LD_LINE_H_ALT,1,5,14,96,13
          !byte LD_LINE_H_ALT,13,8,14,96,13
          !byte LD_LINE_H_ALT,25,11,14,96,13
          !byte LD_LINE_H_ALT,13,14,14,96,13
          !byte LD_LINE_H_ALT,1,17,14,96,13
          !byte LD_LINE_H_ALT,1,20,38,96,13
          !byte LD_LINE_H_ALT,1,21,38,2,13
          
          !byte LD_OBJECT,18,19,TYPE_PLAYER_DEAN
          !byte LD_OBJECT,21,19,TYPE_PLAYER_SAM
          
          !byte LD_OBJECT,4,4,TYPE_SPIDER
          !byte LD_OBJECT,19,7,TYPE_SPIDER
          !byte LD_OBJECT,34,10,TYPE_SPIDER
          !byte LD_OBJECT,19,13,TYPE_SPIDER
          !byte LD_OBJECT,4,16,TYPE_SPIDER
          !byte LD_END

LEVEL_BORDER_DATA
          !byte LD_LINE_H_ALT,0,0,40,128,9
          !byte LD_LINE_H_ALT,1,22,38,128,9
          !byte LD_LINE_V_ALT,0,1,22,128,9
          !byte LD_LINE_V_ALT,39,1,22,128,9
          !byte LD_END

CHARSET
          !binary "j.chr"
          
SPRITES
          !binary "j.spr"