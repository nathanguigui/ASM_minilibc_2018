BITS 64
section .text
global memcpy

memcpy:
    xor rcx, rcx
    mov rax, rdi

.cpy_loop:
	cmp rcx, rdx
	je .end
    mov r8b, byte [rsi + rcx]
	mov byte [rax + rcx], r8b
	inc rcx
	jmp .cpy_loop

.end:
    ret