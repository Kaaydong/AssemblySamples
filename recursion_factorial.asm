# Kayden Hung
# 5/3/2023
# Write a factorial program



.data



.text
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	move $s1, $v0
	
loop:
	addi $s1, $s1, -1
	
	beq $s1, 0, end
	
	mul $s0, $s0, $s1

	j loop
		
end:
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall

