# Kayden Hung
# 4/26/2023
# OBjectives: Write a program that will print out the $sp address
# and push an integer onto the stack and print out the new $sp address



.data
stackPointer: .asciiz "The current stack address is: "
newStackPointer: .asciiz "\nThe new stack address is: "

.text
main:
	# Print out prompt
	li $v0, 4
	la $a0, stackPointer
	syscall

	# Print out address of stack 
	li $v0, 1
	move $a0, $sp
	syscall
	
	# Push an int (12) onto the stack
	li $s0, 12
	sw $s0, -4($sp)
	addi $sp, $sp, -4
	
	# Print out new prompt
	li $v0, 4
	la $a0, newStackPointer
	syscall
	
	# Print out new address of top of stack
	li $v0, 1
	move $a0, $sp
	syscall

exit: 
	li $v0, 10
	syscall
