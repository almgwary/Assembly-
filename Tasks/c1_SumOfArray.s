.data
    str : .asciiz  "Enter any thing"
    buffer : .space 12
.text
.globl main
main :
    #read 2 int
    li $v0,5
    syscall
    add $t0,$v0,$0


    li $v0,5
    syscall
    addi $t1,$v0,1

    #initlis sum # t2=0
    loop :
    beq $t0,$t1,brak
        add $t2,$t2,$t0
        addi $t0,$t0,1
        j loop



    brak:
    add $a0,$t2,$0
    li $v0,1
    syscall

    End:        #end of code
    li $v0,10
    syscall
.end main


