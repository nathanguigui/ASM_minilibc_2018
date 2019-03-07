BITS 64
SECTION .text
GLOBAL memset

memset:
	xor rcx, rcx
	mov rax, rdi

.memset_loop:
	cmp rcx, rdx
	je .memset_end
	mov byte [rax + rcx], sil
	inc rcx
	jmp .memset_loop

.memset_end:
	ret