.data
string: .space 12 
.text
	main:
li $v0 , 8
la $a0 , string
syscall

whil :
lb $t0 , ($a0)
beq $t0 , $0 , ex
blt $t0 , 97 , next
bgt $t0 , 122 , next
sub $t0 , $t0 , 32
sb $t0 , ($a0)

next :
	add $a0 , $a0 , 1
	j whil

ex :
li $v0 , 4
la $a0 , string
syscall
li $v0 , 10
syscall

