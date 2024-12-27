section .text

    global _zero_buf

; Arguments
; rdi: *buf
; rsi; size
_zero_buf:
    mov byte [rdi], 0x0 ; 0 out memory
    inc rdi             ; inc index
    dec rsi             ; dec counter
    cmp rsi, 0x0        ; see if counter is 0
    je done             ; jmp done if counter is 0
    jmp _zero_buf

done:
    ret