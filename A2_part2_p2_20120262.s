# ComputerOrganization Assigment2_part2_problem2 [testPalindrome string]
# ID		  : 20120262
# Name        : Amr Abd Al-Aziz Ibrahim
# Author      : Almgwary
# Date        : 12-Des-2015
#
# -------------------------------
.data 
buffer : .space 120
str1 : .asciiz "Enter Sting length"
str2 : .asciiz "\nEnterString: "
str3 : .asciiz "  [palndrom]"
str4 : .asciiz "  [notPalndrom]"


.text 

	main:
	la $a0,str1 	#" prin str1  "Enter Sting length"
	li $v0,4
	syscall 
	
	li $v0,5		#" read length from user
	syscall 
	addi $t1,$v0,1  #" $t1 = lenght+1 to get string end
	
	la $a0,str2 	#" print str2 "\nEnterString: "
	li $v0,4
	syscall
		
	li $v0,8 		#" read string 
	la $a0,buffer 	#" set buferr address
	add $a1,$t1,$0  #" set length
	syscall
	
	
	#-----------------------------------------------------------
	
	addi $s5,$0,1	#"using it	
	sub $t1,$t1,$s5 #" $t1 = lenght-1 to remove end of string
	
	li $t2,1  		#"assume string is palndrome $t2=1 for testing
	
	li $t3,2		#"calculate middle end index
	div $t4,$t1,$t3
	
	sub $t1,$t1,$s5	#"$t1 = lenght-1 to point to begining of last index
	addi $t5,$0,0	#"$t0 pinter to first elemnt
	
	#"$t5 left 
	#"$t4 middle
	#"$t1 right
	#-------------------------------------------------------------------------
	
	add $t5,$t5,$a0 #"add buffer addresss
	add $t4,$t4,$a0 #"add buffer addresss
	add $t1,$t1,$a0 #"add buffer addresss
	
	#--------------------------------------------------------------
	loop :
		beq  $t5,$t4,brak 	#"if reach to middle end
		lb $t6,($t5)		#"elmnt from left
		lb $t7,($t1)		#"elemnt from right
		beq $t7,$t6,yes
			add $t2,$0,$0
			j brak
		yes:
		addi $t5,$t5,1
		addi $s5,$0,1
		sub $t1,$t1,$s5
	
	 	j loop
	brak:
	
	#--------------------------------------------------------------
	beq $t2,$0,notPalndrom
		la $a0,str3 #print strin is palndrom
		li $v0,4
		syscall
		j exit
	notPalndrom :
		la $a0,str4 #print strin is not palndrom
		li $v0,4
		syscall
		
	
	exit:
	li $v0,10
	syscall 