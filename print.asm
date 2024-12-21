section .text
    global _print

_print:
    push rdi        ; save pointer to string
    mov rbx, 0x0    ; counter

loop:
    inc rdi
    inc rbx
    mov cl, [rdi]
    cmp cl, 0x0
    jne loop

    ; counting done, start printing
    mov rax, 0x1
    mov rdi, 0x1
    pop rsi
    mov rdx, rbx
    syscall

    ret
