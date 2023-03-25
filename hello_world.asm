# CS 2640.02 Test Assembly Program

# Kayden Hung
# 3/8/2023
# hello world print

.data
hello: .asciiz "hello\n"

.text
main:
	li $v0, 4
	la $a0, hello
	syscall
	
	li $v0, 1
	li $a0, 31415
	syscall
	
	li $v0, 10
	syscall
 
