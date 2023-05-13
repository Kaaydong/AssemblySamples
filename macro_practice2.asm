# Kayden Hung
# 4/12/2023
# Macro practice 2


.macro aString(%string)
li $v0, 4
.data
programmerString: .asciiz %string
.text
la $a0, programmerString
syscall
.end_macro


.macro defString(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro


.data
hello: .asciiz "Hello World"
gibberish: .asciiz "fwbqifuwbqidw"


.text
main:
	aString("Hello")
	defString(hello)

exit:
	li $v0, 10
	syscall