BITS 64
section .text
global strcspn:function

strcspn:
	xor rcx, rcx
	xor r9, r9
	xor bl, bl
	xor dl, dl
	jmp first_loop

first_loop:
	mov dl, byte[rdi]
	cmp dl, 0
	jz end
	jmp check_count

check_count:
	mov r9, rsi
	jmp second_loop

second_loop:
	mov bl, byte[r9]
	cmp bl, 0
	jz count
	cmp bl, dl
	je end
	inc r9
	jmp second_loop

count:
	inc rcx
	inc rdi
	jmp first_loop

end:
	mov rax, rcx
	ret