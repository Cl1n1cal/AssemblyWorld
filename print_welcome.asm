section .data
    welcome_msg db 'Welcome to Assembly World!', 0xA, 0

section .text
    extern _print
    global _print_welcome

_print_welcome:
    mov rdi, welcome_msg
    call _print
    ret                     ; ret to main
