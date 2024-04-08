.section .data
numbers:
    .byte 252, 17
len = . - numbers

.section .text
.globl main
.extern printf

main:
    movq %rsp, %rbp      # for correct debugging
    movl $0, %ecx        # инициализация счетчика
    jmp start_loop       # переход к началу цикла

start_loop:
    cmpl $len, %ecx      # проверка на окончание массива
    jge end_loop         # если счетчик больше или равен длине массива, завершаем цикл
    movl $0, %eax        # обнуление суммы
    movl $1, %ebx        # установка множителя в 1
    movzbl numbers(%rip), %edx  # загрузка очередного числа в edx

inner_loop:
    testl %edx, %edx     # проверка на ноль
    jz next_number       # если число равно нулю, переходим к следующему
    movzbl %dl, %eax     # загрузка младшего байта числа в eax
    addb $48, %al        # преобразование числа в символ
    subb $48, %al        # возврат к числовому значению
    addb $48, %al        # конвертация в символ ASCII
    addb $32, %al        # вывод символа на экран
    movzbl %dl, %ebx     # загрузка младшего байта числа в ebx
    imull %ebx, %ebx     # умножение множителя на число
    movzbl numbers+1(%rip), %edx  # загрузка очередного числа в edx
    shrl $8, %edx        # сдвиг числа на 8 бит вправо
    jmp inner_loop       # переход к следующей итерации внутреннего цикла
next_number:
    cmpl %eax, %ebx      # сравнение суммы и произведения
    jge next_index       # если сумма меньше произведения, переходим к следующему индексу
    pushq %rcx           # сохранение счетчика
    pushq %rax           # сохранение суммы
    pushq %rbx           # сохранение произведения
    pushq %rcx           # передача индекса в функцию printf
    leaq format(%rip), %rdi  # передача форматной строки в функцию printf
    call printf          # вызов функции printf
    addq $32, %rsp       # очистка стека
    popq %rbx            # восстановление произведения
    popq %rax            # восстановление суммы
    popq %rcx            # восстановление счетчика
next_index:
    incl %ecx           # инкремент счетчика
    jmp start_loop       # переход к началу цикла
end_loop:
    ret

.section .data
format:
    .string "Index number = %d\n"