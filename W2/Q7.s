

main:
	# $t0 = 24
	li	$t0, 24

loop:
	bge	$t0, 42, loop_end

	li	$v0, 1
	move	$a0, $t0
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

	addi	$t0, $t0, 3

	b	loop

loop_end:
	li	$v0, 0
	jr	$ra




main_end: