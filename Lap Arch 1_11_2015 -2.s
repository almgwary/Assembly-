# beq brench equl 
# bne brench not equal
# blt brench less than
# ble brench less than or equl
# bgt brench greater than
# bge brench greater than or eqaul

.data
	notEqual: .asciiz "not equal"
	equalMsg: .asciiz "equal"
.text
	main:

		li $s0,2
		li $s1,3
		beq $s0,$s1,equal
			la $a0,notEqual
			j Exit
		equal:
			la $a0,equalMsg
		Exit:
		li $v0,4
		syscall

	.end main

	