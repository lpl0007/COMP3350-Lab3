.globl main
main:
	# Request input
	la $a0, input
	li $v0, 4
	syscall
	
	# Reserve space
	la $a0, pause
	li $a1, 100
	li $v0, 8
	syscall
	
	# Return output
	la $t0, pause
	li $t1, 0
	
	# Check for spaces and symbols
check:
	#Load address
	lb $t2, ($t0)
	beqz $t2, final
	
	# Check uppercase values
	blt $t2, 65, lower
	ble $t2, 91, increment
	
	# Check lowercase values
	lower:
		blt $t2, 96, count
		bgt $t2, 122, count
		
# Move to next letter
increment:
	add $t0, $t0, 1
	j check

# Increase word counter
count:
	add $t1, $t1, 1
	j increment
	
# End
final:
	# Print output
	la $a0, output
	li $v0, 4
	syscall
	
	# Print final counter result
	move $a0, $t1
	li $v0, 1
	syscall
		
	# Exit program
	li $v0, 10
	syscall

.data
input:.asciiz "\nEnter a string of size less than 100 characters: "
pause:.space 100
output:.asciiz "\nWord count: "