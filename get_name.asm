section .bss
    name resb 64

section .text
    extern _zero_buf
    global _get_name

; Get name from stdin and return
; name buf will be contained in rsi after returning
_get_name:
    mov rdi, name   ; *name
    mov rsi, 0x40   ; size: 64 decimal
    call _zero_buf
    mov rax, 0x0    ; syscall read
    mov rdi, 0x0    ; stdin
    mov rsi, name   ; *buf
    mov rdx, 0x64   ; count
    syscall
    ret

