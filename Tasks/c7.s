.data
    str : .asciiz  "Enter any thing"
    buffer : .space 12
.text
.globl main
main :

    addi $a2,$0,3
    jal fn


    #print string
    addi $a0,$a1,0
    li $v0,1
    syscall


    End:        #end of code
    li $v0,10
    syscall
.end main


fn:
    subu $sp,$sp,4
    sw $ra,   ($sp)

    li $a0,1 #fobo of 0
    li $a1,2 #fobo of 1


    li $t5,2
    beq $a2,$t5,out
         addi $a2,$a2,-1
         jal fn

    out:
    add $s7,$0,$a0
    add $a1,$a1,$a0 #fobo of 1
    add $a0,$s7,$0 #fobo of 0

    return :

    lw $ra,   ($sp)
    addu $sp,$sp,4
    jr $ra
.end fn
