section .text
;    global find_gcd
    global _find_gcd

;find_gcd:
_find_gcd:
    ; Arguments: rdi = num1, rsi = num2
    mov rax, rdi
    mov rbx, rsi

find_gcd_loop:
    cmp rax, rbx        ; compare rax and rbx
    je done             ; if equal, GCD found
    jl swap             ; if rax < rbx, swap

    sub rax, rbx        ; rax = rax - rbx
    jmp find_gcd_loop   ; repeat

swap:
    xchg rax, rbx       ; swap rax and rbx
    jmp find_gcd_loop   ; repeat

done:
    ret                 ; return GCD in rax
