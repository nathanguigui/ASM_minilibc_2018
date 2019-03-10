BITS 64
global memmove:function
section .text

memmove:
	mov rcx, rdx
	sub rcx, 1
	
.loop_save:
	cmp rcx, -1
	je .make_copy
	mov r8b, byte[rsi + rcx]
	push r8
	dec rcx
	jmp .loop_save

.make_copy:	
	mov rcx, 0

.loop_copy:
	cmp rcx, rdx
	je .end
	pop rax
	mov [rdi + rcx], al
	inc rcx
	jmp .loop_copy
	
.end:
	mov rax, rdi
	ret
