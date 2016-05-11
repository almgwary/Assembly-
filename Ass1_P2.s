#ID 20120262
#almgwary Assigment 1 problem 2 
.data
	messeg1:	.asciiz	"Admhal's Law"
	messeg2:	.asciiz	"\nEnter program total execution time	:	 "
	messeg3:	.asciiz	"\nEnter executoin time affected by improvment 	:	 "
	messeg4:	.asciiz	"\nEnter amount of improvment 	:	 "
	messeg5:	.asciiz	"\nResult 	=	 "
	
	
.text
	.globl main
	.ent main
	main:
		#print string "Admhal's Law"
		la	$a0,messeg1	
		li	$v0,4
		syscall
		
		#print string "Enter program total execution time"
		la	$a0,messeg2
		li	$v0,4
		syscall
		
		#get input from user
		li	$v0,5
		syscall
		add	$t0,$v0,$0
		
		#print string"Enter executoin time affected by improvment"
		la	$a0,messeg3
		li	$v0,4
		syscall
		
		#get input from user
		li	$v0,5
		syscall
		add	$t1,$v0,$0
		
		
		#print string"Enter amount of improvment"
		la	$a0,messeg4
		li	$v0,4
		syscall
		
		#get input from user
		li	$v0,5
		syscall
		add	$t3,$v0,$0
		
		#calculation
				#	un affected = total- affected
				sub 	$t5,$t0,$t1
				# affected/ n
				div 	$t6,$t1,$t3
				#amount of improvment
				add 	$t2,$t6,$t5
		
		
		#print string "Result"
		la	$a0,messeg5
		li	$v0,4
		syscall
		
		#print result
		add	$a0,$t2,$0
		li	$v0,1
		syscall
		
		#exit
		li	$v0,10
		syscall
		
		
		add	$a0,$t2,$0
		li	$v0,1
		syscall
		
		#exit
		li	$v0,10
		syscall
		
		
		
		
	