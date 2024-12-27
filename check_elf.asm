section .text

    global _check_elf

; Open a file for reading and check the magic header
_check_elf:
    mov rax, 0x2    ; Syscall open
    
