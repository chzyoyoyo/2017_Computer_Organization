#t0 = m
#t1 = n
#t2 = r
#t3 = 
#t4 = 
#t5 = 

.data
msg1:	.asciiz "Enter first integers: "
msg2: .asciiz "Enter second integers: "
msg3: .asciiz "Greatest common divisor:  "
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
		move    $t0, $v0      		# store input in $a0 (set arugument of procedure factorial)
		
# print msg2 on the console interface
		li      $v0, 4				# call system call: print string
		la      $a0, msg2 		# load address of string into $a0
		syscall                 	# run the syscall
 
# read the input integer in $v0
 		li      $v0, 5          	# call system call: read string
  		syscall		# run the syscall
		move    $t1, $v0      		# store input in $a0 (set arugument of procedure factorial)
		
		jal gcd

		# print msg3 on the console interface
		li      $v0, 4				# call system call: print string
		la      $a0, msg3 		# load address of string into $a0
		syscall                 	# run the syscall

		li 			$v0, 1		# call system call: print integer
		move 		$a0,$t0
		syscall 		# run the syscall
		
		li $v0 ,10
		syscall


gcd:
		addi $sp, $sp, -12		# adiust stack for 2 items
		sw $ra, 8($sp)				# save the return address
		sw $t0, 4($sp) 				
		sw $t1, 0($sp)				# save the argument n
		bne $t1, $zero, L1		# if n != 0 go to L1


		addi $sp, $sp, 12
		jr $ra
L1:
		div $t0,$t1
		mfhi $t2
		move $t0,$t1
		move $t1,$t2
		jal gcd

		lw $ra, 8($sp) 				# restore the return address
		addi $sp, $sp, 12			# adjust stack pointer to pop 3 items
		jr $ra						# return to the caller
