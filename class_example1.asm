# Name: Kayden Hung
# Class: CS 2640.02
# Date: 3/20/2023
# -getting two numbers from user (integers)
# -compare numbers
# -print the greater number

.data
getNum1: .asciiz "\nPlease Enter An Integer: "
getNum2: .asciiz "\nPlease Enter Another Integer: "


.text
main:
	# print out getNum1
	li $v0, 4
	la $a0, getNum1
	syscall
	
	#get user input
	li $v0, 5
	syscall
	move $s0, $v0
	
	#print out getNum2
	li $v0, 4
	la $a0, getNum2
	syscall
	
	#get second user input, store into $s1
	li $v0, 5
	syscall
	move $s1, $v0
	
	bgt $s0, $s1, firstVal
	#$s0<$s1
	li $v0, 1
	move $a0, $s1
	syscall
	
	j exit
	
firstVal:		#print out the greater number stored at $s0
	li $v0, 1
	move $a0, $s0
	syscall
	
exit:
	li $v0, 10
	syscall
