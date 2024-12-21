section .data
    welcome_msg db 'Welcome to Assembly World!', 0xA, 0

section .text
    extern _strlen
    global _print_welcome

_print_welcome:
    lea rdi, [welcome_msg]
    call _strlen            
    mov rdx, rax            ; set rdx to strlen
    mov rdi, 1              ; stdout
    lea rsi, [welcome_msg]  ; ptr welcome msg
    mov rax, 1              ; write syscall
    syscall
    
    ret                     ; ret to main
