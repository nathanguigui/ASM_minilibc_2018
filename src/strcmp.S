BITS 64
section .text
global strcmp:function

strcmp:
    xor rax, rax

.cmp_loop:
    cmp byte[rdi], 0
    je .end
    cmp byte[rdi], sil
    jg .greater
    cmp byte[rdi], sil
    jl .lower
    inc rdi
    inc rsi
    jmp .cmp_loop

.greater:
    inc rax
    inc rdi
    inc rsi
    jmp .cmp_loop

.lower:
    dec rax
    inc rdi
    inc rsi
    jmp .cmp_loop

.end:
    ret