# &flag[0][0] = &flag
# &flag[0][7] = &flag + 7
# &flag[1][0] = &flag + 12
# &flag[1][7] = &flag + 12 + 7
# &flag[2][7] = &flag + 12 + 12 + 7 = &flag + 2 * 12 + 7
# &flag[row][col] = &flag + row * FLAG_COLS + col

.data
flag:	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'


.text
# CONSTANTS
FLAG_ROWS = 6
FLAG_COLS = 12

main:
main_prologue:
	begin
	push	$ra
main_body:
	# $t0 = row, $t1 = col
	li	$t0, 0

main_body_loop:
	bge	$t0, FLAG_ROWS, main_body_end

	li	$t1, 0

main_body_loop_1:
	bge	$t1, FLAG_COLS, main_body_end_1

	# &flag[row][col] = &flag + row * FLAG_COLS + col
	# la	$t2, flag		# &flag
	# mul	$t3, $t0, FLAG_COLS	# row * FLAG_COLS
	# add	$t2, $t2, $t3		# &flag + row * FLAG_COLS
	# add	$t2, $t2, $t1		# &flag[row][col] = &flag + row * FLAG_COLS + col
	# lb	$a0, ($t2)

	mul	$t2, $t0, FLAG_COLS
	add	$t2, $t2, $t1
	lb	$a0, flag($t2)
	
	li	$v0, 11
	syscall

	addi	$t1, $t1, 1

	b	main_body_loop_1

main_body_end_1:

	li	$v0, 11
	li	$a0, '\n'
	syscall

	addi	$t0, $t0, 1
	
	b	main_body_loop
main_body_end:
main_epilogue:
	pop	$ra
	end

	li	$v0, 0
	jr	$ra			                # return 0 