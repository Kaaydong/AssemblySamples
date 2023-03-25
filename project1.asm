# Name: Kayden Hung
# Date: 3/25/2023
# Objectives: 	First Project
#		Recieve two ints from user
#		Operate on ints using add, sub, mul, and div
#		Tell whether the two ints are equal or not
#
# Github: https://github.com/KaydenDaKat/AssemblySamples/blob/main/project1.asm

.data
num1: .asciiz "Please enter an int: "
num2: .asciiz "\nPlease enter another int: "
echo: .asciiz "\nYour two numbers are: "
and: .asciiz " and "
operations: .asciiz "\n\nOperations"
options: .asciiz "\nEnter an option (enter 1, 2, 3, or 4): " 
addition: .asciiz "\nAddition: "
subtraction: .asciiz "\nSubtraction: "
multiplication: .asciiz "\nMultiplication: "
division: .asciiz "\nDivision: "
same: .asciiz "\n\nUser inputs are the same"
different: .asciiz "\n\nUser inputs are different"

.text

main:
	li $v0, 4	# Print num1
	la $a0, num1	
	syscall
	
	li $v0, 5	# Ask for int 1
	syscall
	move $s0, $v0
	
	li $v0, 4	# Print num2
	la $a0, num2
	syscall
	
	li $v0,5	# Ask for number 2
	syscall
	move $s1, $v0
	
	li $v0, 4	# Print echo
	la $a0, echo
	syscall
	
	li $v0, 1	# Print int 1
	add $a0, $s0, $zero
	syscall
	
	li $v0, 4	# Print and
	la $a0, and
	syscall
	
	li $v0, 1	# Print int 2
	add $a0, $s1, $zero
	syscall
	
	li $v0, 4	# Print operations
	la $a0, operations
	syscall
	
	li $v0, 4	# Print addition
	la $a0, addition
	syscall
	
	li $v0, 1	# Print addition result
	add $a0, $s0, $s1
	syscall
	
	li $v0, 4	# Print subtraction
	la $a0, subtraction
	syscall
	
	li $v0, 1	# Print subtraction result
	sub $a0, $s0, $s1
	syscall
	
	li $v0, 4	# Print multiplication 
	la $a0, multiplication
	syscall
	
	li $v0, 1	# Print multiplication result
	mul $a0, $s0, $s1
	syscall
	
	li $v0, 4	# Print division
	la $a0, division
	syscall
	
	li $v0, 1	# Print division result
	div $a0, $s0, $s1
	syscall
	
	beq $s0, $s1, input_same
	bne $s0, $s1, input_different
	
	
input_same:

	li $v0, 4
	la $a0, same
	syscall
	
	j exit
	
input_different:

	li $v0, 4
	la $a0, different
	syscall

	j exit
	
exit:
	li $v0, 10
	syscall
	
