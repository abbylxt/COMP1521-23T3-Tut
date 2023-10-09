# CONSTANTS
N_SIZE = 10

.text

main:
# int i = $t0

scan_loop_init:
	li	$t0, 0

scan_loop_cond:
	bge	$t0, N_SIZE, scan_loop_end

scan_loop_body:
	li	$v0, 5
	syscall

	mul	$t1, $t0, 4
	la	$t2, numbers
	add	$t2, $t1, $t2
	sw	$v0, ($t2)

scan_loop_incr:


scan_loop_end:


print_loop_init:
	li	$t0, 0

print_loop_cond:
	bge	$t0, N_SIZE, print_loop_end

print_loop_body:
	mul	$t2, $t0, 4	# calculating offset
	# la	$t3, numbers
	# add	$t4, $t3, $t2
	# sw	$t1, ($t4)
	lw	$t1, numbers($t2)

	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

print_loop_incr:
	addi	$t0, $t0, 1
	b	print_loop_cond

print_loop_end:



end:
li	$v0, 0
jr	$ra


.data

numbers:	.word 0,0,0,0,0,0,0,0,0,0