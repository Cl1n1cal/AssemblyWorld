section .data
    debug_msg db "Debug: Option 1 entered", 0xA, 0
    debug_msg_len equ $ - debug_msg
    file_name_msg db "File name:", 0

    debug_msg1 db "Debug: Entered print_error loop", 0xA, 0

section .text
    extern _print
    extern _print_welcome
    extern _print_options
    extern _print_invalid_option
    extern _get_int
    extern _get_name
    extern _remove_newline
    extern _get_file_content
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
    mov rdi, file_name_msg  ; print "Enter file:"
    call _print
    call _get_name
    mov rdi, rsi
    call _remove_newline
    mov rsi, 0x02
    mov rdx, 0x02   ; flags: ORW
    mov rax, 0x02   ; syscall open
    syscall
    mov rdi, rax    ; mov fd into rdi
    call _get_file_content
    mov rdi, rsi
    call _print
    jmp choice

exit:
    ; exit
    mov rax, 0x3c
    mov rdi, 0x00
    syscall

