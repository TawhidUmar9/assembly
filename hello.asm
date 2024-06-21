global _start

section .data
    msg db "hello world", 0x0a,0x0a
    len equ $ - msg
    name db "the name is dibase", 0x0a
    len_name equ $-name
section .text
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, name   
    mov edx, len_name
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80