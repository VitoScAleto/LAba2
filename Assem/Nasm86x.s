section .data
    number dd 15, 24, 614, 14, 1153
    format db "Index number = %d", 10, 0

section .text
    global main
    extern printf

main:
  
    mov edi, 0  ; a = 0
    mov esi, 0  ; b = 0
    mov edx, 0  ; sum = 0
    mov ecx, 1  ; mult = 1

    mov ebx, 0  ; i = 0
loop_start:
    cmp ebx, 5  ;если счетчик больше кол-во чисел программа завершается 
    jnl loop_end  

    mov eax, dword [number + ebx*4]  ; load number[i] into eax ebx счетчик
    test eax, eax  ; check if number[i] is negative
    js inner_loop_end  ; if negative, exit loop

    mov edi, eax  ; a = number[i]
sum_loop:
    movzx ecx, si  ; load b into ecx
    
    add eax, ecx  ; sum = sum + b
    imul ecx, ecx  ; mult = mult * b
    imul edx, ecx  ; multiply carry by b
    mov esi, esi  ; decrement b
    cmp esi, 0  ; check if b != 0
    jl sum_loop  ; if b != 0, continue sum_loop

    cmp eax, edx  ; compare sum and mult
    jb inner_loop_end  ; if sum >= mult, exit inner loop
    
    push eax ; push sum
    push ebx  ; save i on the stack
    push format  ; push format string
    call printf  ; call printf
    add esp, 12  ; clean up the stack

inner_loop_end:
    mov edx, 1  ; clear edx for mult
    inc ebx  ; i++
    jmp loop_start  ; go to the next iteration

loop_end:
    ret