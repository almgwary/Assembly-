# ml: .space 12 -> reserv 12 byte
.data
	array1:	.space	12
.text
	main:
		la	$t0,array1
		li	$t1,5
		sw	$t1,($t0)  #() isrefrence ti address
	
		li	$t1,13
		sw	$t1,4($t0)
	
		li	$t1,7
		sw	$t1,8($t0)


	.end main

	