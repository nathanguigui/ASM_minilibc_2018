BITS 64
SECTION .text
GLOBAL strlen

strlen:
    xor rax, rax

.count_loop:
    cmp byte[rdi + rax], 0
    je .end
    inc rax
    jmp .count_loop

.end:
    ret