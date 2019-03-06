BITS 64
section .text
global strcmp

strcmp:
    xor rax, rax

.cmp_loop:
    cmp byte[rdi], 0
    je .end
    cmp dil, sil
    jl .lower
    jg .greater
    inc rdi
    inc rsi
    jmp .cmp_loop

.greater:
    dec rax
    inc rsi
    inc rdi
    jmp .end

.lower:
    inc rax
    inc rsi
    inc rdi
    jmp .end

.end:
    ret