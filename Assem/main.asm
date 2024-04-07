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

    movq $10, %rsi                # divisor = 10
    xorq %rdx, %rdx               # sum = 0
    movq $1, %rcx                 # mult = 1
    leaq format(%rip), %rdi       # load address of format string

.L2:
    movq number(,%rdi,8), %rax   # a = number[i]
    testq %rax, %rax
    je .L3                        # if (a == 0) goto next iteration

    movq %rax, %rbx               # b = a
    xorq %rdx, %rdx               # sum = 0
    xorq %rcx, %rcx               # mult = 1

    call calculate_sum_product

    cmpq %rdx, %rcx               # if (sum < mult)
    jge .L4                       #   goto next iteration

    movq %rdi, %rsi               # first argument: pointer to format string
    movq %rax, %rdx               # second argument: index value
    xorl %eax, %eax               # clear upper bits of rax
    call printf                   # call printf

.L4:
    addq $1, %rdi                 # i += 1
    cmpq $5, %rdi                # check if i < 5
    jl .L2                        # next iteration

.L3:
    ret                           # end of program..

calculate_sum_product:
    pushq %rbp                    # save rbp
    movq %rsp, %rbp               # set rbp as base pointer

    movq %rdi, %r8                # save rdi (format string pointer)
    movq %rsi, %r9                # save rsi (index value)
    movq %rdx, %r10               # save rdx (sum)
    movq %rcx, %r11               # save rcx (mult)

    movq %rax, %rbx               # b = a
    xorq %rdx, %rdx               # sum = 0
    xorq %rcx, %rcx               # mult = 1

    .L6:
    cqo                           # sign extend rax to rdx:rax
    idivq %rsi                    # b = a % 10, a = a / 10
    addq %rbx, %rdx               # sum += b
    imulq %rbx, %rcx              # mult *= b

    testq %rax, %rax
    jnz .L6                       # if (a != 0) goto .L6

    movq %r8, %rdi                # restore rdi (format string pointer)
    movq %r9, %rsi                # restore rsi (index value)
    movq %r10, %rdx               # restore rdx (sum)
    movq %r11, %rcx               # restore rcx (mult)

    popq %rbp                     # restore rbp
    ret                           # return from subroutine




      .section .data
number:
    .quad 76
    .quad 24
    .quad 614
    .quad 14
    .quad 1153

format:
    .string "Index number = %ld
"

.section .text
.globl main
.type main, @function
main:
    xorq %rdi, %rdi               # i = 0

    movq $10, %rsi                # divisor = 10
    xorq %rdx, %rdx               # sum = 0
    movq $1, %rcx                 # mult = 1
    leaq format(%rip), %rdi       # load address of format string

.L2:
    movq number(,%rdi,8), %rax   # a = number[i]
    testq %rax, %rax
    jl .L5                        # if (a < 0) goto end

    movq %rax, %rbx               # b = a
    cqo                           # sign extend rax to rdx:rax
    idivq %rsi                    # b = a % 10, a = a / 10
    addq %rbx, %rdx               # sum += b
    imulq %rbx, %rcx              # mult *= b

    movq %rax, %rbx               # b = a
    cqo                           # sign extend rax to rdx:rax
    idivq %rsi                    # b = a % 10, a = a / 10
    addq %rbx, %rdx               # sum += b
    imulq %rbx, %rcx              # mult *= b

    movq %rax, %rbx               # b = a
    cqo                           # sign extend rax to rdx:rax
    idivq %rsi                    # b = a % 10, a = a / 10
    addq %rbx, %rdx               # sum += b
    imulq %rbx, %rcx              # mult *= b

    movq %rax, %rbx               # b = a
    cqo                           # sign extend rax to rdx:rax
    idivq %rsi                    # b = a % 10, a = a / 10
    addq %rbx, %rdx               # sum += b
    imulq %rbx, %rcx              # mult *= b

    cmpq %rdx, %rcx               # if (sum < mult)
    jge .L4                       #   goto next iteration

    movq %rdi, %rsi               # first argument: pointer to format string
    movq %rax, %rdx               # second argument: index value
    xorl %eax, %eax               # clear upper bits of rax
    call printf                   # call printf

.L4:
    addq $4, %rdi                 # i += 4
    cmpq $20, %rdi                # check if i < 20
    jl .L2                        # next iteration

.L5:
    ret                           # end of program.