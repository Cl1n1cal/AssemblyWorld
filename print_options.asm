section .data
    option_1 db 'Option 1: Look for ROP gadgets', 0xA, 0
    option_2 db 'Option 2: Look for something1', 0xA, 0
    option_3 db 'Option 3: Look for something2', 0xA, 0

section .text
    extern _print
    global _print_options

_print_options:

    mov rdi, option_1
    call _print

    mov rdi, option_2
    call _print

    mov rdi, option_3
    call _print

    ret