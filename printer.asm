section .text
	global _printer

; example usage caller function
;	mov rax, "AAAAAAAA"
;	push rax
;	mov rax, "BBBBBBAA"
;	push rax
;	mov rdi, 0x10
;	jmp _start


_printer:
	mov rdx, rdi ; len of string provided by caller
	mov rdi, 0x1 ; fd = 1 = stdout
	lea rsi, [rsp] ; string at the top of buffer when called
	mov rax, 0x1 ; syscall write
	syscall
