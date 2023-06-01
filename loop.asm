section .data
	text db "Start: "
	text2 db "End: "
	textTest db "Test",10

section .bss
	start resb 16
	end resb 16

section .text
	global _start

_start:

	call _printText
	call _takeStart

	call _printText2
	call _takeEnd

	call _makeLoop

	jmp _exit

_makeLoop:

	call _increm

	mov rax, 1
	mov rdi, 1
	mov rsi, textTest
	mov rdx, 5
	syscall

	mov rax, [start]
	mov rbx, [end]

	cmp rax, rbx
	jle _makeLoop
	ret

_increm:
	mov rax, [start]
	inc rax
	mov [start], rax
	ret

_printText:

	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 7
	syscall

	ret

_takeStart:

	mov rax, 0
	mov rdi, 0
	mov rsi, start
	mov rdx, 16
	syscall

	ret

_printText2:

	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 5
	syscall
	ret

_takeEnd:

	mov rax, 0
	mov rdi, 0
	mov rsi, end
	mov rdx, 16
	syscall
	ret


_printAll:
	call _printText

	mov rax, 1
	mov rdi, 1
	mov rsi, start
	mov rdx, 16
	syscall

	call _printText2

	mov rax, 1
	mov rdi, 1
	mov rsi, end
	mov rdx, 16
	syscall

	ret


_exit:
	mov rax, 60
	mov rdi, 0
	syscall

