#almgwary lap4 Arch 25/10/20115


.data
fn:  .asciiz  	"enter first number\n  "
sn:  .asciiz  	"\nenter second number\n "
ad:  .asciiz 	"\naddition\n "
sbb:  .asciiz  	"\nsubstraction\n "
mlt: .asciiz  	"\nmultiblcation\n "
dv:  .asciiz  	"\ndivition\n "
r1:  .word  0
r2:  .word  0
r3:  .word  0
r4:  .word  0

.text
.globl main
.ent main
main:

la $a0,fn
li $v0,4
syscall

li $v0,5
syscall
add $s0,$0,$v0
#---------------------------------------
la $a0,sn
li $v0,4
syscall

li $v0,5
syscall
add $s1,$0,$v0
#---------------------------------------
la $a0,ad
li $v0,4
syscall
add $a0,$s0,$s1

sw $a0,r1

li $v0,1
syscall
#---------------------------------------
la $a0,sbb
li $v0,4
syscall

sub $a0,$s0,$s1
sw $a0,r2
li $v0,1
syscall
#---------------------------------------
la $a0,mlt
li $v0,4
syscall
mul $a0,$s0,$s1
sw $a0,r3
li $v0,1
syscall
#---------------------------------------
la $a0,dv
li $v0,4
syscall
div $a0,$s0,$s1
sw $a0,r4
li $v0,1
syscall















li $v0,10
syscall

.end main