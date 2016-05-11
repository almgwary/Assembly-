# ComputerOrganization Assigment3_part2_problem2 [ AxA Pairs count ]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 23-Des-2015
# 
# -------------------------------
# '$s0 : string length '
# '$s1 : string address'
# '$s2 : string last address'
#
.data 
string	: .space 200 #200 byte
newString : .space 200
spaceChar : .asciiz  " "
msg1 : .asciiz  "Enetr String Length: "
msg2 : .asciiz  "\nEnetr String: "
msg3 : .asciiz  "\nResult: "
 	
.text 
.globl main
	.ent main
	main:
		#'1-read string '
			la $a0,msg1	 #' print msg1'
			li $v0,4
			syscall 
			
			li $v0,5	 #' get length from user'
			syscall
			addi $s0,$v0,0
			addi $s0,$s0,1 #'incres string lenth by 1'
			
			la $a0,msg2	 #' print msg2'
			li $v0,4
			syscall
			
			la $a0,string	 #' get srting from user'
			add $a1,$s0,$0
			li $v0,8
			syscall
			
			
			addi $s0,$s0,-1 	#' decrese string lenth by 1 to remove end charchter'
			
			
			la $s1,string		#' string address'
			add $s2,$s1,$s0		#' string last address'
			
			 	
			
		#'3-call method with string and charachter and string length'
			 addi $a0,$s1,0
			 addi $a1,$s2,-2
			 addi $a2,$0,0
			 
			 jal countX_X
			
			
		#'4-print result'
			la $a0,msg3		#'print msg4'
			li $v0,4
			syscall
			
			add $a0,$a2,$0	#' print counter'
			li $v0,1
			syscall
			
	li $v0,10 #exit
	syscall 

#'$a0 start index'
#'$a1 last index -2 this index cannot be checked'
#'$a2 counter'
#' '
#' '	
#' '

countX_X : 
	subu $sp,$sp,4			#'store $ra in $sp'
	sw $ra,($sp)
	
	loopCount : 
		beq $a0,$a1,outLoopCount
		jal testX_X
		add $a2,$a2,$v0		#'count reaturn value '
		
		addi $a0,$a0,1		#'increas index'
		j loopCount
	outLoopCount:
	
	outCountX_X:
	lw $ra,($sp)
	addu $sp,$sp,4
jr $ra




testX_X : 
	subu $sp,$sp,4			#'store $ra in $sp'
	sw $ra,($sp)
	
	li $v0,0				#'initialze test = false'
	
	lb $t0,($a0)			#'get first char'
	addi $t2, $a0, 2		#'get seconf char address'
	lb $t1,($t2)			#'get second char'
	
	beq $t1,$t0,true
		j outTestX_X
	true : 
		li $v0,1				#'test = true'
	outTestX_X: 
		lw $ra,($sp)
		addu $sp,$sp,4
jr $ra


#'	Q2. We will say that a "pair" in a string is two instances of a char	'
#'	separated by a char. So "AxA" the A make a pair. Pair s can overlap,	'
#'	so "AxAxA" contains 3 pairs -- 2 for A and 1 for x. Recursively	'
#'	compute the number of pairs in the given string.	'
#'	countPairs("axa") → 1	'
#'	countPairs("axax") → 2	'
#'	countPairs("axbx") → 1	'