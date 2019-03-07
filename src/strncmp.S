BITS 64
section .text
global strncmp

strncmp:
    xor rax, rax

.cmp_loop:
    cmp rdx, 0
    jle .end
    mov r8b, [rsi]
    cmp [rdi], r8b
    jne .result
    cmp byte[rdi], 0
    je .end
    cmp byte[rsi], 0
    inc rsi
    inc rdi
    dec rdx
    jmp .cmp_loop

.result:
    mov rax, [rdi]
    sub rax, [rsi]
    ret

.end:
    ret