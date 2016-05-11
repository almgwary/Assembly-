#almgwary lap4 Arch 25/10/20115


.data
fn:  .asciiz  	"enter first number\n  "
sn:  .asciiz  	"\nenter second number\n "
ad:  .asciiz 	"\naddition\n "
sbb:  .asciiz  	"\nsubstraction\n "
mlt: .asciiz  	"\nmultiblcation\n "
dv:  .asciiz  	"\ndivition\n "
area:  .asciiz  	"\n Area \n "
tow:  .word  2
pi:  .float  3.14


.text
.globl main
.ent main
main:

#---------------------------------------
la $a0,fn
li $v0,4
syscall

li $v0,5
syscall
add $s0,$0,$v0
#---------------------------------------

la $a0,area
li $v0,4
syscall

add $a0,$s0,$s1



lw $s5,tow
lw $s6,pi

mul $a0,$a0,$s5

mul $a0,$a0,$s6



li $v0,1
syscall





















li $v0,10
syscall

.end main