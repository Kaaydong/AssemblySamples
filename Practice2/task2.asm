# Name: Kayden Hung
# Date: 4/16/2023
# Objectives: Write a program in Assembly that takes in two ints from a user. 
# - One int will be 'x' and the other will be 'y'. 
# - Make sure that user will know which value is 'x' and 'y'. 
# - Find the result of 'x' to the power of 'y'. Output the result to the user.
# Include the following in your program:
# - a main label, a looping label, and an exit label
# - a loop counter


# Print string literal
.macro print(%string)
li $v0, 4

.data
word: .asciiz %string

.text
la $a0, word
syscall
.end_macro


# Print int given address
.macro printNum(%num)
li $v0, 1
move $a0, %num
syscall
.end_macro


.data



.text
main:
	print("You will input values for x to the power of y\n")
	
	# Ask and recieve input for 'x'
	print("Enter a number for 'x': ")
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Ask and recieve input for 'y'
	print("\nEnter a number for 'y': ")
	li $v0, 5
	syscall
	move $s1, $v0
	
	# Print answer prompt
	print("\n'x' to the power 'y' or ")
	printNum($s0)
	print(" to the power ")
	printNum($s1)
	print(" is: ")
	
	
	# initialize loop counter
	add $t0, $t0, $zero
	
	# initialize answer register with value 1
	addi $s2, $s2, 1 
	
	# Jump to loop label
	j loop

# Loop label
loop:
	# Exit if loop counter and 'y' are equal
	beq $t0, $s1, exit
	
	# Multiply the current value with 'x'
	mul $s2, $s2, $s0
	
	# Add 1 to the loop counter
	addi $t0, $t0, 1
	
	# Reiterate the loop
	j loop

# Exit label
exit:
	# Print the answer
	printNum($s2)
	
	# Exit program
	li $v0, 10
	syscall
	

	
	
	