.globl main
.data

vektori: .word 7 , 5 , 6 , 12 , 35 , 27
msg: .asciiz "The even numbers are: "
iterator: .word 0
gjatesiaArray: .word 5
pjesetuesi: .word 2

.text
main:
li $v0, 4
la $a0, msg
syscall

la $t0, vektori			
lw $t1, iterator		# i = 0
lw $t2, gjatesiaArray	# t2 = 5
lw $s0, pjesetuesi		# s0 = 2

#int main() {
#
#	
#	int numbers[] = {7, 5, 6, 12, 35, 27};
#	cout << "The even numbers are: ";
#
#
#	for (int i = 0 ; i < 6 ; i++) {
#		if(numbers[i] % 2 == 0)
#		{
#			cout << numbers[i] << ", " << endl;
#		}
#	}
#	return 0;
#
#}

Loop:   

bgt $t1, $t2, exit_loop			# Branch on Greater Than

sll $t3, $t1, 2					# shift left logical 4byte
add $t3, $t3, $t0				# vektori ne t3

lw  $t4, 0($t3)

div $t4, $s0					# anetaret e vargut / 2
mfhi $t5						# move from high ne t4, mbetja ne t4

beq $t5, $zero, shtypCift		# nqs t4 = 0 goto -> shtypCift

addi $t1, $t1, 1				# i++
j Loop


shtypCift:
li $v0, 1						# print int
lw $a0, 0($t3)
syscall

li $v0, 11						# print char
li $a0, ' '						# per hapesire mes numrave kur t'shtypen
syscall

addi $t1, $t1, 1
j Loop

exit_loop:  li $v0, 10
syscall