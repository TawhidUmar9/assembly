section .data
    buffer db 256 ; Allocate 256 bytes for the input buffer
    buffer_len equ $ - buffer ; Calculate the length of the buffer

section .bss
    ; Uninitialized data section, if needed

section .text
global _start

_start:
    ; sys_read system call
    mov eax, 3      ; sys_read system call number
    mov ebx, 0      ; file descriptor 0 (stdin)
    mov ecx, buffer ; pointer to the input buffer
    mov edx, buffer_len ; maximum number of bytes to read
    int 0x80        ; make the system call

    ; sys_write system call
    mov eax, 4      ; sys_write system call number
    mov ebx, 1      ; file descriptor 1 (stdout)
    mov ecx, buffer ; pointer to the input buffer (with data)
    mov edx, eax    ; number of bytes read (returned in eax by sys_read)
    int 0x80        ; make the system call

    ; Exit syscall
    mov eax, 1      ; sys_exit system call number
    xor ebx, ebx    ; exit status 0
    int 0x80        ; make the system call
