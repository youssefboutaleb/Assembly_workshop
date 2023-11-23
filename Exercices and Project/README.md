# Title: Exercies and Project



## Description: 
in this section you will find the solutions of the 3 exercices and the Project with python(`solution.py`) and asm(`solution.asm`)

### Exercice 1:
Here's a step-by-step breakdown:

`endbr64`: This instruction is part of control-flow enforcement technology (CET) and is used to indicate the end of an instruction stream. It is not directly related to the computation.

`push rbp`: Save the current value of the base pointer on the stack.

`mov rbp, rsp`: Set the base pointer (rbp) to the current value of the stack pointer (rsp).

`mov DWORD PTR [rbp-0x4], edi`: Move the value of the edi register into the dword-sized memory location at [rbp-0x4].

`mov QWORD PTR [rbp-0x10], rsi`: Move the value of the rsi register into the qword-sized memory location at [rbp-0x10].

`mov eax, 0x30`: Move the hexadecimal value 0x30 (48 in decimal) into the eax register.

`pop rbp`: Restore the original value of the base pointer from the stack.

`ret`: Return from the function.


Now, regarding the eax register, it is set to the value 0x30 (48 in decimal) just before the function returns. Therefore, the final value in the eax register is 0x30.

### Exercice 2:
`endbr64`: This instruction is part of control-flow enforcement technology (CET) and indicates the end of an instruction stream.

`push rbp`: Save the current value of the base pointer on the stack.

`mov rbp, rsp`: Set the base pointer (rbp) to the current value of the stack pointer (rsp).

`mov DWORD PTR [rbp-0x14], edi`: Move the value of the edi register into the dword-sized memory location at [rbp-0x14].

`mov QWORD PTR [rbp-0x20], rsi`: Move the value of the rsi register into the qword-sized memory location at [rbp-0x20].

`mov DWORD PTR [rbp-0x4], 0x9fe1a`: Move the immediate value 0x9fe1a into the dword-sized memory location at [rbp-0x4].

`mov eax, DWORD PTR [rbp-0x4]`: Move the value stored at [rbp-0x4] (which is 0x9fe1a) into the eax register.

`pop rbp`: Restore the original value of the base pointer from the stack.

`ret`: Return from the function.

Therefore, the final value in the eax register is 0x9fe1a( 654,874 in decimal).

### Exercice 3:
`endbr64`: This instruction is part of control-flow enforcement technology (CET) and indicates the end of an instruction stream.

`push rbp`: Save the current value of the base pointer on the stack.

`mov rbp, rsp`: Set the base pointer (rbp) to the current value of the stack pointer (rsp).

`mov DWORD PTR [rbp-0x14], edi`: Move the value of the edi register into the dword-sized memory location at [rbp-0x14].

`mov QWORD PTR [rbp-0x20], rsi`: Move the value of the rsi register into the qword-sized memory location at [rbp-0x20].

`mov DWORD PTR [rbp-0x4], 0x9fe1a`: Move the immediate value 0x9fe1a into the dword-sized memory location at [rbp-0x4].

`cmp DWORD PTR [rbp-0x4], 0x2710`: Compare the value at [rbp-0x4] with 0x2710 (10000 in decimal).

`jle 0x55555555514e <main+37>`: Jump to address 0x55555555514e if the result of the comparison is less than or equal to (signed) 0. This is taken if [rbp-0x4] is less than or equal to 10000.

`sub DWORD PTR [rbp-0x4], 0x65`: Subtract 0x65 (101 in decimal) from the value at [rbp-0x4] if the jump was not taken.

`jmp 0x555555555152 <main+41>`: Jump to address 0x555555555152 (regardless of the outcome of the previous comparison).

`add DWORD PTR [rbp-0x4], 0x65`: Add 0x65 (101 in decimal) to the value at [rbp-0x4]. This is the target of the jump at <+29> if the value was less than or equal to 10000.

`mov eax, DWORD PTR [rbp-0x4]`: Move the final value at [rbp-0x4] into the eax register.

`pop rbp`: Restore the original value of the base pointer from the stack.

`ret`: Return from the function.

The final value in the eax register depends on the initial value 0x9fe1a, the comparison with 0x2710, and the subsequent arithmetic operations. If the initial value is greater than 10000, 0x65 (101) is subtracted; otherwise, it is added.
### Project Vache Teraux :
"Vache Teraux" is a simple number-guessing game implemented in ARM assembly language for Linux. The player is prompted to input a 4-digit guess, and the game evaluates the guess against a secret code. The objective is to determine the correct combination of digits. The game provides feedback on the accuracy of the guess, indicating the number of 'vaches' (correct digits in the wrong place) and 'taureaux' (correct digits in the correct place).

The player continues making guesses until the correct code is identified. The game then displays the number of vaches and taureaux for each guess, helping the player refine their strategy. The challenge lies in deciphering the code through a process of deduction and logic.

The ARM assembly implementation showcases the intricacies of low-level programming, emphasizing the skill required to develop a game in an environment that demands precise manipulation of registers and memory. The player's ability to decipher the code efficiently is central to mastering this minimalist, yet engaging, number puzzle.





