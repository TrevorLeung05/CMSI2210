section .bss
    num1 resq 1
    num2 resq 1
    gcd resq 1
    buffer resb 20

section .data
    prompt db "Enter two numbers: ", 0
    result_msg db "The GCD is: ", 0

section .text
    global _start

_start:
    ; Print prompt
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    lea rsi, [rel prompt] ; message to write
    mov rdx, 17         ; message length
    syscall             ; call kernel

    ; Read first number
    mov rax, 0          ; sys_read
    mov rdi, 0          ; file descriptor (stdin)
    lea rsi, [rel num1] ; buffer to store input
    mov rdx, 8          ; number of bytes to read
    syscall             ; call kernel

    ; Read second number
    mov rax, 0          ; sys_read
    mov rdi, 0          ; file descriptor (stdin)
    lea rsi, [rel num2] ; buffer to store input
    mov rdx, 8          ; number of bytes to read
    syscall             ; call kernel

    ; Load numbers into registers
    mov rax, [rel num1]
    mov rbx, [rel num2]

find_gcd:
    cmp rax, rbx        ; compare rax and rbx
    je done             ; if equal, GCD found
    jl swap             ; if rax < rbx, swap

    sub rax, rbx        ; rax = rax - rbx
    jmp find_gcd        ; repeat

swap:
    xchg rax, rbx       ; swap rax and rbx
    jmp find_gcd        ; repeat

done:
    mov [rel gcd], rax  ; store GCD in memory

    ; Convert GCD to string
    lea rdi, [rel buffer] ; buffer to store string
    mov rax, [rel gcd]  ; number to convert
    call int_to_string

    ; Print result message
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    lea rsi, [rel result_msg] ; message to write
    mov rdx, 12         ; message length
    syscall             ; call kernel

    ; Print GCD
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    lea rsi, [rel buffer] ; GCD string to write
    mov rdx, 20         ; length of string
    syscall             ; call kernel

    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel

int_to_string:
    ; Convert integer in RAX to string in RDI
    mov rcx, 10         ; divisor
    mov rbx, rdi        ; save buffer pointer
    add rdi, 20         ; move to end of buffer
    mov byte [rdi], 0   ; null-terminate string

convert_loop:
    dec rdi             ; move back one byte
    xor rdx, rdx        ; clear RDX
    div rcx             ; divide RAX by 10
    add dl, '0'         ; convert remainder to ASCII
    mov [rdi], dl       ; store character
    test rax, rax       ; check if RAX is zero
    jnz convert_loop    ; if not, repeat

    mov rsi, rdi        ; set RSI to start of string
    sub rsi, rbx        ; calculate string length
    ret