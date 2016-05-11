 # ComputerOrganization Assigment3_part1_problem1 [ insertion sort ]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 22-Des-2015
# 
# -------------------------------
# '$s0 : address of array	'
# '$s1 : size of array   	'
# '$t0 : validation variables'
# '$t1 : input variables'
# '$t2 : array pointer'
# '$t3 : elemnt pick form array'
# '$t4 : max array pointer'
# '$t5 : load elemnt before me'
# '$t6 : pointer  before me'
# '$t7 : array pointer for insertion '
# '$t8 : load elemnt  picked'
#
.data 
array	: .space 200 #200 byte 	
.text 
.globl main
	.ent main
	main:
		la $s0,array 	#' load Addres Of the array'
		li $s1,0		#' Initialize size by 0'
		
		# Start getting input
		li $t0,0 		#' for validation'
		li $t1,-1		# '$t1 : input variables'
		loop1 : 
		 beq $t0,$t1,outLoop1
		 addi $s1,$s1,1	#' increment size'
		 li $v0,5		#' read int'
		 syscall
		 add $t1,$v0,$0	#' get input'
		 
		 sb $t1,($s0)	#' store input to array'
		 addi $s0,$s0,1	#' icrement pointer'
		 
		 j loop1
		outLoop1 :
		
		#' Insertion Sort for array'
		la $s0,array 	#' load Addres Of the array'
		addi $t2,$s0,1  #' pointer +1 '
		add $t4,$s0,$s1	# '$t4 : max array pointer = beginig+size '
		
		loop2:
			beq $t2,$t4,outloop2	#' check end of array'
			lb $t3, ($t2)			#' pick elemnt'
			
				#' resort frome this poin to first point '
				addi $t7,$t2,0		#' get pointer of the piked elemnt '
				addi $t6,$t7,-1 	#' pointer to elemnt before me' 
				lb $t8,($t7)		#' get data frome  curent elemnt' 
				lb $t5,($t6)		#' get data frome elemnt before me' 
				while:
					beq $t7,$s0,outWhile	#' check not reach to first elemt'
					bgt $t8,$t5,outWhile	#' chek if current element is less than brevous elemnt Else out '
					#' swap'
					sb $t8,($t6)
					sb $t5,($t7)
					#' reinializ to next whileLoop iteration'
					addi $t7,$t7,-1
					addi $t6,$t6,-1
					lb $t8,($t7)		#' get data frome  curent elemnt' 
					lb $t5,($t6)		#' get data frome elemnt before me' 
					j while
				outWhile:
			
			addi $t2,$t2,1			#' increment counter by one'
			j loop2
		outloop2:
		
		#' print array'
		la $s0,array 	#' load Addres Of the array'
		add $t7,$s0,$0	#' pointer of array'
		loop3:
			beq $t7,$t4,outloop3	#' check reach end of array'
			lb $t6,($t7) 			#' laod elemnt form array'
			add $a0,$t6,$0			#' print value'
			li $v0,1
			syscall
			addi $t7,$t7,1 			#' increment pointer'
			j loop3
		outloop3:	
	li $v0,10 #exit
	syscall 
	
	
	