# Name: Kayden Hung
# Date: 3/23/2023
# Objective: To study for 2400 exam

.data
message: .asciiz "Please enter an int: "
message2: .asciiz "Your int: "

.text


main: 
	li $v0, 4
	la $a0, message
	syscall

	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, message2
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall
