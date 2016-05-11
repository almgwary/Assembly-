#----------------------------------------------
#   72-Dec-2015
# Computer Organization Lap Quiz
# Name  : Amr AbdulAziz Ibrahim
# ID    : 20120262
#
# problem count how many odd numbers on array
#
#----------------------------------------------
.data
    array : .word 11,5,2,9,22,45,56,100,101,54
    #array : .space 200 #[11,5,2,9,22,45,56,100,101,54]
    str : .asciiz "\nResult : "
.text
.ent main
    main:


    la $a0,array
    li $a1,10


    addi $s5,$a0,10
    addi $s6,$a0,0





    jal count_odd_array


    #print string
    la $a0,str
    li $v0,4
    syscall

    #print result
    addi $a0,$v1,0
    li $v0,1
    syscall



    li $v0,10
    syscall
.end main


is_odd:
    #get value form a0
    addi $t0, $a0,0
    addi $t1 , $0,1

    #cheack least significan bit
    and $t2,$t0,$t1

    #initialze return
    li $v0,0

    #if odd ot will eual 1
    addi  $v0,$t2,0
j $ra


count_odd_array :
  #get array address
  add $s0, $a0, $0
  #get array size
  add $s1,$a1,$0
  #multiblay by 4
  li $t4,4
  mul $s1,$s1,$t4
  #initilze return value v1=0
  add $v1,$0,$0

  #make $s1= las address of array
  add $s1,$s1,$s0

  loop:
    beq $s1,$s0,endloop

    #load
    lw $a0,($s0)


    #call function
        #save return address to stack
        addu $sp,$sp,-4
        sw $ra,($sp)
        #call function
        jal is_odd

        #restore return addres from stack
        lw $ra,($sp)
        addu $sp,$sp,4



    #add return value
    add $v1,$v1,$v0


    addi $s0,$s0,4  #encrement
    j loop
  endloop:

returnCount_odd_array :
j $ra
