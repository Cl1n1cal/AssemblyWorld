section .text
    global _strlen

; String pointer given in rdi
; String has to be null terminated

_strlen:
    xor rax, rax ; counter 

find_length:
    cmp byte [rdi + rax], 0 ; cmp to null terminator
    je done
    inc rax
    jmp find_length
   
done:
    ret