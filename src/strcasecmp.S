BITS 64
section .text
global strcasecmp

strcasecmp:
    xor rax, rax
    xor rcx, rcx

.capitalize1:
    cmp byte [rdi + rcx], 0
    je .capitalize2

    cmp byte [rdi + rcx], 97
    jge .skip1
    cmp byte [rdi + rcx], 122
    jle .skip1

    mov r9b, [rdi + rcx]
    sub r9b, 97
    mov [rdi + rcx], r9b

    inc rcx
    
    jmp .capitalize1

.skip1:
    inc rcx
    jmp .capitalize1

.capitalize2:
    cmp byte [rsi + r10], 0
    je .cmp_loop

    cmp byte [rsi + r10], 97
    jge .skip2
    cmp byte [rsi + r10], 122
    jle .skip2

    mov r9b, [rsi + r10]
    sub r9b, 97
    mov [rsi + r10], r9b

    inc r10
    
    jmp .capitalize1

.skip2:
    inc r10
    jmp .capitalize1

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