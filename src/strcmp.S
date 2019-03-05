BITS 64
section .text
global strcmp

strcmp:
    xor rax, rax

.cmp_loop:
    cmp byte[rdi], 0
    je .end
    cmp byte[rdi], sil
    jg .greater
    jl .lower
    inc rdi
    jmp .cmp_loop

.greater:
    inc rax
    jmp .end

.lower:
    dec rax
    jmp .end

.end:
    ret