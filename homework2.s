  .text
     .globl main
main:
###float
    #print input msg
        li $v0, 4 #system output str
        la $a0, strinputmsg
        syscall #print msg
    #get data
        li $v0,8 #take in input
        la $a0, strbuffer #load byte space into address
        li $a1, 20 # allot the byte space for string
        move $t0,$a0 #save string to t0
        syscall
    #print output msg
        li $v0, 4 #system output str
        la $a0, commonoutputmsg
        syscall #print msg


add $t4, $t0, 0
add $t5, $t0, 1
li $t6, 0 #index
li $s1, 1

	loop2:
lb $t1, 0($t4)
lb $t2, 0($t5)
ble $t2, 64, loop1 # t2 <=64, loop1
ble $t1, $t2, loop4
j  loop3

	loop1:
add $t6, $t6, 1
add $t4, $t6, $t0
add $t5, $t4, 1
lb $t1, 0($t4)
lb $t2, 0($t5)
ble $t1, 64, end # t1<=64, end
j loop2

	loop3:
sb $t2, 0($t4)     #t1, t2 위치 바꿔주기
sb $t1, 0($t5)
add $t5, $t5, 1
lb $t1, 0($t4)      #t1이 64보다 작으면 끝내기
ble $t1, 64, end
j loop2
	loop4:
add $t5, $t5, 1    #다음거 비교하기위해 t5더해주기
j loop2


end:
    #print result
        la $a0, strbuffer #reload byte space to primary address
        move $a0,$t0 # primary address = t0 address (load pointer)
        li $v0,4 # print string
        syscall
    #end program
    li $v0,10
    syscall
     .data
        strbuffer: .space 20
        strinputmsg:  .asciiz "Input(max 20 chars): "
        commonoutputmsg:  .asciiz "Output :"