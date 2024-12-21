section .data
    invalid_option db 'Invalid option', 0xA, 0

section .text
    global _print_invalid_option
    extern _print
    extern _strlen

_print_invalid_option:
    mov rdi, invalid_option
    call _print
    ret