BITS 64
section .text
global strchr

strchr:
    mov rax, rdi

.search_loop:
    cmp byte[rax], 0
    je .get_res
    cmp byte[rax], sil
    je .end
    inc rax
    jmp .search_loop

.get_res:
    mov rax, 0x0
    jmp .end

.end:
    ret