section .data
    byte db 0b01101001  ; Example byte, you can change this value for testing

section .bss
    count resb 1        ; To store the count of 1 bits

section .text
    global _start

_start:
    mov al, [byte]      ; Load the byte into AL
    xor ecx, ecx        ; Clear ECX (bit counter)
    xor ebx, ebx        ; Clear EBX (1 bit counter)

count_bits:
    test al, 1          ; Test the least significant bit
    jz no_increment     ; If zero, skip increment
    inc ebx             ; Increment the 1 bit counter

no_increment:
    shr al, 1           ; Shift right to process the next bit
    inc ecx             ; Increment the bit counter
    cmp ecx, 8          ; Have we processed all 8 bits?
    jl count_bits       ; If not, repeat

    ; Determine parity bit
    mov al, 1           ; Assume parity bit is 1 (odd parity)
    test bl, 1          ; Check if the count of 1 bits is odd
    jz print_parity     ; If even, keep parity bit as 1
    xor al, al          ; If odd, set parity bit to 0

print_parity:
    ; Print the parity bit
    mov rdi, 1          ; File descriptor (stdout)
    lea rsi, [rsp]      ; Buffer to store the parity bit
    mov [rsp], al       ; Store the parity bit in the buffer
    mov rdx, 1          ; Number of bytes to write
    mov rax, 1          ; sys_write
    syscall             ; Call kernel

    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; Exit code 0
    syscall             ; Call kernel