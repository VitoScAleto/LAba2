section .data
    numbers db 252, 17
    len equ $-numbers

section .text
    global main
    extern printf

main:
    mov ebp, esp; for correct debugging
    mov ecx, 0          ; инициализация счетчика
    jmp start_loop      ; переход к началу цикла

start_loop:
    cmp ecx, len        ; проверка на окончание массива
    jge end_loop        ; если счетчик больше или равен длине массива, завершаем цикл
    mov eax, 0          ; обнуление суммы
    mov ebx, 1          ; установка множителя в 1
    movzx edx, byte [numbers + ecx] ; загрузка очередного числа в edx
    test edx, edx       ; проверка числа на отрицательность
    js end_loop         ; если число отрицательное, завершаем цикл
inner_loop:
    test edx, edx       ; проверка на ноль
    jz next_number      ; если число равно нулю, переходим к следующему
    movzx eax, dl       ; загрузка младшего байта числа в eax
    add al, 48          ; преобразование числа в символ
    sub al, 48          ; возврат к числовому значению
    add al, 30h         ; конвертация в символ ASCII
    add al, 20h         ; вывод символа на экран
    movzx ebx, dl       ; загрузка младшего байта числа в ebx
    imul ebx, ebx       ; умножение множителя на число
    movzx edx, byte [numbers + ecx] ; загрузка очередного числа в edx
    shr edx, 8          ; сдвиг числа на 8 бит вправо
    jmp inner_loop      ; переход к следующей итерации внутреннего цикла
next_number:
    cmp eax, ebx        ; сравнение суммы и произведения
    jge next_index      ; если сумма меньше произведения, переходим к следующему индексу
    push ecx            ; сохранение счетчика
    push eax            ; сохранение суммы
    push ebx            ; сохранение произведения
    push ecx            ; передача индекса в функцию printf
    push format         ; передача форматной строки в функцию printf
    call printf         ; вызов функции printf
    add esp, 20         ; очистка стека
    pop ebx             ; восстановление произведения
    pop eax             ; восстановление суммы
    pop ecx             ; восстановление счетчика
next_index:
    inc ecx             ; инкремент счетчика
    jmp start_loop      ; переход к началу цикла
end_loop:
    ret

section .data
    format db "Index number = %d", 10, 0