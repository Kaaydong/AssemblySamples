# Name: Kayden Hung
# Data: 4/28/2023
# Objective: Write an Assembly program that will return a letter grade 
# for each element in an array (e.g. test scores in an array of scores)
# - Include the following in your program:
#	- a main label, a looping label, and an exit label
#	- a loop counter
#	- a separate case for grades above 100 (i.e. prints out "A with Extra Credit")
#	- your name printed out after all the grades are read (and before the program exits)


# Print given a string literal
.macro print(%string)
li $v0, 4

.data
word: .asciiz %string

.text
la $a0, word
syscall

.end_macro


.data
scores: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82


.text
main:
	# load array address into $t0
	la $t0, scores 
	
	# set up counter
	add $s1, $s1, $zero
	j loop
	
loop:
	# Exit if counter == 10
	beq $s1, 10, exit
	
	# Load array element in $s0
	lw $s0, 0($t0)
	
	print("\nThe grade for ")	
	# Print the grade number
	li $v0, 1
	move $a0, $s0
	syscall
	print(" is: ")
	
	
	# Increment array address by 4
	addi $t0, $t0, 4
	# Increment counter by 1
	addi $s1, $s1, 1
	
	# If inpit < 100 -> Print extra
	# Else If input <= 90 -> Print A
	# Else If input <= 80 -> Print B
	# Else If input <= 70 -> Print C
	# Else If input <= 60 -> Print D
	# Else If input <= 0 -> Print F
	bgt $s0, 100, extra
	bge $s0, 90, A
	bge $s0, 80, B
	bge $s0, 70, C
	bge $s0, 60, D
	bge $s0, 0, F
	
	# Emergency exit
	j exit

extra:
	print("A with extra credit")
	j loop

# Print A and go to again label
A:
	print("A")
	j loop
	
# Print B and go to again label
B:
	print("B")
	j loop

# Print C and go to again label	
C:
	print("C")
	j loop

# Print D and go to again label	
D:
	print("D")
	j loop
	
# Print F and go to again label
F:
	print("F")
	j loop
	
	
# Exit Label
exit:
	print("\nBy Kayden Hung")
	print("\nThe program will now exit")
	li $v0, 10
	syscall
	

	
	
	
