 # Kayden Hung
 # 4/19/2023
 # Objectives: Open file, print out contents, copy contents to another file, then close file
 # NOTE: Make sure .txt file is in same directory as the MARS.jar file
 
 
.data
fileName: .asciiz "gradedItems.txt"
aBuffer: .space 301
newFile: .asciiz "cs2640items.txt"
newItems: .asciiz "\nProgram 3\nExtra Credit\nHIIII"

.text
main: 
	# open the file
	li $v0, 13
	la $a0, fileName
	li $a1, 0	# Read the file
	li $a2, 0	# 0 means gets ignored
	syscall
	move $s0, $v0	# Store file descriptor in $s0
	
	# read gradedItems.txt
	li $v0, 14
	move $a0, $s0
	la $a1, aBuffer
	li $a2, 300
	syscall
	move $s2, $v0
	
	#li $v0, 1
	#move $a0, $s2
	#syscall
	
	# Print the contents to user
	li $v0, 4
	la $a0, aBuffer
	syscall
	
	# Close 'gradedItems.txt'
	li $v0, 16
	move $a0, $s0
	syscall
	
	# Open 'cs2640items.txt'
	li $v0, 13
	la $a0, newFile
	li $a1, 1
	li $a2, 0 # gets ignored
	syscall
	move $s1, $v0 # save file descriptor to $s1
	
	# Write the buffer items from 'gradedItems.txt' to 'cs2640items.txt'
	li $v0, 15
	move $a0, $s1
	la $a1, aBuffer
	li $a2, 300 # File size
	syscall
	
	# Close 'cs2640items.txt'
	li $v0, 16
	move $a0, $s1
	syscall
	
	# Open 'gradedItems.txt'
	li $v0, 13
	la $a0, fileName
	li $a1, 9	# Flag to write and append to existing file
	li $a2, 0	# Gets ignored
	syscall
	move $s3, $v0
	
	# Append to 'gradedItems.txt'
	li $v0, 15
	move $a0, $s3
	la $a1, newItems
	li $a2, 40
	syscall
	
	# Close 'gradedItems.txt'
	li $v0, 16
	move $a0, $s3
	syscall
	
exit:
	li $v0, 10
	syscall
	
	
	
	 
 
 
