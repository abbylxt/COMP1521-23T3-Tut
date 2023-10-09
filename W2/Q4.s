# Prints the square of a number

main:
	# $t0 = x, $t1 = y
	li	$v0, 4			# printf("Enter a number: ");
	la	$a0, prompt_str
	syscall

	li	$v0, 5			# scanf("%d", &x);
	syscall
	# $v0 now contains scanned in number
	move	$t0, $v0
	# $v0 = $t0 = scanned in value

	mul	$t1, $t0, $t0		# int y = x * x;

	li	$v0, 1			
	move	$a0, $t1
	syscall

	li	$v0, 11		
	li	$a0, '\n'
	syscall

	li	$v0, 0
	jr	$ra


main_end:


.data

prompt_str:
	.asciiz	"Enter a number: "

# prompt_number:
# 	.ascii "Enter a number: \0"