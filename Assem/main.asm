    .section .data
number:
    .quad 76
    .quad 24
    .quad 614
    .quad 14
    .quad 1153

format:
    .string "Index number = %ld\n"

    .section .text
    .globl main
    .type main, @function
main:
    xorq %rdi, %rdi               # i = 0
.L2:
    movq number(,%rdi,8), %rax   # a = number[i]
    testq %rax, %rax
    jl .L5                        # if (a < 0) goto end
    xorq %rdx, %rdx               # sum = 0
    movq $1, %rcx                 # mult = 1
.L3:
    movq %rax, %rbx               # b = a
    movq $10, %rsi                # divisor = 10
    cqo                           # sign extend rax to rdx:rax
    idivq %rsi                    # b = a % 10, a = a / 10
    addq %rbx, %rdx               # sum += b
    imulq %rbx, %rcx              # mult *= b
    testq %rax, %rax
    jne .L3                       # if (a != 0) goto next iteration
    cmpq %rdx, %rcx               # if (sum < mult)
    jge .L4                       #   goto next iteration
    leaq format(%rip), %rdi       # load address of format string
    movq %rdi, %rsi               # first argument: pointer to format string
    movq %rax, %rdx               # second argument: index value
    xorl %eax, %eax               # clear upper bits of rax
    call printf                   # call printf
.L4:
    incq %rdi                     # i++
    jmp .L2                       # next iteration
.L5:
    ret                           # end of program