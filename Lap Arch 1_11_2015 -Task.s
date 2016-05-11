# ml: .space 12 -> reserv 12 byte
.data
	array1	:	.space	12
	succ	: 	.asciiz "succ"
	failed	:	.asciiz "faild"
.text
	main:
		li $s0,0

		la	$t0,array1
		li	$t1,5
		sw	$t1,($t0)  #() isrefrence ti address
		lw	$t3,($t0)
		add 	$s0,$s0,$t3
	
		li	$t1,13
		sw	$t1,4($t0)
		lw	$t3,4($t0)
		add 	$s0,$s0,$t3
	
		li	$t1,7
		sw	$t1,8($t0)
		lw	$t3,8($t0)
		add 	$s0,$s0,$t3

 

		li $s1,50
		ble $s1,$s0,equal
			la $a0,failed
			j Exit
		equal:
			la $a0,succ
		Exit:
		li $v0,4
		syscall


	.end main

	