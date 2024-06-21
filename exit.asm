#x 86 assembly practise

.global _start
.intel_syntax
.section .text  

_start:

    #exit syscall
    mov %eax, 1
    mov %ebx, 65 
    int 0x80

.section .data
