# Name: Kayden Hung
# Date: 4/7/2023
# Objectives: given array = [1,2,3,4,5]
# - display array message to user
# - main label, loop label, exit label
# - $s0 usd for the base address of the array
# - $t0 for the current array element
# - element loop counter

.data
array: .word 1, 2, 3, 4, 5
message: .asciiz "\nArray elements are: "
space: .asciiz ", "

.text
main:
	# print array message
	li $v0, 4
	la $a0, message
	syscall
	
	
	#load address of 'array' into $s0
	la $s0, array
	
	#initialize loop counter into $t7
	move $t7, $zero
	
loop:
	#get the current element of the array
	lw $t0, 0($s0)
	
	#print the element to the user
	li $v0, 1
	move $a0, $t0
	syscall	
	
	#increment base address to next element
	addi $s0, $s0, 4
	
	#increment loop counter
	addi $t7, $t7, 1
	
	#break out of the loop when counter matches the number of elements
	beq $t7, 5, exit
	
	#print a space for seperation between elements:
	li $v0, 4
	la $a0, space
	syscall
	
	j loop
	
exit:
	li $v0, 10
	syscall