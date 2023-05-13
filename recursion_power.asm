# Kayden Hung
# 5/3/2023
# See if input is a power of two

.data
prompt: .asciiz "Input a number to see if power of 2: "
trueStatement: .asciiz "Input is a power of 2"
falseStatement: .asciiz "Input is not a power of 2"

.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $s1, 1
	
loop:
	beq $s1, $s0, true
	bgt $s1, $s0, false
	
	mul $s1, $s1, 2
	
	j loop
	
	
true:
li $v0, 4
la $a0, trueStatement
syscall

j exit

false:
li $v0, 4
la $a0, falseStatement
syscall

j exit

exit: 
li $v0, 10
syscall