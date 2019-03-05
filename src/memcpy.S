BITS 64
section .text
global memcpy

memcpy:
    mov rax, rdi

.cpy_loop:
    cmp byte[rdx], 0
    je .end
    mov byte[rax], sil
    inc rax
    inc rsi
    dec rdx
    jmp .cpy_loop

.end:
    ret