.text
	.globl main


main: #main program entry

la $t0, value
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
lw $t4, 12($t0)

add $t1, $t1, $t2
add $t2, $zero, $t1
sub $t3, $t3, $t4 
sub $t3, $t3, 1
loop:
beq $t3, $zero, end
addu $t1, $t1, $t2
sub $t3, $t3, 1
j loop

end:
sw $t1, 0($t0)
li $v0, 4 #프린트
la $a0, msg1
syscall
li $v0, 1
add $a0, $zero, $t1 # 출력
syscall

li $v0, 10 #종료
syscall

	.data
value: .word 4, 2, 10, 5
msg1: .asciiz "value = "