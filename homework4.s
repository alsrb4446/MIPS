.data
	prompt: .asciiz "input x for fibonacci (x) : "
	message: .asciiz "Result : "
	plus : .asciiz " + "
	equal : .asciiz " = "
	pass : .asciiz "\n"
	message2: .asciiz "End fibonacci "

.text
main:
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t0, $v0 #입력값을 t0에 저장

beq $t0, -1, final #입력값이 –1이면 종료

li $v0, 4
la $a0, message
syscall

li $t2, 1 #index
li $t3, 0 #temp
li $t1, 1

ble $t0, $t1, final2  # 입력값이 1보다 작거나 같으면 final2로 이동

li $v0, 1
move $a0, $t1 #t1값 출력
syscall

j loop

pl:

li $v0, 4 # '+' 출력
la $a0, plus
syscall

li $v0, 1
move $a0, $t1 #t1값 출력
syscall

add $t2, $t2, 1


j loop

eq :

li $v0, 4 #' = ' 출력
la $a0, equal
syscall

li $v0, 1
move $a0, $t3 #t3값 출력
syscall

j replay

loop:
add $t4, $t1, 0 #t4는 임시변수, t1을 저장
add $t1, $t1, $t3 #현재값 + 이전값 , t1에 저장
add $t3, $t4, 0 #t3에 임시변수t4(t1)을 저장
blt $t0, $t1, eq   # 입력값<현재값 eq로 이동
j pl #pl로 이동

final2:
li $v0, 1
move $a0, $t0 #t0값 출력
syscall

j replay

replay:
li $v0, 4  #줄 바꾸기
la $a0, pass
syscall

j main #처음으로 다시 돌아감

final:
li $v0, 4  #end 출력
la $a0, message2
syscall

li $v0,10
syscall
