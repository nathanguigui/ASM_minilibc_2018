BITS 64
section .text
global memset

memset:
    mov rax, rdi

.set_loop:
    mov byte[rax], sil
    inc rax
    dec rdx
    cmp rdx, 0
    je .end
    jmp .set_loop

.end:
    ret