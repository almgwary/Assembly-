# ComputerOrganization Assigment3_part1_problem2 [ Find Method]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 23-Des-2015
# 
# -------------------------------
# '$s0  : string length'
# '$s1 	: string address'
# '$s2	: charachter address'
# '$s3  : charachter value'
# '$s4  : find index'
#
.data 
str	: .space 200 #200 byte
chr : .space 2
msg1 : .asciiz  "\nEnetr String Length: "
msg2 : .asciiz  "\nEnetr String: "
msg3 : .asciiz  "\nEnetr charchter to search: "
msg4 : .asciiz  "\nResult: "
 	
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
			
			la $a0,str	 #' get srting from user'
			add $a1,$s0,$0
			li $v0,8
			syscall
			
			la $s1,str	 #' put string address in $s1'
			
			
		#'2-read charchter'
			la $a0,msg3	 #' print msg3'
			li $v0,4
			syscall
			
				 
			la $a0,chr	 #' get charachter frome user'
			li $a1,2
			li $v0,8
			syscall
			addi $s2,$a0,0
			lb $s3,($s2)
			
		#'3-call method with string and charachter and string length'
			addi $a0,$s0,0	#'paramter fot lenght'
			addi $a1,$s1,0	#'paramter for string address'
			addi $a2,$s3,0	#'paramter for charchter value'
			
			jal find		#'call function'
			
			add $s4,$v0,0	#'get return index from function'
			
		#'4-print result'
			la $a0,msg4		#'print msg4'
			li $v0,4
			syscall
			
			add $a0,$s4,$0	#' print find index'
			li $v0,1
			syscall
			
	li $v0,10 #exit
	syscall 

#'1-initialize return index by -1'
#'2-if found update index and out'
find : 
	#'store parametrs in $t'
	add $t0,$a0,$0	#'paramter fot lenght'
	add $t1,$a1,$0  #'paramter for string address'
	add $t2,$a2,$0  #'paramter for charchter value'
	
	li $v0,-1		#' initialize return value by -1'
	
	li $t3,0
	loopFind : 
		beq $t3,$t0,outLoopFind
		
		add $t4,$t1,$t3		#'get address of current index'
		lb $t5,($t4)		#'get chatchter of current index'
		beq $t5,$t2,fonded	
			j continu
		fonded :
			addi $v0,$t3,0	#'if found store index and go to out of function '
			j outFind
		continu:
		addi $t3,$t3,1
		j loopFind
	outLoopFind:
		
outFind: 
jr $ra


#'Q2. Write a program that implements the find method:'
#' • Read input string from user.'
#' • Read a character to search for it from the user.'
#' • Return the index of the first occurrence of the given'
#' character in the string, or -1 if the character is not exist in the'
#' string.'
#' Examples: Inputs (“Hello”, L) output (2) Inputs (“Hello”, W)'
#' output (-1)'