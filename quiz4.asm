# Kayden Hung
# 4/28/2023
# Quiz 4


# Gets user int input
.macro takeUserInput

# Print prompt
li $v0, 4
la $a0, promptString
syscall

# Get user input
li $v0, 5
syscall
move $s0, $v0			# Macro output stored in $s0


# Print newline
li $v0, 4
la $a0, newLine
syscall
.end_macro


# Takes in 2 integers and adds them
.macro addIntegers(%int1,%int2)
add $s1, %int2, %int1		# Macro output stored in $s1

.end_macro


.macro printString(%string)
li $v0, 4
.data
string: .asciiz %string
.text
la $a0, string
syscall
.end_macro


# Prints int given address
.macro printInt(%int)
li $v0, 1
move $a0, %int
syscall
.end_macro


.data
promptString: .asciiz "\nPlease insert a number: "
newLine: .asciiz "\n"


.text
main:	


printString("Select an operation")
printString("\n1. Addition")
printString("\n2. Subtraction")
printString("\n3. Multiplication")
printString("\n4. Division")
printString("Enter num 1-4")
takeUserInput
move $t9, $s0

takeUserInput 
move $t8, $s0
takeUserInput 
move $t7, $s0

beq $t9, 1, add
beq $t9, 2, sub
beq $t9, 3, mul
beq $t9, 4, div

j exit

add: 
add $s2, $t8, $t7
j exit

sub:
sub $s2, $t8, $t7
j exit

mul:
mul $s2, $t8, $t7
j exit

div:
div $s2, $t8, $t7
j exit

exit:
printString("Result: ")
printInt($s2)
li $v0, 10
syscall

