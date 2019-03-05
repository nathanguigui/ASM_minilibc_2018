BITS 64
SECTION .text
GLOBAL rindex:function

rindex:
    xor rax, rax

.search_loop:
    cmp byte[rdi], 0
    je .end
    cmp byte[rdi], sil
    cmove rax, rdi
    ; inc rdi
    jmp .search_loop

.end:
    ret