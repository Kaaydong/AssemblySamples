# Kayden Hung
# 4/21/2023
# Exam 2 Coding Question
# Objectives: Write a program in MIPS assembly that takes in two user strings and 
# 	prints out their addresses after printing out all elements for the days array provided. 

# Request for and get user input string
.macro getUserString(%buffer)
printString("Please Enter a String (50 Chars Max): ")
li $v0, 8
la $a0, %buffer
li $a1, 50
syscall
.end_macro


# Print string given string literal
.macro printString(%string)
li $v0, 4
.data
string: .asciiz %string

.text
la $a0, string
syscall
.end_macro


# Print int given register parameter
.macro printInt(%int)
li $v0, 1
move $a0, %int
syscall
.end_macro


# Exit program
.macro exit
printString("\nProgram is Exitting")
li $v0, 10
syscall
.end_macro


.data
days: .word 31, 28, 31, 30, 31, 30, 31, 30, 30, 31, 30, 31
buffer1: .space 50
buffer2: .space 50


.text
main:
	# Get first string from user: store in buffer1
	getUserString(buffer1)
	
	# Get second string from user: store in buffer2
	getUserString(buffer2)
	
	# print array message
	printString("Days array elements are: ")
	
	
	#load address of 'array' into $s0
	la $s0, days
	
	#initialize loop counter into $t7
	move $t7, $zero
	
loop:
	#get the current element of the array
	lw $t0, 0($s0)
	
	#print the element to the user
	printInt($t0)
	
	#increment base address to next element
	addi $s0, $s0, 4
	
	#increment loop counter
	addi $t7, $t7, 1
	
	#break out of the loop when counter matches the number of elements
	beq $t7, 12, printStringAddress
	
	#print a space for seperation between elements:
	printString(", ")
	
	j loop
	
printStringAddress:
	# Print out the address of first user input string
	printString("\nThe address for the first string is: ")
	li $v0, 1
	la $a0, buffer1
	syscall
	
	# Print out the address of second user input string
	printString("\nThe address for the second string is: ")
	li $v0, 1
	la $a0, buffer2
	syscall
	
	# Exit program
	exit
	
	
