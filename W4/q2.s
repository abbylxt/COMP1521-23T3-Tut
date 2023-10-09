# &flag[0][0] = &flag
# &flag[0][7] = &flag + 7
# &flag[1][0] = &flag + 12
# &flag[1][7] = &flag + 12 + 7
# &flag[2][7] = &flag + 12 + 12 + 7 = &flag + 12 * 2 + 7 
# &flag[row][col] = &flag + row *n_col + col

.data
flag:	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    	.byte '.', 'X', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'


.text
# CONSTANTS
FLAG_ROWS = 6
FLAG_COLS = 12

main:

main_prologue:
	# everything you push

main_body:
	# $t0 = row, $t1 = col
	li	$t0, 0
main_loop_rows:
	bge	$t0, FLAG_ROWS, main_loop_rows_end

	li	$t1, 0
main_loop_cols:
	bge	$t1, FLAG_COLS, main_loop_cols_end

	# &flag[row][col] = &flag + row *n_col + col
	la	$t2, flag
	mul	$t3, $t0, FLAG_COLS
	add	$t3, $t3, $t2
	add	$t3, $t3, $t1
	lb	$t2, ($t3)
	# printf("%c", flag[row][col]);

	move	$a0, $t2
	li	$v0, 11
	syscall

	addi	$t1, 1
	b	main_loop_cols
main_loop_cols_end:
	li	$a0, '\n'
	li	$v0, 11
	syscall

	addi	$t0, 1
	b	main_loop_rows
main_loop_rows_end:


main_epilogue:
	# everything you pop

	li	$v0, 0
	jr	$ra
