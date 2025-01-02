section .bss
    content resb 0x64

section .text
    extern _zero_buf
    global _get_file_content

; Give fd in rdi
_get_file_content:
    push rdi            ; save rdi
    mov rdi, content    ; *content
    mov rsi, 0x40       ; size: 64 decimal
    call _zero_buf      ; zero content buffer
    mov rax, 0x0        ; syscall read
    pop rdi             ; restore rdi containing fd
    mov rsi, content    ; mov *content to rsi
    mov rdx, 0x64       ; specify number of bytes to read
    syscall
    ret

