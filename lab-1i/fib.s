	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ r3 = -1
        @ r4 = 1
        @ r5 = 0  (sum)
        mov r3, #4294967295
        mov r4, #1
        mov r5, #0

        @ if x <= 0, return sum=0
        cmp r0, #0
        ble .L2
.L1:
        @ sum = previous(r3)+result(r4)
        @ previous = result
        @ result = sum
        add r5, r4, r3
        mov r3, r4
        mov r4, r5
        @ x = x - 1
        @ if x >=0, goto .L1
        subs r0, r0, #1
        bge .L1

.L2:    
        mov r0, r5
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
