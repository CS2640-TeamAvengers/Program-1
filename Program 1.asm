#Assignment: CS2640, Program 1
#
#Name: Alexander Eckert
#Date: 10/24/2022
#Objectives:
#	1. take in 2 user inputs
#	2. set up the 4 arithmetic options
#	3. using user input values perform the 4 arithmetic options
#	5. display the result
#	6. if the two user inputs ==, output "User inputs are the same"
#	if the two user inputs !=, output "User inputs are different"

.data
	prompt1: .asciiz "Enter a number: "
	prompt2: .asciiz "Enter a second number: "
	additionHeader: .asciiz "\n\nAddition"
	subtractionHeader: .asciiz "\n\nSubtraction"
	multiplicationHeader: .asciiz "\n\nMultiplication"
	divisionHeader: .asciiz "\n\nDivision"
	exitMessage: .asciiz "\n\nHave a nice day!\n"
	equalInputs: .asciiz "\nUser inputs are the same"
	notEqualInputs: .asciiz "\nUser inputs are not the same"

.text

main:
	#print first prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#getting user input
	li $v0, 5
	syscall

	#move input to another register
	move $s0, $v0

	#repeat for second user input
	li $v0, 4
	la $a0, prompt2
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	#test if equal inputs
	beq $s1, $s0, IfEqual
	j IfNotEqual
	
IfEqual:
	li $v0, 4
	la $a0, equalInputs
	syscall
	j Add
	
IfNotEqual:
	li $v0, 4
	la $a0, notEqualInputs
	syscall
	j Add

Add:
	#perform operation
	add $t0, $s0, $s1
	
	#print the result
	li $v0, 4
	la $a0, additionHeader
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 11
	li $a0, '+'
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 11
	li $a0, '='
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	
	j Subtract

Subtract:
	#perform operation
	sub $t0, $s0, $s1
	
	#print the result
	li $v0, 4
	la $a0, subtractionHeader
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 11
	li $a0, '-'
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 11
	li $a0, '='
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	
	j Multiply

Multiply:
	#perform operation
	mul $t0, $s0, $s1

	#print the result
	li $v0, 4
	la $a0, multiplicationHeader
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 11
	li $a0, '*'
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 11
	li $a0, '='
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	
	j Divide
	
Divide:
	#perform operation
	div $t0, $s0, $s1

	#print the result
	li $v0, 4
	la $a0, divisionHeader
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 11
	li $a0, '/'
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 11
	li $a0, '='
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit
	
exit:
	#print exit message
	li $v0, 4
	la $a0, exitMessage
	syscall
	
	#exit the program
	li $v0, 10
	syscall
