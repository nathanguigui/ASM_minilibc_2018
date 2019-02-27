BITS 64
SECTION .text
GLOBAL strlen

strlen:
    xor rax, rax

.count_loop:
    cmp byte[rdi], 0
    je .end
    inc rax
    inc rdi
    jmp .count_loop

.end:
    ret