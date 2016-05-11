.data
    str : .asciiz  "*"
    ln : .asciiz  "\n"
.text
.globl main
main :
    #print string
    la $a0,str
    li $v0,4
    syscall

    #read string
    li $v0,5
    syscall
    #sent input parametrs to fn
    addi $a0,$v0,0

    jal fn

    End:        #end of code
    li $v0,10
    syscall
.end main


fn:
    subu $sp,$sp,8
    sw $ra, ($sp)
    sw $a0, 4($sp)
    addi $s0,$a0,0
    li $t0,0
    beq $t0,$s0,return
        #print *

        lop:
            beq $t0,$s0,lop_out
                #print new star
                la $a0,str
                li $v0,4
                syscall
            addi $t0,$t0,1
            j lop
        lop_out:
        #print end line
        #print new line
        la $a0,ln
        li $v0,4
        syscall

        #call function
        addi $a0,$s0,-1
        jal fn


    return :
    lw $a0,4($sp)
    lw $ra, ($sp)
    addu $sp,$sp,8
    jr $ra
.end fn
