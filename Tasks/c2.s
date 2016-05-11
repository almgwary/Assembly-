.data
    array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
.text
.globl main
main :


    la $t0,array #addres index
    addi $t1,$0,0 #start index
    addi $t2,$0,10 #start index

    loop :
    beq $t1,$t2,brak
        lw $t3,($t0)
        #check
        #get first bit
        li $t5,0
        andi $t6, $t3,1
        beq $t6,$t5,even
            addi $t3,$t3,1
            sw $t3, ($t0)

        even:
        addi $t0,$t0,4  #increment address
        addi $t1,$t1,1  #incremant counter
        j loop



    brak:



    End:        #end of code
    li $v0,10
    syscall
.end main


