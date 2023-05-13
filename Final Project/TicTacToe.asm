
# >--------------------------------------------------------------------------< #
# |										 |
# |			      TIC-TAC-TOE PROJECT				 |
# |					BY					 |
# |				  Matthew Finerty				 |
# |				    Kayden Hung					 |
# |				    Eric Jiang					 |
# |				    Matthew Yu					 |
# |										 |								 
# >--------------------------------------------------------------------------< #

# Register Usage List
#
# - $t6 will be used for determineWinner macro (array addresses)
# - $t7, $t8, $t9 will be used for determineWinner macro (array elements)
# 	- These registers will also be used for printElement macro 
#	  (array elements, row, column, and base/buffer)
#	- $t9 will also store the value of an array's element in a position after
#	   determineWinner is run
# - $t0, $t1, $t2, $t3 are for determinig row and col of user input for both X and O
#	-$t0 is for Player X row position selection
#	-$t1 is for Player X column position selection
#	-$t2 is for Player O row position selection
#	-$t3 is for Player O column position selection
# - $s0 will be used for keeping track of what round it is (No other function should use this register)
# - %s1 will be used for isValidInput macro (0 == valid input, 1 or more == invalid input)
# - $t4 and $t5 are used for the printBoard macro 


# --------------------------------------------------------------------------------------------- #
#				Game Handler Macros                                             #
# --------------------------------------------------------------------------------------------- #

# >--------------------------------------------------------------------------< #
# Print String given address
.macro prString(%string)
li $v0, 4
la $a0, %string
syscall
.end_macro


# >--------------------------------------------------------------------------< #
# Player X
# Ask for row position and store position into $t0
.macro readXRow
li $v0, 5
syscall
move $t0, $v0
.end_macro


# >--------------------------------------------------------------------------< #
# Player X
# Ask for column position and store position into $t1
.macro readXColumn
li $v0, 5
syscall
move $t1, $v0
.end_macro


# >--------------------------------------------------------------------------< #
# Player O
# Ask for row position and store position into $t2
.macro readORow
li $v0, 5
syscall
move $t2, $v0
.end_macro


# >--------------------------------------------------------------------------< #
# Player O
# Ask for column position and store position into $t3
.macro readOColumn
li $v0, 5
syscall
move $t3, $v0
.end_macro


# >--------------------------------------------------------------------------< #
# Macro that determines the winner given the state
# of the 3 arrays simulating the 3 x 3 tic tac toe board
# - Should be run after a player's turn
.macro determineWinner

.text
# Determines if someone won or not
determiner:
# ----------------------------
# Check top horizontal x and o
# ----------------------------
# Load row1 address into $t6
la $t6, row1

