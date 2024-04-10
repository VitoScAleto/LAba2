section .data
    number dd 14, 25,15, -1381, ;массив чисел 
    format db "Index number = %d", 10, 0 
section .text
    global main
    extern printf
main:
    mov edi, 0  ; a = 0
    mov esi, 0  ; b = 0
    mov edx, 0  ; остаток от деления
    mov ecx, 1  ; произведение = 1
    mov ebp, 0  ; сумма
    mov ebx, 0  ; i = 0
loop_start:
    cmp ebx, 4 ;если счетчик больше кол-во чисел программа завершается 
    jnl loop_end  
    mov eax, dword [number + ebx*4]  ; load number[i] into eax 
    test eax, eax  ; check if number[i] is negative
    js inner_loop_end  ; if negative, next iteration
sum_loop:
    mov edi, eax ;делимое
    mov esi, 10 ;делитель
    div esi; esi остаток от деления
    add ebp,edx   ; сумма
    imul ecx, edx  ; произведение 
    xor edx, edx   ; очистка частного
    cmp eax, 0  ; сравнение числа с нулем
    ja sum_loop   ; 
sravnenie:
    cmp ecx, ebp; compare sum and mult
    jl inner_loop_end  ; 
    push edx ; push sum
    push ebx  ; save i on the stack
    push format  ; push format string
    call printf  ; call printf
    add esp, 12  ; clean up the stack
inner_loop_end:
    mov ecx, 1  ; clear edx for mult
    xor ebp, ebp
    xor eax, eax
    xor edx,edx
    xor edi,edi
    inc ebx  ; i++
    jmp loop_start  ; go to the next iteration
loop_end:
    ret