# ComputerOrganization Assigment3_part2_problem1 [  revirs word in string ]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 23-Des-2015
# 
# -------------------------------
# '$s0  : string length'
# '$s1 	: string address'
# '$s2	: string last address'
# '$s3  : new string length' 
# '$s4  : new string address' 
# '$s5 	: new string last address'
# '$s6	: space chrachter value'
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
			
			la $s4,newString	#' new string address'
			add $s5,$s4,$s0		#' new string last address'

			la $a0,spaceChar	#' get space charchter'
			lb $s6,($a0)			
			
		#'3-call method with string and charachter and string length'
			addi $s1,$s1,-1 #'decreas string address by 1 becouse it is end value not used'
			addi $a0,$s1,0	#'paramter fot stirng address'
			addi $a1,$s2,0	#'paramter for string lasr address'
			addi $a2,$s4,0	#'paramter for new string address'
			addi $s6,$s6,0	#'Static paramter for space charchter '
			
			jal revers		#'call function'
			
			
		#'4-print result'
			la $a0,msg3		#'print msg4'
			li $v0,4
			syscall
			
			add $a0,$s4,$0	#' print new  String'
			li $v0,4
			syscall
			
	li $v0,10 #exit
	syscall 

#' we need stack only for $ra address only'
#' '
#'const 	$a0 stirng address '
#'decreas 	$a1 string last address'
#'increas 	$a2 new string address'	
#'const		$s6 space charchter '	

revers : 
	subu $sp,$sp,4			#'store $ra in $sp'
	sw $ra,($sp)
	add $t1,$a1,0			#'last address of brevios word'
	reversLoop:
		addi $a1,$a1,-1 		#' decreas last address'
		beq $a0,$a1,outRevers	#' if reach to first index of strin return from function '
		lb $t0,($a1)			#' get last charchter value'
		
		
		
		beq $t0,$s6,newWord		#' if  $t0 = space cahrachter this is new word call the recursive function again'
			j continueFn
		newWord:				#' add brevios  and call recursiv'
			
			addi $t2,$a1,1 		#' address of brevios word after space charachter '
			writeBrevoisWord : 
				beq $t1,$t2,outWriteBrevoisWord
				lb $t3,($t2)
				sb $t3,($a2)
				addi $a2,$a2,1 
				addi $t2,$t2,1
				j writeBrevoisWord
			outWriteBrevoisWord:
			sb $s6,($a2)			#' store space chachter '
			addi $a2,$a2,1 			#' increas new string writer index'
			
			jal revers			#' call the recursive function '
			
			j outRevers			#' return '
		continueFn :
			j reversLoop		#' continue add this word'
		
outRevers: 
	addFirstWord : 
			addi $t2,$a1,1 		#' address of brevios word after space charachter '
			writeFirstWord : 
				beq $t1,$t2,outWriteFirstWord
				lb $t3,($t2)
				sb $t3,($a2)
				addi $a2,$a2,1 
				addi $t2,$t2,1
				j writeFirstWord
			outWriteFirstWord:
			sb $s6,($a2)			#' store space chachter '
			addi $a2,$a2,1 			#' increas new string writer index'
			#'stop adding first word '
			addi $a1,$t1,-1
			
	lw $ra,($sp)
	addu $sp,$sp,4
jr $ra


#'Q1. Write a recursive function to reverse a string. Write a recursive'
#'function to reverse the words in a string, i.e., ”cat is running”'
#'becomes ”running is cat”.'