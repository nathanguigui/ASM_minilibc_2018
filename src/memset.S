BITS 64
section .text
global memset

memset:
    mov rax, rdi

.set_loop:
    cmp byte[rdx], 0
    je .end
    mov byte[rax], sil
    inc rax
    dec rdx
    jmp .set_loop

.end:
    ret