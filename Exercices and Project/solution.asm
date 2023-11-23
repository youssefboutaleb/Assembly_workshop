.section .data
s:     .space 4
ans:   .space 4
t:     .byte 0
v:     .byte 0
newline: .asciz "\n="

.section .text
.global _start

_start:
    mov r0, s
    mov r1, 4
    mov r7, #3       @ Read system call
    mov r7, #0       @ File descriptor (stdin)
    swi 0

    mov r0, newline
    mov r1, #4
    mov r7, #4       @ Write system call
    mov r2, #2       @ Length of the newline string
    swi 0

    mov r0, ans
    mov r1, 4
    mov r7, #3       @ Read system call
    mov r7, #0       @ File descriptor (stdin)
    swi 0

    mov r0, #0
    mov r1, s
    mov r2, ans
    bl calculate

    mov r0, v
    mov r1, #0
    bl print_digit

    mov r0, #4
    mov r1, #0
    bl print_char

    mov r0, t
    mov r1, #0
    bl print_digit

    mov r0, #4
    mov r1, #0
    bl print_char

    b _start

calculate:
    mov r4, #0        @ t
    mov r5, #0        @ v
    mov r6, #0        @ Counter

check_digits:
    ldrb r7, [r1, r6]
    ldrb r8, [r2, #0]

    cmp r7, r8
    bne not_equal_s

    add r4, r4, #1     @ Increment t
    b check_digits

not_equal_s:
    add r6, r6, #1     @ Increment counter
    cmp r6, #4
    bne check_digits

    mov r6, #0        @ Reset counter

check_in_ans:
    ldrb r7, [r1, r6]
    ldrb r8, [r2, #0]

    cmp r7, r8
    bne not_equal_ans

    add r5, r5, #1     @ Increment v
    b check_in_ans

not_equal_ans:
    add r6, r6, #1     @ Increment counter
    cmp r6, #4
    bne check_in_ans

    sub r5, r5, r4     @ v - t
    mov v, r5
    bx lr

print_digit:
    mov r3, #10        @ Base 10
    bl itoa
    ldr r0, =buffer
    bl print_string
    bx lr

print_char:
    ldr r0, =buffer
    bl print_string
    bx lr

itoa:
    ldr r2, =buffer + 11   @ End of buffer
    mov r1, #0

convert_digit:
    ldr r4, =10
    sdiv r3, r0, r4       @ Divide r0 by 10, result in r3, remainder in r0
    add r3, r3, #48       @ Convert remainder to ASCII
    sub r2, r2, #1
    strb r3, [r2]         @ Store ASCII character in buffer
    add r1, r1, #1        @ Increment digit count

    cmp r0, #0
    bne convert_digit

    mov r0, r2            @ Return pointer to the beginning of the string
    mov r1, r1            @ Return digit count
    bx lr

print_string:
    ldr r7, =4            @ Write system call
    ldr r1, =1            @ File descriptor (stdout)
    ldr r2, =buffer
    mov r8, r0            @ Save buffer pointer

    loop:
        ldrb r0, [r8], #1  @ Load the next character
        cmp r0, #0
        beq end_loop

        swi 0
        b loop

    end_loop:
        bx lr

.section .bss
buffer:     .space 12     @ Buffer for converting integers to strings
