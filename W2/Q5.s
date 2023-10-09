# Squares a number, unless its square is too big for a 32-bit integer.
# If it is too big, prints an error message instead.

# Constants
SQUARE_MAX = 46340

main:
	li	$v0, 4
	la	$a0, prompt_str
	syscall

	li	$v0, 5
	syscall
	move	$t0, $v0		# $t0 = x

if_condi:
	ble	$t0, SQUARE_MAX, else_square

	li	$v0, 4
	la	$a0, too_big_str
	syscall

	b	else_end

else_square:
	mul	$t1, $t0, $t0

	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall



else_end:

	li	$v0, 0
	jr	$ra

main_end:


.data

prompt_str:
        .asciiz "Enter a number: "

too_big_str:
	.ascii "square too big for 32 bits\n\0"