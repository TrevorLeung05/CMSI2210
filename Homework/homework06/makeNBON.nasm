section .data
    values dq 0x12345678, 0x87654321, 0xAABBCCDD, 0x11223344, 0x55667788
    format db "Original: 0x%08X, Network Byte Order: 0x%08X", 10, 0

section .bss
    result resq 1

section .text
    extern make_nbo
    extern printf
    global _start

_start:
    mov rdi, values
    mov rcx, 5

.loop:
    mov rsi, [rdi]
    mov rdi, rsi
    call make_nbo
    mov [result], rax

    ; Print the result
    mov rdi, format
    mov rsi, [rdi - 8]
    mov rdx, [result]
    call printf

    add rdi, 8
    loop .loop

    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall