# Kayden Hung
# 4/12/2023
# Macro practice: Recieving arrays and multiple parameters
# Array: 
#	Take in array
#		Parameter will be array
#	Get the last element of the array
#		3
#	Complete arithemetic based off the pattern of given array elements
#		add one to the last element
#	Save the array element in memory


.macro getArr(%array)
la $s0, %array
lw $s1, 0(%array) # 1
lw $s2, 4(%array) # 2
lw $s3, 8(%array) # 3
addi $s4, $s3, 1
sw $s4, 12(%array)
.end_macro


.macro getInput
li $v0, 8
la $a0, userInput
li $a1, 63
syscall
move $t1, $a0
.end_macro

.data
array1: .word 1, 2, 3
buffer:. .space 4
array2: .word 5,6,7
userInput: .space 64	# 64 bytes allocated for string

.text
main:

	

	la $s0, array1 # Load base address of array1 into $s0
	lw $s1, 0($s0) # 1
	lw $s2, 4($s0) # 2
	lw $s3, 8($s0) # 3
	
	# Next element expected is 4
	addi $s4, $s3, 1
	
	# Save in memory $s4 == 12 in memory
	sw $s4, 12($s0)
	
	# Get user string
	# Two Arguments: $a0 = address of the buffer and $a1=length of the string
	#li $v0, 8
	#la $a0, userInput
	#li $a1, 63
	#syscall
	# move content in buffer to another register
	#move $t1, $a0
	getInput
	
	
	# Exit
	li $v0, 10
	syscall
