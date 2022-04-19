#t0 = temp 
#t1 = n
#t2 = i
#t3 = j
#t4 = i+1
#t5 = i-j

.data
msg1:	.asciiz "Pascal Triangle \nPlease enter the number of levels(1~30): "
msg2:  	.asciiz "\n"
msg3:  	.asciiz " "
.text
.globl main
#------------------------- main -----------------------------
main:
# print msg1 on the console interface
		li      $v0, 4				# call system call: print string
		la      $a0, msg1			# load address of string into $a0
		syscall                 	# run the syscall
 
# read the input integer in $v0
 		li      $v0, 5          	# call system call: read string
  		syscall		# run the syscall
		move    $t1, $v0      		# store input in $a0 (set arugument of procedure factorial)
	
		#add $t2,$zero,$zero
  		jal L
		
		li  $v0, 10
		syscall
		
L:
	
	addi $sp, $sp, -4	# adiust stack for 2 items
	sw $ra, 0($sp) 		# save the return address
		
loop1:
    beq $t2,$t1,iiii
	add $t3,$zero,$zero
	jal loop2
    addi $t2,$t2,1
	
	li      $v0, 4				# call system call: print string
	la      $a0, msg2			# load address of string into $a0
	syscall                 	# run the syscall
    j loop1  

loop2:
		addi $t4,$t2, 1
		beq $t3, $t4, jjjj
		beq $t3,$zero,Else
		beq $t3,$t2,Else
		sub $t5,$t2,$t3
		addi $t5,$t5, 1
		mult $t0,$t5
		mflo $t0
		div $t0,$t3
		mflo $t0
		addi $t3,$t3,1	
		
		li      $v0, 4				# call system call: print string
		la      $a0, msg3		
		syscall                 	# run the syscall
		li $v0, 1		# call system call: print integer
		move $a0,$t0
		syscall 		# run the syscall
		j loop2
Else:
		addi $t0,$zero, 1
		addi $t3,$t3,1
		li      $v0, 4				# call system call: print string
		la      $a0, msg3	
		syscall
		li $v0, 1		# call system call: print integer
		move $a0,$t0
		syscall 		# run the syscall
		j loop2


iiii:
	lw $ra, 0($sp)	# restore the return address
	addi $sp, $sp, 4
	jr $ra
jjjj:
	jr $ra

