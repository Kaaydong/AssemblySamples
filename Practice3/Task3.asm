# Name: Kayden Hung
# Data: 4/28/2023
# Objectives: Write a program in Assembly that takes practiceFile.txt file and appends to it
# - Answer the following prompt with your file append: 
#	- "What have you enjoyed most about the class so far?"
# - Bonus: file name and content is taken from user input


# Print given a string literal
.macro print(%string)
li $v0, 4
.data
word: .asciiz %string

.text
la $a0, word
syscall
.end_macro


# Request for and get user input string
.macro getUserString(%buffer,%bufferSize)
li $v0, 8
la $a0, %buffer
li $a1, %bufferSize
syscall
.end_macro


.data
fileNameBuffer: .space 51
contentBuffer: .space 301
name: .asciiz "practiceFile.txt"
content: .asciiz "hello hello hello"
newline: .asciiz "\n"


.text
main:
	# Ask for user file name
	print("Please enter the name of your file (ie: practiceFile.txt) (Max Chars 50): ")
	getUserString(fileNameBuffer, 50)
	
	
	# Ask for appending contents
	print("\nPlease enter the contents you wish to append (Max Chars 300): ")
	getUserString(contentBuffer, 300)


	# Open 'practiceFile.txt'
	li $v0, 13
	la $a0, name
	li $a1, 9	# Flag to write and append to existing file
	li $a2, 0	# Gets ignored
	syscall
	move $s3, $v0
	
	# Append newline to file
	li $v0, 15
	move $a0, $s3
	la $a1, newline
	li $a2, 1
	syscall
	
	# Append to 'practiceFile.txt'
	li $v0, 15
	#move $a0, $s3
	la $a1, contentBuffer
	li $a2, 300
	syscall
	
	# Close 'practiceFile.txt'
	li $v0, 16
	move $a0, $s3
	syscall
	
	j exit
	
exit:
	li $v0, 10
	syscall

