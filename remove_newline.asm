section .text

    global _remove_newline

; Give *buffer in rdi
; Will find trailing newline and replace with
; a null byte

_remove_newline:
    push rdi                ; save rdi for convenience
loop:
    cmp byte [rdi], 0xa     ; cmp [rdi] with '\n'
    je zero
    inc rdi
    jmp loop

zero:
    mov byte [rdi], 0x0     ; zero the index containing '\n'
    pop rdi                 ; restore original rdi
    ret                     ; return to caller
