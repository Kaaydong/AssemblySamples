# Name: Kayden Hung
# Data: 4/15/2023
# Objective: Write an Assembly program that will return a letter grade given a Decimal int from the user
# - Include the following:
# - a user menu
# - a main label, a looping label, and an exit label
# - a way for the user to continue getting letter grades or choose to exit
# - invalid input handling (do NOT just print an error message and exit the program; re-prompt the user until a correct input is entered)


# Print given a string literal
.macro print(%string)
li $v0, 4

.data
word: .asciiz %string

.text
la $a0, word
syscall

.end_macro


# Print given a string address
.macro printA(%string)
li $v0, 4
la $a0, %string
syscall
.end_macro


.data
main_menu: .asciiz "---------- MAIN MENU ----------\n"
option1: .asciiz "(1)Get Letter Grade\n"
option2: .asciiz "(2)Exit Program\n\n"
newline: .asciiz "\n"
prompt: .asciiz "Enter '1' or '2' for your selection: "
line: .asciiz "------------------------------\n\n"
prompt2: .asciiz "Please enter a score as an interger value: "
prompt3: .asciiz "The grade is: "
prompt4: .asciiz "Would you like to enter a new score?\n"
prompt5: .asciiz "(y)Yes (n)No\n\n"
prompt6: .asciiz "Enter 'y' or 'n' for your selection: "


.text
main:
	j loop
	
loop:
	# Print menu
	printA(main_menu)
	printA(option1)
	printA(option2)
	printA(prompt)
	
	# Ask for option user input
	li $v0, 5
	syscall
	move $s0, $v0
	
	printA(newline)
	
	# If input is 1 -> ask for letter grade
	# If input is 2 -> exit program
	beq $s0, 1, grade
	beq $s0, 2, exit
	
	# If input is invalid, get new input
	print("Invalid Input\n")
	j loop


grade:
	# Print prompt
	printA(line)
	printA(prompt2)
	
	# Get user input
	li $v0, 5
	syscall
	move $s0, $v0
	
	
	# If input <= 90 -> Print A
	# Else If input <= 80 -> Print B
	# Else If input <= 70 -> Print C
	# Else If input <= 60 -> Print D
	# Else If input <= 0 -> Print F
	bge $s0, 90, A
	bge $s0, 80, B
	bge $s0, 70, C
	bge $s0, 60, D
	bge $s0, 0, F
	
	# If input is invalid, get new input
	print("Invalid Input, grade cannot be below 0\n")
	j grade

# Print A and go to again label
A:
	printA(prompt3)
	print("A")
	j again
	
# Print B and go to again label
B:
	printA(prompt3)
	print("B")
	j again

# Print C and go to again label	
C:
	printA(prompt3)
	print("C")
	j again

# Print D and go to again label	
D:
	printA(prompt3)
	print("D")
	j again
	
# Print F and go to again label
F:
	printA(prompt3)
	print("F")
	j again
	

# Displays Prompt If User Wants to Input More Grade or Not	
again:
	# Print out menu
	printA(newline)
	printA(line)
	printA(prompt4)
	printA(prompt5)
	printA(prompt6)
	
	# Ask for input
	li $v0, 12
	syscall
	move $s0, $v0
	
	printA(newline)
	
	# If input 'y' -> grade label
	# If input 'n' -> exit label
	beq $s0, 'y', grade
	beq $s0, 'n', exit
	
	# If input is invalid, get new input
	print("Invalid Input\n")
	j again
	
	
# Exit Label
exit:
	li $v0, 10
	syscall
	

	
	
	
