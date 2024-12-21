section .bss

    input_buffer resb 4 ; Reserve 2 bytes for input in .bss (uninitialized data)

section .text
    global _get_int

; Reads 1 character from stdin and stores the unsigned value of the
; character in rax

_get_int:
    mov rax, 0x0 ; syscall read 
    mov rdi, 0x0 ; stdin
    mov rsi, input_buffer
    mov rdx, 0x1
    syscall
    movzx rax, byte [input_buffer] ; mov character from input_buffer to rax and 0 out the rest of rax
    sub rax, '0'    ; convert from ascii to number
    ret