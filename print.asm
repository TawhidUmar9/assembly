.global _start
.intel_syntax
.section .text 

_start:
    # write syscall
    mov %eax, 4          # sys_write system call number
    mov %ebx, 1          # file descriptor (1 for stdout)
    lea %ecx, [message]      # load effective address of msg into ecx
    mov %edx, 13         # message length
    int 0x80             # call kernel

    # exit syscall
    mov %eax, 1          # sys_exit system call number
    mov %ebx, 65         # exit status
    int 0x80             # call kernel


.section .data
    message:
    .ascii "Hello, World\n"
    