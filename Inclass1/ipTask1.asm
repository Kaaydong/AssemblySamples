# Kayden Hung
# 4/14/2023
# Macros with multiple parameters


# Print string literal
.macro aString(%string)

.data
thing: .asciiz %string

.text
main: 
	li $v0, 4
	la $a0, thing
	syscall
.end_macro



.macro getData(%number,%string)
	# Double number parameter
	li $t0, %number
	mul $t0, $t0, 2
	
	# Print number
	li $v0, 1
	move $a0, $t0
	syscall
	
	# Print string with aString macro
	aString("\n")
	aString(%string)
.end_macro


.data

.text
main:
	getData(5,"hello")
	
	li $v0, 10
	syscall
	

