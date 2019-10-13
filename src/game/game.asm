bits 16
section .text


jmp short main
jmp short timer_irq
jmp short keyboard_irq	

%include "src/game/sprite_constants.asm"
%include "src/game/var_locs.asm"
%include "src/game/game_constants.asm"	

main:

	
	call init_top_score
	call play_scr_init
	call score_scr_init
	

main_loop:	


	call get_rand

	


	jmp main_loop

timer_irq:
	pusha

	call update_stage
	
	popa
	iret

keyboard_irq:
	pusha

	

	call update_keys_pressed
	

	
	mov al, 0x61
	out 0x20, al 		;send EOI



	popa
	iret


%include "src/game/renderer.asm"
%include "src/game/2dgfx.asm"
%include "src/game/random.asm"
%include "src/game/bomber.asm"
%include "src/game/keyboard.asm"
%include "src/game/paddle.asm"
%include "src/game/bombs.asm"	
%include "src/game/collision_detection.asm"
%include "src/game/score.asm"
%include "src/game/stage.asm"
%include "src/game/difficulty.asm"	

times 0xFFFF - ($-$$) db 0
