section .data
    numbers db 76, 24, 14, 111, 56
    size equ $ - numbers

section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    mov ecx, 0

loop_start:
    cmp ecx, size
    jge loop_end

    movzx eax, byte [numbers + rcx]
    call sumDigits
    mov edx, eax

    movzx eax, byte [numbers + rcx]
    call productDigits
    cmp eax, edx
    jg add_index

    jmp skip_add_index

add_index:
    mov eax, ecx
    call print_index

skip_add_index:
    inc ecx
    jmp loop_start

loop_end:
    mov eax, 60
    xor edi, edi
    syscall

print_index:
    push rax

    mov eax, 1
    mov edi, 1
    mov rsi, index_msg
    mov edx, index_msg_len
    syscall

    pop rax
    ret

sumDigits:
    push rbp
    mov rbp, rsp
    sub rsp, 4

    mov rax, [rbp + 8]
    push rax
    call show_number
    add rsp, 4

    xor rax, rax
    mov rcx, qword [rbp + 16]

sum_digits_loop:
    test rcx, rcx
    jz sum_digits_end

    movzx rdx, byte [rax]
    sub rdx, '0'
    add rax, 1

    add rax, rdx
    dec rcx
    jmp sum_digits_loop

sum_digits_end:
    leave
    ret

productDigits:
    push rbp
    mov rbp, rsp
    sub rsp, 4

    mov rax, [rbp + 8]
    push rax
    call show_number
    add rsp, 4

    xor rax, rax
    mov rcx, qword [rbp + 16]

product_digits_loop:
    test rcx, rcx
    jz product_digits_end

    movzx rdx, byte [rax]
    sub rdx, '0'
    add rax, 1

    imul rax, rdx
    dec rcx
    jmp product_digits_loop

product_digits_end:
    leave
    ret

show_number:
    push rbp
    mov rbp, rsp
    sub rsp, 4

show_number_loop:
    movzx eax, byte [rbp + 8]
    
    test al, al
    jz show_number_end
    
    mov dl, al
    add dl, '0'
    
    push rdx
 mov rdx, rsp
    
 mov eax, 1
 mov edi, 1
 int 0x80
    
 inc rbp
 jmp show_number_loop
    
show_number_end:
 leave
 ret

section .data
 index_msg db "Index number = ", 0
 index_msg_len equ $ - index_msg