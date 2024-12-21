section .data
    option_1 db 'Option 1: Look for ROP gadgets', 0xA, 0
    option_2 db 'Option 2: Look for something1', 0xA, 0
    option_3 db 'Option 3: Look for something2', 0xA, 0

section .text
    extern _strlen
    global _print_options

_print_options:
    lea rdi, [option_1]
    call _strlen
    mov rdx, rax
    mov rdi, 0x1
    lea rsi, [option_1]
    mov rax, 0x1
    syscall

    lea rdi, [option_2]
    call _strlen
    mov rdx, rax
    mov rdi, 0x1
    lea rsi, [option_2]
    mov rax, 0x1
    syscall

    lea rdi, [option_3]
    call _strlen
    mov rdx, rax
    mov rdi, 0x1
    lea rsi, [option_3]
    mov rax, 0x1
    syscall

    ret