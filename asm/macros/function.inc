	.macro arm_func_start name
	.align 2, 0
	.global \name
	.arm
	.type \name, function
	.endm

	.macro arm_func_end name
	.size \name, .-\name
	.endm

	.macro THUMB_FUNC_START name
	.align 2, 0
	.global \name
	.thumb
	.thumb_func
	.type \name, function
	.endm

	.macro non_word_aligned_thumb_func_start name
	.global \name
	.thumb
	.thumb_func
	.type \name, function
	.endm

	.macro thumb_func_end name
	.size \name, .-\name
	.endm

	.macro mov32 reg, addr
	.if \addr == 0x08800000
		movs \reg, #0x88
		lsls \reg, \reg, #0x14
	.else
		ldr \reg, =#\addr
	.endif
	.endm
