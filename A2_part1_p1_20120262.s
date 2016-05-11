# ComputerOrganization Assigment2_part1_problem1 [claculate area cicumfrance assume r=3 ]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 12-Des-2015
#
# -------------------------------
.data 
r	: .space  12
pi	: .space 12
area : .space 12
circumfrance : .space 12
out1	: .asciiz "Result Stored to memory not printed in screen \nEnter Radios: "
# out2	: .asciiz "result Stored to memory "
.text
	.globl main
	.ent main
	main:
 	#print output1
 	la $a0, out1
 	li $v0,4
 	syscall 
 	
 	#getinput radous
 	li $v0,5
 	syscall 
 	addi $s1,$v0,0
 	
 	#initlize  radios to memory
 	la $t1,r
 	sw $s1,($t1)
 	
 	#initialz pi to memory
 	addi  $s2,$0,3
 	la $t2,pi
 	sw $s2,($t2)
 	
 	#load radios from memory
 	lw $s1,($t1)
 	#load pi from memory
 	lw $s2,($t2)
 	#calculate area $t3=2*pi*r
 	mul $t3,$s1,$s2
 	addi $t5,$0,2
 	mul $t3,$t3,$t5
 	#calculate circumfrance $s1= pi*r*r
 	mul $s1,$s1,$s1
 	mul $s1,$s2,$s1
 	#save to memory
 	la $t4,area
 	la $t5,circumfrance
 	sw $t3,($t4) 
 	sw $s1,($t5)
 	
 	
 
 ex:
 li $v0,10
 syscall
