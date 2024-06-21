global _start

section .data

    text db "hello world", 0x0a
    len equ $ - text


section .text

_start:
    mov esi, 5
    
loop:
    
    ;print syscall
    
    mov eax, 4
    mov ebx, 1
    mov ecx, text
    mov edx, len
    int 0x80        ;this is the text part done
    dec esi
    cmp esi, 0
    jne loop        ; this is the loop controller

    ;exit syscall

    mov eax, 1
    mov ebx, 0
    int 0x80


