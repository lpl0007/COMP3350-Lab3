.text
main:
	# Request input
	la $a0, input
	li $v0, 4
	syscall
	
	# Read input
	li $v0, 5
	syscall
	
	# Move value to a $t0
	move $t0, $v0
	move $a0, $t0
	move $v0, $t0
	jal fibonacci
	move $t1, $v0
	
	# Output
	# Print output1
	la $a0, output1
	li $v0, 4
	syscall
	
	# Print n
	move $a0, $t0
	li $v0, 1
	syscall
	
	# Print output2
	la $a0, output2
	li $v0, 4
	syscall
	
	# Print answer
	move $a0, $t1
	li $v0, 1
	syscall
	
	# End
	li $v0, 10
	syscall

fibonacci:
	# Check if 0 or 1
	beq $a0, 0, case0
	beq $a0, 1, case1
	
	# Save return address in stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	
	# Find n-1
	sub $a0, $a0, 1
	jal fibonacci
	add $a0, $a0, 1
	
	# Restore return address
	lw $ra, 0($sp)
	add $sp, $sp, 4
	
	# Save return address in stack
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	
	# Save return address in stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	
	# Find n-2
	sub $a0, $a0, 2
	jal fibonacci
	add $a0, $a0, 2
	
	# Restore return address
	lw $ra, 0($sp)
	add $sp, $sp, 4
	
	# Pop return address
	lw $s0, 0($sp)
	add $sp, $sp, 4
	
	# fibonacci(n-1) + fibonacci(n-2)
	add $v0, $v0, $s0
	jr $ra

case0:
	li $v0, 0
	jr $ra

case1:
	li $v0, 1
	jr $ra

.data
input: .asciiz "\nEnter an integer greater than zero: "
output1: .asciiz "\nElement "
output2: .asciiz " of the Fibonacci sequence is: "