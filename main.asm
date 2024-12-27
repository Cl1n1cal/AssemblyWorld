section .data
    debug_msg db "Debug: Option 1 entered", 0xA, 0
    debug_msg_len equ $ - debug_msg

    debug_msg1 db "Debug: Entered print_error loop", 0xA, 0

section .text
    extern _print
    extern _print_welcome
    extern _print_options
    extern _print_invalid_option
    extern _get_int
    extern _get_name
    global _start

_start:
    mov rbp, rsp
    sub rsp, 0x10

    call _print_welcome
    call _print_options


choice:
    call _get_int
    cmp rax, 0x1
    je option_1
    cmp rax, 0x3
    jg exit
    jmp choice



option_1:
    call _get_name
    mov rdi, rsi    ; mov *name into rdi ready for _print
    call _print
    jmp choice

exit:
    ; exit
    mov rax, 0x3c
    mov rdi, 0x00
    syscall

