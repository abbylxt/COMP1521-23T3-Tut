
main:
main_prologue:
	push	$ra

main_body:
	la 	$a0, array	# printf("%d\n", max(array, 4));
	li	$a1, 4		

	jal	max

	move 	$a0, $v0
	li	$v0, 1
	syscall

main_epilogue:
	li	$v0, 0		# return 0;
	pop	$ra

	jr	$ra


# max function
max:

max_prologue:
	push	$ra			# push $ra onto the stack to save its value when entering the function
	push	$s0			# push $s0 onto the stack to save its value when entering the function

max_body:
	lw	$s0, ($a0)		# int first_element = array[0]
	move	$t1, $a1		# $t1 = length, $s0 = first_element

max_body_if:
	bne	$t1, 1, max_body_else	# if (length != 1) goto: max_body_if_else

	move	$v0, $s0		# return first_element;
	b	max_epilogue

max_body_else:				# else
	addi	$a0, $a0, 4		# max(&array[1], length - 1);
	addi	$a1, $t1, -1

	jal	max
					# max_so_far = $t0
	move	$t0, $v0		# int max_so_far =  max(&array[1], length - 1);

max_body_else_if:
	ble	$s0, $t0, max_body_else_if_end	# if (first_element <= max_so_far) goto max_body_else_if_end;

	move	$t0, $s0		# max_so_far = first_element;

max_body_else_if_end:
	move	$v0, $t0		# return max_so_far;
	b	max_epilogue

max_body_else_end:
max_epilogue:
	pop	$s0			# pop value from stack and save it into $s0
	pop	$ra			# pop value from stack and save it into $ra

	jr	$ra

.data

array:	.word 1, 3, 8, 7