.data
    array: .word 3, 11, 2, 3, 4, 0, 6, 7, 8, 9
    str : .asciiz " Index and Max "
    str1 : .asciiz " Index and Min "
.text
.globl main
main :

    jal max
    jal min
    End:        #end of code
    li $v0,10
    syscall
.end main


max :

    la $t0,array    #addres index
    addi $t1,$0,0   #start index
    addi $t2,$0,9  #end index
    addi $s0,$s0,0  #max
    addi $s1,$s1,0  #index
    loop :
    beq $t1,$t2,brak
        lw $t3,($t0)
        #check
        blt $t3,$s0,less
            addi $s1,$t1,0  #store index
            addi $s0,$t3,0  #store vlaue

        less:


        addi $t0,$t0,4  #increment address
        addi $t1,$t1,1  #incremant counter
        j loop



    brak:
    #print addres and max elemnt


    addi $a0,$s1,0
    li $v0,1
    syscall


    addi $a0,$s0,0
    li $v0,1
    syscall



    la $a0,str
    li $v0,4
    syscall
    jr $ra


.end max





min :

    la $t0,array    #addres index
    addi $t1,$0,0   #start index
    addi $t2,$0,9  #end index
    addi $s0,$s0,10000  #min
    addi $s1,$s1,0  #index
    loop1 :
    beq $t1,$t2,brak1
        lw $t3,($t0)
        #check
        bgt $t3,$s0,more
            addi $s1,$t1,0  #store index
            addi $s0,$t3,0  #store vlaue

        more:


        addi $t0,$t0,4  #increment address
        addi $t1,$t1,1  #incremant counter
        j loop1



    brak1:
    #print addres and max elemnt


    addi $a0,$s1,0
    li $v0,1
    syscall


    addi $a0,$s0,0
    li $v0,1
    syscall



    la $a0,str1
    li $v0,4
    syscall
    jr $ra


.end min
