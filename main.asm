section .text
    extern _strlen
    extern _print_welcome
    extern _print_options
    global _start

_start:

    call _print_welcome
    call _print_options
    
    ; exit
    mov rax, 0x3c
    mov rdi, 0x00
    syscall