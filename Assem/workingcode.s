.data
number:
  .long 76, 24, 614, 14, 1153
format:
  .asciz "Index number = %d\n"
newline:
  .byte 10

.text
.global _main

_main:
  movl $0, %ecx        # инициализация счетчика
  movl $0, %esi        # инициализация суммы
  movl $1, %edi        # инициализация произведения

for_loop:
  cmpl $20, %ecx       # проверка на конец массива (5 элементов по 4 байта каждый)
  jge end_for          # если конец, завершить цикл

  movl number(,%ecx,4), %eax  # загрузка очередного числа из массива
  testl %eax, %eax     # проверка на отрицательное число
  js end_for           # если отрицательное, завершить цикл

  movl %eax, %ebx      # копирование числа в регистр ebx

inner_loop:
  testl %ebx, %ebx     # проверка на конец числа
  jz next_number       # если конец, перейти к следующему числу

  xorl %edx, %edx      # очистка регистра edx
  movl %eax, %ebx      # копирование числа в регистр eax
  movl $10, %ebx       # делитель
  divl %ebx            # eax = a / 10, edx = a % 10
  addl %edx, %esi      # увеличение суммы
  imull %edx, %edi     # умножение на произведение
  jmp inner_loop       # повторить внутренний цикл

next_number:
  cmpl %esi, %edi      # сравнение суммы и произведения
  jl print_index       # если сумма меньше произведения, напечатать индекс

  movl $0, %esi        # сброс суммы
  movl $1, %edi        # сброс произведения
  incl %ecx            # увеличение счетчика
  jmp for_loop         # повторить внешний цикл

print_index:
  pushl %ecx           # сохранение счетчика на стеке
  pushl $format        # пуш формата строки
  call print_string    # вызов собственной функции вывода на консоль
  addl $8, %esp        # очистка стека
  popl %ecx            # восстановление счетчика
  incl %ecx            # увеличение счетчика
  jmp for_loop         # повторить внешний цикл

end_for:
  movl $1, %eax        # код завершения программы
  int $0x80            # вызов системного вызова

print_string:
  pushl %ebp           # сохранение регистра ebp
  movl %esp, %ebp      # установка ebp равным esp
  movl 8(%ebp), %ecx   # загрузка адреса строки в ecx
  movl $4, %eax        # установка номера системного вызова для write (4 для Linux)
  movl $1, %ebx        # установка файлового дескриптора для стандартного вывода (1 для stdout)
  movl $format, %ecx   # загрузка адреса строки в ecx
  movl $15, %edx       # установка размера строки в байтах
  int $0x80            # вызов системного вызова
  popl %ebp            # восстановление регистра ebp
  ret                  # возврат из функции
