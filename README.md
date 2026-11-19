# ECE-366-project2

Team members 
Name              netid

-Antonio Clara    aclar37

-Nestor Soto      nsoto

-Julises Mercado  jmerc35

-Gael Perez       gpere92

Contributions

Antonio- Made the skeleton of the MIPS code and create the repository

Gael- Implemented and tested the IsOdd(m) code using division by repeated subtraction

Nestor - Designed and implemented IsFibonnaciOdd(n) using existing fibonacci and is_odd programs

Julises - Verified edge cases in MARS, added code comments, and final submission

GitHub repository 

https://github.com/aclar37/ECE-366-project2.git

How to Run Fibonacci(n)
1.Open fibonacci.asm using the MARS simulator.
2.Change the value of n in the .data section to the desired nonnegative integer.
3.Press F3 to assemble the program.
4.Press F5 to run it.
5.View the result in the Data Segment at the memory location labeled result.
Example: When n = 7, the result is 13.

How to Run IsOdd(m)
1.Open is_odd.asm using the MARS simulator.
2.Change the value of m in the .data section to the desired nonnegative integer.
3.Press F3 to assemble the program.
4.Press F5 to run it.
5.View the result in the Data Segment at the memory location labeled result (1 if odd, 0 if even).
Example: When m = 7, the result is 1.

How to Run IsFibonacciOdd(n)
1.Open IsFibonacciOdd.asm using the MARS simulator.
2.Change the value of n in the .data section to the desired nonnegative integer.
3.Press F3 to assemble the program.
4.Press F5 to run it.
5.View the result in the Data Segment at the memory location labeled result (1 if odd, 0 if even).
Example: When n = 7, the result is 1.

Verification/Testing:

| Input (n) | Fib (F_n) | Expected Result | Actual Result|
|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 |
| 2 | 1 | 1 | 1 |
| 3 | 2 | 0 | 0 |
| 7 | 13 | 1 | 1 |
| 10 | 55 | 1 | 1 |
| 12 | 144 | 0 | 0 |
