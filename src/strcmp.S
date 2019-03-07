BITS 64
section .text
global strcmp

strcmp:
    xor rax, rax

.cmp_loop:
    mov r8b, [rsi]
    cmp [rdi], r8b
    jne .result
    cmp byte[rdi], 0
    je .end
    cmp byte[rsi], 0
    inc rsi
    inc rdi
    jmp .cmp_loop

.result:
    mov rax, [rdi]
    sub rax, [rsi]
    ret

.end:
    ret