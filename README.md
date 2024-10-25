# COMP 3350: Lab 3

## Task A
Write a MIPS assembly program in the MARS simulator that performs the following steps:

The program allocates space for an array of 100 characters. The program then prompts the user to enter a string of size less than 100 characters; it reads the string input by the user (no need to test with invalid inputs). The program then iterates through the string (until the null character is encountered) to perform a word count. A word starts with an alphabet a-z or A-Z and ends when a non-alphabet (not a-z and not A-Z) is encountered. The program ends by printing the string "Word count: " followed by the number of words in the string.

## Task B
Write a recursive MIPS assembly program in the MARS simulator to print the Nth integer in the Fibonacci sequence. Prompt the user for N and read the input value N (we will only test with N greater than 0). Recall that procedures are invoked with the jal instruction and you must perform appropriate saves/restores before/after the procedure invocation. The pseudo code for procedure Fib is shown below:
```
procedure Fib(N)
if (N == 0) return 0
if (N == 1) return 1
return Fib(N-1) + Fib(N-2)
```

## Grade
20/20
