# Name: Kayden Hung
# Data: 4/28/2023
# Objectives: Write a program in Assembly that takes in a programmer-defined filename

.data
fileName: .asciiz "practiceFile.txt"
aBuffer: .space 301


.text
main: 
# open the file
	li $v0, 13
	la $a0, fileName
	li $a1, 0	# Read the file
	li $a2, 0	# 0 means gets ignored
	syscall
	move $s0, $v0	# Store file descriptor in $s0
	
	# read practiceFile.txt
	li $v0, 14
	move $a0, $s0
	la $a1, aBuffer
	li $a2, 300
	syscall
	move $s2, $v0
	
	# Print the contents to user
	li $v0, 4
	la $a0, aBuffer
	syscall
	
	j exit
	
exit:
	li $v0, 10
	syscall