BITS 64
section .text
global strchr

strchr:
    mov rax, rdi
    mov rcx, rsi

.search_loop:
    cmp byte[rdi], 0
    je .get_res
    movzx rdx, byte[rax]
    cmp rdx, rcx
    je .end
    inc rax
    jmp .search_loop

.get_res:
    mov eax, 0
    jmp .end

.end:
    ret