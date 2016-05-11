# ComputerOrganization Assigment2_part1_problem2 [array operations ]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 12-Des-2015
#
# assuming all arry elemnts initialzed by zero as default : worked with me
# -------------------------------
.data 
arr: .space 12
endline: .asciiz "\n"
.text 
.globl main
	.ent main
	main:
	la $t0,arr #laod array adress [0]
	addi $t1,$t0,4 #laod array adress [1]
	addi $t2,$t0,8 #laod array adress [2]
	
	
	li $v0,5 #get input
	syscall 
	sw $v0,($t0) # store input to first index arr[0]
	
	li $v0,5 #get input
	syscall 
	sw $v0,($t1) #store input to  second index arr[1]
	
	#arr[1]=arr[0]+arr[1]
	lw $s0,($t0)
	lw $s1,($t1)
	add $s1,$s0,$s1
	sw $s1,($t1)
	
	li $v0,5 #get input
	syscall 
	sw $v0,($t2)  #stoer input to third index arr[2]
	
	# arr[2] = arr[2] + arr[1]
	lw $s2,($t2)
	lw $s1,($t1)
	add $s2,$s2,$s1
	sw $s2,($t2)
	
	#cout<<arr[2];
	lw $s2,($t2)
	add $a0,$s2,$0
	li $v0,1
	syscall 
	#cout<<endl
	la $a0,endline
	li $v0,4
	syscall 
	
	
	
	
	
	
	
	
	
	
	li $v0,10 #exit
	syscall 