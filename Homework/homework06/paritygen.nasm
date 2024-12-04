section .data
    msg db "Parity bit: ", 0

section .text
    global _start

_start:
    mov al, 0b10101110
    call paritygen
    mov eax, 1
    xor ebx, ebx
    int 0x80

paritygen:
    xor ecx, ecx

count_bits:
    test al, 1
    jz skip_increment
    inc ecx

skip_increment:
    shr al, 1
    jnz count_bits

    test ecx, 1
    jz even_parity

    mov edx, msg
    call print_string
    mov dl, '0'
    call print_char
    ret

even_parity:
    mov edx, msg
    call print_string
    mov dl, '1'
    call print_char
    ret

print_string:
    mov esi, edx
    xor ecx, ecx
print_char_loop:
    mov al, byte [esi + ecx]
    test al, al
    jz done_printing
    mov ebx, 1
    mov eax, 4
    mov edx, 1
    int 0x80
    inc ecx
    jmp print_char_loop
done_printing:
    ret

print_char:
    mov ebx, 1
    mov eax, 4
    mov edx, 1
    int 0x80
    ret
