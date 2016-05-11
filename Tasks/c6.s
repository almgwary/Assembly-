.data
    str : .asciiz  "Enter any thing"
    buffer : .space 12
.text
.globl main
main :
    #print string
    la $a0,str
    li $v0,4
    syscall

    #read string
    la $a0,buffer
    li $v0,8
    syscall


    #print input string
    la $a0,buffer
    li $v0,4
    syscall


    End:        #end of code
    li $v0,10
    syscall
.end main


