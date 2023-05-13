# Kayden Hung
# 5/1/2023
# Objectives: Take in an array and reverse the order of its elements

.data
array: .word 5, 4, 3, 2, 1
arrayElements: .asciiz "The array elements are: "
stackArray: .asciiz "\nThe reverse list is: "
space: ", "

.text
main:
	# load base address of array
	la $s0, array
	
	# two loop counters
	move $t7, $zero
	move $t6, $zero
	
	
	# print the message
	
	li $v0, 4
	la $a0, arrayElements
	syscall
	
loop:
	# get current element of array
	lw $t0, 0($s0)
	
	# push to stack
	sw $t0, 0($sp)
	sub $sp, $sp, 4
	
	# print the element
	li $v0, 1
	move $a0, $t0
	syscall
	
	# increment counter
	add $s0, $s0, 4 
	add $t7, $t7, 1
	beq $t7, 5, popMessage
	
	# print comma
	li $v0, 4
	la $a0, space
	syscall
	
	j loop
	
popMessage:
	# print array message
	li $v0, 4
	la $a0, stackArray
	syscall
	
popLoop:
	# pop the stack element onto $t0
	lw $t0, 4($sp)
	add $sp, $sp, 4
	
	# print stack element
	li $v0, 1
	move $a0, $t0
	syscall
	
	# incremenet counter by 1 
	add $t6, $t6, 1
	beq $t6, 5, exit
	
	# print comma
	li $v0, 4
	la $a0, space
	syscall
	
	j popLoop
	
exit:
	li $v0, 10
	syscall
	
