# Kayden Hung
# 4/5/2023
#	Given array = {3,4,5}
#	add the values separately then all together (3+4, 3+5, 4+5, 3+4+5)
#	output the operation details and the results to the user
#	-code in the array
#	-loading the values into registers
#	-arithemetic operations (3+4, 3+5, 4+5, 3+4+5)
#	-store the results into registers
#	-print out the operation details (print out the results)

.data
array: .word 3,4,5
plus: .asciiz " + "
eql: .asciiz " = "
newline: .asciiz "\n"

.text
main:
	# Load address of array into $s0
	la $s0, array
	
	lw $s1, 0($s0) # getting 3 into $s1 
	lw $s2, 4($s0) # getting 4 into $s2
	lw $s3, 8($s0) # getting 5 into $s3
	
	# print oit the values of $s1, $s2, $s3
	li $v0, 1
	move $a0, $s1
	syscall
	move $a0, $s2
	syscall
	move $a0, $s3
	syscall
	
addition:
	#add $t0, $s1, $s2
	#add $t1, $s1, $s3
	#add $t2, $s2, $s3
	#add $t3, $t0, $s3
	
	li $v0, 4
	la $a0, newline	# print newline
	syscall
	
	li $v0, 1
	move $a0, $s1	# print 3
	syscall
	
	li $v0, 4
	la $a0, plus 	# print +
	syscall
	
	li $v0, 1
	move $a0, $s2	# print 4
	syscall
	
	
exit:
	li $v0, 10
	syscall