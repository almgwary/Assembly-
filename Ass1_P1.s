#ID 20120262
#almgwary Assigment 1 problem 1
.data
	messeg1:	.asciiz	"Area Callculaction"
	messeg2:	.asciiz	"\nEnter length 	: "
	messeg3:	.asciiz	"\nEnter width   	: "
	messeg4:	.asciiz	"\nArea = "
	
	
.text
	.globl main
	.ent main
	main:
		#print string "Area Callculation"
		la	$a0,messeg1	
		li	$v0,4
		syscall
		
		#print string "enter length"
		la	$a0,messeg2
		li	$v0,4
		syscall
		
		#get input from user
		li	$v0,5
		syscall
		add	$t0,$v0,$0
		
		#print string"enter width"
		la	$a0,messeg3
		li	$v0,4
		syscall
		
		#get input from user
		li	$v0,5
		syscall
		add	$t1,$v0,$0
		
		#calculate area
		mul	$t2,$t0,$t1
		
		#print string "Area"
		la	$a0,messeg4
		li	$v0,4
		syscall
		
		#print result
		add	$a0,$t2,$0
		li	$v0,1
		syscall
		
		#exit
		li	$v0,10
		syscall
		
		
		
		
	