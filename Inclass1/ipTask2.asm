# Kayden Hung
# 4/17/2023
# Objective: Task2 
# Using the ‘aString’ macro we defined on the previous slide, 
# write a MIPS program that passes the programmer’s defined string to the macro, 
# uses a loop to print the string 3 times (each on a new line), 
# and then exits the program.


# print string literal
.macro aString(%string)

.data
thing: .asciiz %string

.text
main: 
	li $v0, 4
	la $a0, thing
	syscall
.end_macro



.text
main:
	#loop counter 
	add $t0, $t0, $zero
	j loop
	
loop:
	# Print or exit if counter is 3
	beq $t0, 3, exit
	aString("Bing Bong")
	aString("\n")
	
	# Add 1 to counter
	addi $t0, $t0, 1
	j loop
	
exit:
	# Exit
	li $v0, 10
	syscall