# Load elements into $t7, $t8, $t9
lw $t7, 0($t6)
lw $t8, 4($t6)
lw $t9, 8($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# -------------------------------
# Check middle horizontal x and o
# -------------------------------
# Load row2 address into $t6
la $t6, row2

# Load elements into $t7, $t8, $t9
lw $t7, 0($t6)
lw $t8, 4($t6)
lw $t9, 8($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# -------------------------------
# check bottom horizontal x and o
# -------------------------------
# Load row3 address into $t6
la $t6, row3

# Load elements into $t7, $t8, $t9
lw $t7, 0($t6)
lw $t8, 4($t6)
lw $t9, 8($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# ---------------------------
# check left vertical x and o
# ---------------------------
# Load row1 address into $t6
la $t6, row1
# Load elements into $t7
lw $t7, 0($t6)

# Load row2 address into $t6
la $t6, row2
# Load elements into $t8
lw $t8, 0($t6)

# Load row3 address into $t6
la $t6, row3
# Load elements into $t9
lw $t9, 0($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# -----------------------------
# check middle vertical x and o
# -----------------------------
# Load row1 address into $t6
la $t6, row1
# Load elements into $t7
lw $t7, 4($t6)

# Load row2 address into $t6
la $t6, row2
# Load elements into $t8
lw $t8, 4($t6)

# Load row3 address into $t6
la $t6, row3
# Load elements into $t9
lw $t9, 4($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# ----------------------------
# check right vertical x and o
# ----------------------------
# Load row1 address into $t6
la $t6, row1
# Load elements into $t7
lw $t7, 8($t6)

# Load row2 address into $t6
la $t6, row2
# Load elements into $t8
lw $t8, 8($t6)

# Load row3 address into $t6
la $t6, row3
# Load elements into $t9
lw $t9, 8($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# -----------------------------------------------
# check diagonal top left to bottom right x and o
# -----------------------------------------------
# Load row1 address into $t6
la $t6, row1
# Load elements into $t7
lw $t7, 0($t6)

# Load row2 address into $t6
la $t6, row2
# Load elements into $t8
lw $t8, 4($t6)

# Load row3 address into $t6
la $t6, row3
# Load elements into $t9
lw $t9, 8($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO


# -----------------------------------------------
# check diagonal top right to bottom left x and o
# -----------------------------------------------
# Load row1 address into $t6
la $t6, row1
# Load elements into $t7
lw $t7, 8($t6)

# Load row2 address into $t6
la $t6, row2
# Load elements into $t8
lw $t8, 4($t6)

# Load row3 address into $t6
la $t6, row3
# Load elements into $t9
lw $t9, 0($t6)

# Add the values of all 3 elements
add $t7, $t7, $t8
add $t7, $t7, $t9

# If sum of elements == 3, Player X Wins
# If sum of elements == 12, Player O Wins
beq $t7, 3, winnerIsX
beq $t7, 12, winnerIsO

j end

# -------------------------------------------------
# Prints X is the winner and exits program
winnerIsX:
printBoard
prString(playerXWins)
j exit

# -------------------------------------------------
# Prints O is the winner and exits program
winnerIsO:
printBoard
prString(playerOWins)
j exit

# -------------------------------------------------
# Ends macro
end:

.end_macro


# >--------------------------------------------------------------------------< #
# Determines whether a user input for choosing a row and column is valid
# - %row and %column take in registers 
# - Checks if input is out of bounds, ie: input for row or column is not 1,2, or 3
# - Checks if the input is on a position of the grid already chosen from a past move
# Macro will use $s1 and set $s1 to 0 if there are no errors and 1 or greater if there are errors
.macro isInputValid(%row,%column)

.data
rowInputInvalid: .asciiz "\nInput for row is invalid (has to be 1, 2, or 3)"
columnInputInvalid: .asciiz "\nInput for column is invalid (has to be 1, 2, or 3)"
positionOccupiedString: .asciiz "\nThe position chosen has already been used"

.text
# -------------------------------------------------
setup:
# Set $s1 default value to 0
move $s1,$zero

# Checks if %row or %column input is 1, 2, or 3
# - If not, add 1 to %s1 and print error
bgt %row, 3, rowOutOfBounds
blt %row, 1, rowOutOfBounds
bgt %column, 3, columnOutOfBounds
blt %column, 1, columnOutOfBounds

# Jump to next check
j isSpaceOccupied


# -------------------------------------------------
# Print row out of bounds error and add 1 to $s1
rowOutOfBounds:
prString(rowInputInvalid)

# adds 1 to $s1 and prints out column error if applicable
li $s1, 1
bgt %column, 3, columnOutOfBounds
blt %column, 1, columnOutOfBounds
j end


# -------------------------------------------------
# Print column out of bounds error and add 1 to $s1
columnOutOfBounds:
prString(columnInputInvalid)

# adds 1 to $s1
li $s1, 1
j end


# -------------------------------------------------
# Retrieves element from array at position %row and %column
# Array data sent to $t9
# - If $t9 value > 0, then the position has already been used
# 	- Print error and add 1 to $s1
isSpaceOccupied:
printElement(%row, %column,0)
bgt $t9, 0, positionOccupied
j end


# -------------------------------------------------
# Prints that the position is currently used
# Adds 1 to $s1
positionOccupied:
prString(positionOccupiedString)
li $s1, 1
j end

end:

.end_macro


# >--------------------------------------------------------------------------< #
# Print 'blank', X, or O, depending
# on contents of the game board array
# %row and %column take in registers and are POSITION of row and column
# %print is used to determine whether to just
#	load an element into $t9, or to print it
#	- %print == 1 : print the element
#	- %print == 0 : load element into $t9
.macro printElement(%row,%column, %print)

.text
# -------------------------------------------------
# Assign values to $t9 and $t8
assigner:
move $t9, %row
move $t8, %column
# Prepare $t8 to be buffer for array address
subi $t8, $t8, 1
mul $t8, $t8, 4

# Choose row based on %row
beq $t9, 1, loadRow1
beq $t9, 2, loadRow2
beq $t9, 3, loadRow3

# -------------------------------------------------
# Load row1 address into $t7
loadRow1:
la $t7, row1
j loadElement

# -------------------------------------------------
# Load row2 address into $t7
loadRow2:
la $t7, row2
j loadElement

# -------------------------------------------------
# Load row3 address into $t7
loadRow3:
la $t7, row3
j loadElement

# -------------------------------------------------
# Load array element
loadElement:
# Prepare $t7 as array address base
# by adding buffer
add $t7, $t7, $t8
lw $t9, 0($t7)

# If %print == 0, exit macro and do not print
li $t8, %print
beq $t8, 0, end

# If element is 4, print O
# If element is 1, print X
# If element is 0, print [ ]
beq $t9, 4, printO
beq $t9, 1, printX
j printEmpty


# -------------------------------------------------
# Print X
printX:
prString(Xboard)
draw_X(%column,%row)
j end

# -------------------------------------------------
# Print O 
printO:
prString(Oboard)
draw_O(%column,%row)
j end

# -------------------------------------------------
# Print [ ] 
printEmpty:
prString(openSpot)
j end


# -------------------------------------------------
# Ends macro
end:

.end_macro 


# >--------------------------------------------------------------------------< #
# This will change the value of one of the elements in the 3 arrays used for the
# 3 x 3 game board grid.
# %row and % column take in registers and %value is a integer literal
.macro assignValueToArray(%row, %column,%value)
.text
# -------------------------------------------------
# Assign values to $t9 and $t8
assigner:
move $t9, %row
move $t8, %column

# Prepare $t8 to be buffer for array address
subi $t8, $t8, 1
mul $t8, $t8, 4

# Choose row based on %row
beq $t9, 1, loadRow1
beq $t9, 2, loadRow2
beq $t9, 3, loadRow3

# -------------------------------------------------
# Load row1 address into $t7
loadRow1:
la $t7, row1
j assignValue

# -------------------------------------------------
# Load row2 address into $t7
loadRow2:
la $t7, row2
j assignValue

# -------------------------------------------------
# Load row3 address into $t7
loadRow3:
la $t7, row3
j assignValue

# -------------------------------------------------
# Load array element
assignValue:
# Prepare $t7 as array address base
# by adding buffer
add $t7, $t7, $t8

# Store new value into array index
li $t9, %value
sw $t9, 0($t7)

.end_macro


# >--------------------------------------------------------------------------< #
# Prints the current state of
# gameboard in I/O
.macro printBoard

prString(boardTitle)
#Row 1
prString(tab)

# Prepare array position 1,1 and print that position's element
li $t4,1
li $t5,1
printElement($t4,$t5,1)

prString(tab)
prString(borderVert)
prString(tab)

# Prepare array position 1,2 and print that position's element
li $t4,1
li $t5,2
printElement($t4,$t5,1)

prString(tab)
prString(borderVert)
prString(tab)

# Prepare array position 1,3 and print that position's element
li $t4,1
li $t5,3
printElement($t4,$t5,1)

prString(newLine)
prString(borderHorz)

#Row 2
prString(tab)

# Prepare array position 2,1 and print that position's element
li $t4,2
li $t5,1
printElement($t4,$t5,1)

prString(tab)
prString(borderVert)
prString(tab)

# Prepare array position 2,2 and print that position's element
li $t4,2
li $t5,2
printElement($t4,$t5,1)

prString(tab)
prString(borderVert)
prString(tab)

# Prepare array position 2,3 and print that position's element
li $t4,2
li $t5,3
printElement($t4,$t5,1)

prString(newLine)
prString(borderHorz)

# Row 3
prString(tab)

# Prepare array position 3,1 and print that position's element
li $t4,3
li $t5,1
printElement($t4,$t5,1)

prString(tab)
prString(borderVert)
prString(tab)

# Prepare array position 3,2 and print that position's element
li $t4,3
li $t5,2
printElement($t4,$t5,1)
prString(tab)
prString(borderVert)
prString(tab)

# Prepare array position 3,3 and print that position's element
li $t4,3
li $t5,3
printElement($t4,$t5,1)

prString(newLine)

.end_macro


# --------------------------------------------------------------------------------------------- #
#				Bitmap Macros                                                   #
# --------------------------------------------------------------------------------------------- #
# >--------------------------------------------------------------------------< #
# Colors
.eqv RED 0xFF0000
.eqv GREEN 0x00FF00
.eqv BLUE 0x0000FF
.eqv WHITE 0xFFFFFF
.eqv BLACK 0x000000

# draw_line: Start Positions
.eqv START_TOP     1
.eqv START_BOTTOM -1
# >--------------------------------------------------------------------------< #

# >--------------------------------------------------------------------------< #
# pixel_addr = 4 * (y * 512 + x) + $gp
.macro pixel_address(%rd, %x, %y)
	sll %rd,%y,9 # rd = y * 512
	addu %rd,%rd,%x # rd = rd + x
	sll %rd,%rd,2 # rd = 4 * rd
	addu %rd,%rd,$gp # rd = rd + $gp
.end_macro

# >--------------------------------------------------------------------------< #
.macro draw_rect_r(%x, %y, %width, %height, %color)
init:
	move $s2,%x # $s2 = x_pos
	move $s3,%y # $s3 = y_pos
	addiu $s4,$s2,%width # $s4 = x_max
	addiu $s5,$s3,%height # $s5 = y_max
	li $s6,%color # $s6 = color
loop:
	# Save color to pixel address of (x, y)
	pixel_address $s7,$s2,$s3
	sw $s6,0x0($s7)
	
	# Loop stuff
	addiu $s2,$s2,1 # Increment x_pos
	bne $s2,$s4,loop # Loop if x_pos != x_max
	
	move $s2,%x # Else, reset x_pos
	addiu $s3,$s3,1 # Increment y_pos
	bne $s3,$s5,loop # Loop if y_pos != y_max
.end_macro

# >--------------------------------------------------------------------------< #
.macro draw_rect(%x, %y, %width, %height, %color)
	li $t8,%x
	li $t9,%y
	draw_rect_r $t8,$t9,%width,%height,%color
.end_macro

# >--------------------------------------------------------------------------< #
.macro draw_line(%x, %y, %width, %length, %color, %start)
init:
	move $s2,%x # $s2 = x_pos
	move $s3,%y # $s3 = y_pos
	li $s6,%color # $s6 = color
	move $t1,$zero # $t1 = length loop counter
length_loop:
	move $t0,$zero # $t0 = width loop counter
	pixel_address $s7,$s2,$s3
width_loop:
	sw $s6,0x0($s7) # Save color to pixel address
	addiu $s7,$s7,4 # Increment pixel address by one pixel to the right
	addiu $t0,$t0,1 # Increment width loop counter
	bne $t0,%width,width_loop # Loop if $t0 != width
	
	addiu $s2,$s2,1 # Increment x_pos
	addiu $s3,$s3,%start # Increment y_pos
	addiu $t1,$t1,1 # Increment length loop counter
	bne $t1,%length,length_loop # Loop if $t1 != length
.end_macro


# >--------------------------------------------------------------------------< #
.eqv X_COLOR  RED
.eqv O_COLOR  BLUE
.eqv BG_COLOR WHITE
.eqv FG_COLOR BLACK
# >--------------------------------------------------------------------------< #


# >--------------------------------------------------------------------------< #
# draw the game board on bitmap
.macro draw_board
	# Set $gp to heap address (bitmap memory leaks into .data section D:)
	lui $gp,0x1004

	# Clear bitmap
	draw_rect(0,0,512,512,BG_COLOR)
	
	# Draw vertical borders
	draw_rect(0,0,18,512,FG_COLOR)
	draw_rect(166,0,16,512,FG_COLOR)
	draw_rect(330,0,16,512,FG_COLOR)
	draw_rect(494,0,18,512,FG_COLOR)
	
	# Draw horizontal borders
	draw_rect(0,0,512,18,FG_COLOR)
	draw_rect(0,166,512,16,FG_COLOR)
	draw_rect(0,330,512,16,FG_COLOR)
	draw_rect(0,494,512,18,FG_COLOR)
.end_macro


# >--------------------------------------------------------------------------< #
# draw O given position loaded in register
.macro draw_O(%row, %column)
	# Calculate X
	li $t0,34
	move $t1,%row
	subi $t1,$t1,1
	mul $t1,$t1,164
	addu $t0,$t0,$t1
	
	# Calculate Y
	li $t1,34
	move $t2,%column
	subi $t2,$t2,1
	mul $t2,$t2,164
	addu $t1,$t1,$t2
	
	# Top
	draw_rect_r($t0,$t1,114,16,O_COLOR)
	
	# Bottom
	addiu $t1,$t1,96
	draw_rect_r($t0,$t1,114,16,O_COLOR)
	
	# Left
	subiu $t1,$t1,96
	draw_rect_r($t0,$t1,16,96,O_COLOR)
	
	# Right
	addiu $t0,$t0,98
	draw_rect_r($t0,$t1,16,96,O_COLOR)
.end_macro


# >--------------------------------------------------------------------------< #
# draw X given position loaded in register
.macro draw_X(%row, %column)
	# Calculate X
	li $t8,28 # Base X value
	move $t1,%row
	subi $t1,$t1,1 # Decrement row to get a range of 0-2
	mul $t1,$t1,164 # Multiply rows by 164
	addu $t8,$t8,$t1 # Add to x
	
	# Calculate Y
	li $t9,36 # Base Y value
	move $t2,%column
	subi $t2,$t2,1 # Decrement column to get a range of 0-2
	mul $t2,$t2,164 # Multiply columns by 164
	addu $t9,$t9,$t2 # Add to y
	
	# Draw lines
	draw_line($t8,$t9,24,108,X_COLOR,START_TOP)
	addiu $t9,$t9,108
	draw_line($t8,$t9,24,108,X_COLOR,START_BOTTOM)
.end_macro


# --------------------------------------------------------------------------------------------- #
#				Data and Labels                                                 #
# --------------------------------------------------------------------------------------------- #

.data
row1: .word 0,0,0	# 0 = empty, 1 = x, 4 = o
row2: .word 0,0,0
row3: .word 0,0,0

instrucPrompt1: .asciiz "\nThis is tic-tac-toe where the player will have to place a 0 or X in a corresponding 3 by 3 grid and achieve 3 of the same symbols in a row."
instrucPrompt2: .asciiz "\n\nThe game will begin with player X choosing first\n"

playerXWins: .asciiz "\nPlayer X is the Winner!"
playerOWins: .asciiz "\nPlayer O is the Winner!"
draw: .asciiz "\nThe game has ended in a draw!"

boardTitle: .asciiz "\n		     Game Board\n"

Xboard: .asciiz "  X  "
Oboard: .asciiz "  O  "
openSpot: .asciiz " [ ] "
newLine: .asciiz "\n"
borderVert: .asciiz "  | "
borderHorz: .asciiz " 	-------------------------------------\n"
tab: .asciiz "	"

playerXrow: .asciiz "\nPlayer X, pick a row: "
playerXcol: .asciiz "Player X, pick a column: "

playerOrow: .asciiz "\nPlayer O, pick a row: "
playerOcol: .asciiz "Player O, pick a column: "

invalidInput: .asciiz "\nYour input was invalid, please try again.\n"


.text
# -------------------------------------------------
# Setup label
main:
	
	# Print out instruction prompts
	prString(instrucPrompt1)
	prString(instrucPrompt2)

	# Initialize the round number counter
	# Round starts at 0
	move $s0,$zero
	
	# Draw board in bitmap display
	draw_board

	# Begin the loop, starting with player X's turn
	j playerXTurn


# -------------------------------------------------
# Setup player X's turn
playerXTurn:

	# Add 1 to $s0 round counter
	addi $s0, $s0, 1

	# Print the current game board
	printBoard

	# If the round number is 10, the game board is filled
	# and game is a draw
	beq $s0, 10, roundIsDraw

	# Prompt player X to choose their positions
	j playerXChoose


# -------------------------------------------------
# Player X chooses row and column positions
playerXChoose: 

	# Print prompt for row position and retrieve it
	prString(playerXrow)
	readXRow

	# Print prompt for column position and retrieve it
	prString(playerXcol)
	readXColumn

	# Check if input is valid
	isInputValid($t0,$t1)

	# If input is valid, assign the input into the game board
	beq $s1, 0, playerXValueAssigned

	# If input is invalid, print invalid prompt and ask for input again
	prString(invalidInput)
	j playerXChoose


# -------------------------------------------------
# Assign X onto gameboard position where player assgined it
playerXValueAssigned:

	# Assign the value 1 to the array positions stored in
	# registers $t0 (row), and $t1 (column)
	assignValueToArray($t0,$t1,1)

	# Determine if the player won
	determineWinner

	# Jump to player O's turn if no one won
	j playerOTurn


# -------------------------------------------------
# Setup player O's turn
playerOTurn:
	# Add 1 to $s0 round counter
	addi $s0, $s0, 1

	# Print the current game board
	printBoard

	# If the round number is 10, the game board is filled
	# and game is a draw
	beq $s0, 10, roundIsDraw

	# Prompt player O to choose their positions
	j playerOChoose


# -------------------------------------------------
# Player O chooses row and column positions
playerOChoose: 
	# Print prompt for row position and retrieve it
	prString(playerOrow)
	readORow

	# Print prompt for column position and retrieve it
	prString(playerOcol)
	readOColumn

	# Check if input is valid
	isInputValid($t2,$t3)

	# If input is valid, assign the input into the game board
	beq $s1, 0, playerOValueAssigned

	# If input is invalid, print invalid prompt and ask for input again
	prString(invalidInput)
	j playerOChoose


# -------------------------------------------------
# Assign O onto gameboard position where player assgined it
playerOValueAssigned:
	# Assign the value 1 to the array positions stored in
	# registers $t2 (row), and $t3 (column)
	assignValueToArray($t2,$t3,4)

	# Determine if the player won
	determineWinner

	# Jump to player X's turn if no one won
	j playerXTurn


# -------------------------------------------------
# Prompts the players that the game is a draw
roundIsDraw: 
	prString(draw)
	j exit

# -------------------------------------------------
# Ends program
exit:
	li $v0, 10
	syscall
