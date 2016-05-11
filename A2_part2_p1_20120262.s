# ComputerOrganization Assigment2_part2_problem1 [count how many time it take to make input int reach 1 i following ruls if even half it if odd+1 *3 then ]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 12-Des-2015
#
# -------------------------------
.data 
.text 
	.globl main
	.ent main
	main:
	li $v0,5 #get input
	syscall 
	add $t0,$v0,$0
	
	addi $t1,$0,1 # t1 is counter
	addi $t2,$0,1 # end state
	addi $t4,$0,2 #for divion
	addi $t5,$0,3 #for multiplication
	
	loop:
		beq $t0,$t2,brak  #if num = 1 exit
		add $t1,$t1,$t2  #increas counter by one
		andi $t3, $t0,1 	#get Lsb
		beq $t3,$t2, odd  # if true this odd else even
		 div $t0,$t0,$t4  #divid value by 2
		 j c
		odd:
		 mul $t0,$t0,$t5 #multiplication by 3
		 add $t0,$t0,$t2 # add 1
		c:
		add $a0,$t0,$0
		li $v0,1
		syscall 
		j loop
	brak :
		add $a0,$t1,$0 #print counter
		li $v0,1
	syscall 
	
	
	
	
	
	exit:
	li $v0,10 #exit
	syscall
	