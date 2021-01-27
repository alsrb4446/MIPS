.text
	.globl main

main: #main program entry

la $t0, value
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)

loop:

beq $t2, $zero, end
add $t1, $t1, 1
add $t3, $t3, $t1
sub $t2, $t2, 1
j loop

end:
sw $t3, 8($t0)
li $v0, 4 #프린트
la $a0, msg1
syscall
li $v0, 1
addu $a0, $t3, $zero # 출력
syscall

li $v0, 10 #종료
syscall

	.data
value: .word 0, 100, 0
msg1: .asciiz "SUM of 0~100 Number=>"