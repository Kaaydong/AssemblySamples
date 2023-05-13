# Kayden Hung
# 4/7/2023
# Class macro examples

.macro PRINT(%string)
	li $v0, 4
	la $a0, %string
	syscall
.end_macro


.macro PRINT_IMMEDIATE(%string)
	li $v0, 4
.data
	userString: .asciiz %string
.text
	la $a0, userString
	syscall
.end_macro 


.macro INTS(%parameter)
	PRINT(escape)
	li $v0, 1
	addi $a0, $zero, %parameter
	syscall
.end_macro


.macro INTS_ADDRESS(%parameter)
	PRINT(escape)
	li $v0, 1
	add $a0, $zero, %parameter
	syscall
.end_macro


.macro EXIT
	li $v0, 10
	syscall
.end_macro


.data
printing: .asciiz "\nHello"
escape: .asciiz "\n"

.text
main:
	move $t0, $zero
	move $t1, $zero
	
	
loop:
	PRINT(printing)
	
	addi $t0, $t0, 1
	beq $t0, 5, loop2

	j loop

loop2: 
	addi $t1, $t1, 1
	INTS_ADDRESS($t1)
	beq $t1, 5, exit
	
	j loop2

exit:
	INTS(1000)
	PRINT_IMMEDIATE("\nYou sussy baka")
	EXIT
