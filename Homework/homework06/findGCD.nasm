section .data
    firstNum dq 3113041662
    secondNum dq 11570925
    resultMsg db "The GCD is: ", 0
    newline db 0xA, 0

section .bss
    gcd resb 20

section .text
    global _start

_start:
    mov rax, [firstNum]
    mov r8, rax
    mov rbx, [secondNum]
    mov r9, rbx
    mov rax, r8
    mov rbx, r9
    call gcd_calc
    mov rsi, gcd
    call int_to_str
    mov rax, 1
    mov rdi, 1
    mov rsi, resultMsg
    mov rdx, 13
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, gcd
    call str_len
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall

gcd_calc:
    cmp rbx, 0
    je .done
    xor rdx, rdx
    div rbx
    mov rax, rbx
    mov rbx, rdx
    jmp gcd_calc
.done:
    ret

int_to_str:
    mov rcx, 10
    xor rdx, rdx
    mov rdi, rsi
    add rsi, 19
    mov byte [rsi], 0
.int_to_str_loop:
    dec rsi
    xor rdx, rdx
    div rcx
    add dl, '0'
    mov [rsi], dl
    test rax, rax
    jnz .int_to_str_loop
    ret

str_len:
    mov rcx, 0
.str_len_loop:
    cmp byte [rsi + rcx], 0
    je .str_len_done
    inc rcx
    jmp .str_len_loop
.str_len_done:
    mov rdx, rcx
    ret
