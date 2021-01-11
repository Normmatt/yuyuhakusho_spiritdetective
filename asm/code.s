.include "asm/macros.inc"

.syntax unified
.section .text

	arm_func_start start
start: @ 0x08000000
	b _080000C0
	.include "asm/rom_header.inc"
    
_080000C0:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _080000F8 @ =0x03007FA0
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _080000F4 @ =0x03007EA0
	ldr r1, _080001C4 @ =0x03007FFC
	add r0, pc, #0x18 @ =IntrMain
	str r0, [r1]
	ldr r1, _080001C8 @ =AgbMain
	mov lr, pc
	bx r1

	arm_func_start j_start_0
j_start_0: @ 0x080000F0
	b _080000C0
	.align 2, 0
_080000F4: .4byte 0x03007EA0
_080000F8: .4byte 0x03007FA0

	arm_func_start IntrMain
IntrMain: @ 0x080000FC
	mov r3, #0x4000000
	add r3, r3, #0x200
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	ands r0, r1, #0x2000
	strbne r0, [r3, #-0x17c]
_08000114:
	bne _08000114
	mov r2, #0
	ands r0, r1, #1
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #2
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #4
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #8
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x10
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x20
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x40
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x80
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x100
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x200
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x400
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x800
	bne _080001B0
	add r2, r2, #4
	ands r0, r1, #0x1000
_080001B0:
	strh r0, [r3, #2]
	ldr r1, _080001CC @ =0x08031850
	add r1, r1, r2
	ldr r0, [r1]
	bx r0
	.align 2, 0
_080001C4: .4byte 0x03007FFC
_080001C8: .4byte AgbMain
_080001CC: .4byte 0x08031850

	thumb_func_start CheckDonMilhamRules
CheckDonMilhamRules: @ 0x080001D0
	push {r7, lr}
	mov r7, sp
	movs r0, #0x80
	lsls r0, r0, #0x12
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x44
	beq _080001E6
	movs r0, #0
	b _08000340
_080001E6:
	ldr r0, _080001F8 @ =0x02000001
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x4f
	beq _080001FC
	movs r0, #0
	b _08000340
	.align 2, 0
_080001F8: .4byte 0x02000001
_080001FC:
	ldr r0, _0800020C @ =0x02000002
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x4e
	beq _08000210
	movs r0, #0
	b _08000340
	.align 2, 0
_0800020C: .4byte 0x02000002
_08000210:
	ldr r0, _08000220 @ =0x02000003
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x20
	beq _08000224
	movs r0, #0
	b _08000340
	.align 2, 0
_08000220: .4byte 0x02000003
_08000224:
	ldr r0, _08000234 @ =0x02000004
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x4d
	beq _08000238
	movs r0, #0
	b _08000340
	.align 2, 0
_08000234: .4byte 0x02000004
_08000238:
	ldr r0, _08000248 @ =0x02000005
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x49
	beq _0800024C
	movs r0, #0
	b _08000340
	.align 2, 0
_08000248: .4byte 0x02000005
_0800024C:
	ldr r0, _0800025C @ =0x02000006
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x4c
	beq _08000260
	movs r0, #0
	b _08000340
	.align 2, 0
_0800025C: .4byte 0x02000006
_08000260:
	ldr r0, _08000270 @ =0x02000007
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x48
	beq _08000274
	movs r0, #0
	b _08000340
	.align 2, 0
_08000270: .4byte 0x02000007
_08000274:
	ldr r0, _08000284 @ =0x02000008
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x41
	beq _08000288
	movs r0, #0
	b _08000340
	.align 2, 0
_08000284: .4byte 0x02000008
_08000288:
	ldr r0, _08000298 @ =0x02000009
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x4d
	beq _0800029C
	movs r0, #0
	b _08000340
	.align 2, 0
_08000298: .4byte 0x02000009
_0800029C:
	ldr r0, _080002AC @ =0x0200000A
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x20
	beq _080002B0
	movs r0, #0
	b _08000340
	.align 2, 0
_080002AC: .4byte 0x0200000A
_080002B0:
	ldr r0, _080002C0 @ =0x0200000B
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x52
	beq _080002C4
	movs r0, #0
	b _08000340
	.align 2, 0
_080002C0: .4byte 0x0200000B
_080002C4:
	ldr r0, _080002D4 @ =0x0200000C
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x55
	beq _080002D8
	movs r0, #0
	b _08000340
	.align 2, 0
_080002D4: .4byte 0x0200000C
_080002D8:
	ldr r0, _080002E8 @ =0x0200000D
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x4c
	beq _080002EC
	movs r0, #0
	b _08000340
	.align 2, 0
_080002E8: .4byte 0x0200000D
_080002EC:
	ldr r0, _080002FC @ =0x0200000E
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x45
	beq _08000300
	movs r0, #0
	b _08000340
	.align 2, 0
_080002FC: .4byte 0x0200000E
_08000300:
	ldr r0, _08000310 @ =0x0200000F
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x53
	beq _08000314
	movs r0, #0
	b _08000340
	.align 2, 0
_08000310: .4byte 0x0200000F
_08000314:
	ldr r0, _08000324 @ =0x02000010
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0x21
	beq _08000328
	movs r0, #0
	b _08000340
	.align 2, 0
_08000324: .4byte 0x02000010
_08000328:
	ldr r0, _08000338 @ =0x02000010
	ldrb r1, [r0]
	lsls r2, r1, #0x18
	lsrs r0, r2, #0x18
	cmp r0, #0
	beq _0800033C
	b _08000340
	.align 2, 0
_08000338: .4byte 0x02000010
_0800033C:
	movs r0, #1
	b _08000340
_08000340:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetupDonMilhamRules
SetupDonMilhamRules: @ 0x08000348
	push {r7, lr}
	mov r7, sp
	movs r0, #0x80
	lsls r0, r0, #0x12
	movs r1, #0x44
	strb r1, [r0]
	ldr r0, _080003C0 @ =0x02000001
	movs r1, #0x4f
	strb r1, [r0]
	ldr r0, _080003C4 @ =0x02000002
	movs r1, #0x4e
	strb r1, [r0]
	ldr r0, _080003C8 @ =0x02000003
	movs r1, #0x20
	strb r1, [r0]
	ldr r0, _080003CC @ =0x02000004
	movs r1, #0x4d
	strb r1, [r0]
	ldr r0, _080003D0 @ =0x02000005
	movs r1, #0x49
	strb r1, [r0]
	ldr r0, _080003D4 @ =0x02000006
	movs r1, #0x4c
	strb r1, [r0]
	ldr r0, _080003D8 @ =0x02000007
	movs r1, #0x48
	strb r1, [r0]
	ldr r0, _080003DC @ =0x02000008
	movs r1, #0x41
	strb r1, [r0]
	ldr r0, _080003E0 @ =0x02000009
	movs r1, #0x4d
	strb r1, [r0]
	ldr r0, _080003E4 @ =0x0200000A
	movs r1, #0x20
	strb r1, [r0]
	ldr r0, _080003E8 @ =0x0200000B
	movs r1, #0x52
	strb r1, [r0]
	ldr r0, _080003EC @ =0x0200000C
	movs r1, #0x55
	strb r1, [r0]
	ldr r0, _080003F0 @ =0x0200000D
	movs r1, #0x4c
	strb r1, [r0]
	ldr r0, _080003F4 @ =0x0200000E
	movs r1, #0x45
	strb r1, [r0]
	ldr r0, _080003F8 @ =0x0200000F
	movs r1, #0x53
	strb r1, [r0]
	ldr r0, _080003FC @ =0x02000010
	movs r1, #0x21
	strb r1, [r0]
	ldr r0, _08000400 @ =0x02000011
	movs r1, #0
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080003C0: .4byte 0x02000001
_080003C4: .4byte 0x02000002
_080003C8: .4byte 0x02000003
_080003CC: .4byte 0x02000004
_080003D0: .4byte 0x02000005
_080003D4: .4byte 0x02000006
_080003D8: .4byte 0x02000007
_080003DC: .4byte 0x02000008
_080003E0: .4byte 0x02000009
_080003E4: .4byte 0x0200000A
_080003E8: .4byte 0x0200000B
_080003EC: .4byte 0x0200000C
_080003F0: .4byte 0x0200000D
_080003F4: .4byte 0x0200000E
_080003F8: .4byte 0x0200000F
_080003FC: .4byte 0x02000010
_08000400: .4byte 0x02000011

	thumb_func_start AgbMain
AgbMain: @ 0x08000404
	push {r4, r5, r7, lr}
	sub sp, #0x30
	add r7, sp, #4
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x20]
	ldr r0, _080004CC @ =0x04000204
	ldr r2, _080004D0 @ =0x00004014
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0
	str r0, [r7, #0x24]
	ldr r0, _080004D4 @ =0x040000D4
	str r0, [r7, #0x28]
	ldr r0, [r7, #0x28]
	adds r1, r7, #0
	adds r1, #0x24
	str r1, [r0]
	ldr r1, [r7, #0x28]
	adds r0, r1, #4
	movs r1, #0xc0
	lsls r1, r1, #0x12
	str r1, [r0]
	ldr r1, [r7, #0x28]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _080004D8 @ =0x85001F80
	str r1, [r0]
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r0, _080004D4 @ =0x040000D4
	str r0, [r7, #0x28]
	ldr r0, [r7, #0x28]
	ldr r1, _080004DC @ =IntrMain
	str r1, [r0]
	ldr r1, [r7, #0x28]
	adds r0, r1, #4
	ldr r1, _080004E0 @ =0x03000EF0
	str r1, [r0]
	ldr r1, [r7, #0x28]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _080004E4 @ =0x84000040
	str r1, [r0]
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r0, _080004E8 @ =0x03007FFC
	ldr r1, _080004E0 @ =0x03000EF0
	str r1, [r0]
	ldr r0, _080004EC @ =0x04000200
	ldr r2, _080004F0 @ =0x00002005
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080004F4 @ =0x04000004
	ldr r2, _080004F8 @ =0x00001E28
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080004FC @ =0x04000208
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08000500 @ =0x03000FFC
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08000504 @ =0x03001000
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08000508 @ =0x03000E2C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800050C @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	bl CheckDonMilhamRules
	str r0, [r7, #0x14]
	bl VBlankIntrWait
	bl sub_8021754
	bl m4aSoundInit
	ldr r0, _08000508 @ =0x03000E2C
	movs r1, #0
	str r1, [r0]
	b _08000534
	.align 2, 0
_080004CC: .4byte 0x04000204
_080004D0: .4byte 0x00004014
_080004D4: .4byte 0x040000D4
_080004D8: .4byte 0x85001F80
_080004DC: .4byte IntrMain
_080004E0: .4byte 0x03000EF0
_080004E4: .4byte 0x84000040
_080004E8: .4byte 0x03007FFC
_080004EC: .4byte 0x04000200
_080004F0: .4byte 0x00002005
_080004F4: .4byte 0x04000004
_080004F8: .4byte 0x00001E28
_080004FC: .4byte 0x04000208
_08000500: .4byte 0x03000FFC
_08000504: .4byte 0x03001000
_08000508: .4byte 0x03000E2C
_0800050C: .4byte 0x04000134
_08000510:
	.byte 0x06, 0x48, 0x00, 0x21, 0x01, 0x60, 0x04, 0xF0, 0x79, 0xF8, 0x05, 0x49, 0x00, 0x20, 0x28, 0xF0
	.byte 0x65, 0xFB, 0x05, 0xF0, 0x8D, 0xFC, 0xB8, 0x61, 0x33, 0xE0, 0x00, 0x00, 0x30, 0x60, 0x00, 0x03
	.byte 0x88, 0x18, 0x03, 0x08
_08000534:
	movs r0, #0x13
	bl PlaySfx
	movs r0, #0
	ldr r1, [r7, #0x14]
	cmp r1, #0
	bne _08000544
	movs r0, #1
_08000544:
	bl sub_80292A4
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #2
	bhi _0800055C
	bl sub_800460C
	bl sub_800601C
	str r0, [r7, #0x18]
	b _08000592
_0800055C:
	ldr r0, [r7]
	cmp r0, #4
	bne _08000570
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r0, _0800056C @ =0x0203001E
	str r0, [r7, #0x18]
	b _08000592
	.align 2, 0
_0800056C: .4byte 0x0203001E
_08000570:
	ldr r0, [r7]
	cmp r0, #5
	bne _08000584
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r0, _08000580 @ =0x00020013
	str r0, [r7, #0x18]
	b _08000592
	.align 2, 0
_08000580: .4byte 0x00020013
_08000584:
	ldr r0, [r7]
	cmp r0, #6
	bne _08000592
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r0, _0800068C @ =0x00030013
	str r0, [r7, #0x18]
_08000592:
	bl VBlankIntrWait
	bl SetupDonMilhamRules
	ldr r0, _08000690 @ =0x03000E2C
	movs r1, #0
	str r1, [r0]
	movs r0, #0x11
	bl PlaySfx
	movs r0, #0xa0
	lsls r0, r0, #0x13
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r2, #0x82
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r2, [r1]
	ldr r3, _08000694 @ =0x0000F0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08000698 @ =0x03000E30
	ldr r1, _08000698 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #1
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _08000698 @ =0x03000E30
	ldr r1, _08000698 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #2
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _08000698 @ =0x03000E30
	ldr r1, _08000698 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #4
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _08000698 @ =0x03000E30
	ldr r1, _08000698 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #8
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _0800069C @ =0x030011A8
	ldr r1, _080006A0 @ =0x00002710
	str r1, [r0]
	ldr r0, _080006A4 @ =0x030010D0
	movs r1, #0
	str r1, [r0]
	movs r0, #0
	bl sub_80029CC
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_8002370
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_80024A0
	movs r0, #1
	bl sub_80029CC
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_8002370
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_80024A0
	movs r0, #2
	bl sub_80029CC
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_8002370
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_80024A0
	movs r0, #3
	bl sub_80029CC
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_8002370
	ldr r1, _080006A0 @ =0x00002710
	adds r0, r1, #0
	bl sub_80024A0
	ldr r0, [r7, #0x18]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r2, [r7, #0x18]
	lsrs r1, r2, #0x10
	movs r2, #0xff
	ands r1, r2
	ldr r3, [r7, #0x18]
	lsrs r2, r3, #0x18
	movs r3, #0xff
	ands r2, r3
	ldr r3, _080006A8 @ =0x03000FF4
	ldr r4, _080006AC @ =0x03000E28
	str r4, [sp]
	bl sub_8000C88
	ldr r0, _080006B0 @ =0x03000EE4
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
_0800068A:
	b _080006B6
	.align 2, 0
_0800068C: .4byte 0x00030013
_08000690: .4byte 0x03000E2C
_08000694: .4byte 0x0000F0FF
_08000698: .4byte 0x03000E30
_0800069C: .4byte 0x030011A8
_080006A0: .4byte 0x00002710
_080006A4: .4byte 0x030010D0
_080006A8: .4byte 0x03000FF4
_080006AC: .4byte 0x03000E28
_080006B0: .4byte 0x03000EE4
_080006B4:
	.byte 0x60, 0xE0
_080006B6:
	bl sub_8021AA0
	adds r5, r0, #0
	bl sub_8021AA0
	adds r4, r0, #0
	bl sub_8021AA0
	adds r1, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #0x13
	lsls r2, r5, #0x18
	lsrs r3, r2, #0x18
	adds r2, r3, #0
	cmp r2, #0
	bge _080006D8
	adds r2, #7
_080006D8:
	asrs r2, r2, #3
	lsls r3, r4, #0x18
	lsrs r4, r3, #0x18
	adds r3, r4, #0
	cmp r3, #0
	bge _080006E6
	adds r3, #7
_080006E6:
	asrs r3, r3, #3
	adds r4, r3, #0
	lsls r3, r4, #5
	orrs r2, r3
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r1, r3, #0
	cmp r1, #0
	bge _080006FA
	adds r1, #7
_080006FA:
	asrs r1, r1, #3
	adds r3, r1, #0
	lsls r1, r3, #0xa
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	bl sub_80009C0
	movs r0, #0
	bl sub_8024674
	ldr r0, _0800073C @ =0x03000EE4
	ldr r1, [r0]
	movs r0, #1
	cmn r1, r0
	beq _08000738
	ldr r1, _0800073C @ =0x03000EE4
	ldr r0, [r1]
	ldr r2, _08000740 @ =0x03001008
	ldr r1, [r2]
	ldr r3, _08000744 @ =0x03001004
	ldr r2, [r3]
	ldr r3, _08000748 @ =0x03000FF4
	ldr r4, _0800074C @ =0x03000E28
	str r4, [sp]
	bl sub_8000C88
	ldr r0, _0800073C @ =0x03000EE4
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
_08000738:
	b _08000768
	.align 2, 0
_0800073C: .4byte 0x03000EE4
_08000740: .4byte 0x03001008
_08000744: .4byte 0x03001004
_08000748: .4byte 0x03000FF4
_0800074C: .4byte 0x03000E28
_08000750:
	.byte 0x06, 0x4A, 0x07, 0x4B, 0x17, 0x20, 0x12, 0x21, 0x21, 0xF0, 0xAA, 0xFE, 0x05, 0x4A, 0x18, 0x20
	.byte 0x13, 0x21, 0x00, 0x23, 0x21, 0xF0, 0xA4, 0xFE
_08000768:
	b _0800068A
	.align 2, 0
_0800076C:
	.byte 0x90, 0x18, 0x03, 0x08
	.byte 0x50, 0x1B, 0x00, 0x03, 0x9C, 0x18, 0x03, 0x08, 0x0C, 0xB0, 0xB0, 0xBC, 0x01, 0xBC, 0x00, 0x47

	thumb_func_start sub_8000780
sub_8000780: @ 0x08000780
	push {r7, lr}
	mov r7, sp
	ldr r0, _080007A0 @ =0x03000EDC
	ldr r1, _080007A4 @ =0x03000E20
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080007A8 @ =0x03001014
	ldr r1, _080007AC @ =0x03000FF8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080007B0 @ =0x0300100C
	movs r1, #1
	str r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080007A0: .4byte 0x03000EDC
_080007A4: .4byte 0x03000E20
_080007A8: .4byte 0x03001014
_080007AC: .4byte 0x03000FF8
_080007B0: .4byte 0x0300100C

	thumb_func_start sub_80007B4
sub_80007B4: @ 0x080007B4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080007CC @ =0x0300100C
	movs r1, #0
	str r1, [r0]
	ldr r0, _080007D0 @ =0x03000EE0
	movs r1, #1
	str r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080007CC: .4byte 0x0300100C
_080007D0: .4byte 0x03000EE0

	thumb_func_start sub_80007D4
sub_80007D4: @ 0x080007D4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08000808 @ =0x03000EDC
	ldr r1, _0800080C @ =0x03000E20
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08000810 @ =0x03001014
	ldr r1, _08000814 @ =0x03000FF8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _0800080C @ =0x03000E20
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, _08000814 @ =0x03000FF8
	ldr r1, [r7, #4]
	str r1, [r0]
	ldr r0, _08000818 @ =0x03000EE0
	movs r1, #2
	str r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000808: .4byte 0x03000EDC
_0800080C: .4byte 0x03000E20
_08000810: .4byte 0x03001014
_08000814: .4byte 0x03000FF8
_08000818: .4byte 0x03000EE0

	thumb_func_start sub_800081C
sub_800081C: @ 0x0800081C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r0, _0800086C @ =0x03000EE0
	ldr r1, [r0]
	cmp r1, #0
	bne _0800082C
	b _0800092A
_0800082C:
	ldr r0, _08000870 @ =0x03000EDC
	ldr r1, _08000874 @ =0x03000E20
	ldr r0, [r0]
	ldr r2, [r1]
	subs r1, r0, r2
	adds r0, r1, #0
	cmp r0, #0
	bge _0800083E
	rsbs r0, r0, #0
_0800083E:
	str r0, [r7]
	ldr r0, _08000878 @ =0x03001014
	ldr r1, _0800087C @ =0x03000FF8
	ldr r0, [r0]
	ldr r2, [r1]
	subs r1, r0, r2
	adds r0, r1, #0
	cmp r0, #0
	bge _08000852
	rsbs r0, r0, #0
_08000852:
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
	ldr r0, [r7]
	cmp r0, #4
	bgt _08000880
	ldr r0, _08000870 @ =0x03000EDC
	ldr r1, _08000874 @ =0x03000E20
	ldr r2, [r1]
	str r2, [r0]
	movs r0, #1
	str r0, [r7, #8]
	b _080008AA
	.align 2, 0
_0800086C: .4byte 0x03000EE0
_08000870: .4byte 0x03000EDC
_08000874: .4byte 0x03000E20
_08000878: .4byte 0x03001014
_0800087C: .4byte 0x03000FF8
_08000880:
	ldr r0, _08000898 @ =0x03000EDC
	ldr r1, _0800089C @ =0x03000E20
	ldr r0, [r0]
	ldr r1, [r1]
	cmp r0, r1
	ble _080008A0
	ldr r0, _08000898 @ =0x03000EDC
	ldr r1, _08000898 @ =0x03000EDC
	ldr r2, [r1]
	subs r1, r2, #4
	str r1, [r0]
	b _080008AA
	.align 2, 0
_08000898: .4byte 0x03000EDC
_0800089C: .4byte 0x03000E20
_080008A0:
	ldr r0, _080008D0 @ =0x03000EDC
	ldr r1, _080008D0 @ =0x03000EDC
	ldr r2, [r1]
	adds r1, r2, #4
	str r1, [r0]
_080008AA:
	ldr r0, [r7, #4]
	cmp r0, #2
	bgt _08000900
	ldr r0, _080008D4 @ =0x03001014
	ldr r1, _080008D8 @ =0x03000FF8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _080008F4
	ldr r0, _080008DC @ =0x03000EE0
	ldr r1, [r0]
	cmp r1, #1
	bne _080008E0
	ldr r0, _080008DC @ =0x03000EE0
	movs r1, #0
	str r1, [r0]
	b _080008F4
	.align 2, 0
_080008D0: .4byte 0x03000EDC
_080008D4: .4byte 0x03001014
_080008D8: .4byte 0x03000FF8
_080008DC: .4byte 0x03000EE0
_080008E0:
	ldr r0, _080008F8 @ =0x03000EE0
	ldr r1, [r0]
	cmp r1, #2
	bne _080008F4
	ldr r0, _080008F8 @ =0x03000EE0
	movs r1, #0
	str r1, [r0]
	ldr r0, _080008FC @ =0x0300100C
	movs r1, #1
	str r1, [r0]
_080008F4:
	b _0800092A
	.align 2, 0
_080008F8: .4byte 0x03000EE0
_080008FC: .4byte 0x0300100C
_08000900:
	ldr r0, _08000918 @ =0x03001014
	ldr r1, _0800091C @ =0x03000FF8
	ldr r0, [r0]
	ldr r1, [r1]
	cmp r0, r1
	ble _08000920
	ldr r0, _08000918 @ =0x03001014
	ldr r1, _08000918 @ =0x03001014
	ldr r2, [r1]
	subs r1, r2, #2
	str r1, [r0]
	b _0800092A
	.align 2, 0
_08000918: .4byte 0x03001014
_0800091C: .4byte 0x03000FF8
_08000920:
	ldr r0, _08000934 @ =0x03001014
	ldr r1, _08000934 @ =0x03001014
	ldr r2, [r1]
	adds r1, r2, #2
	str r1, [r0]
_0800092A:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000934: .4byte 0x03001014

	thumb_func_start sub_8000938
sub_8000938: @ 0x08000938
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08000950 @ =0x0300100C
	ldr r1, [r0]
	cmp r1, #0
	bne _08000954
	movs r0, #0
	b _080009B8
	.align 2, 0
_08000950: .4byte 0x0300100C
_08000954:
	ldr r0, _08000968 @ =0x03000EDC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	cmp r1, r0
	bge _0800096C
	movs r0, #1
	b _080009B8
	.align 2, 0
_08000968: .4byte 0x03000EDC
_0800096C:
	ldr r0, _08000980 @ =0x03000EDC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xe8
	ldr r1, [r7]
	cmp r1, r0
	blt _08000984
	movs r0, #1
	b _080009B8
	.align 2, 0
_08000980: .4byte 0x03000EDC
_08000984:
	ldr r0, _08000998 @ =0x03001014
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x28
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _0800099C
	movs r0, #1
	b _080009B8
	.align 2, 0
_08000998: .4byte 0x03001014
_0800099C:
	ldr r0, _080009B0 @ =0x03001014
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x9c
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _080009B4
	movs r0, #1
	b _080009B8
	.align 2, 0
_080009B0: .4byte 0x03001014
_080009B4:
	movs r0, #0
	b _080009B8
_080009B8:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80009C0
sub_80009C0: @ 0x080009C0
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000A68 @ =0x03000EE0
	ldr r1, [r0]
	cmp r1, #2
	beq _08000A50
	ldr r0, _08000A6C @ =0x03000E20
	ldr r2, _08000A70 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	subs r2, #0x78
	str r2, [r0]
	ldr r0, _08000A74 @ =0x03000FF8
	ldr r2, _08000A70 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	subs r2, #0x50
	str r2, [r0]
	ldr r0, _08000A6C @ =0x03000E20
	ldr r1, [r0]
	cmp r1, #0
	bge _080009FA
	ldr r0, _08000A6C @ =0x03000E20
	movs r1, #0
	str r1, [r0]
_080009FA:
	ldr r0, _08000A6C @ =0x03000E20
	ldr r1, _08000A78 @ =0x03000FF4
	ldr r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #6
	adds r1, r2, #0
	subs r1, #0xf0
	ldr r0, [r0]
	cmp r0, r1
	ble _08000A1E
	ldr r0, _08000A6C @ =0x03000E20
	ldr r1, _08000A78 @ =0x03000FF4
	ldr r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #6
	adds r1, r2, #0
	subs r1, #0xf0
	str r1, [r0]
_08000A1E:
	ldr r0, _08000A74 @ =0x03000FF8
	ldr r1, [r0]
	cmp r1, #0
	bge _08000A2C
	ldr r0, _08000A74 @ =0x03000FF8
	movs r1, #0
	str r1, [r0]
_08000A2C:
	ldr r0, _08000A74 @ =0x03000FF8
	ldr r1, _08000A7C @ =0x03000E28
	ldr r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #6
	adds r1, r2, #0
	subs r1, #0xa0
	ldr r0, [r0]
	cmp r0, r1
	ble _08000A50
	ldr r0, _08000A74 @ =0x03000FF8
	ldr r1, _08000A7C @ =0x03000E28
	ldr r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #6
	adds r1, r2, #0
	subs r1, #0xa0
	str r1, [r0]
_08000A50:
	ldr r0, _08000A68 @ =0x03000EE0
	ldr r1, [r0]
	cmp r1, #0
	beq _08000A88
	ldr r1, _08000A80 @ =0x03000EDC
	ldr r0, [r1]
	ldr r1, _08000A84 @ =0x03001014
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_802014C
	b _08000A9E
	.align 2, 0
_08000A68: .4byte 0x03000EE0
_08000A6C: .4byte 0x03000E20
_08000A70: .4byte 0x03000EE8
_08000A74: .4byte 0x03000FF8
_08000A78: .4byte 0x03000FF4
_08000A7C: .4byte 0x03000E28
_08000A80: .4byte 0x03000EDC
_08000A84: .4byte 0x03001014
_08000A88:
	ldr r0, _08000AE0 @ =0x0300100C
	ldr r1, [r0]
	cmp r1, #0
	bne _08000A9E
	ldr r1, _08000AE4 @ =0x03000E20
	ldr r0, [r1]
	ldr r1, _08000AE8 @ =0x03000FF8
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_802014C
_08000A9E:
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl VBlankIntrWait
	bl sub_8021754
	bl sub_801FC2C
	bl sub_800081C
	ldr r0, _08000AEC @ =0x03000EE0
	ldr r1, [r0]
	cmp r1, #0
	beq _08000AF8
	ldr r1, _08000AF0 @ =0x03000EDC
	ldr r0, [r1]
	ldr r1, _08000AF4 @ =0x03001014
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_8023830
	ldr r1, _08000AF0 @ =0x03000EDC
	ldr r0, [r1]
	ldr r1, _08000AF4 @ =0x03001014
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_80073D4
	b _08000B3A
	.align 2, 0
_08000AE0: .4byte 0x0300100C
_08000AE4: .4byte 0x03000E20
_08000AE8: .4byte 0x03000FF8
_08000AEC: .4byte 0x03000EE0
_08000AF0: .4byte 0x03000EDC
_08000AF4: .4byte 0x03001014
_08000AF8:
	ldr r0, _08000B20 @ =0x0300100C
	ldr r1, [r0]
	cmp r1, #0
	bne _08000B2C
	ldr r1, _08000B24 @ =0x03000E20
	ldr r0, [r1]
	ldr r1, _08000B28 @ =0x03000FF8
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_8023830
	ldr r1, _08000B24 @ =0x03000E20
	ldr r0, [r1]
	ldr r1, _08000B28 @ =0x03000FF8
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_80073D4
	b _08000B3A
	.align 2, 0
_08000B20: .4byte 0x0300100C
_08000B24: .4byte 0x03000E20
_08000B28: .4byte 0x03000FF8
_08000B2C:
	ldr r1, _08000B4C @ =0x03000EDC
	ldr r0, [r1]
	ldr r1, _08000B50 @ =0x03001014
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_80073D4
_08000B3A:
	bl sub_8027620
	bl sub_8003C30
	bl sub_801ECB0
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
_08000B4C: .4byte 0x03000EDC
_08000B50: .4byte 0x03001014

	thumb_func_start sub_8000B54
sub_8000B54: @ 0x08000B54
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000B70 @ =0x0300100C
	ldr r1, [r0]
	cmp r1, #0
	bne _08000B7C
	ldr r1, _08000B74 @ =0x03000E20
	ldr r0, [r1]
	ldr r1, _08000B78 @ =0x03000FF8
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_802014C
	b _08000B8A
	.align 2, 0
_08000B70: .4byte 0x0300100C
_08000B74: .4byte 0x03000E20
_08000B78: .4byte 0x03000FF8
_08000B7C:
	ldr r1, _08000BA0 @ =0x03000EDC
	ldr r0, [r1]
	ldr r1, _08000BA4 @ =0x03001014
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_802014C
_08000B8A:
	movs r0, #1
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
_08000BA0: .4byte 0x03000EDC
_08000BA4: .4byte 0x03001014

	thumb_func_start sub_8000BA8
sub_8000BA8: @ 0x08000BA8
	push {r7, lr}
	mov r7, sp
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8000BB4
sub_8000BB4: @ 0x08000BB4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000BE8 @ =0x03000E2C
	ldr r1, [r0]
	cmp r1, #0
	bne _08000BC4
	bl SoundVSync
_08000BC4:
	ldr r0, _08000BEC @ =0x04000208
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08000BF0 @ =0x03007FF8
	ldr r1, _08000BF0 @ =0x03007FF8
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08000BEC @ =0x04000208
	movs r1, #1
	strh r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BE8: .4byte 0x03000E2C
_08000BEC: .4byte 0x04000208
_08000BF0: .4byte 0x03007FF8

	thumb_func_start sub_8000BF4
sub_8000BF4: @ 0x08000BF4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000C0C @ =0x03000E2C
	ldr r1, [r0]
	cmp r1, #0
	bne _08000C04
	bl m4aSoundMain
_08000C04:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000C0C: .4byte 0x03000E2C

	thumb_func_start sub_8000C10
sub_8000C10: @ 0x08000C10
	push {r7, lr}
	mov r7, sp
	bl sub_801F3C8
	bl sub_801F4C4
	bl sub_8020200
	bl sub_801F7A8
	bl sub_801E8B0
	bl sub_8021A88
	movs r0, #0
	movs r1, #0
	bl sub_802014C
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8000C3C
sub_8000C3C: @ 0x08000C3C
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl sub_801E828
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r2, #0x82
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0
	bl sub_80235B4
	movs r0, #1
	bl sub_80235B4
	movs r0, #0
	bl sub_80226CC
	movs r0, #1
	bl sub_80226CC
	movs r0, #0
	bl sub_8022814
	bl sub_8001068
	bl sub_80070A4
	bl sub_8021D20
	movs r0, #2
	bl sub_801E7A0
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8000C88
sub_8000C88: @ 0x08000C88
	push {r7, lr}
	sub sp, #0x34
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08000D98 @ =0x03001008
	ldr r1, [r7, #4]
	str r1, [r0]
	bl VBlankIntrWait
	movs r0, #2
	bl sub_801E828
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r2, #0x82
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r2, [r1]
	ldr r3, _08000D9C @ =0x0000F0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	bl sub_8000C10
	movs r0, #0
	bl sub_80204F8
	bl sub_801FC2C
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8023BFC
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x10
	adds r2, r7, #0
	adds r2, #0x12
	bl sub_8023E00
	adds r1, r7, #0
	adds r1, #0x1c
	adds r2, r7, #0
	adds r2, #0x20
	ldr r0, [r7]
	bl sub_8022974
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x1c]
	str r1, [r0]
	ldr r0, [r7, #0x34]
	ldr r1, [r7, #0x20]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x10
	ldrh r1, [r0]
	adds r0, r1, #0
	subs r0, #0x78
	str r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x12
	ldrh r1, [r0]
	adds r0, r1, #0
	subs r0, #0x50
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _08000D26
	movs r0, #0
	str r0, [r7, #0x14]
_08000D26:
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	lsls r0, r1, #6
	adds r1, r0, #0
	subs r1, #0xf0
	ldr r0, [r7, #0x14]
	cmp r0, r1
	ble _08000D42
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	lsls r0, r1, #6
	adds r1, r0, #0
	subs r1, #0xf0
	str r1, [r7, #0x14]
_08000D42:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bge _08000D4C
	movs r0, #0
	str r0, [r7, #0x18]
_08000D4C:
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	lsls r0, r1, #6
	adds r1, r0, #0
	subs r1, #0xa0
	ldr r0, [r7, #0x18]
	cmp r0, r1
	ble _08000D68
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	lsls r0, r1, #6
	adds r1, r0, #0
	subs r1, #0xa0
	str r1, [r7, #0x18]
_08000D68:
	bl sub_8001C84
	bl sub_8021D20
	movs r0, #0
	bl sub_80070BC
	ldr r0, _08000DA0 @ =0x03000FF0
	movs r1, #0
	str r1, [r0]
	movs r0, #1
	bl sub_8024674
	bl sub_8023FE0
	str r0, [r7, #0x24]
	movs r0, #0
	str r0, [r7, #0x28]
_08000D8C:
	ldr r0, [r7, #0x28]
	ldr r1, [r7, #0x24]
	cmp r0, r1
	blo _08000DA4
	b _08000DB6
	.align 2, 0
_08000D98: .4byte 0x03001008
_08000D9C: .4byte 0x0000F0FF
_08000DA0: .4byte 0x03000FF0
_08000DA4:
	ldr r1, [r7, #0x28]
	adds r0, r1, #0
	movs r1, #0
	bl sub_80256A0
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	b _08000D8C
_08000DB6:
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #0x18]
	ldr r0, [r7]
	bl sub_8022858
	ldr r0, _08000E2C @ =0x03000FF0
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80070BC
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	bl sub_802014C
	ldr r0, _08000E30 @ =0x0300100C
	movs r1, #0
	str r1, [r0]
	ldr r0, _08000E34 @ =0x03000EE0
	movs r1, #0
	str r1, [r0]
	bl sub_8001068
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r0, [r1]
	adds r1, r7, #0
	adds r1, #0x12
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #4
	bl sub_800CE30
	ldr r1, _08000E38 @ =0x03000EE8
	str r0, [r1]
	bl sub_8020928
	movs r0, #0
	bl sub_80204F8
	bl sub_801FC2C
	bl sub_8020928
	movs r0, #0
	bl sub_80204F8
	bl sub_801FC2C
	ldr r0, [r7]
	cmp r0, #0xe
	bhi _08000EBC
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08000E3C @ =_08000E40
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08000E2C: .4byte 0x03000FF0
_08000E30: .4byte 0x0300100C
_08000E34: .4byte 0x03000EE0
_08000E38: .4byte 0x03000EE8
_08000E3C: .4byte _08000E40
_08000E40: @ jump table
	.4byte _08000E7C @ case 0
	.4byte _08000E7E @ case 1
	.4byte _08000E7C @ case 2
	.4byte _08000E7E @ case 3
	.4byte _08000E7E @ case 4
	.4byte _08000E7E @ case 5
	.4byte _08000E7E @ case 6
	.4byte _08000E7E @ case 7
	.4byte _08000E7E @ case 8
	.4byte _08000E7E @ case 9
	.4byte _08000E7E @ case 10
	.4byte _08000E7E @ case 11
	.4byte _08000E7E @ case 12
	.4byte _08000E7E @ case 13
	.4byte _08000E7E @ case 14
_08000E7C:
	b _08000EBC
_08000E7E:
	movs r0, #7
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa
	movs r3, #0x64
	bl sub_801E8F0
	movs r0, #7
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0xa
	movs r1, #1
	movs r2, #7
	movs r3, #0x64
	bl sub_801E8F0
	movs r0, #5
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #9
	movs r2, #0xf
	movs r3, #0x3c
	bl sub_801E8F0
	b _08000EBC
_08000EBC:
	movs r0, #2
	bl sub_801E7A0
	ldr r0, _08000ECC @ =0x03001010
	ldr r1, [r7]
	str r1, [r0]
	movs r0, #1
	b _08000ED0
	.align 2, 0
_08000ECC: .4byte 0x03001010
_08000ED0:
	add sp, #0x34
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start PlaySfx
PlaySfx: @ 0x08000ED8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x1e
	bhi _08000EF6
	ldr r0, _08000EF0 @ =0x03000FFC
	ldrb r1, [r0]
	cmp r1, #0
	bne _08000EF4
	b _08000F12
	.align 2, 0
_08000EF0: .4byte 0x03000FFC
_08000EF4:
	b _08000F04
_08000EF6:
	ldr r0, _08000F00 @ =0x03001000
	ldrb r1, [r0]
	cmp r1, #0
	bne _08000F04
	b _08000F12
	.align 2, 0
_08000F00: .4byte 0x03001000
_08000F04:
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl m4aSongNumStart
_08000F12:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8000F1C
sub_8000F1C: @ 0x08000F1C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08000F30 @ =0x03001020
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x81
	ldrb r1, [r2]
	adds r0, r1, #0
	b _08000F34
	.align 2, 0
_08000F30: .4byte 0x03001020
_08000F34:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8000F3C
sub_8000F3C: @ 0x08000F3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _08000F64
	movs r0, #0
	bl sub_8004868
	ldr r1, _08000F60 @ =0x0000015B
	adds r0, r1, #0
	movs r1, #0xc
	movs r2, #0x12
	bl sub_8001AF4
	b _08000F90
	.align 2, 0
_08000F60: .4byte 0x0000015B
_08000F64:
	ldr r0, [r7]
	cmp r0, #1
	bne _08000F84
	movs r0, #1
	bl sub_8004868
	ldr r1, _08000F80 @ =0x0000015B
	adds r0, r1, #0
	movs r1, #1
	movs r2, #6
	bl sub_8001AF4
	b _08000F90
	.align 2, 0
_08000F80: .4byte 0x0000015B
_08000F84:
	ldr r1, _08001060 @ =0x0000015B
	adds r0, r1, #0
	movs r1, #0x13
	movs r2, #0x13
	bl sub_8001AF4
_08000F90:
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x20]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x24]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x28]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x2c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x30]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x34]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x38]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001064 @ =0x03001020
	ldr r2, [r0, #0x44]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001060: .4byte 0x0000015B
_08001064: .4byte 0x03001020

	thumb_func_start sub_8001068
sub_8001068: @ 0x08001068
	push {r7, lr}
	mov r7, sp
	ldr r1, _08001168 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x87
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800107A
	b _080011F0
_0800107A:
	ldr r1, _0800116C @ =0x00000159
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0x13
	bl sub_8001AF4
	ldr r0, _08001168 @ =0x03001020
	ldr r2, [r0, #0x24]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001168 @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _08001168 @ =0x03001020
	ldr r2, [r0, #0x24]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001168 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x88
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08001170
	ldr r0, _08001168 @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001168 @ =0x03001020
	ldr r0, [r1, #0x3c]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _08001168 @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001168 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x88
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x56
	ldr r2, _08001168 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r1, [r2, r3]
	asrs r2, r1, #1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	ble _08001164
	ldr r0, _08001168 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001168 @ =0x03001020
	ldr r0, [r1, #0x40]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _08001168 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08001164:
	b _080011DC
	.align 2, 0
_08001168: .4byte 0x03001020
_0800116C: .4byte 0x00000159
_08001170:
	ldr r0, _080011EC @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080011EC @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080011EC @ =0x03001020
	ldr r0, [r1, #0x3c]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080011EC @ =0x03001020
	ldr r0, [r1, #0x40]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080011EC @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080011EC @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080011DC:
	ldr r0, _080011EC @ =0x03001020
	ldr r1, [r0, #0x6c]
	movs r0, #1
	movs r2, #0
	bl sub_80028E8
	b _08001262
	.align 2, 0
_080011EC: .4byte 0x03001020
_080011F0:
	ldr r1, _080013A8 @ =0x00000159
	adds r0, r1, #0
	movs r1, #0xc
	movs r2, #0x13
	bl sub_8001AF4
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x24]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x3c]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x40]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_08001262:
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x20]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x28]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x2c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x30]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x34]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x38]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080013AC @ =0x03001020
	ldr r2, [r0, #0x44]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x20]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x2c]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x30]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x38]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080013AC @ =0x03001020
	ldr r0, [r1, #0x44]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080013AC @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x84
	ldrb r1, [r0]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	bl sub_8002804
	ldr r0, _080013AC @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x85
	ldrb r1, [r0]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	bl sub_800284C
	ldr r0, _080013AC @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x86
	ldrb r1, [r0]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	bl sub_8002894
	ldr r1, _080013AC @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x82
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080013A8: .4byte 0x00000159
_080013AC: .4byte 0x03001020

	thumb_func_start sub_80013B0
sub_80013B0: @ 0x080013B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080013D8 @ =0x03001020
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x7c
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080013D8: .4byte 0x03001020

	thumb_func_start sub_80013DC
sub_80013DC: @ 0x080013DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_080013E6:
	ldr r0, [r7]
	cmp r0, #0xa
	bls _080013EE
	b _08001408
_080013EE:
	ldr r1, _08001404 @ =0x080319B4
	adds r0, r1, #0
	movs r1, #0
	ldr r2, [r7]
	bl sub_80049CC
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _080013E6
	.align 2, 0
_08001404: .4byte 0x080319B4
_08001408:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8001410
sub_8001410: @ 0x08001410
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_80013DC
	ldr r1, _08001468 @ =0x080319C8
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_80049CC
	ldr r1, _0800146C @ =0x080319D4
	adds r0, r1, #0
	movs r1, #2
	movs r2, #3
	bl sub_80049CC
	ldr r1, _08001470 @ =0x080319E0
	adds r0, r1, #0
	movs r1, #2
	movs r2, #5
	bl sub_80049CC
	ldr r0, [r7]
	cmp r0, #0
	beq _08001452
	ldr r1, _08001474 @ =0x080319EC
	adds r0, r1, #0
	movs r1, #2
	movs r2, #7
	bl sub_80049CC
_08001452:
	ldr r1, _08001478 @ =0x080319F8
	adds r0, r1, #0
	movs r1, #2
	movs r2, #9
	bl sub_80049CC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001468: .4byte 0x080319C8
_0800146C: .4byte 0x080319D4
_08001470: .4byte 0x080319E0
_08001474: .4byte 0x080319EC
_08001478: .4byte 0x080319F8

	thumb_func_start sub_800147C
sub_800147C: @ 0x0800147C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _080014AC @ =0x08031A18
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #3
	bl memcpy
	adds r0, r7, #4
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #3
	movs r1, #0
	bl sub_80049CC
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014AC: .4byte 0x08031A18

	thumb_func_start sub_80014B0
sub_80014B0: @ 0x080014B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080014D0 @ =0x08031A20
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #3
	movs r1, #0
	bl sub_80049CC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014D0: .4byte 0x08031A20

	thumb_func_start sub_80014D4
sub_80014D4: @ 0x080014D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #2
	str r0, [r7]
	bl sub_80013DC
	ldr r1, _0800151C @ =0x080319F8
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_80049CC
	ldr r1, _08001520 @ =0x08031A28
	adds r0, r1, #0
	movs r1, #1
	movs r2, #3
	bl sub_80049CC
	ldr r1, _08001524 @ =0x08031A38
	adds r0, r1, #0
	movs r1, #3
	movs r2, #5
	bl sub_80049CC
	ldr r1, _08001528 @ =0x08031A3C
	adds r0, r1, #0
	movs r1, #3
	movs r2, #7
	bl sub_80049CC
	ldr r0, [r7]
	bl sub_800147C
_08001518:
	b _0800152E
	.align 2, 0
_0800151C: .4byte 0x080319F8
_08001520: .4byte 0x08031A28
_08001524: .4byte 0x08031A38
_08001528: .4byte 0x08031A3C
_0800152C:
	.byte 0x41, 0xE0
_0800152E:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, _0800155C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800156A
	ldr r0, [r7]
	bl sub_80014B0
	ldr r0, [r7]
	cmp r0, #2
	bne _08001560
	movs r0, #1
	str r0, [r7]
	b _08001564
	.align 2, 0
_0800155C: .4byte 0x03005578
_08001560:
	movs r0, #2
	str r0, [r7]
_08001564:
	ldr r0, [r7]
	bl sub_800147C
_0800156A:
	ldr r0, _08001588 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08001594
	ldr r0, [r7]
	cmp r0, #1
	bne _0800158E
	movs r0, #1
	b _080015B2
	.align 2, 0
_08001588: .4byte 0x03005578
_0800158C:
	.byte 0x01, 0xE0
_0800158E:
	movs r0, #0
	b _080015B2
_08001592:
	.byte 0x0D, 0xE0
_08001594:
	ldr r0, _080015AC @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080015B0
	movs r0, #0
	b _080015B2
	.align 2, 0
_080015AC: .4byte 0x03005578
_080015B0:
	b _08001518
_080015B2:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80015BC
sub_80015BC: @ 0x080015BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #2
	str r0, [r7]
	bl sub_80013DC
	ldr r1, _08001610 @ =0x080319EC
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80049CC
	ldr r1, _08001614 @ =0x08031A54
	adds r0, r1, #0
	movs r1, #0
	movs r2, #1
	bl sub_80049CC
	ldr r1, _08001618 @ =0x08031A28
	adds r0, r1, #0
	movs r1, #1
	movs r2, #3
	bl sub_80049CC
	ldr r1, _0800161C @ =0x08031A38
	adds r0, r1, #0
	movs r1, #3
	movs r2, #5
	bl sub_80049CC
	ldr r1, _08001620 @ =0x08031A3C
	adds r0, r1, #0
	movs r1, #3
	movs r2, #7
	bl sub_80049CC
	ldr r0, [r7]
	bl sub_800147C
_0800160C:
	b _08001626
	.align 2, 0
_08001610: .4byte 0x080319EC
_08001614: .4byte 0x08031A54
_08001618: .4byte 0x08031A28
_0800161C: .4byte 0x08031A38
_08001620: .4byte 0x08031A3C
_08001624:
	.byte 0x41, 0xE0
_08001626:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, _08001654 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08001662
	ldr r0, [r7]
	bl sub_80014B0
	ldr r0, [r7]
	cmp r0, #2
	bne _08001658
	movs r0, #1
	str r0, [r7]
	b _0800165C
	.align 2, 0
_08001654: .4byte 0x03005578
_08001658:
	movs r0, #2
	str r0, [r7]
_0800165C:
	ldr r0, [r7]
	bl sub_800147C
_08001662:
	ldr r0, _08001680 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800168C
	ldr r0, [r7]
	cmp r0, #1
	bne _08001686
	movs r0, #1
	b _080016AA
	.align 2, 0
_08001680: .4byte 0x03005578
_08001684:
	.byte 0x01, 0xE0
_08001686:
	movs r0, #0
	b _080016AA
_0800168A:
	.byte 0x0D, 0xE0
_0800168C:
	ldr r0, _080016A4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080016A8
	movs r0, #0
	b _080016AA
	.align 2, 0
_080016A4: .4byte 0x03005578
_080016A8:
	b _0800160C
_080016AA:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80016B4
sub_80016B4: @ 0x080016B4
	push {r7, lr}
	sub sp, #4
	add r7, sp, #4
	bl sub_80013DC
	ldr r1, _080016E4 @ =0x08031A7C
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_80049CC
	ldr r1, _080016E8 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x7c
	ldrh r0, [r1]
	cmp r0, #0
	bne _080016F0
	ldr r1, _080016EC @ =0x08031A88
	adds r0, r1, #0
	movs r1, #0
	movs r2, #3
	bl sub_8004A08
	b _0800170C
	.align 2, 0
_080016E4: .4byte 0x08031A7C
_080016E8: .4byte 0x03001020
_080016EC: .4byte 0x08031A88
_080016F0:
	ldr r1, _08001714 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x7c
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetStringPointer
	movs r1, #7
	str r1, [sp]
	movs r1, #0
	movs r2, #3
	movs r3, #0xe
	bl sub_8004A08
_0800170C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001714: .4byte 0x03001020

	thumb_func_start sub_8001718
sub_8001718: @ 0x08001718
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _08001808 @ =0x03001020
	ldr r0, [r1, #0x20]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _08001808 @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x28]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x2c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x30]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x34]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x38]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001808 @ =0x03001020
	ldr r2, [r0, #0x44]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl sub_8000B54
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0x13
	bl sub_8001AF4
	movs r0, #2
	bl sub_8004868
	ldr r0, [r7]
	bl sub_8001410
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_800147C
_08001806:
	b _0800180E
	.align 2, 0
_08001808: .4byte 0x03001020
_0800180C:
	.byte 0xCD, 0xE0
_0800180E:
	bl VBlankIntrWait
	bl sub_8021754
	movs r0, #1
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	ldr r0, _08001850 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08001872
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_80014B0
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08001854
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08001858
	.align 2, 0
_08001850: .4byte 0x03005578
_08001854:
	movs r0, #3
	str r0, [r7, #4]
_08001858:
	ldr r0, [r7]
	cmp r0, #0
	bne _08001868
	ldr r0, [r7, #4]
	cmp r0, #2
	bne _08001868
	movs r0, #1
	str r0, [r7, #4]
_08001868:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_800147C
	b _080018BC
_08001872:
	ldr r0, _0800189C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080018BC
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_80014B0
	ldr r0, [r7, #4]
	cmp r0, #2
	bhi _080018A0
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080018A4
	.align 2, 0
_0800189C: .4byte 0x03005578
_080018A0:
	movs r0, #0
	str r0, [r7, #4]
_080018A4:
	ldr r0, [r7]
	cmp r0, #0
	bne _080018B4
	ldr r0, [r7, #4]
	cmp r0, #2
	bne _080018B4
	movs r0, #3
	str r0, [r7, #4]
_080018B4:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_800147C
_080018BC:
	ldr r0, _080018EC @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080018D2
	b _0800198E
_080018D2:
	movs r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #1
	beq _080018F6
	cmp r0, #1
	blo _080018F0
	cmp r0, #2
	beq _08001932
	cmp r0, #3
	beq _08001964
	b _08001984
	.align 2, 0
_080018EC: .4byte 0x03005578
_080018F0:
	movs r0, #1
	str r0, [r7, #8]
	b _08001984
_080018F6:
	bl sub_80016B4
_080018FA:
	b _080018FE
_080018FC:
	.byte 0x11, 0xE0
_080018FE:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, _0800191C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08001920
	b _08001922
	.align 2, 0
_0800191C: .4byte 0x03005578
_08001920:
	b _080018FA
_08001922:
	ldr r0, [r7]
	bl sub_8001410
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_800147C
	b _08001984
_08001932:
	bl sub_80015BC
	cmp r0, #0
	beq _08001954
	ldr r0, _08001950 @ =0x03006030
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_802920C
	bl sub_80046F8
	movs r0, #0xfe
	bl SoftReset
	b _08001962
	.align 2, 0
_08001950: .4byte 0x03006030
_08001954:
	ldr r0, [r7]
	bl sub_8001410
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_800147C
_08001962:
	b _08001984
_08001964:
	bl sub_80014D4
	cmp r0, #0
	beq _08001974
	movs r0, #0xfe
	bl SoftReset
	b _08001982
_08001974:
	ldr r0, [r7]
	bl sub_8001410
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_800147C
_08001982:
	b _08001984
_08001984:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _0800198C
	b _080019AA
_0800198C:
	b _080019A8
_0800198E:
	ldr r0, _080019A4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0xe
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080019A8
	b _080019AA
	.align 2, 0
_080019A4: .4byte 0x03005578
_080019A8:
	b _08001806
_080019AA:
	ldr r0, _080019BC @ =0x03005578
	movs r1, #0
	strh r1, [r0]
	bl sub_8001068
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019BC: .4byte 0x03005578

	thumb_func_start sub_80019C0
sub_80019C0: @ 0x080019C0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08001A08 @ =0x03001020
	ldr r1, [r7]
	str r1, [r0, #0x6c]
	ldr r1, _08001A08 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x88
	ldr r0, [r7, #4]
	str r0, [r1]
	ldr r0, _08001A08 @ =0x03001020
	ldr r2, [r7, #4]
	ldr r1, [r2, #0x5c]
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0xc]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #1
	ldr r1, [r7]
	movs r2, #0
	bl sub_80028E8
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001A08: .4byte 0x03001020

	thumb_func_start sub_8001A0C
sub_8001A0C: @ 0x08001A0C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001A30 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x87
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001A30: .4byte 0x03001020

	thumb_func_start sub_8001A34
sub_8001A34: @ 0x08001A34
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001A50 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x87
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001A50: .4byte 0x03001020

	thumb_func_start sub_8001A54
sub_8001A54: @ 0x08001A54
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001A70 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #6
	bhi _08001AE8
	ldr r0, [r0]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08001A74 @ =_08001A78
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08001A70: .4byte 0x0300118C
_08001A74: .4byte _08001A78
_08001A78: @ jump table
	.4byte _08001A94 @ case 0
	.4byte _08001AA0 @ case 1
	.4byte _08001AAC @ case 2
	.4byte _08001AB8 @ case 3
	.4byte _08001AC4 @ case 4
	.4byte _08001AD0 @ case 5
	.4byte _08001ADC @ case 6
_08001A94:
	movs r0, #0
	movs r1, #0x33
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001AA0:
	movs r0, #0
	movs r1, #0x19
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001AAC:
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001AB8:
	movs r0, #0
	movs r1, #0x18
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001AC4:
	movs r0, #0
	movs r1, #0x13
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001AD0:
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001ADC:
	movs r0, #0
	movs r1, #0xc
	movs r2, #0
	bl sub_80028E8
	b _08001AE8
_08001AE8:
	bl sub_8001068
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8001AF4
sub_8001AF4: @ 0x08001AF4
	push {r7, lr}
	ldr r7, _08001C68 @ =0xFFFFFACC
	add sp, r7
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #1
	lsls r1, r0, #2
	movs r2, #0x88
	lsls r2, r2, #0x14
	subs r0, r2, r1
	ldr r1, [r0]
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x1c]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7, #0x1c]
	movs r3, #0xa4
	lsls r3, r3, #3
	adds r0, r7, r3
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	ldr r0, _08001C6C @ =0x00000524
	adds r1, r7, r0
	ldr r0, _08001C70 @ =0x040000D4
	str r0, [r1]
	adds r0, r7, #0
	ldr r2, _08001C6C @ =0x00000524
	adds r1, r7, r2
	ldr r0, [r1]
	movs r3, #0xa4
	lsls r3, r3, #3
	adds r1, r7, r3
	str r1, [r0]
	adds r0, r7, #0
	ldr r0, _08001C6C @ =0x00000524
	adds r2, r7, r0
	ldr r1, [r2]
	adds r0, r1, #4
	adds r1, r7, #0
	adds r1, #0x20
	str r1, [r0]
	adds r0, r7, #0
	ldr r1, _08001C6C @ =0x00000524
	adds r2, r7, r1
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08001C74 @ =0x81000280
	str r1, [r0]
	adds r0, r7, #0
	ldr r2, _08001C6C @ =0x00000524
	adds r1, r7, r2
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	adds r0, r7, #0
	ldr r3, _08001C6C @ =0x00000524
	adds r1, r7, r3
	ldr r0, _08001C70 @ =0x040000D4
	str r0, [r1]
	adds r0, r7, #0
	ldr r0, _08001C6C @ =0x00000524
	adds r1, r7, r0
	ldr r0, [r1]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #6
	ldr r2, [r7, #0x1c]
	adds r1, r2, r1
	str r1, [r0]
	adds r0, r7, #0
	ldr r1, _08001C6C @ =0x00000524
	adds r2, r7, r1
	ldr r1, [r2]
	adds r0, r1, #4
	adds r1, r7, #0
	adds r1, #0x20
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #6
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	ldr r3, _08001C6C @ =0x00000524
	adds r2, r7, r3
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7, #8]
	ldr r2, [r7, #4]
	subs r1, r1, r2
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #5
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r2, r1
	str r2, [r0]
	adds r0, r7, #0
	ldr r0, _08001C6C @ =0x00000524
	adds r1, r7, r0
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	adds r0, r7, #0
	adds r0, #0x20
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x1c]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r0, r2
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r0]
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #4
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	str r0, [r7, #0x18]
	ldr r2, [r7, #0x14]
	ldr r3, [r7, #0x18]
	movs r0, #0x17
	str r0, [sp]
	ldr r0, [r7, #0x10]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #3
	bl sub_8021520
	adds r0, r7, #0
	ldr r3, _08001C6C @ =0x00000524
	adds r1, r7, r3
	ldr r0, _08001C70 @ =0x040000D4
	str r0, [r1]
	adds r0, r7, #0
	ldr r0, _08001C6C @ =0x00000524
	adds r1, r7, r0
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r2, r1, r3
	str r2, [r0]
	adds r0, r7, #0
	ldr r0, _08001C6C @ =0x00000524
	adds r2, r7, r0
	ldr r1, [r2]
	adds r0, r1, #4
	ldr r1, _08001C78 @ =0x050001E0
	str r1, [r0]
	adds r0, r7, #0
	ldr r1, _08001C6C @ =0x00000524
	adds r2, r7, r1
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08001C7C @ =0x80000010
	str r1, [r0]
	adds r0, r7, #0
	ldr r2, _08001C6C @ =0x00000524
	adds r1, r7, r2
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	movs r0, #0
	bl sub_8021650
	ldr r3, _08001C80 @ =0x00000534
	add sp, r3
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001C68: .4byte 0xFFFFFACC
_08001C6C: .4byte 0x00000524
_08001C70: .4byte 0x040000D4
_08001C74: .4byte 0x81000280
_08001C78: .4byte 0x050001E0
_08001C7C: .4byte 0x80000010
_08001C80: .4byte 0x00000534

	thumb_func_start sub_8001C84
sub_8001C84: @ 0x08001C84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08001EBC @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x7a
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001EBC @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001EC0 @ =0x00000159
	adds r0, r1, #0
	movs r1, #0xc
	movs r2, #0x13
	bl sub_8001AF4
	movs r0, #0x33
	bl sub_80209F8
	ldr r1, _08001EBC @ =0x03001020
	str r0, [r1, #0x20]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x20]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x20]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x20]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x20]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x7e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x20]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x20]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x33
	bl sub_80209F8
	ldr r1, _08001EBC @ =0x03001020
	str r0, [r1, #0x24]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x24]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xce
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x24]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x24]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	ldr r1, _08001EBC @ =0x03001020
	str r0, [r1, #0x44]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x44]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x44]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x44]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x44]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x97
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x44]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x44]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001EC4 @ =0x00000161
	adds r0, r1, #0
	bl sub_80209F8
	ldr r1, _08001EBC @ =0x03001020
	str r0, [r1, #0x28]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x28]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x45
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x93
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _08001EBC @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _08001EBC @ =0x03001020
	ldr r2, [r0, #0x28]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001EBC @ =0x03001020
	ldr r1, [r0, #0x28]
	adds r0, r1, #0
	movs r1, #0x1e
	bl sub_8020F98
	movs r0, #0
	str r0, [r7]
_08001EB4:
	ldr r0, [r7]
	cmp r0, #1
	ble _08001EC8
	b _08001FB8
	.align 2, 0
_08001EBC: .4byte 0x03001020
_08001EC0: .4byte 0x00000159
_08001EC4: .4byte 0x00000161
_08001EC8:
	ldr r1, _08001FB0 @ =0x00000157
	adds r0, r1, #0
	bl sub_80209F8
	ldr r1, _08001FB4 @ =0x03001020
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, #0x34
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x2d
	ldrh r2, [r0, #0x14]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x14]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r0, [r1]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x8d
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08001FB4 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x34
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	movs r1, #0x1f
	bl sub_8020F98
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08001EB4
	.align 2, 0
_08001FB0: .4byte 0x00000157
_08001FB4: .4byte 0x03001020
_08001FB8:
	ldr r0, _08001FD0 @ =0x03001020
	ldr r1, [r0, #0x38]
	adds r0, r1, #0
	movs r1, #0x1a
	bl sub_8020F98
	movs r0, #0
	str r0, [r7]
_08001FC8:
	ldr r0, [r7]
	cmp r0, #1
	ble _08001FD4
	b _080020C4
	.align 2, 0
_08001FD0: .4byte 0x03001020
_08001FD4:
	ldr r1, _080020BC @ =0x00000157
	adds r0, r1, #0
	bl sub_80209F8
	ldr r1, _080020C0 @ =0x03001020
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, #0x3c
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x89
	ldrh r2, [r0, #0x14]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x14]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r0, [r1]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080020C0 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x3c
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	movs r1, #0x1f
	bl sub_8020F98
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08001FC8
	.align 2, 0
_080020BC: .4byte 0x00000157
_080020C0: .4byte 0x03001020
_080020C4:
	ldr r0, _080020DC @ =0x03001020
	ldr r1, [r0, #0x40]
	adds r0, r1, #0
	movs r1, #0x1a
	bl sub_8020F98
	movs r0, #0
	str r0, [r7]
_080020D4:
	ldr r0, [r7]
	cmp r0, #1
	ble _080020E0
	b _080021CC
	.align 2, 0
_080020DC: .4byte 0x03001020
_080020E0:
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	ldr r1, _080021C8 @ =0x03001020
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, #0x2c
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x47
	ldrh r2, [r0, #0x14]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x14]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r0, [r1]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x87
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080021C8 @ =0x03001020
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x2c
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	movs r1, #0x1f
	bl sub_8020F98
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _080020D4
	.align 2, 0
_080021C8: .4byte 0x03001020
_080021CC:
	ldr r0, _08002228 @ =0x03001020
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #0xb
	bl sub_8020F98
	ldr r0, _08002228 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x84
	ldrb r1, [r0]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002228 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x85
	ldrb r1, [r0]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002228 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x86
	ldrb r1, [r0]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002228 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x87
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl sub_80047FC
	bl sub_80028C8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002228: .4byte 0x03001020

	thumb_func_start sub_800222C
sub_800222C: @ 0x0800222C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r1, _080022C0 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #8]
	ldr r0, [r7]
	cmp r0, #0
	bge _0800224A
	movs r0, #0
	str r0, [r7]
_0800224A:
	ldr r0, [r7]
	adds r2, r0, #0
	lsls r1, r2, #4
	subs r1, r1, r0
	lsls r2, r1, #2
	subs r2, r2, r0
	ldr r1, [r7, #8]
	adds r0, r2, #0
	bl Div
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bgt _080022C6
	ldr r1, _080022C0 @ =0x03001020
	ldr r0, [r1, #0x3c]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	movs r0, #0
	str r0, [r7, #0xc]
	ldr r1, _080022C0 @ =0x03001020
	ldr r0, [r1, #0x3c]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080022C0 @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080022C0 @ =0x03001020
	ldr r0, [r1, #0x40]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _080022C0 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08002364
	.align 2, 0
_080022C0: .4byte 0x03001020
_080022C4:
	.byte 0x06, 0xE0
_080022C6:
	ldr r1, _080022E4 @ =0x03001020
	ldr r0, [r1, #0x3c]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _080022E4 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x83
	ldrb r0, [r1]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	bne _080022E8
	b _08002364
	.align 2, 0
_080022E4: .4byte 0x03001020
_080022E8:
	ldr r1, _08002338 @ =0x03001020
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x83
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	cmp r0, #0x1f
	bgt _0800233C
	ldr r0, _08002338 @ =0x03001020
	ldr r1, [r0, #0x3c]
	ldr r2, [r7, #0xc]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_8020F98
	ldr r1, _08002338 @ =0x03001020
	ldr r0, [r1, #0x40]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, _08002338 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08002364
	.align 2, 0
_08002338: .4byte 0x03001020
_0800233C:
	ldr r0, _0800236C @ =0x03001020
	ldr r1, [r0, #0x3c]
	adds r0, r1, #0
	movs r1, #0x1f
	bl sub_8020F98
	ldr r1, _0800236C @ =0x03001020
	ldr r0, [r1, #0x40]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _0800236C @ =0x03001020
	ldr r0, [r1, #0x40]
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	subs r1, #0x20
	bl sub_8020F98
_08002364:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800236C: .4byte 0x03001020

	thumb_func_start sub_8002370
sub_8002370: @ 0x08002370
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08002388 @ =0x00002710
	cmp r0, r1
	ble _0800238C
	ldr r0, _08002388 @ =0x00002710
	str r0, [r7]
	b _080023A4
	.align 2, 0
_08002388: .4byte 0x00002710
_0800238C:
	ldr r0, [r7]
	cmp r0, #0
	bgt _080023A4
	movs r0, #0
	str r0, [r7]
	ldr r0, _080023F0 @ =0x03001104
	ldr r1, [r0]
	cmp r1, #0
	bne _080023A4
	ldr r0, _080023F0 @ =0x03001104
	movs r1, #1
	str r1, [r0]
_080023A4:
	ldr r0, _080023F4 @ =0x030011A8
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, _080023F8 @ =0x03001020
	ldr r2, _080023F8 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r7, #8]
_080023D6:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0xa7
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	cmp r0, r1
	blt _080023FC
	b _080023FE
	.align 2, 0
_080023F0: .4byte 0x03001104
_080023F4: .4byte 0x030011A8
_080023F8: .4byte 0x03001020
_080023FC:
	b _080023D6
_080023FE:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _0800241C
	ldr r1, _08002418 @ =0x03001020
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	movs r0, #0
	str r0, [r7, #8]
	b _0800242A
	.align 2, 0
_08002418: .4byte 0x03001020
_0800241C:
	ldr r1, _08002468 @ =0x03001020
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_0800242A:
	ldr r1, _08002468 @ =0x03001020
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x84
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #8]
	cmp r0, #0x1f
	bgt _0800246C
	ldr r0, _08002468 @ =0x03001020
	ldr r1, [r0, #0x34]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_8020F98
	ldr r1, _08002468 @ =0x03001020
	ldr r0, [r1, #0x38]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	b _08002494
	.align 2, 0
_08002468: .4byte 0x03001020
_0800246C:
	ldr r0, _0800249C @ =0x03001020
	ldr r1, [r0, #0x34]
	adds r0, r1, #0
	movs r1, #0x1f
	bl sub_8020F98
	ldr r1, _0800249C @ =0x03001020
	ldr r0, [r1, #0x38]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _0800249C @ =0x03001020
	ldr r0, [r1, #0x38]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r1, #0x20
	bl sub_8020F98
_08002494:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800249C: .4byte 0x03001020

	thumb_func_start sub_80024A0
sub_80024A0: @ 0x080024A0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _080024B8 @ =0x00002710
	cmp r0, r1
	ble _080024BC
	ldr r0, _080024B8 @ =0x00002710
	str r0, [r7]
	b _080024C6
	.align 2, 0
_080024B8: .4byte 0x00002710
_080024BC:
	ldr r0, [r7]
	cmp r0, #0
	bge _080024C6
	movs r0, #0
	str r0, [r7]
_080024C6:
	ldr r0, _08002514 @ =0x0300115C
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, _08002518 @ =0x03001020
	ldr r2, _08002518 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #2]
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r7, #8]
_080024F8:
	ldr r0, [r7, #4]
	movs r2, #0x9c
	lsls r2, r2, #1
	adds r1, r0, r2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	cmp r0, r1
	blt _0800251C
	b _0800251E
	.align 2, 0
_08002514: .4byte 0x0300115C
_08002518: .4byte 0x03001020
_0800251C:
	b _080024F8
_0800251E:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _0800253C
	ldr r1, _08002538 @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	movs r0, #0
	str r0, [r7, #8]
	b _0800254A
	.align 2, 0
_08002538: .4byte 0x03001020
_0800253C:
	ldr r1, _08002578 @ =0x03001020
	ldr r0, [r1, #0x28]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_0800254A:
	ldr r1, _08002578 @ =0x03001020
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x85
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08002578 @ =0x03001020
	ldr r1, [r0, #0x28]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_8020F98
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002578: .4byte 0x03001020

	thumb_func_start sub_800257C
sub_800257C: @ 0x0800257C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800262C @ =0x03001020
	movs r2, #6
	ldrsh r1, [r0, r2]
	cmp r1, #5
	ble _08002598
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x10
	orrs r2, r1
	str r2, [r0, #0x18]
_08002598:
	ldr r0, _0800262C @ =0x03001020
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	cmp r1, #5
	ble _080025B0
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r2, r1
	str r2, [r0, #0x18]
_080025B0:
	ldr r0, _0800262C @ =0x03001020
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	cmp r1, #0xd
	ble _080025C8
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x14
	orrs r2, r1
	str r2, [r0, #0x18]
_080025C8:
	ldr r0, _0800262C @ =0x03001020
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	cmp r1, #0xd
	ble _080025E0
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r2, r1
	str r2, [r0, #0x18]
_080025E0:
	ldr r0, _0800262C @ =0x03001020
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	cmp r1, #0x12
	ble _080025F8
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r2, r1
	str r2, [r0, #0x18]
_080025F8:
	ldr r0, _0800262C @ =0x03001020
	movs r2, #0x1e
	ldrsh r1, [r0, r2]
	cmp r1, #0xd
	ble _0800260E
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #1
	orrs r2, r1
	str r2, [r0, #0x1c]
_0800260E:
	ldr r0, _0800262C @ =0x03001020
	movs r2, #0x1e
	ldrsh r1, [r0, r2]
	cmp r1, #0x12
	ble _08002624
	ldr r0, _08002630 @ =0x03000E30
	ldr r1, _08002630 @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #2
	orrs r2, r1
	str r2, [r0, #0x1c]
_08002624:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800262C: .4byte 0x03001020
_08002630: .4byte 0x03000E30

	thumb_func_start sub_8002634
sub_8002634: @ 0x08002634
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _080026C0 @ =0x0000270F
	cmp r0, r1
	ble _080026E8
	ldr r0, _080026C4 @ =0x03001020
	ldr r2, _080026C4 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r0, r2]
	cmp r1, #0x17
	bgt _080026CC
	movs r0, #0
	str r0, [r7]
	ldr r0, _080026C4 @ =0x03001020
	ldr r2, _080026C4 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r3, r2, #3
	adds r1, r0, r3
	ldr r0, _080026C4 @ =0x03001020
	ldr r2, _080026C4 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, _080026C4 @ =0x03001020
	ldr r3, _080026C4 @ =0x03001020
	adds r2, r3, #0
	adds r3, #0x82
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080026C8 @ =0x00002710
	adds r0, r1, #0
	bl sub_8002804
	ldr r1, _080026C8 @ =0x00002710
	adds r0, r1, #0
	bl sub_800284C
	movs r0, #0x38
	bl PlaySfx
	bl sub_800257C
	b _080026D0
	.align 2, 0
_080026C0: .4byte 0x0000270F
_080026C4: .4byte 0x03001020
_080026C8: .4byte 0x00002710
_080026CC:
	ldr r0, _080026E0 @ =0x00002710
	str r0, [r7]
_080026D0:
	ldr r1, _080026E4 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x82
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_8002A34
	b _080026F2
	.align 2, 0
_080026E0: .4byte 0x00002710
_080026E4: .4byte 0x03001020
_080026E8:
	ldr r0, [r7]
	cmp r0, #0
	bgt _080026F2
	movs r0, #0
	str r0, [r7]
_080026F2:
	ldr r0, _0800273C @ =0x03001020
	ldr r2, _0800273C @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r0, _08002740 @ =0x030010D0
	ldr r1, [r7]
	str r1, [r0]
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r7, #8]
_08002724:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0xe3
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	cmp r0, r1
	blt _08002744
	b _08002746
	.align 2, 0
_0800273C: .4byte 0x03001020
_08002740: .4byte 0x030010D0
_08002744:
	b _08002724
_08002746:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _08002764
	ldr r1, _08002760 @ =0x03001020
	ldr r0, [r1, #0x2c]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	movs r0, #0
	str r0, [r7, #8]
	b _08002772
	.align 2, 0
_08002760: .4byte 0x03001020
_08002764:
	ldr r1, _080027CC @ =0x03001020
	ldr r0, [r1, #0x2c]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_08002772:
	ldr r1, _080027CC @ =0x03001020
	ldr r0, [r1, #0x44]
	ldr r1, _080027CC @ =0x03001020
	ldr r3, _080027CC @ =0x03001020
	adds r2, r3, #0
	adds r3, #0x82
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r3, #6
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	bl sub_8020F98
	ldr r1, _080027CC @ =0x03001020
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x86
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #8]
	cmp r0, #0x1f
	bgt _080027D0
	ldr r0, _080027CC @ =0x03001020
	ldr r1, [r0, #0x2c]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_8020F98
	ldr r1, _080027CC @ =0x03001020
	ldr r0, [r1, #0x30]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	b _080027F8
	.align 2, 0
_080027CC: .4byte 0x03001020
_080027D0:
	ldr r0, _08002800 @ =0x03001020
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	movs r1, #0x1f
	bl sub_8020F98
	ldr r1, _08002800 @ =0x03001020
	ldr r0, [r1, #0x30]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r1, _08002800 @ =0x03001020
	ldr r0, [r1, #0x30]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r1, #0x20
	bl sub_8020F98
_080027F8:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002800: .4byte 0x03001020

	thumb_func_start sub_8002804
sub_8002804: @ 0x08002804
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800281C @ =0x030010B0
	ldr r1, [r0]
	cmp r1, #0
	beq _08002820
	ldr r0, [r7]
	cmp r0, #0
	bge _08002820
	b _0800283E
	.align 2, 0
_0800281C: .4byte 0x030010B0
_08002820:
	ldr r0, _08002848 @ =0x03001020
	ldr r2, _08002848 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	adds r1, r1, r0
	adds r0, r1, #0
	bl sub_8002370
_0800283E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002848: .4byte 0x03001020

	thumb_func_start sub_800284C
sub_800284C: @ 0x0800284C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002864 @ =0x030010B8
	ldr r1, [r0]
	cmp r1, #0
	beq _08002868
	ldr r0, [r7]
	cmp r0, #0
	bge _08002868
	b _08002886
	.align 2, 0
_08002864: .4byte 0x030010B8
_08002868:
	ldr r0, _08002890 @ =0x03001020
	ldr r2, _08002890 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #2
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	adds r1, r1, r0
	adds r0, r1, #0
	bl sub_80024A0
_08002886:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002890: .4byte 0x03001020

	thumb_func_start sub_8002894
sub_8002894: @ 0x08002894
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080028C4 @ =0x03001020
	ldr r2, _080028C4 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	adds r1, r1, r0
	adds r0, r1, #0
	bl sub_8002634
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080028C4: .4byte 0x03001020

	thumb_func_start sub_80028C8
sub_80028C8: @ 0x080028C8
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl sub_8021650
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80028D8
sub_80028D8: @ 0x080028D8
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl sub_8021688
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80028E8
sub_80028E8: @ 0x080028E8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	cmp r0, #0
	bne _08002908
	ldr r0, _08002904 @ =0x03001020
	ldr r1, [r0, #0x20]
	str r1, [r7, #0xc]
	b _0800290E
	.align 2, 0
_08002904: .4byte 0x03001020
_08002908:
	ldr r0, _08002934 @ =0x03001020
	ldr r1, [r0, #0x24]
	str r1, [r7, #0xc]
_0800290E:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08002938
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x1c]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	b _08002970
	.align 2, 0
_08002934: .4byte 0x03001020
_08002938:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	bl sub_8020D1C
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020F98
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
_08002970:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8002978
sub_8002978: @ 0x08002978
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	cmp r0, #0
	bne _08002994
	ldr r0, _08002990 @ =0x03001020
	ldr r1, [r0, #0x20]
	str r1, [r7, #8]
	b _0800299A
	.align 2, 0
_08002990: .4byte 0x03001020
_08002994:
	ldr r0, _080029C8 @ =0x03001020
	ldr r1, [r0, #0x24]
	str r1, [r7, #8]
_0800299A:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl sub_8020F98
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080029C8: .4byte 0x03001020

	thumb_func_start sub_80029CC
sub_80029CC: @ 0x080029CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080029FC @ =0x03001020
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x82
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	cmp r0, #4
	beq _08002A00
	ldr r0, [r7]
	cmp r0, #5
	beq _08002A00
	b _08002A10
	.align 2, 0
_080029FC: .4byte 0x03001020
_08002A00:
	ldr r0, _08002A30 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x82
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08002A10:
	ldr r0, [r7]
	bl sub_8002A34
	movs r0, #0
	bl sub_8002804
	movs r0, #0
	bl sub_8002894
	movs r0, #0
	bl sub_800284C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002A30: .4byte 0x03001020

	thumb_func_start sub_8002A34
sub_8002A34: @ 0x08002A34
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _08002A88 @ =0x03001020
	ldr r2, _08002A88 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r0, r2]
	adds r2, r7, #4
	adds r3, r7, #0
	adds r3, #8
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp]
	ldr r0, [r7]
	bl sub_8002BE8
	ldr r0, _08002A88 @ =0x03001020
	ldr r2, _08002A88 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r0, r1
	movs r1, #6
	ldrsh r0, [r2, r1]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	bl sub_8002D4C
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002A88: .4byte 0x03001020

	thumb_func_start sub_8002A8C
sub_8002A8C: @ 0x08002A8C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x28]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x34]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x38]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x3c]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x40]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x44]
	adds r0, r1, #0
	movs r1, #1
	bl sub_80210A4
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x28]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002B12
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x28]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002B12:
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x2c]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002B34
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x2c]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002B34:
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x30]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002B56
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x30]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002B56:
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002B78
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x34]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002B78:
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x38]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002B9A
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x38]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002B9A:
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x3c]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002BBC
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x3c]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002BBC:
	ldr r0, _08002BE4 @ =0x03001020
	ldr r1, [r0, #0x40]
	ldrb r0, [r1, #0x1c]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08002BDE
	ldr r0, _08002BE4 @ =0x03001020
	ldr r2, [r0, #0x40]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r1, #0
	bl sub_801F840
_08002BDE:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002BE4: .4byte 0x03001020

	thumb_func_start sub_8002BE8
sub_8002BE8: @ 0x08002BE8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7]
	cmp r0, #6
	bhi _08002C90
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08002C0C @ =_08002C10
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08002C0C: .4byte _08002C10
_08002C10: @ jump table
	.4byte _08002C2C @ case 0
	.4byte _08002C38 @ case 1
	.4byte _08002C44 @ case 2
	.4byte _08002C50 @ case 3
	.4byte _08002C5C @ case 4
	.4byte _08002C72 @ case 5
	.4byte _08002C86 @ case 6
_08002C2C:
	ldr r0, _08002C34 @ =0x08031B10
	str r0, [r7, #0x10]
	b _08002C90
	.align 2, 0
_08002C34: .4byte 0x08031B10
_08002C38:
	ldr r0, _08002C40 @ =0x08031B5B
	str r0, [r7, #0x10]
	b _08002C90
	.align 2, 0
_08002C40: .4byte 0x08031B5B
_08002C44:
	ldr r0, _08002C4C @ =0x08031BA6
	str r0, [r7, #0x10]
	b _08002C90
	.align 2, 0
_08002C4C: .4byte 0x08031BA6
_08002C50:
	ldr r0, _08002C58 @ =0x08031BF1
	str r0, [r7, #0x10]
	b _08002C90
	.align 2, 0
_08002C58: .4byte 0x08031BF1
_08002C5C:
	ldr r0, [r7, #8]
	movs r1, #1
	str r1, [r0]
	ldr r0, [r7, #0xc]
	movs r1, #1
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	movs r1, #1
	str r1, [r0]
	b _08002D42
_08002C70:
	.byte 0x0E, 0xE0
_08002C72:
	ldr r0, [r7, #8]
	movs r1, #5
	str r1, [r0]
	ldr r0, [r7, #0xc]
	movs r1, #5
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	movs r1, #5
	str r1, [r0]
	b _08002D42
_08002C86:
	ldr r0, _08002C8C @ =0x08031C3C
	str r0, [r7, #0x10]
	b _08002C90
	.align 2, 0
_08002C8C: .4byte 0x08031C3C
_08002C90:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	ldr r3, [r7, #0x10]
	adds r1, r2, r3
	ldrb r2, [r1]
	str r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	ldr r3, [r7, #0x10]
	adds r1, r2, r3
	adds r2, r1, #1
	ldrb r1, [r2]
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	ldr r3, [r7, #0x10]
	adds r1, r2, r3
	adds r2, r1, #2
	ldrb r1, [r2]
	str r1, [r0]
	ldr r0, [r7]
	cmp r0, #0
	beq _08002CD6
	cmp r0, #1
	beq _08002D18
	b _08002D40
_08002CD6:
	ldr r0, _08002D10 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0xb
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08002CF0
	ldr r0, [r7, #8]
	ldr r1, [r7, #8]
	ldr r2, [r1]
	adds r1, r2, #2
	str r1, [r0]
_08002CF0:
	ldr r0, _08002D10 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0xc
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08002D0A
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1]
	adds r1, r2, #2
	str r1, [r0]
_08002D0A:
	ldr r0, _08002D14 @ =0x08031B10
	str r0, [r7, #0x10]
	b _08002D40
	.align 2, 0
_08002D10: .4byte 0x03000E30
_08002D14: .4byte 0x08031B10
_08002D18:
	ldr r0, _08002D38 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0xd
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08002D32
	ldr r0, [r7, #8]
	ldr r1, [r7, #8]
	ldr r2, [r1]
	adds r1, r2, #2
	str r1, [r0]
_08002D32:
	ldr r0, _08002D3C @ =0x08031B5B
	str r0, [r7, #0x10]
	b _08002D40
	.align 2, 0
_08002D38: .4byte 0x03000E30
_08002D3C: .4byte 0x08031B5B
_08002D40:
	b _08002D42
_08002D42:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8002D4C
sub_8002D4C: @ 0x08002D4C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, _08002DC4 @ =0x03001020
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x81
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08002DC4 @ =0x03001020
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x7e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08002DC4 @ =0x03001020
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x7f
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08002DC4 @ =0x03001020
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x80
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002DC4: .4byte 0x03001020

	thumb_func_start sub_8002DC8
sub_8002DC8: @ 0x08002DC8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r2, _08002E00 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x7e
	ldrb r1, [r2]
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r2, _08002E00 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x7f
	ldrb r1, [r2]
	str r1, [r0]
	ldr r0, [r7, #8]
	ldr r2, _08002E00 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x80
	ldrb r1, [r2]
	str r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E00: .4byte 0x03001020

	thumb_func_start sub_8002E04
sub_8002E04: @ 0x08002E04
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002E34 @ =0x08031CAC
	ldr r2, _08002E38 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x7e
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r7]
	muls r1, r0, r1
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	lsrs r1, r0, #8
	str r1, [r7, #4]
	ldr r0, _08002E3C @ =0x03001170
	ldr r1, [r0]
	cmp r1, #0
	beq _08002E40
	b _08002E58
	.align 2, 0
_08002E34: .4byte 0x08031CAC
_08002E38: .4byte 0x03001020
_08002E3C: .4byte 0x03001170
_08002E40:
	ldr r0, [r7, #4]
	rsbs r1, r0, #0
	adds r0, r1, #0
	bl sub_8002804
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	ldr r1, _08002E60 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x7e
	ldrb r0, [r1]
	str r0, [r7, #0xc]
_08002E58:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E60: .4byte 0x03001020

	thumb_func_start sub_8002E64
sub_8002E64: @ 0x08002E64
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002EA8 @ =0x08031CAC
	ldr r2, _08002EAC @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x80
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r7]
	muls r1, r0, r1
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	lsrs r1, r0, #8
	str r1, [r7, #4]
	ldr r0, _08002EAC @ =0x03001020
	ldr r2, _08002EAC @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #2
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #4]
	cmp r1, r0
	bhs _08002EB0
	movs r0, #0
	b _08002EBE
	.align 2, 0
_08002EA8: .4byte 0x08031CAC
_08002EAC: .4byte 0x03001020
_08002EB0:
	ldr r0, [r7, #4]
	rsbs r1, r0, #0
	adds r0, r1, #0
	bl sub_800284C
	movs r0, #1
	b _08002EBE
_08002EBE:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8002EC8
sub_8002EC8: @ 0x08002EC8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002F0C @ =0x08031CAC
	ldr r2, _08002F10 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x80
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r7]
	muls r1, r0, r1
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	lsrs r1, r0, #8
	str r1, [r7, #4]
	ldr r0, _08002F10 @ =0x03001020
	ldr r2, _08002F10 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x82
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r2, #2
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #4]
	cmp r1, r0
	bhs _08002F14
	movs r0, #0
	b _08002F18
	.align 2, 0
_08002F0C: .4byte 0x08031CAC
_08002F10: .4byte 0x03001020
_08002F14:
	movs r0, #1
	b _08002F18
_08002F18:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8002F20
sub_8002F20: @ 0x08002F20
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08002F38
	movs r0, #3
	str r0, [r7, #0x10]
_08002F38:
	ldr r1, [r7]
	subs r0, r1, #1
	ldr r2, _08002F58 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x81
	ldrb r1, [r2]
	subs r0, r0, r1
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #5
	cmn r0, r1
	bge _08002F5C
	movs r0, #5
	rsbs r0, r0, #0
	str r0, [r7, #8]
	b _08002F66
	.align 2, 0
_08002F58: .4byte 0x03001020
_08002F5C:
	ldr r0, [r7, #8]
	cmp r0, #5
	ble _08002F66
	movs r0, #5
	str r0, [r7, #8]
_08002F66:
	ldr r0, _08002F94 @ =0x08031CF4
	ldr r2, [r7, #8]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r7, #0x10]
	muls r1, r0, r1
	str r1, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	bl sub_8002894
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x14]
	ldr r0, [r7, #8]
	str r0, [r7, #0x18]
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F94: .4byte 0x08031CF4

	thumb_func_start sub_8002F98
sub_8002F98: @ 0x08002F98
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	bl sub_800C628
	cmp r0, #0
	bne _08002FB2
	movs r0, #1
	rsbs r0, r0, #0
	b _080031AE
_08002FB2:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08002FBA
	b _080030B2
_08002FBA:
	ldr r0, [r7]
	cmp r0, #6
	bls _08002FC2
	b _080030B0
_08002FC2:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08002FD0 @ =_08002FD4
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08002FD0: .4byte _08002FD4
_08002FD4: @ jump table
	.4byte _08002FF0 @ case 0
	.4byte _08003008 @ case 1
	.4byte _08003020 @ case 2
	.4byte _08003038 @ case 3
	.4byte _080030B0 @ case 4
	.4byte _080030B0 @ case 5
	.4byte _08003050 @ case 6
_08002FF0:
	ldr r0, _08003004 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003008
	movs r0, #1
	b _080031AE
	.align 2, 0
_08003004: .4byte 0x03000E30
_08003008:
	ldr r0, _0800301C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003020
	movs r0, #2
	b _080031AE
	.align 2, 0
_0800301C: .4byte 0x03000E30
_08003020:
	ldr r0, _08003034 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003038
	movs r0, #3
	b _080031AE
	.align 2, 0
_08003034: .4byte 0x03000E30
_08003038:
	ldr r0, _0800304C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003050
	movs r0, #6
	b _080031AE
	.align 2, 0
_0800304C: .4byte 0x03000E30
_08003050:
	ldr r0, _08003064 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003068
	movs r0, #0
	b _080031AE
	.align 2, 0
_08003064: .4byte 0x03000E30
_08003068:
	ldr r0, _0800307C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003080
	movs r0, #1
	b _080031AE
	.align 2, 0
_0800307C: .4byte 0x03000E30
_08003080:
	ldr r0, _08003094 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003098
	movs r0, #2
	b _080031AE
	.align 2, 0
_08003094: .4byte 0x03000E30
_08003098:
	ldr r0, _080030AC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080030B0
	movs r0, #3
	b _080031AE
	.align 2, 0
_080030AC: .4byte 0x03000E30
_080030B0:
	b _080031A8
_080030B2:
	ldr r0, [r7]
	cmp r0, #6
	bls _080030BA
	b _080031A8
_080030BA:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080030C8 @ =_080030CC
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080030C8: .4byte _080030CC
_080030CC: @ jump table
	.4byte _08003148 @ case 0
	.4byte _08003130 @ case 1
	.4byte _08003118 @ case 2
	.4byte _08003100 @ case 3
	.4byte _080031A8 @ case 4
	.4byte _080031A8 @ case 5
	.4byte _080030E8 @ case 6
_080030E8:
	ldr r0, _080030FC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003100
	movs r0, #3
	b _080031AE
	.align 2, 0
_080030FC: .4byte 0x03000E30
_08003100:
	ldr r0, _08003114 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003118
	movs r0, #2
	b _080031AE
	.align 2, 0
_08003114: .4byte 0x03000E30
_08003118:
	ldr r0, _0800312C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003130
	movs r0, #1
	b _080031AE
	.align 2, 0
_0800312C: .4byte 0x03000E30
_08003130:
	ldr r0, _08003144 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003148
	movs r0, #0
	b _080031AE
	.align 2, 0
_08003144: .4byte 0x03000E30
_08003148:
	ldr r0, _0800315C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003160
	movs r0, #6
	b _080031AE
	.align 2, 0
_0800315C: .4byte 0x03000E30
_08003160:
	ldr r0, _08003174 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003178
	movs r0, #3
	b _080031AE
	.align 2, 0
_08003174: .4byte 0x03000E30
_08003178:
	ldr r0, _0800318C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003190
	movs r0, #2
	b _080031AE
	.align 2, 0
_0800318C: .4byte 0x03000E30
_08003190:
	ldr r0, _080031A4 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080031A8
	movs r0, #1
	b _080031AE
	.align 2, 0
_080031A4: .4byte 0x03000E30
_080031A8:
	movs r0, #1
	rsbs r0, r0, #0
	b _080031AE
_080031AE:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80031B8
sub_80031B8: @ 0x080031B8
	push {r7, lr}
	sub sp, #0x48
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	str r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x28
	adds r0, r7, #0
	adds r0, #0x28
	adds r2, r0, #2
	movs r0, #0
	bl sub_801F6A0
	adds r0, r7, #0
	adds r0, #0x28
	adds r1, r0, #4
	adds r0, r7, #0
	adds r0, #0x28
	adds r2, r0, #6
	movs r0, #1
	bl sub_801F6A0
	adds r0, r7, #0
	adds r0, #0x28
	adds r1, r0, #0
	adds r1, #8
	adds r0, r7, #0
	adds r0, #0x28
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #2
	bl sub_801F6A0
	bl sub_8020174
	bl sub_801F3C8
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_801F400
	movs r0, #0
	movs r1, #0
	bl sub_802014C
	movs r0, #0
	bl sub_801E828
	movs r1, #0xb2
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	movs r1, #0xb2
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x10]
	movs r1, #0xb2
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x14]
	movs r1, #0xb1
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x18]
	movs r1, #0xb1
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x1c]
	movs r1, #0xb1
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x20]
	ldr r1, _080033A4 @ =0x0000015F
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x24]
	ldr r0, [r7, #0x24]
	movs r1, #0xa6
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x24]
	movs r1, #0
	str r1, [r0, #0x34]
	ldr r0, [r7, #0x24]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x24]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	movs r1, #0xd0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	movs r1, #0x98
	lsls r1, r1, #7
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x10]
	movs r1, #0xd0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x10]
	movs r1, #0xd8
	lsls r1, r1, #8
	str r1, [r0, #0x34]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x14]
	movs r1, #0xd0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x14]
	movs r1, #0xb4
	lsls r1, r1, #9
	str r1, [r0, #0x34]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x18]
	movs r1, #0xd0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x18]
	movs r1, #0xf8
	lsls r1, r1, #9
	str r1, [r0, #0x34]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x18]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x1c]
	movs r1, #0xd0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x1c]
	movs r1, #0x88
	lsls r1, r1, #0xa
	str r1, [r0, #0x34]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x20]
	movs r1, #0xd0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x20]
	movs r1, #0x94
	lsls r1, r1, #0xa
	str r1, [r0, #0x34]
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x20]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
_080033A0:
	b _080033AA
	.align 2, 0
_080033A4: .4byte 0x0000015F
_080033A8:
	.byte 0x36, 0xE2
_080033AA:
	ldr r0, [r7, #8]
	cmp r0, #6
	bls _080033B2
	b _08003502
_080033B2:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080033C0 @ =_080033C4
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080033C0: .4byte _080033C4
_080033C4: @ jump table
	.4byte _080033E0 @ case 0
	.4byte _0800340C @ case 1
	.4byte _08003438 @ case 2
	.4byte _08003464 @ case 3
	.4byte _08003490 @ case 4
	.4byte _080034B2 @ case 5
	.4byte _080034E0 @ case 6
_080033E0:
	ldr r0, _08003404 @ =0x00000165
	str r0, [r7, #4]
	ldr r0, _08003408 @ =0x03001020
	movs r2, #6
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #0
	bl sub_8002BE8
	b _08003502
	.align 2, 0
_08003404: .4byte 0x00000165
_08003408: .4byte 0x03001020
_0800340C:
	movs r0, #0xaf
	lsls r0, r0, #1
	str r0, [r7, #4]
	ldr r0, _08003434 @ =0x03001020
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #1
	bl sub_8002BE8
	b _08003502
	.align 2, 0
_08003434: .4byte 0x03001020
_08003438:
	movs r0, #0xac
	lsls r0, r0, #1
	str r0, [r7, #4]
	ldr r0, _08003460 @ =0x03001020
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #2
	bl sub_8002BE8
	b _08003502
	.align 2, 0
_08003460: .4byte 0x03001020
_08003464:
	ldr r0, _08003488 @ =0x0000015D
	str r0, [r7, #4]
	ldr r0, _0800348C @ =0x03001020
	movs r2, #0x1e
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #3
	bl sub_8002BE8
	b _08003502
	.align 2, 0
_08003488: .4byte 0x0000015D
_0800348C: .4byte 0x03001020
_08003490:
	movs r0, #0xae
	lsls r0, r0, #1
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #4
	bl sub_8002BE8
	b _08003502
_080034B2:
	ldr r0, _080034D8 @ =0x00000153
	str r0, [r7, #4]
	ldr r0, _080034DC @ =0x03001020
	movs r2, #6
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #5
	bl sub_8002BE8
	b _08003502
	.align 2, 0
_080034D8: .4byte 0x00000153
_080034DC: .4byte 0x03001020
_080034E0:
	movs r0, #0xab
	lsls r0, r0, #1
	str r0, [r7, #4]
	movs r0, #0xe
	str r0, [r7, #0x40]
	ldr r1, [r7, #0x40]
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r7, #0
	adds r0, #0x3c
	str r0, [sp]
	movs r0, #6
	bl sub_8002BE8
	b _08003502
_08003502:
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x40]
	bl sub_8020F98
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #0x34]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x3c]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x38]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r1, [r7, #0x18]
	adds r0, r1, #0
	movs r1, #0x11
	bl sub_8020F98
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	movs r1, #0x11
	bl sub_8020F98
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	movs r1, #0x11
	bl sub_8020F98
	ldr r0, [r7, #8]
	cmp r0, #5
	bne _08003578
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8020F98
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	bl sub_8020F98
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	movs r1, #0x11
	bl sub_8020F98
	b _08003712
_08003578:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _08003586
	ldr r0, [r7, #8]
	cmp r0, #6
	beq _08003586
	b _080035DC
_08003586:
	ldr r0, _080035D8 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080035A0
	ldr r1, [r7, #0x18]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8020F98
_080035A0:
	ldr r0, _080035D8 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080035BA
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	movs r1, #1
	bl sub_8020F98
_080035BA:
	ldr r0, _080035D8 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080035D4
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	movs r1, #2
	bl sub_8020F98
_080035D4:
	b _08003712
	.align 2, 0
_080035D8: .4byte 0x03000E30
_080035DC:
	ldr r0, [r7, #8]
	cmp r0, #1
	bne _08003648
	ldr r0, _08003644 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003602
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8020F98
_08003602:
	ldr r0, _08003644 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003622
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	bl sub_8020F98
_08003622:
	ldr r0, _08003644 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x14
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003642
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	bl sub_8020F98
_08003642:
	b _08003712
	.align 2, 0
_08003644: .4byte 0x03000E30
_08003648:
	ldr r0, [r7, #8]
	cmp r0, #2
	bne _080036B4
	ldr r0, _080036B0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x15
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800366E
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8020F98
_0800366E:
	ldr r0, _080036B0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x16
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800368E
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	bl sub_8020F98
_0800368E:
	ldr r0, _080036B0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x17
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080036AE
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	bl sub_8020F98
_080036AE:
	b _08003712
	.align 2, 0
_080036B0: .4byte 0x03000E30
_080036B4:
	ldr r0, [r7, #8]
	cmp r0, #3
	bne _08003712
	ldr r0, _08003768 @ =0x03000E30
	ldr r1, [r0, #0x18]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _080036D6
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8020F98
_080036D6:
	ldr r0, _08003768 @ =0x03000E30
	ldr r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080036F4
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	bl sub_8020F98
_080036F4:
	ldr r0, _08003768 @ =0x03000E30
	ldr r1, [r0, #0x1c]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08003712
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	bl sub_8020F98
_08003712:
	bl sub_801F170
	ldr r1, _0800376C @ =0x00000163
	adds r0, r1, #0
	bl RLUnCompVram_Wrapper
	ldr r1, _0800376C @ =0x00000163
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0xff
	bl sub_801F244
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #7
	movs r2, #0x10
	bl sub_801F1B4
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0x9f
	bl sub_801F244
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	bl VBlankIntrWait
	movs r0, #0
	bl sub_801E7A0
	ldr r0, [r7, #8]
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #8]
_08003764:
	b _08003772
	.align 2, 0
_08003768: .4byte 0x03000E30
_0800376C: .4byte 0x00000163
_08003770:
	.byte 0x4C, 0xE0
_08003772:
	bl VBlankIntrWait
	bl sub_8021754
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	ldr r0, _080037A0 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080037A4
	b _0800380C
	.align 2, 0
_080037A0: .4byte 0x03005578
_080037A4:
	ldr r0, _080037D0 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080037D8
	ldr r0, [r7]
	movs r1, #1
	bl sub_8002F98
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _080037D4
	b _08003764
	.align 2, 0
_080037D0: .4byte 0x03005578
_080037D4:
	b _0800380C
_080037D6:
	.byte 0x18, 0xE0
_080037D8:
	ldr r0, _08003804 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800380A
	ldr r0, [r7]
	movs r1, #0
	bl sub_8002F98
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _08003808
	b _08003764
	.align 2, 0
_08003804: .4byte 0x03005578
_08003808:
	b _0800380C
_0800380A:
	b _08003764
_0800380C:
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _08003816
	b _08003818
_08003816:
	b _080033A0
_08003818:
	ldr r1, [r7, #0x24]
	adds r0, r1, #0
	bl sub_80203E4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	bl sub_80203E4
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_80203E4
	ldr r1, [r7, #0x14]
	adds r0, r1, #0
	bl sub_80203E4
	ldr r1, [r7, #0x18]
	adds r0, r1, #0
	bl sub_80203E4
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl sub_80203E4
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	bl sub_80203E4
	bl sub_801F3C8
	bl VBlankIntrWait
	adds r0, r7, #0
	adds r0, #0x28
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x28
	ldrh r2, [r0, #2]
	movs r0, #0
	bl sub_801F704
	adds r0, r7, #0
	adds r0, #0x28
	ldrh r1, [r0, #4]
	adds r0, r7, #0
	adds r0, #0x28
	ldrh r2, [r0, #6]
	movs r0, #1
	bl sub_801F704
	adds r0, r7, #0
	adds r0, #0x28
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	adds r0, #0x28
	ldrh r2, [r0, #0xa]
	movs r0, #2
	bl sub_801F704
	bl sub_80201BC
	ldr r0, _080038A4 @ =0x03005578
	movs r1, #0
	strh r1, [r0]
	bl sub_8000B54
	add sp, #0x48
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080038A4: .4byte 0x03005578

	thumb_func_start sub_80038A8
sub_80038A8: @ 0x080038A8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080038DC @ =0x03001020
	ldr r2, [r0, #0x4c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080038DC @ =0x03001020
	ldr r2, [r0, #0x50]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080038DC: .4byte 0x03001020

	thumb_func_start sub_80038E0
sub_80038E0: @ 0x080038E0
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800393C @ =0x03001020
	ldr r2, [r0, #0x4c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800393C @ =0x03001020
	ldr r2, [r0, #0x4c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800393C @ =0x03001020
	ldr r2, [r0, #0x50]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800393C @ =0x03001020
	ldr r2, [r0, #0x50]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800393C: .4byte 0x03001020

	thumb_func_start sub_8003940
sub_8003940: @ 0x08003940
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r1, _080039D4 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x76
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, _080039D8 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	subs r0, r0, r1
	str r0, [r7]
	ldr r1, _080039D4 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x78
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, _080039D8 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8021BC4
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #8]
	ldr r1, _080039D4 @ =0x03001020
	ldr r0, [r1, #0x4c]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	adds r1, #0x40
	movs r2, #0xff
	ands r1, r2
	lsrs r2, r1, #4
	adds r1, r2, #0
	bl sub_8020F98
	ldr r1, _080039D8 @ =0x03000EE8
	ldr r0, [r1]
	ldr r2, _080039D4 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x76
	movs r1, #0
	ldrsh r3, [r2, r1]
	lsls r1, r3, #0xa
	ldr r3, _080039D4 @ =0x03001020
	adds r2, r3, #0
	adds r3, #0x78
	movs r2, #0
	ldrsh r4, [r3, r2]
	lsls r2, r4, #0xa
	movs r3, #0x80
	lsls r3, r3, #0xa
	bl sub_8009464
	cmp r0, #0
	beq _080039DC
	ldr r0, _080039D4 @ =0x03001020
	ldr r2, [r0, #0x50]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _080039FC
	.align 2, 0
_080039D4: .4byte 0x03001020
_080039D8: .4byte 0x03000EE8
_080039DC:
	ldr r0, _08003A04 @ =0x03001020
	ldr r1, [r0, #0x50]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8020F98
	ldr r0, _08003A04 @ =0x03001020
	ldr r2, [r0, #0x50]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080039FC:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A04: .4byte 0x03001020

	thumb_func_start sub_8003A08
sub_8003A08: @ 0x08003A08
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _08003B50 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003B18
	ldr r1, _08003B54 @ =0x00000213
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #8]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r0, [r7, #8]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x5d
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x5c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08003B50 @ =0x03001020
	ldr r1, [r7, #8]
	str r1, [r0, #0x4c]
	ldr r0, _08003B50 @ =0x03001020
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x50]
	ldr r0, _08003B50 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x7a
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08003B18:
	ldr r1, _08003B50 @ =0x03001020
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x76
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, _08003B50 @ =0x03001020
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x78
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B50: .4byte 0x03001020
_08003B54: .4byte 0x00000213

	thumb_func_start sub_8003B58
sub_8003B58: @ 0x08003B58
	push {r7, lr}
	mov r7, sp
	ldr r0, _08003B78 @ =0x03001020
	ldr r1, [r0, #0x48]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0x1d
	bne _08003B80
	ldr r0, _08003B7C @ =0x03000E30
	ldr r1, _08003B7C @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	orrs r2, r1
	str r2, [r0, #0x18]
	b _08003BFA
	.align 2, 0
_08003B78: .4byte 0x03001020
_08003B7C: .4byte 0x03000E30
_08003B80:
	ldr r1, _08003C00 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x70
	ldr r0, _08003C00 @ =0x03001020
	ldr r2, _08003C00 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x70
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x70
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003C00 @ =0x03001020
	ldr r1, _08003C00 @ =0x03001020
	ldr r3, [r1, #0x48]
	adds r2, r3, #0
	adds r1, r3, #0
	adds r1, #0x45
	adds r2, r0, #0
	adds r0, #0x74
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08003C00 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x70
	ldr r2, _08003C00 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x72
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003BFA
	ldr r0, _08003C00 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x70
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08003C00 @ =0x03001020
	ldr r1, [r0, #0x48]
	adds r0, r1, #0
	bl sub_8021068
_08003BFA:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C00: .4byte 0x03001020

	thumb_func_start sub_8003C04
sub_8003C04: @ 0x08003C04
	push {r7, lr}
	mov r7, sp
	ldr r0, _08003C2C @ =0x03001020
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08003C24
	ldr r0, _08003C2C @ =0x03001020
	ldr r2, [r0, #0x48]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08003C24:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C2C: .4byte 0x03001020

	thumb_func_start sub_8003C30
sub_8003C30: @ 0x08003C30
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003C80 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	beq _08003C44
	bl sub_8003940
_08003C44:
	ldr r1, _08003C80 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	cmp r0, #0
	beq _08003C54
	bl sub_8003B58
_08003C54:
	ldr r1, _08003C80 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x87
	ldrb r0, [r1]
	cmp r0, #0
	beq _08003C78
	ldr r1, _08003C80 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x88
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x56
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	bl sub_800222C
_08003C78:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C80: .4byte 0x03001020

	thumb_func_start sub_8003C84
sub_8003C84: @ 0x08003C84
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08003D5C @ =0x0000020D
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08003D60 @ =0x03001020
	ldr r1, [r7, #4]
	str r1, [r0, #0x48]
	ldr r0, _08003D60 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x70
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08003D60 @ =0x03001020
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #4
	subs r2, r2, r1
	lsls r1, r2, #3
	adds r2, r0, #0
	adds r0, #0x72
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003D60 @ =0x03001020
	adds r1, r0, #0
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08003D64 @ =0x03000E30
	ldr r1, _08003D64 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r3, #0x80
	adds r1, r2, #0
	bics r1, r3
	str r1, [r0, #0x18]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003D5C: .4byte 0x0000020D
_08003D60: .4byte 0x03001020
_08003D64: .4byte 0x03000E30

	thumb_func_start sub_8003D68
sub_8003D68: @ 0x08003D68
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	ldr r1, _08003DD4 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x70
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7]
	ldr r1, _08003DD4 @ =0x03001020
	adds r0, r1, #0
	adds r1, #0x72
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	movs r0, #1
	bl sub_8003C84
	ldr r1, _08003DD4 @ =0x03001020
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x70
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, _08003DD4 @ =0x03001020
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x72
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, _08003DD4 @ =0x03001020
	ldr r0, [r1, #0x48]
	ldr r2, _08003DD4 @ =0x03001020
	adds r1, r2, #0
	adds r2, #0x74
	ldrb r1, [r2]
	bl sub_8020F98
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003DD4: .4byte 0x03001020

	thumb_func_start sub_8003DD8
sub_8003DD8: @ 0x08003DD8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	ldr r1, _08003E5C @ =0x0000020A
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x90
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08003E60 @ =0x03001020
	ldr r1, [r7, #4]
	str r1, [r0, #0x54]
	movs r0, #0
	str r0, [r7]
_08003E52:
	ldr r0, [r7]
	cmp r0, #3
	bls _08003E64
	b _08003EFC
	.align 2, 0
_08003E5C: .4byte 0x0000020A
_08003E60: .4byte 0x03001020
_08003E64:
	ldr r1, _08003EF4 @ =0x00000231
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0xbc
	ldrh r2, [r0, #0x14]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x90
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08003EF8 @ =0x03001020
	ldr r2, [r7]
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r7, #4]
	str r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08003E52
	.align 2, 0
_08003EF4: .4byte 0x00000231
_08003EF8: .4byte 0x03001020
_08003EFC:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8003F04
sub_8003F04: @ 0x08003F04
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08003F22
	ldr r0, [r7]
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	str r0, [r7]
_08003F22:
	movs r0, #0
	str r0, [r7, #8]
_08003F26:
	ldr r0, [r7, #4]
	ldr r1, _08003F30 @ =0x000003E7
	cmp r0, r1
	bgt _08003F34
	b _08003F4C
	.align 2, 0
_08003F30: .4byte 0x000003E7
_08003F34:
	ldr r0, [r7, #4]
	ldr r2, _08003F48 @ =0xFFFFFC18
	adds r1, r0, r2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	movs r0, #1
	str r0, [r7, #0xc]
	b _08003F26
	.align 2, 0
_08003F48: .4byte 0xFFFFFC18
_08003F4C:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08003F62
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	adds r2, r1, #1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, #1
	str r0, [r7]
_08003F62:
	movs r0, #0
	str r0, [r7, #8]
_08003F66:
	ldr r0, [r7, #4]
	cmp r0, #0x63
	bgt _08003F6E
	b _08003F82
_08003F6E:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	subs r1, #0x64
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	movs r0, #1
	str r0, [r7, #0xc]
	b _08003F66
_08003F82:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08003F98
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	adds r2, r1, #1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, #1
	str r0, [r7]
_08003F98:
	movs r0, #0
	str r0, [r7, #8]
_08003F9C:
	ldr r0, [r7, #4]
	cmp r0, #9
	bgt _08003FA4
	b _08003FB8
_08003FA4:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	subs r1, #0xa
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	movs r0, #1
	str r0, [r7, #0xc]
	b _08003F9C
_08003FB8:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08003FCE
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	adds r2, r1, #1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, #1
	str r0, [r7]
_08003FCE:
	movs r0, #0
	str r0, [r7, #8]
_08003FD2:
	ldr r0, [r7, #4]
	cmp r0, #0
	bgt _08003FDA
	b _08003FEC
_08003FDA:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	movs r0, #1
	str r0, [r7, #0xc]
	b _08003FD2
_08003FEC:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08004002
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	adds r2, r1, #1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, #1
	str r0, [r7]
_08004002:
	ldr r0, [r7]
	movs r1, #0
	strb r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8004010
sub_8004010: @ 0x08004010
	push {r4, r7, lr}
	sub sp, #0x30
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	str r0, [r7, #0x28]
	movs r0, #1
	str r0, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #4]
	bl sub_8003F04
	ldr r0, [r7]
	cmp r0, #1
	bne _08004036
	b _08004162
_08004036:
	cmp r0, #1
	blo _08004042
	cmp r0, #2
	bne _08004040
	b _0800422A
_08004040:
	b _080042F2
_08004042:
	ldr r0, _0800406C @ =0x03001020
	ldr r2, [r0, #0x54]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800406C @ =0x03001020
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	movs r1, #1
	bl sub_8020F98
_08004062:
	ldr r0, [r7, #0x28]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08004070
	b _080040D4
	.align 2, 0
_0800406C: .4byte 0x03001020
_08004070:
	ldr r0, _080040D0 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080040D0 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r2, _080040D0 @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r3, r2, #0
	adds r3, #0x54
	adds r2, r3, r4
	adds r1, #1
	str r1, [r0]
	ldr r0, [r2]
	ldr r1, [r7, #0x28]
	ldrb r2, [r1]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	b _08004062
	.align 2, 0
_080040D0: .4byte 0x03001020
_080040D4:
	ldr r0, _08004130 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08004130 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r2, _08004130 @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r3, r2, #0
	adds r3, #0x54
	adds r2, r3, r4
	adds r1, #1
	str r1, [r0]
	ldr r1, [r2]
	adds r0, r1, #0
	movs r1, #0xa
	bl sub_8020F98
_08004128:
	ldr r0, [r7, #0x2c]
	cmp r0, #4
	bls _08004134
	b _08004160
	.align 2, 0
_08004130: .4byte 0x03001020
_08004134:
	ldr r2, _0800415C @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r2, #0x54
	adds r3, r2, r4
	ldr r2, [r3]
	adds r3, r2, #0
	adds r2, #0x2d
	ldrb r3, [r2]
	movs r4, #4
	orrs r3, r4
	adds r4, r3, #0
	strb r4, [r2]
	adds r1, #1
	str r1, [r0]
	b _08004128
	.align 2, 0
_0800415C: .4byte 0x03001020
_08004160:
	b _080042F2
_08004162:
	ldr r0, _0800418C @ =0x03001020
	ldr r2, [r0, #0x54]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800418C @ =0x03001020
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	movs r1, #2
	bl sub_8020F98
_08004182:
	ldr r0, [r7, #0x28]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08004190
	b _080041F4
	.align 2, 0
_0800418C: .4byte 0x03001020
_08004190:
	ldr r0, _080041F0 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080041F0 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r2, _080041F0 @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r3, r2, #0
	adds r3, #0x54
	adds r2, r3, r4
	adds r1, #1
	str r1, [r0]
	ldr r0, [r2]
	ldr r1, [r7, #0x28]
	ldrb r2, [r1]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	b _08004182
	.align 2, 0
_080041F0: .4byte 0x03001020
_080041F4:
	ldr r0, [r7, #0x2c]
	cmp r0, #4
	bls _080041FC
	b _08004228
_080041FC:
	ldr r2, _08004224 @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r2, #0x54
	adds r3, r2, r4
	ldr r2, [r3]
	adds r3, r2, #0
	adds r2, #0x2d
	ldrb r3, [r2]
	movs r4, #4
	orrs r3, r4
	adds r4, r3, #0
	strb r4, [r2]
	adds r1, #1
	str r1, [r0]
	b _080041F4
	.align 2, 0
_08004224: .4byte 0x03001020
_08004228:
	b _080042F2
_0800422A:
	ldr r0, _08004254 @ =0x03001020
	ldr r2, [r0, #0x54]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08004254 @ =0x03001020
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8020F98
_0800424A:
	ldr r0, [r7, #0x28]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08004258
	b _080042BC
	.align 2, 0
_08004254: .4byte 0x03001020
_08004258:
	ldr r0, _080042B8 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080042B8 @ =0x03001020
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, #0x54
	adds r1, r0, r1
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r2, _080042B8 @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r3, r2, #0
	adds r3, #0x54
	adds r2, r3, r4
	adds r1, #1
	str r1, [r0]
	ldr r0, [r2]
	ldr r1, [r7, #0x28]
	ldrb r2, [r1]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	b _0800424A
	.align 2, 0
_080042B8: .4byte 0x03001020
_080042BC:
	ldr r0, [r7, #0x2c]
	cmp r0, #4
	bls _080042C4
	b _080042F0
_080042C4:
	ldr r2, _080042EC @ =0x03001020
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r3, r1, #0
	lsls r4, r3, #2
	adds r2, #0x54
	adds r3, r2, r4
	ldr r2, [r3]
	adds r3, r2, #0
	adds r2, #0x2d
	ldrb r3, [r2]
	movs r4, #4
	orrs r3, r4
	adds r4, r3, #0
	strb r4, [r2]
	adds r1, #1
	str r1, [r0]
	b _080042BC
	.align 2, 0
_080042EC: .4byte 0x03001020
_080042F0:
	b _080042F2
_080042F2:
	add sp, #0x30
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80042FC
sub_80042FC: @ 0x080042FC
	push {r7, lr}
	mov r7, sp
	ldr r0, _08004394 @ =0x03001020
	ldr r1, [r0, #0x54]
	cmp r1, #0
	beq _0800431C
	ldr r0, _08004394 @ =0x03001020
	ldr r2, [r0, #0x54]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800431C:
	ldr r0, _08004394 @ =0x03001020
	ldr r1, [r0, #0x58]
	cmp r1, #0
	beq _08004338
	ldr r0, _08004394 @ =0x03001020
	ldr r2, [r0, #0x58]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08004338:
	ldr r0, _08004394 @ =0x03001020
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	beq _08004354
	ldr r0, _08004394 @ =0x03001020
	ldr r2, [r0, #0x5c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08004354:
	ldr r0, _08004394 @ =0x03001020
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _08004370
	ldr r0, _08004394 @ =0x03001020
	ldr r2, [r0, #0x60]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08004370:
	ldr r0, _08004394 @ =0x03001020
	ldr r1, [r0, #0x64]
	cmp r1, #0
	beq _0800438C
	ldr r0, _08004394 @ =0x03001020
	ldr r2, [r0, #0x64]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800438C:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004394: .4byte 0x03001020

	thumb_func_start sub_8004398
sub_8004398: @ 0x08004398
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800444C @ =0x03001020
	ldr r1, [r0, #0x54]
	cmp r1, #0
	beq _080043C6
	ldr r0, _0800444C @ =0x03001020
	ldr r2, [r0, #0x54]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0800444C @ =0x03001020
	ldr r0, [r1, #0x54]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_080043C6:
	ldr r0, _0800444C @ =0x03001020
	ldr r1, [r0, #0x58]
	cmp r1, #0
	beq _080043F0
	ldr r0, _0800444C @ =0x03001020
	ldr r2, [r0, #0x58]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0800444C @ =0x03001020
	ldr r0, [r1, #0x58]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_080043F0:
	ldr r0, _0800444C @ =0x03001020
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	beq _0800441A
	ldr r0, _0800444C @ =0x03001020
	ldr r2, [r0, #0x5c]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0800444C @ =0x03001020
	ldr r0, [r1, #0x5c]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_0800441A:
	ldr r0, _0800444C @ =0x03001020
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _08004444
	ldr r0, _0800444C @ =0x03001020
	ldr r2, [r0, #0x60]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0800444C @ =0x03001020
	ldr r0, [r1, #0x60]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
_08004444:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800444C: .4byte 0x03001020

	thumb_func_start sub_8004450
sub_8004450: @ 0x08004450
	push {r4, r7, lr}
	mov r7, sp
	movs r0, #2
	bl sub_801E828
	bl sub_801F170
	bl sub_8000C10
	movs r0, #0
	bl sub_80204F8
	bl sub_801FC2C
	ldr r0, _08004550 @ =0x03000E30
	ldr r1, _08004554 @ =0x03000ED8
	ldr r2, [r1]
	adds r1, r2, #0
	ldrb r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	bl sub_80046F8
	ldr r4, _08004554 @ =0x03000ED8
	ldr r0, _08004554 @ =0x03000ED8
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80057C4
	str r0, [r4]
	ldr r1, _08004558 @ =0x00000155
	adds r0, r1, #0
	bl RLUnCompVram_Wrapper
	ldr r1, _08004558 @ =0x00000155
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0xff
	bl sub_801F244
	movs r0, #2
	bl sub_801E7A0
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #0x10]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x10]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0800455C @ =0x03001020
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08004560 @ =0x00002710
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
_0800454E:
	b _08004566
	.align 2, 0
_08004550: .4byte 0x03000E30
_08004554: .4byte 0x03000ED8
_08004558: .4byte 0x00000155
_0800455C: .4byte 0x03001020
_08004560: .4byte 0x00002710
_08004564:
	.byte 0x11, 0xE0
_08004566:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, _08004584 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0xb
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08004588
	b _0800458A
	.align 2, 0
_08004584: .4byte 0x03005578
_08004588:
	b _0800454E
_0800458A:
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8004590
sub_8004590: @ 0x08004590
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08004608 @ =0x03001020
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #6]
	ldr r0, _08004608 @ =0x03001020
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, _08004608 @ =0x03001020
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x16]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x16]
	ldr r0, _08004608 @ =0x03001020
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r1, _08004608 @ =0x03001020
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x81
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004608: .4byte 0x03001020

	thumb_func_start sub_800460C
sub_800460C: @ 0x0800460C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080046E8 @ =0x03006030
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_802920C
	ldr r0, _080046EC @ =0x03000ED8
	ldr r1, _080046F0 @ =0x03000E30
	ldrb r2, [r1, #0xc]
	str r2, [r0]
	ldr r0, _080046F4 @ =0x03001020
	ldr r1, _080046F0 @ =0x03000E30
	ldrb r2, [r1, #0xe]
	adds r1, r2, #0
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #6]
	ldr r0, _080046F4 @ =0x03001020
	ldr r1, _080046F0 @ =0x03000E30
	ldrb r2, [r1, #0xf]
	adds r1, r2, #0
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, _080046F4 @ =0x03001020
	ldr r1, _080046F0 @ =0x03000E30
	ldrb r2, [r1, #0x10]
	adds r1, r2, #0
	ldrh r2, [r0, #0x16]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x16]
	ldr r0, _080046F4 @ =0x03001020
	ldr r1, _080046F0 @ =0x03000E30
	ldrb r2, [r1, #0x11]
	adds r1, r2, #0
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r0, _080046F4 @ =0x03001020
	ldr r1, _080046F0 @ =0x03000E30
	ldr r2, [r1, #0x7c]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r0, _080046F4 @ =0x03001020
	ldr r2, _080046F0 @ =0x03000E30
	adds r1, r2, #0
	adds r2, #0x80
	ldr r3, [r2]
	adds r1, r3, #0
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r0, _080046F4 @ =0x03001020
	ldr r2, _080046F0 @ =0x03000E30
	adds r1, r2, #0
	adds r2, #0x84
	ldr r3, [r2]
	adds r1, r3, #0
	ldrh r2, [r0, #0x14]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r0, _080046F4 @ =0x03001020
	ldr r2, _080046F0 @ =0x03000E30
	adds r1, r2, #0
	adds r2, #0x88
	ldr r3, [r2]
	adds r1, r3, #0
	ldrh r2, [r0, #0x1c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1c]
	bl sub_800257C
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080046E8: .4byte 0x03006030
_080046EC: .4byte 0x03000ED8
_080046F0: .4byte 0x03000E30
_080046F4: .4byte 0x03001020

	thumb_func_start sub_80046F8
sub_80046F8: @ 0x080046F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080047B8 @ =0x03000E30
	ldr r1, _080047BC @ =0x03001020
	ldrh r2, [r1, #6]
	adds r1, r2, #0
	ldrb r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0xe]
	ldr r0, _080047B8 @ =0x03000E30
	ldr r1, _080047BC @ =0x03001020
	ldrh r2, [r1, #0xe]
	adds r1, r2, #0
	ldrb r2, [r0, #0xf]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0xf]
	ldr r0, _080047B8 @ =0x03000E30
	ldr r1, _080047BC @ =0x03001020
	ldrh r2, [r1, #0x16]
	adds r1, r2, #0
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080047B8 @ =0x03000E30
	ldr r1, _080047BC @ =0x03001020
	ldrh r2, [r1, #0x1e]
	adds r1, r2, #0
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r0, _080047B8 @ =0x03000E30
	ldrb r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x12]
	ldr r0, _080047B8 @ =0x03000E30
	ldrb r1, [r0, #0x13]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x13]
	ldr r0, _080047B8 @ =0x03000E30
	ldr r1, _080047BC @ =0x03001020
	movs r3, #4
	ldrsh r2, [r1, r3]
	str r2, [r0, #0x7c]
	ldr r0, _080047B8 @ =0x03000E30
	adds r1, r0, #0
	adds r0, #0x80
	ldr r1, _080047BC @ =0x03001020
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	str r2, [r0]
	ldr r0, _080047B8 @ =0x03000E30
	adds r1, r0, #0
	adds r0, #0x84
	ldr r1, _080047BC @ =0x03001020
	movs r3, #0x14
	ldrsh r2, [r1, r3]
	str r2, [r0]
	ldr r0, _080047B8 @ =0x03000E30
	adds r1, r0, #0
	adds r0, #0x88
	ldr r1, _080047BC @ =0x03001020
	movs r3, #0x1c
	ldrsh r2, [r1, r3]
	str r2, [r0]
	ldr r1, _080047B8 @ =0x03000E30
	adds r0, r1, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	ldr r1, _080047B8 @ =0x03000E30
	adds r0, r1, #0
	adds r1, #0x90
	movs r0, #0
	str r0, [r1]
	b _080047EC
	.align 2, 0
_080047B8: .4byte 0x03000E30
_080047BC: .4byte 0x03001020
_080047C0:
	.byte 0x00, 0x20, 0x38, 0x60, 0x38, 0x68, 0x0F, 0x28, 0x00, 0xDD, 0x0F, 0xE0, 0x06, 0x49, 0x08, 0x1C
	.byte 0x94, 0x31, 0x3A, 0x68, 0x88, 0x18, 0x01, 0x78, 0x00, 0x22, 0x11, 0x40, 0x0A, 0x1C, 0x02, 0x70
	.byte 0x38, 0x68, 0x41, 0x1C, 0x39, 0x60, 0xED, 0xE7, 0x30, 0x0E, 0x00, 0x03
_080047EC:
	bl sub_8028EFC
	cmp r0, #0
	beq _080047F4
_080047F4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80047FC
sub_80047FC: @ 0x080047FC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	ldr r0, _08004858 @ =0x087FFAB4
	ldr r1, [r0]
	str r1, [r7]
	ldr r0, [r7]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc0
	str r1, [r7]
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, [r7]
	adds r1, r0, #4
	str r1, [r7]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r0, _0800485C @ =0x040000D4
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #4
	ldr r1, _08004860 @ =0x0600F400
	str r1, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08004864 @ =0x80000600
	str r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004858: .4byte 0x087FFAB4
_0800485C: .4byte 0x040000D4
_08004860: .4byte 0x0600F400
_08004864: .4byte 0x80000600

	thumb_func_start sub_8004868
sub_8004868: @ 0x08004868
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800488C @ =0x030010AC
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800488C: .4byte 0x030010AC

	thumb_func_start sub_8004890
sub_8004890: @ 0x08004890
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0x92
	bne _080048A6
	movs r0, #0x27
	str r0, [r7, #8]
_080048A6:
	ldr r0, _080048C0 @ =0x030010AC
	ldrb r1, [r0]
	cmp r1, #0
	bne _080048C4
	ldr r0, [r7]
	adds r1, r0, #6
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0xe
	str r1, [r7, #4]
	b _080048EE
	.align 2, 0
_080048C0: .4byte 0x030010AC
_080048C4:
	ldr r0, _080048DC @ =0x030010AC
	ldrb r1, [r0]
	cmp r1, #1
	bne _080048E0
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	b _080048EE
	.align 2, 0
_080048DC: .4byte 0x030010AC
_080048E0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #4
	str r1, [r7, #4]
_080048EE:
	ldr r1, [r7]
	ldr r0, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	lsls r2, r0, #6
	adds r1, r1, r2
	ldr r2, _0800491C @ =0x0600B800
	adds r0, r1, r2
	ldr r2, [r7, #8]
	adds r1, r2, #0
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r2, r1, r3
	adds r1, r2, #0
	movs r2, #0xf0
	lsls r2, r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800491C: .4byte 0x0600B800

	thumb_func_start sub_8004920
sub_8004920: @ 0x08004920
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	ldrb r2, [r1]
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0
	beq _0800496A
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _0800496A
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0xa
	beq _0800496A
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #9
	beq _0800496A
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0x7e
	beq _0800496A
	b _0800496E
_0800496A:
	movs r0, #1
	b _080049C4
_0800496E:
	b _08004972
_08004970:
	.byte 0x28, 0xE0
_08004972:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0
	beq _080049B6
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _080049B6
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0xa
	beq _080049B6
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #9
	beq _080049B6
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0x7e
	beq _080049B6
	b _080049BC
_080049B6:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _080049C4
_080049BC:
	ldr r1, [r7, #4]
	adds r2, r1, #1
	str r2, [r7, #4]
	b _0800496E
_080049C4:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80049CC
sub_80049CC: @ 0x080049CC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_080049D8:
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0
	bne _080049E2
	b _08004A00
_080049E2:
	adds r0, r7, #4
	ldr r1, [r0]
	adds r2, r1, #0
	adds r1, #1
	str r1, [r0]
	adds r0, r2, #0
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldrb r2, [r3]
	bl sub_8004890
	ldr r1, [r7]
	adds r2, r1, #1
	str r2, [r7]
	b _080049D8
_08004A00:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8004A08
sub_8004A08: @ 0x08004A08
	push {r7, lr}
	sub sp, #0x3c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #4]
	str r0, [r7, #0x28]
	ldr r0, [r7, #8]
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x30]
_08004A22:
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08004A2C
	b _08004AFA
_08004A2C:
	ldr r0, [r7]
	bl sub_8004920
	str r0, [r7, #0x24]
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x30]
	cmp r0, r1
	bls _08004A64
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _08004A4A
	ldr r0, [r7, #0x44]
	subs r1, r0, #1
	str r1, [r7, #0x44]
	b _08004A4C
_08004A4A:
	b _08004AFA
_08004A4C:
	ldr r0, [r7, #4]
	str r0, [r7, #0x28]
	ldr r0, [r7, #0x2c]
	adds r1, r0, #1
	str r1, [r7, #0x2c]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x24]
	subs r0, r0, r1
	str r0, [r7, #0x30]
	b _08004A6C
_08004A64:
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x24]
	subs r0, r0, r1
	str r0, [r7, #0x30]
_08004A6C:
	ldr r0, [r7, #0x24]
	cmp r0, #1
	bne _08004A96
	ldr r0, [r7, #0x28]
	ldr r1, [r7, #4]
	cmp r0, r1
	bne _08004A96
	adds r0, r7, #0
	adds r0, #0x38
	ldr r1, [r7]
	ldrb r2, [r1]
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r1, [r0]
	cmp r1, #0x20
	bne _08004A96
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08004A22
_08004A96:
	movs r0, #0
	str r0, [r7, #0x34]
_08004A9A:
	ldr r0, [r7, #0x24]
	cmp r0, #0
	bne _08004AA2
	b _08004AD2
_08004AA2:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #0x34]
	adds r0, r0, r1
	ldr r1, [r7]
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0x34]
	adds r1, r0, #1
	str r1, [r7, #0x34]
	ldr r0, [r7, #0x24]
	subs r1, r0, #1
	str r1, [r7, #0x24]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08004A9A
_08004AD2:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #0x34]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	bl sub_80049CC
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x34]
	adds r1, r1, r2
	str r1, [r7, #0x28]
	b _08004A22
_08004AFA:
	add sp, #0x3c
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004B04
sub_8004B04: @ 0x08004B04
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x18]
	bl sub_8004CCC
_08004B20:
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08004B2A
	b _08004C70
_08004B2A:
	ldr r0, [r7]
	bl sub_8004920
	movs r1, #0x17
	ldr r2, [r7, #0xc]
	subs r1, r1, r2
	cmp r0, r1
	blo _08004B9A
	movs r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #3
	bls _08004B9A
	movs r0, #0
	str r0, [r7, #0x10]
	ldr r0, _08004B64 @ =0x030010AC
	ldrb r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8002978
	bl sub_8000B54
	bl sub_801ECB0
_08004B62:
	b _08004B6A
	.align 2, 0
_08004B64: .4byte 0x030010AC
_08004B68:
	.byte 0x13, 0xE0
_08004B6A:
	bl VBlankIntrWait
	bl sub_8021754
	bl sub_801ECB0
	ldr r0, _08004B8C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08004B90
	b _08004B92
	.align 2, 0
_08004B8C: .4byte 0x03005578
_08004B90:
	b _08004B62
_08004B92:
	movs r0, #1
	str r0, [r7, #4]
	bl sub_8004CCC
_08004B9A:
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0x7e
	bne _08004BB4
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08004B20
_08004BB4:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _08004BC4
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0x20
	bne _08004BC4
	b _08004BEA
_08004BC4:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	ldr r3, [r7]
	ldrb r2, [r3]
	bl sub_8004890
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r2, r1, #0
	adds r1, #1
	str r1, [r0]
	cmp r2, #2
	bls _08004BEA
	movs r0, #0
	str r0, [r7, #0x18]
_08004BEA:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	movs r0, #0
	str r0, [r7, #8]
_08004BF4:
	ldr r0, [r7, #8]
	cmp r0, #1
	bls _08004BFC
	b _08004C34
_08004BFC:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08004C26
	bl VBlankIntrWait
	bl sub_8021754
	bl sub_801ECB0
	ldr r0, _08004C30 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08004C26
	movs r0, #0
	str r0, [r7, #4]
_08004C26:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08004BF4
	.align 2, 0
_08004C30: .4byte 0x03005578
_08004C34:
	ldr r1, [r7, #0x14]
	adds r0, r1, #1
	adds r1, r0, #0
	str r1, [r7, #0x14]
	cmp r1, #6
	bne _08004C5C
	ldr r0, _08004C58 @ =0x030010AC
	ldrb r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8002978
	bl sub_8000B54
	bl sub_801ECB0
	b _08004C6E
	.align 2, 0
_08004C58: .4byte 0x030010AC
_08004C5C:
	ldr r0, [r7, #0x14]
	cmp r0, #9
	bls _08004C6E
	movs r0, #0
	str r0, [r7, #0x14]
	bl sub_8000B54
	bl sub_801ECB0
_08004C6E:
	b _08004B20
_08004C70:
	ldr r0, _08004C88 @ =0x030010AC
	ldrb r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8002978
	bl sub_8000B54
	bl sub_801ECB0
_08004C84:
	b _08004C8E
	.align 2, 0
_08004C88: .4byte 0x030010AC
_08004C8C:
	.byte 0x13, 0xE0
_08004C8E:
	bl VBlankIntrWait
	bl sub_8021754
	bl sub_801ECB0
	ldr r0, _08004CB0 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08004CB4
	b _08004CB6
	.align 2, 0
_08004CB0: .4byte 0x03005578
_08004CB4:
	b _08004C84
_08004CB6:
	ldr r0, _08004CC0 @ =0x03005578
	movs r1, #0
	strh r1, [r0]
	movs r0, #0
	b _08004CC4
	.align 2, 0
_08004CC0: .4byte 0x03005578
_08004CC4:
	add sp, #0x1c
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8004CCC
sub_8004CCC: @ 0x08004CCC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	movs r0, #0
	str r0, [r7, #4]
_08004CD6:
	ldr r0, [r7, #4]
	cmp r0, #3
	bls _08004CDE
	b _08004D04
_08004CDE:
	movs r0, #0
	str r0, [r7]
_08004CE2:
	ldr r0, [r7]
	cmp r0, #0x15
	bls _08004CEA
	b _08004CFC
_08004CEA:
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0x20
	bl sub_8004890
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08004CE2
_08004CFC:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08004CD6
_08004D04:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8004D0C
sub_8004D0C: @ 0x08004D0C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_08004D18:
	ldr r0, [r7, #4]
	cmp r0, #0x15
	bls _08004D20
	b _08004D34
_08004D20:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	ldr r1, [r7]
	movs r2, #0x20
	bl sub_8004890
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08004D18
_08004D34:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start GetStringPointer
GetStringPointer: @ 0x08004D3C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08004D68 @ =0x087FFFF8
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, _08004D6C @ =0x087FFFFC
	ldr r1, [r0]
	str r1, [r7, #8]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #2
	ldr r2, [r7, #8]
	adds r1, r0, r2
	adds r0, r1, #0
	b _08004D70
	.align 2, 0
_08004D68: .4byte 0x087FFFF8
_08004D6C: .4byte 0x087FFFFC
_08004D70:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8004D78
sub_8004D78: @ 0x08004D78
	push {r7, lr}
	sub sp, #0x18
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8004868
	movs r0, #3
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0xf
	movs r1, #4
	movs r2, #0xa
	movs r3, #0xc8
	bl sub_801E8F0
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl GetStringPointer
	adds r1, r0, #0
	adds r0, r1, #0
	bl sub_8004B04
	str r0, [r7, #0xc]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_801EC7C
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08004DBE
_08004DBE:
	add sp, #0x18
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004DC8
sub_8004DC8: @ 0x08004DC8
	push {r7, lr}
	sub sp, #0x2c
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #1
	lsls r1, r0, #2
	movs r2, #0x88
	lsls r2, r2, #0x14
	subs r0, r2, r1
	ldr r1, [r0]
	str r1, [r7, #0x14]
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	str r0, [r7, #4]
	ldr r0, [r7, #0x14]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	str r0, [r7, #8]
	ldr r0, [r7, #0x14]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r0, r2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldr r1, [r0]
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x14]
	adds r1, r0, #4
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x10]
	bl VBlankIntrWait
	ldr r0, _08004E68 @ =0x040000D4
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #5
	ldr r2, [r7, #4]
	adds r1, r2, r1
	str r1, [r0]
	ldr r1, [r7, #0x1c]
	adds r0, r1, #4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08004E6C @ =0x80000010
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r2, [r7, #0xc]
	ldr r3, [r7, #0x10]
	movs r0, #0x10
	str r0, [sp]
	ldr r0, [r7, #8]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0
	bl sub_8021520
	movs r0, #1
	bl sub_8021650
	add sp, #0x2c
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004E68: .4byte 0x040000D4
_08004E6C: .4byte 0x80000010

	thumb_func_start DrawDebugMenuInfo
DrawDebugMenuInfo: @ 0x08004E70
	push {r7, lr}
	sub sp, #0x28
	mov r7, sp
	str r0, [r7]
	bl sub_80221D0
	movs r0, #0
	str r0, [r7, #0x24]
_08004E80:
	ldr r0, [r7, #0x24]
	cmp r0, #7
	bls _08004E88
	b _08004E9E
_08004E88:
	adds r0, r7, #4
	ldr r1, [r7, #0x24]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [r0]
	ldr r0, [r7, #0x24]
	adds r1, r0, #1
	str r1, [r7, #0x24]
	b _08004E80
_08004E9E:
	adds r0, r7, #4
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x3e
	str r1, [r0]
	ldr r0, _08004EBC @ =0x08031DAC
	adds r1, r7, #4
	bl sub_8022288
	add sp, #0x28
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004EBC: .4byte 0x08031DAC

	thumb_func_start DrawPowerUpMenuInfo
DrawPowerUpMenuInfo: @ 0x08004EC0
	push {r7, lr}
	sub sp, #0x28
	mov r7, sp
	str r0, [r7]
	bl sub_80221D0
	movs r0, #0
	str r0, [r7, #0x24]
_08004ED0:
	ldr r0, [r7, #0x24]
	cmp r0, #7
	bls _08004ED8
	b _08004EEE
_08004ED8:
	adds r0, r7, #4
	ldr r1, [r7, #0x24]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [r0]
	ldr r0, [r7, #0x24]
	adds r1, r0, #1
	str r1, [r7, #0x24]
	b _08004ED0
_08004EEE:
	adds r0, r7, #4
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x3e
	str r1, [r0]
	ldr r0, _08004F0C @ =0x08032010
	adds r1, r7, #4
	bl sub_8022288
	add sp, #0x28
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004F0C: .4byte 0x08032010

	thumb_func_start DrawSpawnEnemyMenuInfo
DrawSpawnEnemyMenuInfo: @ 0x08004F10
	push {r7, lr}
	sub sp, #0x88
	mov r7, sp
	str r0, [r7]
	bl sub_80221D0
	adds r0, r7, #0
	adds r1, r7, #0
	adds r1, #0x84
	movs r0, #0
	str r0, [r1]
_08004F26:
	adds r0, r7, #0
	adds r1, r7, #0
	adds r1, #0x84
	ldr r0, [r1]
	cmp r0, #0x1f
	bls _08004F34
	b _08004F62
_08004F34:
	adds r0, r7, #4
	adds r1, r7, #0
	adds r2, r7, #0
	adds r2, #0x84
	ldr r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [r0]
	adds r0, r7, #0
	adds r1, r7, #0
	adds r1, #0x84
	adds r2, r7, #0
	adds r0, r7, #0
	adds r0, #0x84
	adds r1, r7, #0
	adds r2, r7, #0
	adds r2, #0x84
	ldr r1, [r2]
	adds r2, r1, #1
	str r2, [r0]
	b _08004F26
_08004F62:
	adds r0, r7, #4
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x3e
	str r1, [r0]
	ldr r0, _08004F80 @ =0x08032168
	adds r1, r7, #4
	bl sub_8022288
	add sp, #0x88
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004F80: .4byte 0x08032168

	thumb_func_start DrawCheatsMenuInfo
DrawCheatsMenuInfo: @ 0x08004F84
	push {r7, lr}
	sub sp, #0x50
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	bl sub_80221D0
	movs r0, #0
	str r0, [r7, #0x48]
_08004F96:
	ldr r0, [r7, #0x48]
	cmp r0, #0xf
	bls _08004F9E
	b _08004FB6
_08004F9E:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #0x48]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [r0]
	ldr r0, [r7, #0x48]
	adds r1, r0, #1
	str r1, [r7, #0x48]
	b _08004F96
_08004FB6:
	movs r0, #0
	str r0, [r7, #0x48]
_08004FBA:
	ldr r0, [r7, #0x48]
	cmp r0, #7
	bls _08004FC2
	b _08004FF6
_08004FC2:
	ldr r0, [r7, #4]
	ldr r1, [r7, #0x48]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _08004FD4
	movs r0, #0x78
	str r0, [r7, #0x4c]
	b _08004FD8
_08004FD4:
	movs r0, #0x20
	str r0, [r7, #0x4c]
_08004FD8:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #0x48]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x4c]
	str r1, [r0]
	ldr r0, [r7, #0x48]
	adds r1, r0, #1
	str r1, [r7, #0x48]
	b _08004FBA
_08004FF6:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	movs r1, #0x3e
	str r1, [r0]
	ldr r0, _08005018 @ =0x08031EEC
	adds r1, r7, #0
	adds r1, #8
	bl sub_8022288
	add sp, #0x50
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005018: .4byte 0x08031EEC

	thumb_func_start HandleDebugMenu
HandleDebugMenu: @ 0x0800501C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #4
	str r0, [r7, #8]
	ldr r0, _0800505C @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08005060
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #8]
	cmp r1, r0
	bls _08005054
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_08005054:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
	b _0800508E
	.align 2, 0
_0800505C: .4byte 0x03005578
_08005060:
	ldr r0, _080050A0 @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800508E
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _08005088
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	str r1, [r0]
_08005088:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
_0800508E:
	ldr r0, _080050A0 @ =0x03005578
	ldr r1, [r0]
	movs r2, #9
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080050A6
	movs r0, #1
	b _080050E0
	.align 2, 0
_080050A0: .4byte 0x03005578
_080050A4:
	.byte 0x0E, 0xE0
_080050A6:
	ldr r0, _080050C0 @ =0x03005578
	ldr r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080050C4
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	str r1, [r0]
	movs r0, #1
	b _080050E0
	.align 2, 0
_080050C0: .4byte 0x03005578
_080050C4:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #0
	beq _080050DC
	ldr r0, [r7, #4]
	ldr r1, [r0]
	adds r0, r1, #0
	bl DrawDebugMenuInfo
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0]
_080050DC:
	movs r0, #0
	b _080050E0
_080050E0:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start HandlePowerUpMenues
HandlePowerUpMenues: @ 0x080050E8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #5
	str r0, [r7, #8]
	ldr r0, _08005128 @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800512C
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #8]
	cmp r1, r0
	bls _08005120
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_08005120:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
	b _0800515A
	.align 2, 0
_08005128: .4byte 0x03005578
_0800512C:
	ldr r0, _0800516C @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800515A
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _08005154
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	str r1, [r0]
_08005154:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
_0800515A:
	ldr r0, _0800516C @ =0x03005578
	ldr r1, [r0]
	movs r2, #9
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08005172
	movs r0, #1
	b _080051AC
	.align 2, 0
_0800516C: .4byte 0x03005578
_08005170:
	.byte 0x0E, 0xE0
_08005172:
	ldr r0, _0800518C @ =0x03005578
	ldr r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08005190
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	str r1, [r0]
	movs r0, #1
	b _080051AC
	.align 2, 0
_0800518C: .4byte 0x03005578
_08005190:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #0
	beq _080051A8
	ldr r0, [r7, #4]
	ldr r1, [r0]
	adds r0, r1, #0
	bl DrawPowerUpMenuInfo
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0]
_080051A8:
	movs r0, #0
	b _080051AC
_080051AC:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start HandleSpawnEnemyMenu
HandleSpawnEnemyMenu: @ 0x080051B4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #4
	str r0, [r7, #8]
	ldr r0, _080051F4 @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080051F8
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #8]
	cmp r1, r0
	bls _080051EC
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_080051EC:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
	b _08005226
	.align 2, 0
_080051F4: .4byte 0x03005578
_080051F8:
	ldr r0, _08005238 @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08005226
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _08005220
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	str r1, [r0]
_08005220:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
_08005226:
	ldr r0, _08005238 @ =0x03005578
	ldr r1, [r0]
	movs r2, #9
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800523E
	movs r0, #1
	b _08005278
	.align 2, 0
_08005238: .4byte 0x03005578
_0800523C:
	.byte 0x0E, 0xE0
_0800523E:
	ldr r0, _08005258 @ =0x03005578
	ldr r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800525C
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	str r1, [r0]
	movs r0, #1
	b _08005278
	.align 2, 0
_08005258: .4byte 0x03005578
_0800525C:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #0
	beq _08005274
	ldr r0, [r7, #4]
	ldr r1, [r0]
	adds r0, r1, #0
	bl DrawSpawnEnemyMenuInfo
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0]
_08005274:
	movs r0, #0
	b _08005278
_08005278:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start HandleCheatMenu
HandleCheatMenu: @ 0x08005280
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #4
	str r0, [r7, #0xc]
	ldr r0, _080052C4 @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080052C8
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	bls _080052BA
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_080052BA:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
	b _080052F6
	.align 2, 0
_080052C4: .4byte 0x03005578
_080052C8:
	ldr r0, _08005308 @ =0x03005578
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080052F6
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _080052F0
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	str r1, [r0]
_080052F0:
	ldr r0, [r7]
	movs r1, #1
	str r1, [r0]
_080052F6:
	ldr r0, _08005308 @ =0x03005578
	ldr r1, [r0]
	movs r2, #9
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800530E
	movs r0, #1
	b _0800534C
	.align 2, 0
_08005308: .4byte 0x03005578
_0800530C:
	.byte 0x0E, 0xE0
_0800530E:
	ldr r0, _08005328 @ =0x03005578
	ldr r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800532C
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	str r1, [r0]
	movs r0, #1
	b _0800534C
	.align 2, 0
_08005328: .4byte 0x03005578
_0800532C:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #0
	beq _08005348
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	adds r1, r2, #0
	bl DrawCheatsMenuInfo
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0]
_08005348:
	movs r0, #0
	b _0800534C
_0800534C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start HandleDeveloperMenus
HandleDeveloperMenus: @ 0x08005354
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	movs r0, #0
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r1, #0
	movs r1, #0
	movs r2, #8
	bl memset
	bl m4aMPlayAllStop
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #1
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, _080053EC @ =0x030010B4
	ldr r2, [r1]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, _080053F0 @ =0x030010B0
	ldr r2, [r1]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, _080053F4 @ =0x030010B8
	ldr r2, [r1]
	adds r1, r2, #0
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #2]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, _080053F8 @ =0x030010BC
	ldr r2, [r1]
	adds r1, r2, #0
	ldrb r2, [r0, #3]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	movs r0, #0
	bl DrawDebugMenuInfo
_080053E2:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _080053FC
	b _080056CA
	.align 2, 0
_080053EC: .4byte 0x030010B4
_080053F0: .4byte 0x030010B0
_080053F4: .4byte 0x030010B8
_080053F8: .4byte 0x030010BC
_080053FC:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, [r7, #4]
	cmp r0, #1
	beq _08005480
	cmp r0, #1
	blo _0800541A
	cmp r0, #2
	beq _080054D4
	cmp r0, #3
	bne _08005418
	b _0800561C
_08005418:
	b _080056C8
_0800541A:
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, #0
	adds r1, r7, #0
	bl HandleDebugMenu
	cmp r0, #0
	beq _0800547E
	ldr r0, [r7]
	cmp r0, #0
	bne _0800543C
	movs r0, #1
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #8]
_0800543C:
	ldr r0, [r7]
	cmp r0, #1
	bne _0800544E
	movs r0, #2
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #8]
_0800544E:
	ldr r0, [r7]
	cmp r0, #2
	bne _08005462
	movs r0, #3
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #8]
	b _0800547E
_08005462:
	ldr r0, [r7]
	cmp r0, #3
	bne _08005474
	bl sub_8006064
	movs r0, #0xff
	bl SoftReset
	b _0800547E
_08005474:
	ldr r0, [r7]
	cmp r0, #4
	bne _0800547E
	movs r0, #1
	str r0, [r7, #0xc]
_0800547E:
	b _080056C8
_08005480:
	adds r0, r7, #0
	adds r0, #8
	adds r2, r7, #0
	adds r2, #0x10
	adds r1, r7, #0
	bl HandleCheatMenu
	cmp r0, #0
	beq _080054D2
	ldr r0, [r7]
	cmp r0, #4
	bne _080054A6
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #8]
	b _080054D2
_080054A6:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x10
	ldr r2, [r7]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	eors r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #1
	str r0, [r7, #8]
_080054D2:
	b _080056C8
_080054D4:
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, #0
	adds r1, r7, #0
	bl HandlePowerUpMenues
	cmp r0, #0
	bne _080054E6
	b _0800561A
_080054E6:
	ldr r0, [r7]
	cmp r0, #0
	bne _080054FC
	ldr r1, _080054F8 @ =0x000186A0
	adds r0, r1, #0
	bl sub_8002804
	b _08005612
	.align 2, 0
_080054F8: .4byte 0x000186A0
_080054FC:
	ldr r0, [r7]
	cmp r0, #1
	bne _08005510
	ldr r1, _0800550C @ =0x000186A0
	adds r0, r1, #0
	bl sub_800284C
	b _08005612
	.align 2, 0
_0800550C: .4byte 0x000186A0
_08005510:
	ldr r0, [r7]
	cmp r0, #2
	bne _08005524
	ldr r1, _08005520 @ =0x000186A0
	adds r0, r1, #0
	bl sub_8002894
	b _08005612
	.align 2, 0
_08005520: .4byte 0x000186A0
_08005524:
	ldr r0, [r7]
	cmp r0, #3
	bne _0800554E
	movs r0, #0
	str r0, [r7, #0x18]
_0800552E:
	ldr r0, [r7, #0x18]
	cmp r0, #0x18
	bls _08005536
	b _0800554C
_08005536:
	ldr r1, _08005548 @ =0x000186A0
	adds r0, r1, #0
	bl sub_8002894
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _0800552E
	.align 2, 0
_08005548: .4byte 0x000186A0
_0800554C:
	b _08005612
_0800554E:
	ldr r0, [r7]
	cmp r0, #4
	bne _08005600
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x10
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x11
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x14
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r2, r1
	str r2, [r0, #0x18]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #1
	orrs r2, r1
	str r2, [r0, #0x1c]
	ldr r0, _080055FC @ =0x03000E30
	ldr r1, _080055FC @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #2
	orrs r2, r1
	str r2, [r0, #0x1c]
	b _08005612
	.align 2, 0
_080055FC: .4byte 0x03000E30
_08005600:
	ldr r0, [r7]
	cmp r0, #5
	bne _08005612
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #8]
_08005612:
	bl sub_8002A8C
	bl sub_801FC2C
_0800561A:
	b _080056C8
_0800561C:
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, #0
	adds r1, r7, #0
	bl HandleSpawnEnemyMenu
	cmp r0, #0
	beq _080056C6
	movs r0, #0x78
	bl sub_8021B2C
	ldr r1, _08005668 @ =0x03005570
	adds r0, #0x3c
	ldr r1, [r1]
	adds r0, r1, r0
	str r0, [r7, #0x18]
	movs r0, #0x50
	bl sub_8021B2C
	ldr r1, _0800566C @ =0x03001B48
	adds r0, #0x28
	ldr r1, [r1]
	adds r0, r1, r0
	str r0, [r7, #0x1c]
	movs r0, #8
	bl sub_8021B2C
	str r0, [r7, #0x20]
	ldr r0, [r7]
	cmp r0, #0
	bne _08005670
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	ldr r2, [r7, #0x20]
	bl sub_800EFBC
	b _080056B8
	.align 2, 0
_08005668: .4byte 0x03005570
_0800566C: .4byte 0x03001B48
_08005670:
	ldr r0, [r7]
	cmp r0, #1
	bne _08005682
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	ldr r2, [r7, #0x20]
	bl sub_800CFF4
	b _080056B8
_08005682:
	ldr r0, [r7]
	cmp r0, #2
	bne _08005694
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	ldr r2, [r7, #0x20]
	bl sub_800F184
	b _080056B8
_08005694:
	ldr r0, [r7]
	cmp r0, #3
	bne _080056A6
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	ldr r2, [r7, #0x20]
	bl sub_8012B04
	b _080056B8
_080056A6:
	ldr r0, [r7]
	cmp r0, #4
	bne _080056B8
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #8]
_080056B8:
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
_080056C6:
	b _080056C8
_080056C8:
	b _080053E2
_080056CA:
	ldr r0, _08005708 @ =0x03005578
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800570C @ =0x030010B4
	adds r1, r7, #0
	adds r1, #0x10
	ldrb r2, [r1]
	str r2, [r0]
	ldr r0, _08005710 @ =0x030010B0
	adds r1, r7, #0
	adds r1, #0x10
	ldrb r2, [r1, #1]
	str r2, [r0]
	ldr r0, _08005714 @ =0x030010B8
	adds r1, r7, #0
	adds r1, #0x10
	ldrb r2, [r1, #2]
	str r2, [r0]
	ldr r0, _08005718 @ =0x030010BC
	adds r1, r7, #0
	adds r1, #0x10
	ldrb r2, [r1, #3]
	str r2, [r0]
	bl sub_80221D0
	bl MPlayAllContinue
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005708: .4byte 0x03005578
_0800570C: .4byte 0x030010B4
_08005710: .4byte 0x030010B0
_08005714: .4byte 0x030010B8
_08005718: .4byte 0x030010BC

	thumb_func_start sub_800571C
sub_800571C: @ 0x0800571C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8005738
sub_8005738: @ 0x08005738
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r0, r1
	movs r1, #0x40
	strb r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8005754
sub_8005754: @ 0x08005754
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #4]
_08005760:
	ldr r0, [r7, #4]
	cmp r0, #0x18
	ble _08005768
	b _080057BC
_08005768:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	str r1, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0x3f
	bhi _0800577C
	movs r0, #0x40
	str r0, [r7, #8]
_0800577C:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r2, r1, #3
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r2, r1, #1
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r2, r1
	ldr r2, [r7, #8]
	lsrs r1, r2, #3
	ldr r3, [r7, #8]
	lsrs r2, r3, #3
	adds r3, r2, #0
	lsls r2, r3, #5
	orrs r1, r2
	ldr r3, [r7, #8]
	lsrs r2, r3, #3
	adds r3, r2, #0
	lsls r2, r3, #0xa
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08005760
_080057BC:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80057C4
sub_80057C4: @ 0x080057C4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0xff
	bls _080057D4
	b _08005C58
_080057D4:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080057E4 @ =_080057E8
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080057E4: .4byte _080057E8
_080057E8: @ jump table
	.4byte _08005BE8 @ case 0
	.4byte _08005BEC @ case 1
	.4byte _08005BF0 @ case 2
	.4byte _08005BF4 @ case 3
	.4byte _08005BF8 @ case 4
	.4byte _08005BFC @ case 5
	.4byte _08005C00 @ case 6
	.4byte _08005C04 @ case 7
	.4byte _08005C08 @ case 8
	.4byte _08005C0C @ case 9
	.4byte _08005C10 @ case 10
	.4byte _08005C14 @ case 11
	.4byte _08005C18 @ case 12
	.4byte _08005C1C @ case 13
	.4byte _08005C20 @ case 14
	.4byte _08005C24 @ case 15
	.4byte _08005C28 @ case 16
	.4byte _08005C2C @ case 17
	.4byte _08005C30 @ case 18
	.4byte _08005C34 @ case 19
	.4byte _08005C38 @ case 20
	.4byte _08005C3C @ case 21
	.4byte _08005C40 @ case 22
	.4byte _08005C58 @ case 23
	.4byte _08005C58 @ case 24
	.4byte _08005C44 @ case 25
	.4byte _08005C48 @ case 26
	.4byte _08005C4C @ case 27
	.4byte _08005C50 @ case 28
	.4byte _08005C54 @ case 29
	.4byte _08005C58 @ case 30
	.4byte _08005C58 @ case 31
	.4byte _08005C58 @ case 32
	.4byte _08005C58 @ case 33
	.4byte _08005C58 @ case 34
	.4byte _08005C58 @ case 35
	.4byte _08005C58 @ case 36
	.4byte _08005C58 @ case 37
	.4byte _08005C58 @ case 38
	.4byte _08005C58 @ case 39
	.4byte _08005C58 @ case 40
	.4byte _08005C58 @ case 41
	.4byte _08005C58 @ case 42
	.4byte _08005C58 @ case 43
	.4byte _08005C58 @ case 44
	.4byte _08005C58 @ case 45
	.4byte _08005C58 @ case 46
	.4byte _08005C58 @ case 47
	.4byte _08005C58 @ case 48
	.4byte _08005C58 @ case 49
	.4byte _08005C58 @ case 50
	.4byte _08005C58 @ case 51
	.4byte _08005C58 @ case 52
	.4byte _08005C58 @ case 53
	.4byte _08005C58 @ case 54
	.4byte _08005C58 @ case 55
	.4byte _08005C58 @ case 56
	.4byte _08005C58 @ case 57
	.4byte _08005C58 @ case 58
	.4byte _08005C58 @ case 59
	.4byte _08005C58 @ case 60
	.4byte _08005C58 @ case 61
	.4byte _08005C58 @ case 62
	.4byte _08005C58 @ case 63
	.4byte _08005C58 @ case 64
	.4byte _08005C58 @ case 65
	.4byte _08005C58 @ case 66
	.4byte _08005C58 @ case 67
	.4byte _08005C58 @ case 68
	.4byte _08005C58 @ case 69
	.4byte _08005C58 @ case 70
	.4byte _08005C58 @ case 71
	.4byte _08005C58 @ case 72
	.4byte _08005C58 @ case 73
	.4byte _08005C58 @ case 74
	.4byte _08005C58 @ case 75
	.4byte _08005C58 @ case 76
	.4byte _08005C58 @ case 77
	.4byte _08005C58 @ case 78
	.4byte _08005C58 @ case 79
	.4byte _08005C58 @ case 80
	.4byte _08005C58 @ case 81
	.4byte _08005C58 @ case 82
	.4byte _08005C58 @ case 83
	.4byte _08005C58 @ case 84
	.4byte _08005C58 @ case 85
	.4byte _08005C58 @ case 86
	.4byte _08005C58 @ case 87
	.4byte _08005C58 @ case 88
	.4byte _08005C58 @ case 89
	.4byte _08005C58 @ case 90
	.4byte _08005C58 @ case 91
	.4byte _08005C58 @ case 92
	.4byte _08005C58 @ case 93
	.4byte _08005C58 @ case 94
	.4byte _08005C58 @ case 95
	.4byte _08005C58 @ case 96
	.4byte _08005C58 @ case 97
	.4byte _08005C58 @ case 98
	.4byte _08005C58 @ case 99
	.4byte _08005C58 @ case 100
	.4byte _08005C58 @ case 101
	.4byte _08005C58 @ case 102
	.4byte _08005C58 @ case 103
	.4byte _08005C58 @ case 104
	.4byte _08005C58 @ case 105
	.4byte _08005C58 @ case 106
	.4byte _08005C58 @ case 107
	.4byte _08005C58 @ case 108
	.4byte _08005C58 @ case 109
	.4byte _08005C58 @ case 110
	.4byte _08005C58 @ case 111
	.4byte _08005C58 @ case 112
	.4byte _08005C58 @ case 113
	.4byte _08005C58 @ case 114
	.4byte _08005C58 @ case 115
	.4byte _08005C58 @ case 116
	.4byte _08005C58 @ case 117
	.4byte _08005C58 @ case 118
	.4byte _08005C58 @ case 119
	.4byte _08005C58 @ case 120
	.4byte _08005C58 @ case 121
	.4byte _08005C58 @ case 122
	.4byte _08005C58 @ case 123
	.4byte _08005C58 @ case 124
	.4byte _08005C58 @ case 125
	.4byte _08005C58 @ case 126
	.4byte _08005C58 @ case 127
	.4byte _08005C58 @ case 128
	.4byte _08005C58 @ case 129
	.4byte _08005C58 @ case 130
	.4byte _08005C58 @ case 131
	.4byte _08005C58 @ case 132
	.4byte _08005C58 @ case 133
	.4byte _08005C58 @ case 134
	.4byte _08005C58 @ case 135
	.4byte _08005C58 @ case 136
	.4byte _08005C58 @ case 137
	.4byte _08005C58 @ case 138
	.4byte _08005C58 @ case 139
	.4byte _08005C58 @ case 140
	.4byte _08005C58 @ case 141
	.4byte _08005C58 @ case 142
	.4byte _08005C58 @ case 143
	.4byte _08005C58 @ case 144
	.4byte _08005C58 @ case 145
	.4byte _08005C58 @ case 146
	.4byte _08005C58 @ case 147
	.4byte _08005C58 @ case 148
	.4byte _08005C58 @ case 149
	.4byte _08005C58 @ case 150
	.4byte _08005C58 @ case 151
	.4byte _08005C58 @ case 152
	.4byte _08005C58 @ case 153
	.4byte _08005C58 @ case 154
	.4byte _08005C58 @ case 155
	.4byte _08005C58 @ case 156
	.4byte _08005C58 @ case 157
	.4byte _08005C58 @ case 158
	.4byte _08005C58 @ case 159
	.4byte _08005C58 @ case 160
	.4byte _08005C58 @ case 161
	.4byte _08005C58 @ case 162
	.4byte _08005C58 @ case 163
	.4byte _08005C58 @ case 164
	.4byte _08005C58 @ case 165
	.4byte _08005C58 @ case 166
	.4byte _08005C58 @ case 167
	.4byte _08005C58 @ case 168
	.4byte _08005C58 @ case 169
	.4byte _08005C58 @ case 170
	.4byte _08005C58 @ case 171
	.4byte _08005C58 @ case 172
	.4byte _08005C58 @ case 173
	.4byte _08005C58 @ case 174
	.4byte _08005C58 @ case 175
	.4byte _08005C58 @ case 176
	.4byte _08005C58 @ case 177
	.4byte _08005C58 @ case 178
	.4byte _08005C58 @ case 179
	.4byte _08005C58 @ case 180
	.4byte _08005C58 @ case 181
	.4byte _08005C58 @ case 182
	.4byte _08005C58 @ case 183
	.4byte _08005C58 @ case 184
	.4byte _08005C58 @ case 185
	.4byte _08005C58 @ case 186
	.4byte _08005C58 @ case 187
	.4byte _08005C58 @ case 188
	.4byte _08005C58 @ case 189
	.4byte _08005C58 @ case 190
	.4byte _08005C58 @ case 191
	.4byte _08005C58 @ case 192
	.4byte _08005C58 @ case 193
	.4byte _08005C58 @ case 194
	.4byte _08005C58 @ case 195
	.4byte _08005C58 @ case 196
	.4byte _08005C58 @ case 197
	.4byte _08005C58 @ case 198
	.4byte _08005C58 @ case 199
	.4byte _08005C58 @ case 200
	.4byte _08005C58 @ case 201
	.4byte _08005C58 @ case 202
	.4byte _08005C58 @ case 203
	.4byte _08005C58 @ case 204
	.4byte _08005C58 @ case 205
	.4byte _08005C58 @ case 206
	.4byte _08005C58 @ case 207
	.4byte _08005C58 @ case 208
	.4byte _08005C58 @ case 209
	.4byte _08005C58 @ case 210
	.4byte _08005C58 @ case 211
	.4byte _08005C58 @ case 212
	.4byte _08005C58 @ case 213
	.4byte _08005C58 @ case 214
	.4byte _08005C58 @ case 215
	.4byte _08005C58 @ case 216
	.4byte _08005C58 @ case 217
	.4byte _08005C58 @ case 218
	.4byte _08005C58 @ case 219
	.4byte _08005C58 @ case 220
	.4byte _08005C58 @ case 221
	.4byte _08005C58 @ case 222
	.4byte _08005C58 @ case 223
	.4byte _08005C58 @ case 224
	.4byte _08005C58 @ case 225
	.4byte _08005C58 @ case 226
	.4byte _08005C58 @ case 227
	.4byte _08005C58 @ case 228
	.4byte _08005C58 @ case 229
	.4byte _08005C58 @ case 230
	.4byte _08005C58 @ case 231
	.4byte _08005C58 @ case 232
	.4byte _08005C58 @ case 233
	.4byte _08005C58 @ case 234
	.4byte _08005C58 @ case 235
	.4byte _08005C58 @ case 236
	.4byte _08005C58 @ case 237
	.4byte _08005C58 @ case 238
	.4byte _08005C58 @ case 239
	.4byte _08005C58 @ case 240
	.4byte _08005C58 @ case 241
	.4byte _08005C58 @ case 242
	.4byte _08005C58 @ case 243
	.4byte _08005C58 @ case 244
	.4byte _08005C58 @ case 245
	.4byte _08005C58 @ case 246
	.4byte _08005C58 @ case 247
	.4byte _08005C58 @ case 248
	.4byte _08005C58 @ case 249
	.4byte _08005C58 @ case 250
	.4byte _08005C58 @ case 251
	.4byte _08005C58 @ case 252
	.4byte _08005C58 @ case 253
	.4byte _08005C58 @ case 254
	.4byte _08005C58 @ case 255
_08005BE8:
	movs r0, #1
	b _08005C5E
_08005BEC:
	movs r0, #2
	b _08005C5E
_08005BF0:
	movs r0, #3
	b _08005C5E
_08005BF4:
	movs r0, #4
	b _08005C5E
_08005BF8:
	movs r0, #5
	b _08005C5E
_08005BFC:
	movs r0, #0x1d
	b _08005C5E
_08005C00:
	movs r0, #0x1c
	b _08005C5E
_08005C04:
	movs r0, #0x19
	b _08005C5E
_08005C08:
	movs r0, #9
	b _08005C5E
_08005C0C:
	movs r0, #0xa
	b _08005C5E
_08005C10:
	movs r0, #0x1a
	b _08005C5E
_08005C14:
	movs r0, #0xc
	b _08005C5E
_08005C18:
	movs r0, #0xd
	b _08005C5E
_08005C1C:
	movs r0, #0xe
	b _08005C5E
_08005C20:
	movs r0, #0xf
	b _08005C5E
_08005C24:
	movs r0, #0x1b
	b _08005C5E
_08005C28:
	movs r0, #0x11
	b _08005C5E
_08005C2C:
	movs r0, #0x12
	b _08005C5E
_08005C30:
	movs r0, #0x13
	b _08005C5E
_08005C34:
	movs r0, #0x14
	b _08005C5E
_08005C38:
	movs r0, #0x16
	b _08005C5E
_08005C3C:
	movs r0, #0x16
	b _08005C5E
_08005C40:
	movs r0, #0
	b _08005C5E
_08005C44:
	movs r0, #8
	b _08005C5E
_08005C48:
	movs r0, #0xb
	b _08005C5E
_08005C4C:
	movs r0, #0x10
	b _08005C5E
_08005C50:
	movs r0, #7
	b _08005C5E
_08005C54:
	movs r0, #6
	b _08005C5E
_08005C58:
	movs r0, #0
	b _08005C5E
_08005C5C:
	.byte 0xFF, 0xE7
_08005C5E:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ChangeLevel
ChangeLevel: @ 0x08005C68
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r0, [r7]
	cmp r0, #0x1d
	bls _08005C8C
	b _08005E26
_08005C8C:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08005C9C @ =_08005CA0
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08005C9C: .4byte _08005CA0
_08005CA0: @ jump table
	.4byte _08005D18 @ case 0
	.4byte _08005D26 @ case 1
	.4byte _08005D34 @ case 2
	.4byte _08005D42 @ case 3
	.4byte _08005D50 @ case 4
	.4byte _08005D5E @ case 5
	.4byte _08005D6C @ case 6
	.4byte _08005D7A @ case 7
	.4byte _08005D80 @ case 8
	.4byte _08005D86 @ case 9
	.4byte _08005D90 @ case 10
	.4byte _08005D9A @ case 11
	.4byte _08005DA0 @ case 12
	.4byte _08005DA6 @ case 13
	.4byte _08005DB4 @ case 14
	.4byte _08005DBA @ case 15
	.4byte _08005DC0 @ case 16
	.4byte _08005DC6 @ case 17
	.4byte _08005DCC @ case 18
	.4byte _08005DD2 @ case 19
	.4byte _08005DD8 @ case 20
	.4byte _08005DDE @ case 21
	.4byte _08005DE4 @ case 22
	.4byte _08005DEE @ case 23
	.4byte _08005E26 @ case 24
	.4byte _08005DF8 @ case 25
	.4byte _08005DFE @ case 26
	.4byte _08005E0C @ case 27
	.4byte _08005E12 @ case 28
	.4byte _08005E18 @ case 29
_08005D18:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	movs r0, #0
	str r0, [r7, #0x18]
	b _08005E26
_08005D26:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	movs r0, #1
	str r0, [r7, #0x18]
	b _08005E26
_08005D34:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #2
	str r0, [r7, #0x14]
	movs r0, #2
	str r0, [r7, #0x18]
	b _08005E26
_08005D42:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #3
	str r0, [r7, #0x14]
	movs r0, #3
	str r0, [r7, #0x18]
	b _08005E26
_08005D50:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #4
	str r0, [r7, #0x14]
	movs r0, #4
	str r0, [r7, #0x18]
	b _08005E26
_08005D5E:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #5
	str r0, [r7, #0x14]
	movs r0, #5
	str r0, [r7, #0x18]
	b _08005E26
_08005D6C:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #6
	str r0, [r7, #0x14]
	movs r0, #6
	str r0, [r7, #0x18]
	b _08005E26
_08005D7A:
	movs r0, #0x14
	str r0, [r7, #0x10]
	b _08005E26
_08005D80:
	movs r0, #0x19
	str r0, [r7, #0x10]
	b _08005E26
_08005D86:
	movs r0, #0x1a
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08005E26
_08005D90:
	movs r0, #0x14
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08005E26
_08005D9A:
	movs r0, #0xf
	str r0, [r7, #0x10]
	b _08005E26
_08005DA0:
	movs r0, #2
	str r0, [r7, #0x10]
	b _08005E26
_08005DA6:
	movs r0, #0x12
	str r0, [r7, #0x10]
	movs r0, #7
	str r0, [r7, #0x14]
	movs r0, #7
	str r0, [r7, #0x18]
	b _08005E26
_08005DB4:
	movs r0, #3
	str r0, [r7, #0x10]
	b _08005E26
_08005DBA:
	movs r0, #6
	str r0, [r7, #0x10]
	b _08005E26
_08005DC0:
	movs r0, #0xa
	str r0, [r7, #0x10]
	b _08005E26
_08005DC6:
	movs r0, #0xd
	str r0, [r7, #0x10]
	b _08005E26
_08005DCC:
	movs r0, #0x10
	str r0, [r7, #0x10]
	b _08005E26
_08005DD2:
	movs r0, #0x11
	str r0, [r7, #0x10]
	b _08005E26
_08005DD8:
	movs r0, #0x1b
	str r0, [r7, #0x10]
	b _08005E26
_08005DDE:
	movs r0, #0x1e
	str r0, [r7, #0x10]
	b _08005E26
_08005DE4:
	movs r0, #0x1e
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08005E26
_08005DEE:
	movs r0, #0x13
	str r0, [r7, #0x10]
	movs r0, #3
	str r0, [r7, #0x14]
	b _08005E26
_08005DF8:
	movs r0, #0x18
	str r0, [r7, #0x10]
	b _08005E26
_08005DFE:
	movs r0, #0x14
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x18]
	movs r0, #2
	str r0, [r7, #0x14]
	b _08005E26
_08005E0C:
	movs r0, #9
	str r0, [r7, #0x10]
	b _08005E26
_08005E12:
	movs r0, #0x25
	str r0, [r7, #0x10]
	b _08005E26
_08005E18:
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x14]
	b _08005E26
_08005E26:
	ldr r0, [r7, #4]
	ldr r1, [r7, #0x10]
	str r1, [r0]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x18]
	str r1, [r0]
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start HandleLevelSelectMenu
HandleLevelSelectMenu: @ 0x08005E40
	push {r7, lr}
	sub sp, #0x34
	add r7, sp, #8
	movs r0, #1
	str r0, [r7]
	movs r0, #0
	bl sub_801E828
	bl sub_8000C10
	movs r0, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x90
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F2AC
	movs r0, #1
	str r0, [r7, #0x28]
_08005E6C:
	ldr r0, [r7, #0x28]
	cmp r0, #0x18
	ble _08005E74
	b _08005E84
_08005E74:
	ldr r0, [r7, #0x28]
	adds r1, r7, #4
	bl sub_8005738
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	b _08005E6C
_08005E84:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_800571C
	adds r1, r7, #4
	adds r0, r1, #0
	bl sub_8005754
	movs r0, #2
	bl sub_801E7A0
_08005E9A:
	b _08005E9E
_08005E9C:
	.byte 0x8B, 0xE0
_08005E9E:
	bl VBlankIntrWait
	bl sub_8021754
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_800571C
	adds r1, r7, #4
	adds r0, r1, #0
	bl sub_8005754
	ldr r0, _08005ECC @ =0x03005578
	ldrh r1, [r0]
	movs r2, #9
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08005ED0
	b _08005FB6
	.align 2, 0
_08005ECC: .4byte 0x03005578
_08005ED0:
	ldr r0, _08005EFC @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08005F00
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bgt _08005EF4
	movs r0, #0x18
	str r0, [r7]
_08005EF4:
	movs r0, #0x21
	bl PlaySfx
	b _08005FB4
	.align 2, 0
_08005EFC: .4byte 0x03005578
_08005F00:
	ldr r0, _08005F2C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08005F30
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	ldr r0, [r7]
	cmp r0, #0x18
	ble _08005F24
	movs r0, #1
	str r0, [r7]
_08005F24:
	movs r0, #0x21
	bl PlaySfx
	b _08005FB4
	.align 2, 0
_08005F2C: .4byte 0x03005578
_08005F30:
	ldr r0, _08005F50 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08005F72
	ldr r0, [r7]
	cmp r0, #1
	bne _08005F54
	movs r0, #0x18
	str r0, [r7]
	b _08005F6A
	.align 2, 0
_08005F50: .4byte 0x03005578
_08005F54:
	ldr r0, [r7]
	adds r1, r0, #0
	subs r1, #8
	str r1, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bgt _08005F6A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x17
	str r1, [r7]
_08005F6A:
	movs r0, #0x21
	bl PlaySfx
	b _08005FB4
_08005F72:
	ldr r0, _08005F94 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08005FB4
	ldr r0, [r7]
	cmp r0, #0x18
	bne _08005F98
	movs r0, #1
	str r0, [r7]
	b _08005FAE
	.align 2, 0
_08005F94: .4byte 0x03005578
_08005F98:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r7]
	ldr r0, [r7]
	cmp r0, #0x18
	ble _08005FAE
	ldr r0, [r7]
	adds r1, r0, #0
	subs r1, #0x17
	str r1, [r7]
_08005FAE:
	movs r0, #0x21
	bl PlaySfx
_08005FB4:
	b _08005E9A
_08005FB6:
	movs r0, #2
	bl sub_801E828
	ldr r0, _08006010 @ =0x03000ED8
	ldr r1, [r7]
	subs r2, r1, #1
	str r2, [r0]
	ldr r1, _08006010 @ =0x03000ED8
	ldr r0, [r1]
	adds r1, r7, #0
	adds r1, #0x1c
	adds r2, r7, #0
	adds r2, #0x20
	adds r3, r7, #0
	adds r3, #0x24
	bl ChangeLevel
	ldr r0, [r7, #0x1c]
	movs r1, #1
	cmn r0, r1
	bne _08005FFA
	movs r0, #0x78
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x8b
	movs r1, #1
	movs r2, #2
	movs r3, #0
	bl sub_801F2AC
	movs r0, #0xff
	bl SoftReset
_08005FFA:
	ldr r1, [r7, #0x20]
	lsls r0, r1, #0x10
	ldr r2, [r7, #0x1c]
	adds r1, r0, #0
	orrs r1, r2
	ldr r2, [r7, #0x24]
	lsls r0, r2, #0x18
	orrs r1, r0
	adds r0, r1, #0
	b _08006014
	.align 2, 0
_08006010: .4byte 0x03000ED8
_08006014:
	add sp, #0x34
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800601C
sub_800601C: @ 0x0800601C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r0, _08006054 @ =0x03000E30
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl sub_80057C4
	ldr r1, _08006058 @ =0x03000ED8
	str r0, [r1]
	ldr r1, _08006058 @ =0x03000ED8
	ldr r0, [r1]
	adds r2, r7, #4
	adds r3, r7, #0
	adds r3, #8
	adds r1, r7, #0
	bl ChangeLevel
	ldr r1, [r7, #4]
	lsls r0, r1, #0x10
	ldr r2, [r7]
	adds r1, r0, #0
	orrs r1, r2
	ldr r2, [r7, #8]
	lsls r0, r2, #0x18
	orrs r1, r0
	adds r0, r1, #0
	b _0800605C
	.align 2, 0
_08006054: .4byte 0x03000E30
_08006058: .4byte 0x03000ED8
_0800605C:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8006064
sub_8006064: @ 0x08006064
	push {r7, lr}
	sub sp, #0x28
	add r7, sp, #8
	movs r0, #1
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x14]
	movs r0, #0x2f
	str r0, [r7, #0x18]
	ldr r0, _08006120 @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, _08006120 @ =0x080322B0
	ldr r2, [r7, #0x14]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08006120 @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #8]
	bl sub_8000C10
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_801F400
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0xf0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	movs r1, #0xa0
	lsls r1, r1, #9
	str r1, [r0, #0x34]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #4]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0, #0x4c]
	movs r0, #0
	bl sub_801E828
	movs r0, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x82
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F2AC
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r2, _08006124 @ =0x00001444
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #2
	bl sub_801E7A0
_0800611E:
	b _0800612A
	.align 2, 0
_08006120: .4byte 0x080322B0
_08006124: .4byte 0x00001444
_08006128:
	.byte 0x66, 0xE1
_0800612A:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, _08006148 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800614C
	b _080063F8
	.align 2, 0
_08006148: .4byte 0x03005578
_0800614C:
	ldr r0, _08006184 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08006188
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	cmp r0, #7
	ble _0800617A
	movs r0, #0
	str r0, [r7, #0x1c]
_0800617A:
	ldr r0, [r7, #4]
	ldr r1, [r7, #0x1c]
	bl sub_8020E18
	b _080061BE
	.align 2, 0
_08006184: .4byte 0x03005578
_08006188:
	ldr r0, _08006200 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080061BE
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bge _080061B6
	movs r0, #7
	str r0, [r7, #0x1c]
_080061B6:
	ldr r0, [r7, #4]
	ldr r1, [r7, #0x1c]
	bl sub_8020E18
_080061BE:
	ldr r0, _08006200 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08006208
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _080061E4
	movs r0, #0
	str r0, [r7, #0xc]
_080061E4:
	ldr r0, _08006204 @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8020D1C
	b _08006248
	.align 2, 0
_08006200: .4byte 0x03005578
_08006204: .4byte 0x080322B0
_08006208:
	ldr r0, _080062B4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08006248
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _0800622E
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0xc]
_0800622E:
	ldr r0, _080062B8 @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8020D1C
_08006248:
	ldr r0, _080062B4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080062BC
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	cmp r0, r1
	blt _08006270
	movs r0, #0
	str r0, [r7, #0x14]
_08006270:
	ldr r0, _080062B8 @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, _080062B8 @ =0x080322B0
	ldr r2, [r7, #0x14]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	subs r0, r0, r1
	adds r1, r0, #1
	str r1, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0xc]
	ldr r0, _080062B8 @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8020D1C
	b _080063E4
	.align 2, 0
_080062B4: .4byte 0x03005578
_080062B8: .4byte 0x080322B0
_080062BC:
	ldr r0, _08006328 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08006330
	ldr r0, [r7, #0x14]
	subs r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _080062E4
	ldr r0, [r7, #0x18]
	subs r1, r0, #1
	str r1, [r7, #0x14]
_080062E4:
	ldr r0, _0800632C @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, _0800632C @ =0x080322B0
	ldr r2, [r7, #0x14]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	subs r0, r0, r1
	adds r1, r0, #1
	str r1, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0xc]
	ldr r0, _0800632C @ =0x080322B0
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8020D1C
	b _080063E4
	.align 2, 0
_08006328: .4byte 0x03005578
_0800632C: .4byte 0x080322B0
_08006330:
	ldr r0, _08006370 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08006374
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_8021030
	b _080063E4
	.align 2, 0
_08006370: .4byte 0x03005578
_08006374:
	ldr r0, _080063B4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080063B8
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_8021030
	b _080063E4
	.align 2, 0
_080063B4: .4byte 0x03005578
_080063B8:
	ldr r0, _080063F4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080063E4
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_8021068
_080063E4:
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	b _0800611E
	.align 2, 0
_080063F4: .4byte 0x03005578
_080063F8:
	movs r0, #2
	bl sub_801E828
	ldr r0, [r7]
	subs r1, r0, #1
	adds r0, r1, #0
	b _08006406
_08006406:
	add sp, #0x28
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8006410
sub_8006410: @ 0x08006410
	push {r7, lr}
	sub sp, #0x2c
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #1
	lsls r1, r0, #2
	movs r2, #0x88
	lsls r2, r2, #0x14
	subs r0, r2, r1
	ldr r1, [r0]
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	str r0, [r7, #8]
	ldr r0, [r7, #0x18]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x18]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	str r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	movs r0, #2
	str r0, [sp]
	ldr r0, [r7, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	bl sub_8021520
	ldr r0, _080064A4 @ =0x040000D4
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #5
	ldr r2, [r7, #8]
	adds r1, r2, r1
	str r1, [r0]
	ldr r1, [r7, #0x1c]
	adds r0, r1, #4
	ldr r1, _080064A8 @ =0x05000020
	str r1, [r0]
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _080064AC @ =0x80000010
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	add sp, #0x2c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080064A4: .4byte 0x040000D4
_080064A8: .4byte 0x05000020
_080064AC: .4byte 0x80000010

	thumb_func_start sub_80064B0
sub_80064B0: @ 0x080064B0
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #1
	lsls r1, r0, #2
	movs r2, #0x88
	lsls r2, r2, #0x14
	subs r0, r2, r1
	ldr r1, [r0]
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x1c]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r0, r3
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r0]
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #4
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	str r0, [r7, #0x18]
	ldr r0, _08006538 @ =0x040000D4
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #5
	ldr r2, [r7, #0xc]
	adds r1, r2, r1
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #4
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r3, #0xa0
	lsls r3, r3, #0x13
	adds r2, r1, r3
	str r2, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _0800653C @ =0x80000010
	str r1, [r0]
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006538: .4byte 0x040000D4
_0800653C: .4byte 0x80000010

	thumb_func_start sub_8006540
sub_8006540: @ 0x08006540
	push {r7, lr}
	sub sp, #0x30
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #1
	lsls r1, r0, #2
	movs r2, #0x88
	lsls r2, r2, #0x14
	subs r0, r2, r1
	ldr r1, [r0]
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	str r0, [r7, #8]
	ldr r0, [r7, #0x18]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x18]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	str r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x1c
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0800660C @ =0x040000D4
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	adds r1, r7, #0
	adds r1, #0x1c
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08006610 @ =0x81000800
	str r1, [r0]
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	movs r0, #0
	str r0, [sp]
	ldr r0, [r7, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #2
	bl sub_8021520
	ldr r0, _08006614 @ =0x04000008
	ldr r2, _08006618 @ =0x00004008
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0800660C @ =0x040000D4
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #5
	ldr r2, [r7, #8]
	adds r1, r2, r1
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _0800661C @ =0x80000010
	str r1, [r0]
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	add sp, #0x30
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800660C: .4byte 0x040000D4
_08006610: .4byte 0x81000800
_08006614: .4byte 0x04000008
_08006618: .4byte 0x00004008
_0800661C: .4byte 0x80000010

	thumb_func_start sub_8006620
sub_8006620: @ 0x08006620
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r7]
	movs r1, #0xbc
	lsls r1, r1, #1
	cmp r0, r1
	beq _0800669A
	movs r1, #0xbc
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08006670
	ldr r1, _0800666C @ =0x00000177
	cmp r0, r1
	beq _08006694
	b _0800668E
	.align 2, 0
_0800666C: .4byte 0x00000177
_08006670:
	ldr r1, _08006680 @ =0x00000179
	cmp r0, r1
	beq _0800668E
	ldr r1, _08006684 @ =0x0000017F
	cmp r0, r1
	beq _08006688
	b _0800668E
	.align 2, 0
_08006680: .4byte 0x00000179
_08006684: .4byte 0x0000017F
_08006688:
	movs r0, #1
	str r0, [r7, #0x10]
	b _080066A0
_0800668E:
	movs r0, #2
	str r0, [r7, #0x10]
	b _080066A0
_08006694:
	movs r0, #3
	str r0, [r7, #0x10]
	b _080066A0
_0800669A:
	movs r0, #4
	str r0, [r7, #0x10]
	b _080066A0
_080066A0:
	ldr r0, [r7]
	movs r1, #0
	bl sub_8006540
	movs r0, #0xba
	lsls r0, r0, #1
	ldr r1, [r7, #0x10]
	bl sub_8006410
	ldr r0, [r7]
	movs r1, #0
	movs r2, #0
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #2
	movs r2, #2
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #3
	movs r2, #3
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #4
	movs r2, #4
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #5
	movs r2, #5
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #6
	movs r2, #6
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #7
	movs r2, #7
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #8
	movs r2, #8
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #9
	movs r2, #9
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xa
	movs r2, #0xa
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xb
	movs r2, #0xb
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xc
	movs r2, #0xc
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xd
	movs r2, #0xd
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xe
	movs r2, #0xe
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xf
	movs r2, #0xf
	bl sub_80064B0
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	bl sub_8021650
	movs r0, #1
	bl sub_8021650
	adds r0, r7, #0
	adds r0, #8
	ldrb r2, [r0]
	movs r0, #1
	movs r1, #0
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	movs r1, #0
	bl sub_80216C8
_08006790:
	b _08006794
_08006792:
	.byte 0x28, 0xE0
_08006794:
	bl VBlankIntrWait
	bl sub_8021754
	adds r0, r7, #0
	adds r0, #8
	ldrb r2, [r0]
	movs r0, #1
	movs r1, #0
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrb r2, [r1]
	subs r1, r2, #6
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	movs r1, #0
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #9
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r1, [r0]
	cmp r1, #0x5f
	bls _080067E4
	b _080067E6
_080067E4:
	b _08006790
_080067E6:
	movs r0, #1
	bl sub_801E718
	ldr r1, [r7, #4]
	ldr r2, _08006800 @ =0xFFFFFE8E
	adds r0, r1, r2
	cmp r0, #0xb
	bhi _08006862
	lsls r1, r0, #2
	ldr r2, _08006804 @ =_08006808
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08006800: .4byte 0xFFFFFE8E
_08006804: .4byte _08006808
_08006808: @ jump table
	.4byte _08006862 @ case 0
	.4byte _08006862 @ case 1
	.4byte _08006862 @ case 2
	.4byte _08006838 @ case 3
	.4byte _08006862 @ case 4
	.4byte _08006862 @ case 5
	.4byte _08006862 @ case 6
	.4byte _08006862 @ case 7
	.4byte _0800688C @ case 8
	.4byte _08006862 @ case 9
	.4byte _080068E0 @ case 10
	.4byte _080068B6 @ case 11
_08006838:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0xee
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x60
	strb r1, [r0]
	movs r0, #2
	str r0, [r7, #0x10]
	b _0800690A
_08006862:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0xee
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x60
	strb r1, [r0]
	movs r0, #1
	str r0, [r7, #0x10]
	b _0800690A
_0800688C:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0xd5
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x60
	strb r1, [r0]
	movs r0, #3
	str r0, [r7, #0x10]
	b _0800690A
_080068B6:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0xd5
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x60
	strb r1, [r0]
	movs r0, #4
	str r0, [r7, #0x10]
	b _0800690A
_080068E0:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0xd5
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x60
	strb r1, [r0]
	movs r0, #5
	str r0, [r7, #0x10]
	b _0800690A
_0800690A:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #2
	movs r2, #2
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #3
	movs r2, #3
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #4
	movs r2, #4
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #5
	movs r2, #5
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	movs r2, #6
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #7
	movs r2, #7
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #8
	movs r2, #8
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #9
	movs r2, #9
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	movs r2, #0xa
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xb
	movs r2, #0xb
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xc
	movs r2, #0xc
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xd
	movs r2, #0xd
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xe
	movs r2, #0xe
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xf
	movs r2, #0xf
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8006540
	ldr r0, _08006A20 @ =0x0000017B
	ldr r1, [r7, #0x10]
	bl sub_8006410
	movs r0, #0
	bl sub_8021650
	movs r0, #1
	bl sub_8021650
	adds r0, r7, #0
	adds r0, #0xa
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80216C8
	ldr r0, _08006A24 @ =0x04000050
	movs r1, #0xbf
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _08006A28 @ =0x04000054
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	movs r1, #0x40
	strb r1, [r0]
_08006A1E:
	b _08006A2E
	.align 2, 0
_08006A20: .4byte 0x0000017B
_08006A24: .4byte 0x04000050
_08006A28: .4byte 0x04000054
_08006A2C:
	.byte 0x65, 0xE0
_08006A2E:
	adds r0, r7, #0
	adds r0, #0x19
	ldrb r1, [r0]
	cmp r1, #0
	beq _08006A60
	adds r1, r7, #0
	adds r1, #0x19
	adds r0, r7, #0
	adds r0, #0x19
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08006AC8 @ =0x04000054
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	lsrs r1, r2, #2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	adds r2, r1, #0
	strh r2, [r0]
_08006A60:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	bl VBlankIntrWait
	bl sub_8021754
	adds r0, r7, #0
	adds r0, #0xa
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #0xa
	adds r1, r7, #0
	adds r1, #0xa
	ldrb r2, [r1]
	adds r1, r2, #0
	subs r1, #8
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80216C8
	ldr r0, [r7, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08006ACC
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #9
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	strb r2, [r0]
	b _08006AEC
	.align 2, 0
_08006AC8: .4byte 0x04000054
_08006ACC:
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #9
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
_08006AEC:
	adds r0, r7, #0
	adds r0, #9
	ldrb r1, [r0]
	cmp r1, #0x32
	bhi _08006AF8
	b _08006AFA
_08006AF8:
	b _08006A1E
_08006AFA:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8006B04
sub_8006B04: @ 0x08006B04
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x40
	strh r1, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8006540
	ldr r0, [r7]
	movs r1, #1
	bl sub_8006410
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #2
	movs r2, #2
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #3
	movs r2, #3
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #4
	movs r2, #4
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #5
	movs r2, #5
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	movs r2, #6
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #7
	movs r2, #7
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #8
	movs r2, #8
	bl sub_80064B0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #9
	movs r2, #9
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xa
	movs r2, #0xa
	bl sub_80064B0
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r2, _08006C40 @ =0x0000FFB0
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x23
	strb r1, [r0]
	movs r0, #0
	bl sub_8021650
	movs r0, #1
	bl sub_8021650
	adds r0, r7, #0
	adds r0, #0xa
	ldrb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrb r2, [r0]
	movs r0, #1
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80216C8
	ldr r0, _08006C44 @ =0x04000050
	movs r1, #0xbf
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _08006C48 @ =0x04000054
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	movs r1, #0x40
	strb r1, [r0]
_08006C3E:
	b _08006C4E
	.align 2, 0
_08006C40: .4byte 0x0000FFB0
_08006C44: .4byte 0x04000050
_08006C48: .4byte 0x04000054
_08006C4C:
	.byte 0x49, 0xE0
_08006C4E:
	bl VBlankIntrWait
	bl sub_8021754
	adds r0, r7, #0
	adds r0, #0x19
	ldrb r1, [r0]
	cmp r1, #0
	beq _08006C88
	adds r1, r7, #0
	adds r1, #0x19
	adds r0, r7, #0
	adds r0, #0x19
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08006C94 @ =0x04000054
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	lsrs r1, r2, #2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	adds r2, r1, #0
	strh r2, [r0]
_08006C88:
	ldr r0, [r7, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08006C98
	b _08006C98
	.align 2, 0
_08006C94: .4byte 0x04000054
_08006C98:
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80216C8
	ldr r0, [r7, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08006CC4
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08006CC4:
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	cmp r1, #0xdb
	bhi _08006CDA
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	cmp r1, #0x1c
	bls _08006CDA
	b _08006CE2
_08006CDA:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08006C3E
_08006CE2:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8006CEC
sub_8006CEC: @ 0x08006CEC
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #5
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #6
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r7]
	movs r1, #1
	bl sub_8006410
	ldr r0, [r7]
	movs r1, #0
	movs r2, #0
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #1
	movs r2, #1
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #2
	movs r2, #2
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #3
	movs r2, #3
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #4
	movs r2, #4
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #5
	movs r2, #5
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #6
	movs r2, #6
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #7
	movs r2, #7
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #8
	movs r2, #8
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #9
	movs r2, #9
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xa
	movs r2, #0xa
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xb
	movs r2, #0xb
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xc
	movs r2, #0xc
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xd
	movs r2, #0xd
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xe
	movs r2, #0xe
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xf
	movs r2, #0xf
	bl sub_80064B0
	adds r0, r7, #6
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl sub_8021650
	adds r0, r7, #6
	ldrb r1, [r0]
	adds r0, r7, #4
	ldrb r2, [r0]
	movs r0, #1
	bl sub_80216C8
_08006DDE:
	b _08006DE2
_08006DE0:
	.byte 0x47, 0xE0
_08006DE2:
	bl VBlankIntrWait
	bl sub_8021754
	bl sub_8021AA0
	str r0, [r7, #0x18]
	bl sub_8021AA0
	adds r4, r0, #0
	bl sub_8021AA0
	adds r1, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #0x13
	ldr r3, [r7, #0x18]
	lsrs r2, r3, #3
	adds r3, r4, #0
	cmp r3, #0
	bge _08006E0C
	adds r3, #7
_08006E0C:
	asrs r3, r3, #3
	adds r4, r3, #0
	lsls r3, r4, #5
	orrs r2, r3
	cmp r1, #0
	bge _08006E1A
	adds r1, #7
_08006E1A:
	asrs r1, r1, #3
	adds r3, r1, #0
	lsls r1, r3, #0xa
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrb r1, [r0]
	adds r0, r7, #4
	ldrb r2, [r0]
	movs r0, #1
	bl sub_80216C8
	ldr r0, [r7, #0x10]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08006E4A
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
_08006E4A:
	ldr r0, [r7, #0x10]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08006E60
	adds r0, r7, #6
	adds r1, r7, #6
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
_08006E60:
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #0x54
	bls _08006E6A
	b _08006E72
_08006E6A:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08006DDE
_08006E72:
	movs r0, #2
	bl sub_801E828
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8006E80
sub_8006E80: @ 0x08006E80
	push {r4, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x40
	strh r1, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8006540
	ldr r0, [r7]
	movs r1, #1
	bl sub_8006410
	ldr r0, [r7]
	movs r1, #1
	movs r2, #1
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #2
	movs r2, #2
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #3
	movs r2, #3
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #4
	movs r2, #4
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #5
	movs r2, #5
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #6
	movs r2, #6
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #7
	movs r2, #7
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #8
	movs r2, #8
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #9
	movs r2, #9
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xa
	movs r2, #0xa
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xb
	movs r2, #0xb
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xc
	movs r2, #0xc
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xd
	movs r2, #0xd
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xe
	movs r2, #0xe
	bl sub_80064B0
	ldr r0, [r7]
	movs r1, #0xf
	movs r2, #0xf
	bl sub_80064B0
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0x10
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0x26
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	movs r1, #0x26
	strb r1, [r0]
	movs r0, #0
	bl sub_8021650
	movs r0, #1
	bl sub_8021650
	adds r0, r7, #0
	adds r0, #0xa
	ldrb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrb r2, [r0]
	movs r0, #1
	bl sub_80216C8
	adds r0, r7, #0
	adds r0, #0xc
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80216C8
	ldr r0, _08006FD0 @ =0x04000050
	movs r1, #0xbf
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _08006FD4 @ =0x04000054
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	movs r1, #0x40
	strb r1, [r0]
_08006FCC:
	b _08006FDA
	.align 2, 0
_08006FD0: .4byte 0x04000050
_08006FD4: .4byte 0x04000054
_08006FD8:
	.byte 0x5C, 0xE0
_08006FDA:
	bl VBlankIntrWait
	bl sub_8021754
	bl sub_8021AA0
	str r0, [r7, #0x1c]
	bl sub_8021AA0
	adds r4, r0, #0
	bl sub_8021AA0
	adds r1, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #0x13
	ldr r3, [r7, #0x1c]
	lsrs r2, r3, #3
	adds r3, r4, #0
	cmp r3, #0
	bge _08007004
	adds r3, #7
_08007004:
	asrs r3, r3, #3
	adds r4, r3, #0
	lsls r3, r4, #5
	orrs r2, r3
	cmp r1, #0
	bge _08007012
	adds r1, #7
_08007012:
	asrs r1, r1, #3
	adds r3, r1, #0
	lsls r1, r3, #0xa
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x19
	ldrb r1, [r0]
	cmp r1, #0
	beq _08007050
	adds r1, r7, #0
	adds r1, #0x19
	adds r0, r7, #0
	adds r0, #0x19
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08007088 @ =0x04000054
	adds r1, r7, #0
	adds r1, #0x19
	ldrb r2, [r1]
	lsrs r1, r2, #2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	adds r2, r1, #0
	strh r2, [r0]
_08007050:
	adds r0, r7, #0
	adds r0, #0xa
	ldrb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrb r2, [r0]
	movs r0, #1
	bl sub_80216C8
	ldr r0, [r7, #0x14]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0800707C
	adds r0, r7, #0
	adds r0, #0xa
	adds r1, r7, #0
	adds r1, #0xa
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
_0800707C:
	adds r0, r7, #0
	adds r0, #0xa
	ldrb r1, [r0]
	cmp r1, #0x14
	bls _0800708C
	b _08007094
	.align 2, 0
_08007088: .4byte 0x04000054
_0800708C:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08006FCC
_08007094:
	movs r0, #3
	bl sub_801E828
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80070A4
sub_80070A4: @ 0x080070A4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080070B8 @ =0x030010C0
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_80070BC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080070B8: .4byte 0x030010C0

	thumb_func_start sub_80070BC
sub_80070BC: @ 0x080070BC
	push {r7, lr}
	sub sp, #0x30
	add r7, sp, #0xc
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #0x18]
	movs r0, #0xe
	str r0, [r7, #0x1c]
	ldr r0, _08007128 @ =0x030010C0
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08007128 @ =0x030010C0
	ldrb r1, [r0, #1]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08007128 @ =0x030010C0
	ldrb r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #2]
	ldr r0, _08007128 @ =0x030010C0
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r0, _08007128 @ =0x030010C0
	ldrh r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #6]
	ldr r0, [r7]
	cmp r0, #6
	bls _08007118
	b _08007204
_08007118:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _0800712C @ =_08007130
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08007128: .4byte 0x030010C0
_0800712C: .4byte _08007130
_08007130: @ jump table
	.4byte _0800714C @ case 0
	.4byte _08007156 @ case 1
	.4byte _08007168 @ case 2
	.4byte _08007178 @ case 3
	.4byte _080071AC @ case 4
	.4byte _080071C0 @ case 5
	.4byte _080071D0 @ case 6
_0800714C:
	movs r0, #1
	bl sub_8021688
	b _080073CC
_08007154:
	.byte 0x56, 0xE0
_08007156:
	ldr r0, _08007164 @ =0x087FFDC0
	ldr r1, [r0]
	str r1, [r7, #0x14]
	movs r0, #1
	str r0, [r7, #0x18]
	b _08007204
	.align 2, 0
_08007164: .4byte 0x087FFDC0
_08007168:
	ldr r0, _08007174 @ =0x087FFDE4
	ldr r1, [r0]
	str r1, [r7, #0x14]
	movs r0, #1
	str r0, [r7, #0x18]
	b _08007204
	.align 2, 0
_08007174: .4byte 0x087FFDE4
_08007178:
	ldr r0, _08007198 @ =0x087FFDE4
	ldr r1, [r0]
	str r1, [r7, #0x14]
	ldr r0, _0800719C @ =0x04000050
	ldr r2, _080071A0 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080071A4 @ =0x04000052
	ldr r2, _080071A8 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #1
	str r0, [r7, #0x18]
	movs r0, #0xd
	str r0, [r7, #0x1c]
	b _08007204
	.align 2, 0
_08007198: .4byte 0x087FFDE4
_0800719C: .4byte 0x04000050
_080071A0: .4byte 0x00001C42
_080071A4: .4byte 0x04000052
_080071A8: .4byte 0x0000060A
_080071AC:
	ldr r0, _080071BC @ =0x087FFDDC
	ldr r1, [r0]
	str r1, [r7, #0x14]
	movs r0, #1
	str r0, [r7, #0x18]
	movs r0, #0xe
	str r0, [r7, #0x1c]
	b _08007204
	.align 2, 0
_080071BC: .4byte 0x087FFDDC
_080071C0:
	ldr r0, _080071CC @ =0x087FFD90
	ldr r1, [r0]
	str r1, [r7, #0x14]
	movs r0, #1
	str r0, [r7, #0x18]
	b _08007204
	.align 2, 0
_080071CC: .4byte 0x087FFD90
_080071D0:
	ldr r0, _080071F0 @ =0x087FFDF8
	ldr r1, [r0]
	str r1, [r7, #0x14]
	ldr r0, _080071F4 @ =0x04000050
	ldr r2, _080071F8 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080071FC @ =0x04000052
	ldr r2, _08007200 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #1
	str r0, [r7, #0x18]
	movs r0, #0xe
	str r0, [r7, #0x1c]
	b _08007204
	.align 2, 0
_080071F0: .4byte 0x087FFDF8
_080071F4: .4byte 0x04000050
_080071F8: .4byte 0x00001C42
_080071FC: .4byte 0x04000052
_08007200: .4byte 0x0000060A
_08007204:
	ldr r0, [r7, #0x14]
	str r0, [r7, #4]
	ldr r0, [r7, #0x14]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	str r0, [r7, #8]
	ldr r0, [r7, #0x14]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldr r1, [r0]
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x14]
	adds r1, r0, #4
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x10]
	movs r0, #0x19
	str r0, [sp]
	ldr r0, [r7, #8]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #3
	movs r2, #0
	movs r3, #0
	bl sub_8021520
	ldr r0, _080072C4 @ =0x040000D4
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #0x10]
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #4
	ldr r1, _080072C8 @ =0x0600D000
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7, #0xc]
	adds r2, r1, #0
	lsls r1, r2, #4
	movs r2, #0x80
	lsls r2, r2, #0x18
	orrs r1, r2
	str r1, [r0]
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r0, _080072C4 @ =0x040000D4
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	ldr r1, [r7, #0x1c]
	adds r2, r1, #0
	lsls r1, r2, #5
	ldr r2, [r7, #4]
	adds r1, r2, r1
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #4
	ldr r1, _080072CC @ =0x050001C0
	str r1, [r0]
	ldr r1, [r7, #0x20]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _080072D0 @ =0x80000010
	str r1, [r0]
	ldr r0, [r7, #0x20]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r0, [r7, #0x18]
	cmp r0, #0
	beq _080072AE
	movs r0, #1
	bl sub_8021650
_080072AE:
	ldr r0, [r7]
	cmp r0, #6
	bls _080072B6
	b _080073CC
_080072B6:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080072D4 @ =_080072D8
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080072C4: .4byte 0x040000D4
_080072C8: .4byte 0x0600D000
_080072CC: .4byte 0x050001C0
_080072D0: .4byte 0x80000010
_080072D4: .4byte _080072D8
_080072D8: @ jump table
	.4byte _080072F4 @ case 0
	.4byte _080072F6 @ case 1
	.4byte _08007334 @ case 2
	.4byte _08007336 @ case 3
	.4byte _08007358 @ case 4
	.4byte _0800737C @ case 5
	.4byte _080073A8 @ case 6
_080072F4:
	b _080073CC
_080072F6:
	ldr r0, _0800732C @ =0x0400000A
	ldr r1, _0800732C @ =0x0400000A
	ldrh r2, [r1]
	ldr r3, _08007330 @ =0x0000FFFC
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0800732C @ =0x0400000A
	ldr r1, _0800732C @ =0x0400000A
	ldrh r2, [r1]
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	movs r0, #7
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xe
	movs r1, #2
	movs r2, #0xa
	movs r3, #0xa0
	bl sub_801E8F0
	b _080073CC
	.align 2, 0
_0800732C: .4byte 0x0400000A
_08007330: .4byte 0x0000FFFC
_08007334:
	b _080073CC
_08007336:
	ldr r0, _08007348 @ =0x04000050
	ldr r2, _0800734C @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08007350 @ =0x04000052
	ldr r2, _08007354 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	b _080073CC
	.align 2, 0
_08007348: .4byte 0x04000050
_0800734C: .4byte 0x00001C42
_08007350: .4byte 0x04000052
_08007354: .4byte 0x0000060A
_08007358:
	ldr r0, _0800736C @ =0x04000050
	ldr r2, _08007370 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08007374 @ =0x04000052
	ldr r2, _08007378 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	b _080073CC
	.align 2, 0
_0800736C: .4byte 0x04000050
_08007370: .4byte 0x00001C42
_08007374: .4byte 0x04000052
_08007378: .4byte 0x0000060A
_0800737C:
	ldr r0, _080073A0 @ =0x0400000A
	ldr r1, _080073A0 @ =0x0400000A
	ldrh r2, [r1]
	ldr r3, _080073A4 @ =0x0000FFFC
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080073A0 @ =0x0400000A
	ldr r1, _080073A0 @ =0x0400000A
	ldrh r2, [r1]
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _080073CC
	.align 2, 0
_080073A0: .4byte 0x0400000A
_080073A4: .4byte 0x0000FFFC
_080073A8:
	ldr r0, _080073BC @ =0x04000050
	ldr r2, _080073C0 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080073C4 @ =0x04000052
	ldr r2, _080073C8 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	b _080073CC
	.align 2, 0
_080073BC: .4byte 0x04000050
_080073C0: .4byte 0x00001C42
_080073C4: .4byte 0x04000052
_080073C8: .4byte 0x0000060A
_080073CC:
	add sp, #0x30
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80073D4
sub_80073D4: @ 0x080073D4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
	ldr r1, _0800742C @ =0x030010C0
	ldr r0, _0800742C @ =0x030010C0
	ldr r1, _0800742C @ =0x030010C0
	ldrh r2, [r1, #4]
	adds r1, r2, #1
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, _0800742C @ =0x030010C0
	ldr r0, _0800742C @ =0x030010C0
	ldr r1, _0800742C @ =0x030010C0
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _0800742C @ =0x030010C0
	ldrb r0, [r1]
	cmp r0, #6
	bls _08007420
	b _08007912
_08007420:
	lsls r1, r0, #2
	ldr r2, _08007430 @ =_08007434
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800742C: .4byte 0x030010C0
_08007430: .4byte _08007434
_08007434: @ jump table
	.4byte _08007450 @ case 0
	.4byte _08007454 @ case 1
	.4byte _080074A4 @ case 2
	.4byte _08007514 @ case 3
	.4byte _0800772C @ case 4
	.4byte _08007732 @ case 5
	.4byte _08007780 @ case 6
_08007450:
	b _0800793E
_08007452:
	.byte 0x5E, 0xE2
_08007454:
	ldr r0, _080074A0 @ =0x030010C0
	ldrh r1, [r0, #4]
	cmp r1, #8
	bls _0800749C
	ldr r1, _080074A0 @ =0x030010C0
	ldr r0, _080074A0 @ =0x030010C0
	ldr r1, _080074A0 @ =0x030010C0
	ldrb r2, [r1, #2]
	adds r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _080074A0 @ =0x030010C0
	ldr r0, _080074A0 @ =0x030010C0
	ldr r1, _080074A0 @ =0x030010C0
	ldrb r2, [r1, #1]
	adds r1, r2, #1
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _080074A0 @ =0x030010C0
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
_0800749C:
	b _08007912
	.align 2, 0
_080074A0: .4byte 0x030010C0
_080074A4:
	ldr r0, _08007500 @ =0x030010C0
	ldrh r1, [r0, #4]
	cmp r1, #0xa
	bls _080074EC
	ldr r1, _08007500 @ =0x030010C0
	ldr r0, _08007500 @ =0x030010C0
	ldr r1, _08007500 @ =0x030010C0
	ldrb r2, [r1, #2]
	adds r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _08007500 @ =0x030010C0
	ldr r0, _08007500 @ =0x030010C0
	ldr r1, _08007500 @ =0x030010C0
	ldrb r2, [r1, #1]
	adds r1, r2, #1
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _08007500 @ =0x030010C0
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
_080074EC:
	ldr r0, _08007504 @ =0x04000050
	ldr r2, _08007508 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0800750C @ =0x04000052
	ldr r2, _08007510 @ =0x00000808
	adds r1, r2, #0
	strh r1, [r0]
	b _08007912
	.align 2, 0
_08007500: .4byte 0x030010C0
_08007504: .4byte 0x04000050
_08007508: .4byte 0x00001C42
_0800750C: .4byte 0x04000052
_08007510: .4byte 0x00000808
_08007514:
	ldr r0, _08007570 @ =0x030010C0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0800755C
	ldr r1, _08007570 @ =0x030010C0
	ldr r0, _08007570 @ =0x030010C0
	ldr r1, _08007570 @ =0x030010C0
	ldrb r2, [r1, #2]
	subs r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _08007570 @ =0x030010C0
	ldr r0, _08007570 @ =0x030010C0
	ldr r1, _08007570 @ =0x030010C0
	ldrb r2, [r1, #1]
	adds r1, r2, #1
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _08007570 @ =0x030010C0
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
_0800755C:
	ldr r0, _08007570 @ =0x030010C0
	ldrh r1, [r0, #6]
	ldr r0, _08007574 @ =0x000001D1
	cmp r1, r0
	bls _08007578
	movs r0, #0
	bl sub_80070BC
	b _08007718
	.align 2, 0
_08007570: .4byte 0x030010C0
_08007574: .4byte 0x000001D1
_08007578:
	ldr r0, _08007598 @ =0x030010C0
	ldrh r1, [r0, #6]
	movs r0, #0xe1
	lsls r0, r0, #1
	cmp r1, r0
	bls _080075AC
	ldr r0, _0800759C @ =0x04000050
	ldr r2, _080075A0 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080075A4 @ =0x04000052
	ldr r2, _080075A8 @ =0x00000E02
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_08007598: .4byte 0x030010C0
_0800759C: .4byte 0x04000050
_080075A0: .4byte 0x00001C42
_080075A4: .4byte 0x04000052
_080075A8: .4byte 0x00000E02
_080075AC:
	ldr r0, _080075C8 @ =0x030010C0
	ldrh r1, [r0, #6]
	ldr r0, _080075CC @ =0x000001B3
	cmp r1, r0
	bls _080075E0
	ldr r0, _080075D0 @ =0x04000050
	ldr r2, _080075D4 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080075D8 @ =0x04000052
	ldr r2, _080075DC @ =0x00000C04
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_080075C8: .4byte 0x030010C0
_080075CC: .4byte 0x000001B3
_080075D0: .4byte 0x04000050
_080075D4: .4byte 0x00001C42
_080075D8: .4byte 0x04000052
_080075DC: .4byte 0x00000C04
_080075E0:
	ldr r0, _08007600 @ =0x030010C0
	ldrh r1, [r0, #6]
	movs r0, #0xd2
	lsls r0, r0, #1
	cmp r1, r0
	bls _08007614
	ldr r0, _08007604 @ =0x04000050
	ldr r2, _08007608 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0800760C @ =0x04000052
	ldr r2, _08007610 @ =0x00000A06
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_08007600: .4byte 0x030010C0
_08007604: .4byte 0x04000050
_08007608: .4byte 0x00001C42
_0800760C: .4byte 0x04000052
_08007610: .4byte 0x00000A06
_08007614:
	ldr r0, _08007630 @ =0x030010C0
	ldrh r1, [r0, #6]
	ldr r0, _08007634 @ =0x00000195
	cmp r1, r0
	bls _08007648
	ldr r0, _08007638 @ =0x04000050
	ldr r2, _0800763C @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08007640 @ =0x04000052
	ldr r2, _08007644 @ =0x00000808
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_08007630: .4byte 0x030010C0
_08007634: .4byte 0x00000195
_08007638: .4byte 0x04000050
_0800763C: .4byte 0x00001C42
_08007640: .4byte 0x04000052
_08007644: .4byte 0x00000808
_08007648:
	ldr r0, _08007664 @ =0x030010C0
	ldrh r1, [r0, #6]
	cmp r1, #0x3c
	bls _08007678
	ldr r0, _08007668 @ =0x04000050
	ldr r2, _0800766C @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08007670 @ =0x04000052
	ldr r2, _08007674 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_08007664: .4byte 0x030010C0
_08007668: .4byte 0x04000050
_0800766C: .4byte 0x00001C42
_08007670: .4byte 0x04000052
_08007674: .4byte 0x0000060A
_08007678:
	ldr r0, _08007694 @ =0x030010C0
	ldrh r1, [r0, #6]
	cmp r1, #0x2d
	bls _080076A8
	ldr r0, _08007698 @ =0x04000050
	ldr r2, _0800769C @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080076A0 @ =0x04000052
	ldr r2, _080076A4 @ =0x00000808
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_08007694: .4byte 0x030010C0
_08007698: .4byte 0x04000050
_0800769C: .4byte 0x00001C42
_080076A0: .4byte 0x04000052
_080076A4: .4byte 0x00000808
_080076A8:
	ldr r0, _080076C4 @ =0x030010C0
	ldrh r1, [r0, #6]
	cmp r1, #0x1e
	bls _080076D8
	ldr r0, _080076C8 @ =0x04000050
	ldr r2, _080076CC @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080076D0 @ =0x04000052
	ldr r2, _080076D4 @ =0x00000A06
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_080076C4: .4byte 0x030010C0
_080076C8: .4byte 0x04000050
_080076CC: .4byte 0x00001C42
_080076D0: .4byte 0x04000052
_080076D4: .4byte 0x00000A06
_080076D8:
	ldr r0, _080076F4 @ =0x030010C0
	ldrh r1, [r0, #6]
	cmp r1, #0xf
	bls _08007708
	ldr r0, _080076F8 @ =0x04000050
	ldr r2, _080076FC @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08007700 @ =0x04000052
	ldr r2, _08007704 @ =0x00000C04
	adds r1, r2, #0
	strh r1, [r0]
	b _08007718
	.align 2, 0
_080076F4: .4byte 0x030010C0
_080076F8: .4byte 0x04000050
_080076FC: .4byte 0x00001C42
_08007700: .4byte 0x04000052
_08007704: .4byte 0x00000C04
_08007708:
	ldr r0, _0800771C @ =0x04000050
	ldr r2, _08007720 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08007724 @ =0x04000052
	ldr r2, _08007728 @ =0x00000E02
	adds r1, r2, #0
	strh r1, [r0]
_08007718:
	b _08007912
	.align 2, 0
_0800771C: .4byte 0x04000050
_08007720: .4byte 0x00001C42
_08007724: .4byte 0x04000052
_08007728: .4byte 0x00000E02
_0800772C:
	movs r0, #1
	str r0, [r7, #8]
	b _08007912
_08007732:
	ldr r0, _0800777C @ =0x030010C0
	ldrh r1, [r0, #4]
	cmp r1, #8
	bls _0800777A
	ldr r1, _0800777C @ =0x030010C0
	ldr r0, _0800777C @ =0x030010C0
	ldr r1, _0800777C @ =0x030010C0
	ldrb r2, [r1, #2]
	subs r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _0800777C @ =0x030010C0
	ldr r0, _0800777C @ =0x030010C0
	ldr r1, _0800777C @ =0x030010C0
	ldrb r2, [r1, #1]
	subs r1, r2, #1
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _0800777C @ =0x030010C0
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
_0800777A:
	b _08007912
	.align 2, 0
_0800777C: .4byte 0x030010C0
_08007780:
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #8]
	ldr r0, _080077C8 @ =0x030010C0
	ldrh r1, [r0, #6]
	lsrs r0, r1, #3
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	lsls r1, r0, #3
	adds r0, r1, #1
	ldr r1, _080077C8 @ =0x030010C0
	ldrh r2, [r1, #6]
	cmp r0, r2
	bne _080077A8
	movs r0, #1
	str r0, [r7, #0x10]
_080077A8:
	ldr r0, _080077CC @ =0x04000050
	ldr r2, _080077D0 @ =0x00001C42
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, #0x1b
	bls _080077B8
	b _08007910
_080077B8:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080077D4 @ =_080077D8
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080077C8: .4byte 0x030010C0
_080077CC: .4byte 0x04000050
_080077D0: .4byte 0x00001C42
_080077D4: .4byte _080077D8
_080077D8: @ jump table
	.4byte _080078F0 @ case 0
	.4byte _080078DC @ case 1
	.4byte _080078C8 @ case 2
	.4byte _080078B4 @ case 3
	.4byte _080078A0 @ case 4
	.4byte _0800788C @ case 5
	.4byte _08007878 @ case 6
	.4byte _08007864 @ case 7
	.4byte _08007850 @ case 8
	.4byte _080078F0 @ case 9
	.4byte _080078DC @ case 10
	.4byte _080078C8 @ case 11
	.4byte _080078B4 @ case 12
	.4byte _080078A0 @ case 13
	.4byte _0800788C @ case 14
	.4byte _08007878 @ case 15
	.4byte _08007864 @ case 16
	.4byte _08007850 @ case 17
	.4byte _080078F0 @ case 18
	.4byte _080078DC @ case 19
	.4byte _080078C8 @ case 20
	.4byte _080078B4 @ case 21
	.4byte _080078A0 @ case 22
	.4byte _0800788C @ case 23
	.4byte _08007878 @ case 24
	.4byte _08007864 @ case 25
	.4byte _08007850 @ case 26
	.4byte _08007848 @ case 27
_08007848:
	movs r0, #0
	bl sub_80070BC
	b _08007910
_08007850:
	ldr r0, _0800785C @ =0x04000052
	ldr r2, _08007860 @ =0x00000E02
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_0800785C: .4byte 0x04000052
_08007860: .4byte 0x00000E02
_08007864:
	ldr r0, _08007870 @ =0x04000052
	ldr r2, _08007874 @ =0x00000C04
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_08007870: .4byte 0x04000052
_08007874: .4byte 0x00000C04
_08007878:
	ldr r0, _08007884 @ =0x04000052
	ldr r2, _08007888 @ =0x00000A06
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_08007884: .4byte 0x04000052
_08007888: .4byte 0x00000A06
_0800788C:
	ldr r0, _08007898 @ =0x04000052
	ldr r2, _0800789C @ =0x00000808
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_08007898: .4byte 0x04000052
_0800789C: .4byte 0x00000808
_080078A0:
	ldr r0, _080078AC @ =0x04000052
	ldr r2, _080078B0 @ =0x0000060A
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_080078AC: .4byte 0x04000052
_080078B0: .4byte 0x0000060A
_080078B4:
	ldr r0, _080078C0 @ =0x04000052
	ldr r2, _080078C4 @ =0x00000808
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_080078C0: .4byte 0x04000052
_080078C4: .4byte 0x00000808
_080078C8:
	ldr r0, _080078D4 @ =0x04000052
	ldr r2, _080078D8 @ =0x00000A06
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_080078D4: .4byte 0x04000052
_080078D8: .4byte 0x00000A06
_080078DC:
	ldr r0, _080078E8 @ =0x04000052
	ldr r2, _080078EC @ =0x00000C04
	adds r1, r2, #0
	strh r1, [r0]
	b _08007910
	.align 2, 0
_080078E8: .4byte 0x04000052
_080078EC: .4byte 0x00000C04
_080078F0:
	ldr r0, _08007908 @ =0x04000052
	ldr r2, _0800790C @ =0x00000E02
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08007904
	movs r0, #0x3b
	bl PlaySfx
_08007904:
	b _08007910
	.align 2, 0
_08007908: .4byte 0x04000052
_0800790C: .4byte 0x00000E02
_08007910:
	b _08007912
_08007912:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _08007934
	ldr r0, _08007930 @ =0x030010C0
	ldrb r1, [r0, #1]
	ldr r0, [r7]
	adds r1, r1, r0
	ldr r0, _08007930 @ =0x030010C0
	ldrb r2, [r0, #2]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	movs r0, #1
	bl sub_80216C8
	b _0800793E
	.align 2, 0
_08007930: .4byte 0x030010C0
_08007934:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_80216C8
_0800793E:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8007948
sub_8007948: @ 0x08007948
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r1, _080079CC @ =0x0000020A
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #8]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r0, [r7, #8]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x90
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	str r1, [r0]
	movs r0, #0
	str r0, [r7, #4]
_080079C4:
	ldr r0, [r7, #4]
	cmp r0, #3
	bls _080079D0
	b _08007A60
	.align 2, 0
_080079CC: .4byte 0x0000020A
_080079D0:
	ldr r1, _08007A5C @ =0x00000231
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0xbc
	ldrh r2, [r0, #0x14]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x14]
	ldr r0, [r7, #8]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x90
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #4
	ldr r0, [r7, #8]
	str r0, [r1]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080079C4
	.align 2, 0
_08007A5C: .4byte 0x00000231
_08007A60:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8007A68
sub_8007A68: @ 0x08007A68
	push {r4, r7, lr}
	sub sp, #0x30
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	str r0, [r7, #0x28]
	movs r0, #1
	str r0, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #4]
	bl sub_8003F04
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #2
	bl sub_8020F98
_08007AA6:
	ldr r0, [r7, #0x28]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08007AB0
	b _08007B0A
_08007AB0:
	ldr r0, [r7, #0x2c]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x2c]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r2, [r7]
	adds r1, r0, r2
	ldr r0, [r1]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x1c]
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r2, r1, #0
	adds r3, r2, #0
	lsls r2, r3, #2
	ldr r3, [r7]
	adds r2, r2, r3
	adds r1, #1
	str r1, [r0]
	ldr r0, [r2]
	ldr r1, [r7, #0x28]
	ldrb r2, [r1]
	subs r1, r2, #1
	bl sub_8020F98
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	b _08007AA6
_08007B0A:
	ldr r0, [r7, #0x2c]
	cmp r0, #4
	bls _08007B12
	b _08007B3A
_08007B12:
	adds r0, r7, #0
	adds r0, #0x2c
	ldr r1, [r0]
	adds r2, r1, #0
	adds r3, r2, #0
	lsls r2, r3, #2
	ldr r3, [r7]
	adds r2, r2, r3
	ldr r4, [r2]
	adds r3, r4, #0
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r3, [r2]
	movs r4, #4
	orrs r3, r4
	adds r4, r3, #0
	strb r4, [r2]
	adds r1, #1
	str r1, [r0]
	b _08007B0A
_08007B3A:
	add sp, #0x30
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8007B44
sub_8007B44: @ 0x08007B44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	ldr r1, [r7]
	str r0, [r1]
	ldr r0, [r7]
	ldr r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #0xa
	str r0, [r1, #0x30]
	ldr r0, [r7]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x34]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	ldr r2, [r7]
	adds r1, r2, #4
	str r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #4
	ldr r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #0xa
	str r0, [r1, #0x30]
	ldr r1, [r7]
	adds r0, r1, #4
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x34]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #8
	str r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #0xa
	str r0, [r1, #0x30]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x34]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0xc
	str r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	str r0, [r1, #0x30]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x34]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8007BFC
sub_8007BFC: @ 0x08007BFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	cmp r1, #0
	beq _08007C36
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xc
	movs r1, #0
	str r1, [r0]
	movs r0, #1
	b _08007CBE
_08007C36:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	cmp r1, #0
	beq _08007C68
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #8
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #8
	movs r1, #0
	str r1, [r0]
	movs r0, #1
	b _08007CBE
_08007C68:
	ldr r1, [r7]
	adds r0, r1, #4
	ldr r1, [r0]
	cmp r1, #0
	beq _08007C94
	ldr r1, [r7]
	adds r0, r1, #4
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #4
	movs r1, #0
	str r1, [r0]
	movs r0, #1
	b _08007CBE
_08007C94:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #0
	beq _08007CBA
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0]
	movs r0, #0
	b _08007CBE
_08007CBA:
	movs r0, #0
	b _08007CBE
_08007CBE:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8007CC8
sub_8007CC8: @ 0x08007CC8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r2, r1, #1
	ldr r1, _08007CEC @ =0x050001E0
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007CEC: .4byte 0x050001E0

	thumb_func_start sub_8007CF0
sub_8007CF0: @ 0x08007CF0
	push {r7, lr}
	sub sp, #0x60
	add r7, sp, #8
	movs r0, #0
	bl sub_801E828
	bl sub_8000C10
	movs r0, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x98
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F2AC
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r2, _08007D34 @ =0x00001444
	adds r1, r2, #0
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_801F400
	movs r0, #0
	str r0, [r7]
_08007D2C:
	ldr r0, [r7]
	cmp r0, #5
	ble _08007D38
	b _08007D48
	.align 2, 0
_08007D34: .4byte 0x00001444
_08007D38:
	ldr r0, [r7]
	movs r1, #0
	bl sub_8007CC8
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08007D2C
_08007D48:
	adds r1, r7, #0
	adds r1, #0x34
	adds r0, r1, #0
	bl sub_8007B44
	movs r0, #0
	str r0, [r7, #0x30]
	adds r1, r7, #0
	adds r1, #0x44
	adds r0, r1, #0
	bl sub_8007948
	adds r0, r7, #0
	adds r0, #0x44
	ldr r1, [r7, #0x30]
	bl sub_8007A68
	movs r0, #1
	bl sub_801E7A0
	movs r0, #0
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	movs r0, #0
	str r0, [r7, #0x24]
	movs r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x87
	str r0, [r7, #0x2c]
_08007D98:
	b _08007D9C
_08007D9A:
	.byte 0xA7, 0xE1
_08007D9C:
	bl VBlankIntrWait
	bl sub_8021754
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	ldr r0, [r7, #0x28]
	cmp r0, #0
	beq _08007DC8
	ldr r0, [r7, #0x28]
	adds r1, r0, #1
	str r1, [r7, #0x28]
	ldr r0, [r7, #0x28]
	cmp r0, #0x3c
	bls _08007DC6
	b _080080EC
_08007DC6:
	b _08007D98
_08007DC8:
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x2c]
	cmp r0, r1
	bls _08007E24
	movs r0, #0
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x2c]
	subs r1, r0, #1
	str r1, [r7, #0x2c]
	movs r0, #3
	bl sub_8021B2C
	cmp r0, #1
	beq _08007E08
	cmp r0, #1
	bgt _08007DF4
	cmp r0, #0
	beq _08007DFA
	b _08007E24
_08007DF4:
	cmp r0, #2
	beq _08007E16
	b _08007E24
_08007DFA:
	ldr r0, [r7, #0x2c]
	adds r1, r0, #0
	subs r1, #0x2d
	str r1, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x20]
	b _08007E24
_08007E08:
	ldr r0, [r7, #0x2c]
	adds r1, r0, #0
	subs r1, #0x2d
	str r1, [r7, #8]
	movs r0, #0
	str r0, [r7, #0x20]
	b _08007E24
_08007E16:
	ldr r0, [r7, #0x2c]
	adds r1, r0, #0
	subs r1, #0x2d
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #0x20]
	b _08007E24
_08007E24:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	beq _08007E32
	ldr r0, [r7, #0x18]
	subs r1, r0, #1
	str r1, [r7, #0x18]
	b _08007F38
_08007E32:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _08007E40
	ldr r0, [r7, #0x14]
	subs r1, r0, #1
	str r1, [r7, #0x14]
	b _08007F38
_08007E40:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08007E4E
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
	b _08007F38
_08007E4E:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _08007E62
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08007E62
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _08007E62
	b _08007F38
_08007E62:
	ldr r0, _08007E9C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08007EAA
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0xf
	str r1, [r7, #0x10]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08007EA0
	movs r0, #1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x30]
	adds r1, r0, #0
	adds r1, #0x14
	str r1, [r7, #0x30]
	b _08007EA8
	.align 2, 0
_08007E9C: .4byte 0x03005578
_08007EA0:
	movs r0, #0
	str r0, [r7, #0x20]
	movs r0, #1
	str r0, [r7, #0x24]
_08007EA8:
	b _08007F38
_08007EAA:
	ldr r0, _08007EE4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08007EF2
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0xf
	str r1, [r7, #0x14]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08007EE8
	movs r0, #1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x30]
	adds r1, r0, #0
	adds r1, #0x14
	str r1, [r7, #0x30]
	b _08007EF0
	.align 2, 0
_08007EE4: .4byte 0x03005578
_08007EE8:
	movs r0, #0
	str r0, [r7, #0x20]
	movs r0, #1
	str r0, [r7, #0x24]
_08007EF0:
	b _08007F38
_08007EF2:
	ldr r0, _08007F2C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08007F38
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0xf
	str r1, [r7, #0x18]
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _08007F30
	movs r0, #1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x30]
	adds r1, r0, #0
	adds r1, #0x14
	str r1, [r7, #0x30]
	b _08007F38
	.align 2, 0
_08007F2C: .4byte 0x03005578
_08007F30:
	movs r0, #0
	str r0, [r7, #0x20]
	movs r0, #1
	str r0, [r7, #0x24]
_08007F38:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08007F5E
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _08007F5C
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	adds r0, r0, r1
	cmp r0, #0
	bne _08007F5C
	movs r0, #1
	str r0, [r7, #0x24]
_08007F5C:
	b _08007FA8
_08007F5E:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _08007F84
	ldr r0, [r7, #8]
	subs r1, r0, #1
	str r1, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _08007F82
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	adds r0, r0, r1
	cmp r0, #0
	bne _08007F82
	movs r0, #1
	str r0, [r7, #0x24]
_08007F82:
	b _08007FA8
_08007F84:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08007FA8
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08007FA8
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	adds r0, r0, r1
	cmp r0, #0
	bne _08007FA8
	movs r0, #1
	str r0, [r7, #0x24]
_08007FA8:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08007FCE
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bne _08007FC4
	ldr r1, _08007FC0 @ =0x000003FF
	movs r0, #0
	bl sub_8007CC8
	b _08007FCC
	.align 2, 0
_08007FC0: .4byte 0x000003FF
_08007FC4:
	movs r0, #0
	movs r1, #0x1f
	bl sub_8007CC8
_08007FCC:
	b _08007FD6
_08007FCE:
	movs r0, #0
	movs r1, #0
	bl sub_8007CC8
_08007FD6:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _08007FFA
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bne _08007FF0
	ldr r1, _08007FEC @ =0x000003FF
	movs r0, #1
	bl sub_8007CC8
	b _08007FF8
	.align 2, 0
_08007FEC: .4byte 0x000003FF
_08007FF0:
	movs r0, #1
	movs r1, #0x1f
	bl sub_8007CC8
_08007FF8:
	b _08008002
_08007FFA:
	movs r0, #1
	movs r1, #0
	bl sub_8007CC8
_08008002:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08008026
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bne _0800801C
	ldr r1, _08008018 @ =0x000003FF
	movs r0, #2
	bl sub_8007CC8
	b _08008024
	.align 2, 0
_08008018: .4byte 0x000003FF
_0800801C:
	movs r0, #2
	movs r1, #0x1f
	bl sub_8007CC8
_08008024:
	b _0800802E
_08008026:
	movs r0, #2
	movs r1, #0
	bl sub_8007CC8
_0800802E:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08008052
	ldr r0, [r7, #0x20]
	cmp r0, #0
	beq _08008048
	ldr r1, _08008044 @ =0x000003FF
	movs r0, #3
	bl sub_8007CC8
	b _08008050
	.align 2, 0
_08008044: .4byte 0x000003FF
_08008048:
	movs r0, #3
	movs r1, #0x1f
	bl sub_8007CC8
_08008050:
	b _0800805A
_08008052:
	movs r0, #3
	movs r1, #0
	bl sub_8007CC8
_0800805A:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _0800807E
	ldr r0, [r7, #0x20]
	cmp r0, #0
	beq _08008074
	ldr r1, _08008070 @ =0x000003FF
	movs r0, #4
	bl sub_8007CC8
	b _0800807C
	.align 2, 0
_08008070: .4byte 0x000003FF
_08008074:
	movs r0, #4
	movs r1, #0x1f
	bl sub_8007CC8
_0800807C:
	b _08008086
_0800807E:
	movs r0, #4
	movs r1, #0
	bl sub_8007CC8
_08008086:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	beq _080080AA
	ldr r0, [r7, #0x20]
	cmp r0, #0
	beq _080080A0
	ldr r1, _0800809C @ =0x000003FF
	movs r0, #5
	bl sub_8007CC8
	b _080080A8
	.align 2, 0
_0800809C: .4byte 0x000003FF
_080080A0:
	movs r0, #5
	movs r1, #0x1f
	bl sub_8007CC8
_080080A8:
	b _080080B2
_080080AA:
	movs r0, #5
	movs r1, #0
	bl sub_8007CC8
_080080B2:
	ldr r0, [r7, #0x24]
	cmp r0, #1
	bne _080080CE
	movs r0, #0
	str r0, [r7, #0x24]
	adds r1, r7, #0
	adds r1, #0x34
	adds r0, r1, #0
	bl sub_8007BFC
	cmp r0, #0
	bne _080080CE
	movs r0, #1
	str r0, [r7, #0x28]
_080080CE:
	ldr r0, [r7, #0x30]
	ldr r1, _080080E8 @ =0x0000018F
	cmp r0, r1
	ble _080080DA
	movs r0, #1
	str r0, [r7, #0x28]
_080080DA:
	adds r0, r7, #0
	adds r0, #0x44
	ldr r1, [r7, #0x30]
	bl sub_8007A68
	b _08007D98
	.align 2, 0
_080080E8: .4byte 0x0000018F
_080080EC:
	ldr r0, _08008104 @ =0x030010CC
	ldr r1, [r0]
	ldr r0, [r7, #0x30]
	cmp r1, r0
	bge _080080FC
	ldr r0, _08008104 @ =0x030010CC
	ldr r1, [r7, #0x30]
	str r1, [r0]
_080080FC:
	add sp, #0x60
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008104: .4byte 0x030010CC

	thumb_func_start sub_8008108
sub_8008108: @ 0x08008108
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldr r3, _08008158 @ =0x00000333
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	cmp r0, #0x66
	bgt _08008128
	b _080082F8
_08008128:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	cmp r0, #0x7d
	ble _08008134
	b _080082F8
_08008134:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	beq _08008142
	b _080082F8
_08008142:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	beq _080081CC
	cmp r0, #1
	bgt _0800815C
	cmp r0, #0
	beq _08008168
	b _080082F8
	.align 2, 0
_08008158: .4byte 0x00000333
_0800815C:
	cmp r0, #2
	beq _08008230
	cmp r0, #3
	bne _08008166
	b _08008294
_08008166:
	b _080082F8
_08008168:
	ldr r0, _080081C4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080081C2
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #1
	movs r1, #0x30
	bl sub_80084FC
	ldr r0, _080081C4 @ =0x03005578
	ldr r1, _080081C4 @ =0x03005578
	ldrh r2, [r1]
	ldr r3, _080081C8 @ =0x0000FDFF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	adds r0, r2, #0
	bl PlaySfx
_080081C2:
	b _080082F8
	.align 2, 0
_080081C4: .4byte 0x03005578
_080081C8: .4byte 0x0000FDFF
_080081CC:
	ldr r0, _08008228 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08008224
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #1
	movs r1, #0x60
	bl sub_80084FC
	ldr r0, _08008228 @ =0x03005578
	ldr r1, _08008228 @ =0x03005578
	ldrh r2, [r1]
	ldr r3, _0800822C @ =0x0000FFFD
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	adds r0, r2, #0
	bl PlaySfx
_08008224:
	b _080082F8
	.align 2, 0
_08008228: .4byte 0x03005578
_0800822C: .4byte 0x0000FFFD
_08008230:
	ldr r0, _0800828C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08008288
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #1
	movs r1, #0x90
	bl sub_80084FC
	ldr r0, _0800828C @ =0x03005578
	ldr r1, _0800828C @ =0x03005578
	ldrh r2, [r1]
	ldr r3, _08008290 @ =0x0000FFFE
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	adds r0, r2, #0
	bl PlaySfx
_08008288:
	b _080082F8
	.align 2, 0
_0800828C: .4byte 0x03005578
_08008290: .4byte 0x0000FFFE
_08008294:
	ldr r0, _080082F0 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080082EE
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #1
	movs r1, #0xc0
	bl sub_80084FC
	ldr r0, _080082F0 @ =0x03005578
	ldr r1, _080082F0 @ =0x03005578
	ldrh r2, [r1]
	ldr r3, _080082F4 @ =0x0000FEFF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	adds r0, r2, #0
	bl PlaySfx
_080082EE:
	b _080082F8
	.align 2, 0
_080082F0: .4byte 0x03005578
_080082F4: .4byte 0x0000FEFF
_080082F8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	bne _080083AA
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	cmp r0, #0x7e
	ble _080083AA
	ldr r0, _08008344 @ =0x030010C8
	ldr r1, [r0]
	cmp r1, #0
	bne _0800832C
	ldr r1, [r7]
	ldr r0, [r1, #0x58]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	ldr r1, [r2]
	adds r2, r1, #0
	subs r2, #0x14
	str r2, [r0]
	ldr r0, _08008344 @ =0x030010C8
	movs r1, #1
	str r1, [r0]
_0800832C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	beq _08008362
	cmp r0, #1
	bgt _08008348
	cmp r0, #0
	beq _08008352
	b _08008392
	.align 2, 0
_08008344: .4byte 0x030010C8
_08008348:
	cmp r0, #2
	beq _08008372
	cmp r0, #3
	beq _08008382
	b _08008392
_08008352:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #0
	movs r1, #0x30
	bl sub_80084FC
	b _08008392
_08008362:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #0
	movs r1, #0x60
	bl sub_80084FC
	b _08008392
_08008372:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #0
	movs r1, #0x90
	bl sub_80084FC
	b _08008392
_08008382:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r2, r1, #0xa
	movs r0, #0
	movs r1, #0xc0
	bl sub_80084FC
	b _08008392
_08008392:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080083AA:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	cmp r0, #0xb4
	ble _080083C4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080083C4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80083CC
sub_80083CC: @ 0x080083CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldr r3, _08008410 @ =0x00000333
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x1e
	bls _08008406
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08008406:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008410: .4byte 0x00000333

	thumb_func_start sub_8008414
sub_8008414: @ 0x08008414
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0x84
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, _080084BC @ =sub_8008108
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x58]
	ldr r0, [r7]
	cmp r0, #1
	beq _080084CA
	cmp r0, #1
	blo _080084C0
	cmp r0, #2
	beq _080084D4
	cmp r0, #3
	beq _080084DE
	b _080084E8
	.align 2, 0
_080084BC: .4byte sub_8008108
_080084C0:
	ldr r0, [r7, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0, #0x30]
	b _080084E8
_080084CA:
	ldr r0, [r7, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #9
	str r1, [r0, #0x30]
	b _080084E8
_080084D4:
	ldr r0, [r7, #0xc]
	movs r1, #0x90
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	b _080084E8
_080084DE:
	ldr r0, [r7, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	b _080084E8
_080084E8:
	ldr r0, [r7, #0xc]
	ldr r1, _080084F8 @ =0xFFFFD800
	str r1, [r0, #0x34]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080084F8: .4byte 0xFFFFD800

	thumb_func_start sub_80084FC
sub_80084FC: @ 0x080084FC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0x9c
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, [r7, #0xc]
	ldr r1, _08008588 @ =sub_80083CC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7]
	cmp r0, #0
	bne _0800857E
	movs r0, #0x37
	bl PlaySfx
_0800857E:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008588: .4byte sub_80083CC

	thumb_func_start sub_800858C
sub_800858C: @ 0x0800858C
	push {r7, lr}
	sub sp, #0x3c
	add r7, sp, #8
	movs r0, #0xc8
	lsls r0, r0, #1
	str r0, [r7, #0xc]
	ldr r0, _080085F8 @ =0x08032488
	str r0, [r7, #0x10]
	movs r0, #4
	str r0, [r7, #0x14]
	movs r0, #0
	bl sub_801E828
	bl m4aMPlayAllStop
	bl sub_8000C10
	movs r0, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x8e
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F2AC
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r2, _080085FC @ =0x00001444
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #1
	bl sub_801E7A0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_801F400
	adds r1, r7, #0
	adds r1, #0x18
	adds r0, r1, #0
	bl sub_8007948
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r7, #0xc]
	bl sub_8007A68
	movs r0, #0x14
	str r0, [r7, #4]
_080085F4:
	b _08008602
	.align 2, 0
_080085F8: .4byte 0x08032488
_080085FC: .4byte 0x00001444
_08008600:
	.byte 0xC8, 0xE0
_08008602:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bgt _0800868A
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	ldrb r1, [r0]
	str r1, [r7, #0x2c]
	ldr r0, [r7, #0x2c]
	lsrs r1, r0, #4
	str r1, [r7, #0x30]
	ldr r0, _08008648 @ =0x030010C8
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0xff
	beq _0800868A
	ldr r0, [r7, #0x2c]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08008658
	cmp r0, #4
	bhi _0800864C
	cmp r0, #2
	beq _08008652
	b _08008664
	.align 2, 0
_08008648: .4byte 0x030010C8
_0800864C:
	cmp r0, #8
	beq _0800865E
	b _08008664
_08008652:
	movs r0, #0x48
	str r0, [r7, #4]
	b _0800866A
_08008658:
	movs r0, #0x24
	str r0, [r7, #4]
	b _0800866A
_0800865E:
	movs r0, #0x12
	str r0, [r7, #4]
	b _0800866A
_08008664:
	movs r0, #0x48
	str r0, [r7, #4]
	b _0800866A
_0800866A:
	ldr r1, [r7, #0x30]
	subs r0, r1, #1
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	subs r2, r1, #1
	ldrb r3, [r2]
	adds r1, r3, #0
	adds r1, #0x2e
	adds r2, r7, #0
	adds r2, #0xc
	bl sub_8008414
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
_0800868A:
	ldr r0, [r7, #4]
	movs r1, #0xf0
	cmn r0, r1
	bgt _08008694
	b _08008794
_08008694:
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	ldr r0, _0800878C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080086D8
	movs r0, #0
	movs r1, #0x30
	movs r2, #0x72
	bl sub_80084FC
	ldr r0, _08008790 @ =0x030010C8
	ldr r1, [r0]
	cmp r1, #0
	bne _080086D8
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x14
	str r1, [r7, #0xc]
	ldr r0, _08008790 @ =0x030010C8
	movs r1, #1
	str r1, [r0]
_080086D8:
	ldr r0, _0800878C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800870C
	movs r0, #0
	movs r1, #0x60
	movs r2, #0x72
	bl sub_80084FC
	ldr r0, _08008790 @ =0x030010C8
	ldr r1, [r0]
	cmp r1, #0
	bne _0800870C
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x14
	str r1, [r7, #0xc]
	ldr r0, _08008790 @ =0x030010C8
	movs r1, #1
	str r1, [r0]
_0800870C:
	ldr r0, _0800878C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08008740
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x72
	bl sub_80084FC
	ldr r0, _08008790 @ =0x030010C8
	ldr r1, [r0]
	cmp r1, #0
	bne _08008740
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x14
	str r1, [r7, #0xc]
	ldr r0, _08008790 @ =0x030010C8
	movs r1, #1
	str r1, [r0]
_08008740:
	ldr r0, _0800878C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08008776
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x72
	bl sub_80084FC
	ldr r0, _08008790 @ =0x030010C8
	ldr r1, [r0]
	cmp r1, #0
	bne _08008776
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x14
	str r1, [r7, #0xc]
	ldr r0, _08008790 @ =0x030010C8
	movs r1, #1
	str r1, [r0]
_08008776:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08008780
	movs r0, #0
	str r0, [r7, #0xc]
_08008780:
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r7, #0xc]
	bl sub_8007A68
	b _080085F4
	.align 2, 0
_0800878C: .4byte 0x03005578
_08008790: .4byte 0x030010C8
_08008794:
	ldr r0, _080087AC @ =0x03001134
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	bge _080087A4
	ldr r0, _080087AC @ =0x03001134
	ldr r1, [r7, #0xc]
	str r1, [r0]
_080087A4:
	add sp, #0x3c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080087AC: .4byte 0x03001134

	thumb_func_start sub_80087B0
sub_80087B0: @ 0x080087B0
	push {r7, lr}
	sub sp, #0x74
	add r7, sp, #0xc
	movs r0, #0
	str r0, [r7, #0x30]
	movs r0, #0
	str r0, [r7, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r2, #0x82
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0
	bl sub_801E828
	bl sub_8000C10
	ldr r0, _080089F8 @ =0x087FFDA0
	ldr r1, [r0]
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x5c]
	movs r3, #0x82
	lsls r3, r3, #2
	adds r1, r0, r3
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x50]
	ldr r0, [r7, #0x5c]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r0, r2
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	ldr r1, [r0]
	str r1, [r7, #0x54]
	ldr r0, [r7, #0x5c]
	adds r1, r0, #4
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x58]
	ldr r2, [r7, #0x54]
	ldr r3, [r7, #0x58]
	movs r0, #0x1f
	str r0, [sp]
	ldr r0, [r7, #0x50]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #2
	bl sub_8021520
	ldr r0, _080089FC @ =0x040000D4
	str r0, [r7, #0x60]
	ldr r0, [r7, #0x60]
	ldr r1, [r7, #0x4c]
	str r1, [r0]
	ldr r1, [r7, #0x60]
	adds r0, r1, #4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, [r7, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08008A00 @ =0x80000100
	str r1, [r0]
	ldr r0, [r7, #0x60]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r0, _08008A04 @ =0x087FFDA4
	ldr r1, [r0]
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x5c]
	movs r3, #0x82
	lsls r3, r3, #2
	adds r1, r0, r3
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x50]
	ldr r0, [r7, #0x5c]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r0, r2
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	ldr r1, [r0]
	str r1, [r7, #0x54]
	ldr r0, [r7, #0x5c]
	adds r1, r0, #4
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080089FC @ =0x040000D4
	str r0, [r7, #0x60]
	ldr r0, [r7, #0x60]
	adds r1, r7, #0
	adds r1, #0x64
	str r1, [r0]
	ldr r1, [r7, #0x60]
	adds r0, r1, #4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, [r7, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08008A08 @ =0x81000800
	str r1, [r0]
	ldr r0, [r7, #0x60]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r2, [r7, #0x54]
	ldr r3, [r7, #0x58]
	movs r0, #0x1e
	str r0, [sp]
	ldr r0, [r7, #0x50]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	bl sub_8021520
	ldr r0, _08008A0C @ =0x087FFDA8
	ldr r1, [r0]
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x5c]
	movs r3, #0x82
	lsls r3, r3, #2
	adds r1, r0, r3
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x50]
	ldr r0, [r7, #0x5c]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r0, r2
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	ldr r1, [r0]
	str r1, [r7, #0x54]
	ldr r0, [r7, #0x5c]
	adds r1, r0, #4
	str r1, [r7, #0x5c]
	ldr r0, [r7, #0x5c]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080089FC @ =0x040000D4
	str r0, [r7, #0x60]
	ldr r0, [r7, #0x60]
	adds r1, r7, #0
	adds r1, #0x64
	str r1, [r0]
	ldr r1, [r7, #0x60]
	adds r0, r1, #4
	ldr r1, _08008A10 @ =0x0600E000
	str r1, [r0]
	ldr r1, [r7, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08008A08 @ =0x81000800
	str r1, [r0]
	ldr r0, [r7, #0x60]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r1]
	ldr r2, [r7, #0x54]
	ldr r3, [r7, #0x58]
	movs r0, #0x1c
	str r0, [sp]
	ldr r0, [r7, #0x50]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl sub_8021520
	ldr r0, _08008A14 @ =0x04000008
	movs r3, #0xb8
	lsls r3, r3, #7
	adds r1, r3, #0
	strh r1, [r0]
	movs r0, #0
	bl sub_8021650
	movs r0, #1
	bl sub_8021650
	movs r0, #2
	bl sub_8021650
	movs r0, #0x6f
	rsbs r0, r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r1, _08008A18 @ =0x00000222
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x18]
	movs r1, #0xa0
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x18]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [r0, #0x34]
	ldr r1, _08008A1C @ =0x00000223
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x1c]
	movs r1, #0xbe
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x1c]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [r0, #0x34]
	movs r0, #0
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x28]
	movs r0, #0
	str r0, [r7, #0x2c]
	ldr r1, [r7, #4]
	ldr r2, [r7, #0xc]
	movs r0, #0
	bl sub_80216C8
	ldr r1, [r7, #8]
	ldr r2, [r7, #0x10]
	movs r0, #1
	bl sub_80216C8
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, #0
	bl sub_8007948
	adds r0, r7, #0
	adds r0, #0x38
	ldr r1, [r7, #0x34]
	bl sub_8007A68
	movs r0, #1
	bl sub_801E7A0
_080089F6:
	b _08008A22
	.align 2, 0
_080089F8: .4byte 0x087FFDA0
_080089FC: .4byte 0x040000D4
_08008A00: .4byte 0x80000100
_08008A04: .4byte 0x087FFDA4
_08008A08: .4byte 0x81000800
_08008A0C: .4byte 0x087FFDA8
_08008A10: .4byte 0x0600E000
_08008A14: .4byte 0x04000008
_08008A18: .4byte 0x00000222
_08008A1C: .4byte 0x00000223
_08008A20:
	.byte 0xBF, 0xE1
_08008A22:
	bl VBlankIntrWait
	bl sub_8021754
	ldr r0, [r7, #0x14]
	cmp r0, #4
	bls _08008A32
	b _08008D10
_08008A32:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08008A40 @ =_08008A44
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08008A40: .4byte _08008A44
_08008A44: @ jump table
	.4byte _08008A58 @ case 0
	.4byte _08008B7A @ case 1
	.4byte _08008BEE @ case 2
	.4byte _08008C74 @ case 3
	.4byte _08008D08 @ case 4
_08008A58:
	ldr r0, [r7, #0x28]
	cmp r0, #0
	beq _08008A64
	ldr r0, [r7, #0x28]
	subs r1, r0, #1
	str r1, [r7, #0x28]
_08008A64:
	ldr r0, _08008A88 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08008AD4
	ldr r0, [r7, #0x20]
	cmp r0, #2
	bhi _08008A8C
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #0x1e
	str r1, [r7, #0x28]
	b _08008AD4
	.align 2, 0
_08008A88: .4byte 0x03005578
_08008A8C:
	ldr r0, [r7, #0x20]
	cmp r0, #5
	bhi _08008A9C
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #0x19
	str r1, [r7, #0x28]
	b _08008AD4
_08008A9C:
	ldr r0, [r7, #0x20]
	cmp r0, #8
	bhi _08008AAC
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #0x14
	str r1, [r7, #0x28]
	b _08008AD4
_08008AAC:
	ldr r0, [r7, #0x20]
	cmp r0, #0xb
	bhi _08008ABC
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #0xf
	str r1, [r7, #0x28]
	b _08008AD4
_08008ABC:
	ldr r0, [r7, #0x20]
	cmp r0, #0xe
	bhi _08008ACC
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #0xb
	str r1, [r7, #0x28]
	b _08008AD4
_08008ACC:
	ldr r0, [r7, #0x28]
	adds r1, r0, #0
	adds r1, #9
	str r1, [r7, #0x28]
_08008AD4:
	ldr r0, _08008B18 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08008AEE
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
_08008AEE:
	ldr r0, [r7, #0x28]
	lsrs r1, r0, #4
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0x11
	bls _08008AFE
	movs r0, #0x11
	str r0, [r7, #0x20]
_08008AFE:
	movs r0, #0
	str r0, [r7, #0x60]
	ldr r0, [r7, #0x2c]
	cmp r0, #1
	beq _08008B28
	cmp r0, #1
	blo _08008B1C
	cmp r0, #2
	beq _08008B34
	cmp r0, #3
	beq _08008B40
	b _08008B4C
	.align 2, 0
_08008B18: .4byte 0x03005578
_08008B1C:
	ldr r0, [r7, #0x20]
	cmp r0, #7
	bls _08008B26
	movs r0, #1
	str r0, [r7, #0x60]
_08008B26:
	b _08008B4C
_08008B28:
	ldr r0, [r7, #0x20]
	cmp r0, #0xa
	bls _08008B32
	movs r0, #1
	str r0, [r7, #0x60]
_08008B32:
	b _08008B4C
_08008B34:
	ldr r0, [r7, #0x20]
	cmp r0, #0xe
	bls _08008B3E
	movs r0, #1
	str r0, [r7, #0x60]
_08008B3E:
	b _08008B4C
_08008B40:
	ldr r0, [r7, #0x20]
	cmp r0, #0x10
	bls _08008B4A
	movs r0, #1
	str r0, [r7, #0x60]
_08008B4A:
	b _08008B4C
_08008B4C:
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _08008B62
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	movs r1, #1
	bl sub_8020F98
	movs r0, #2
	str r0, [r7, #0x24]
	b _08008B70
_08008B62:
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8020F98
	movs r0, #0
	str r0, [r7, #0x24]
_08008B70:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x20]
	bl sub_8020F98
	b _08008D10
_08008B7A:
	ldr r0, [r7, #0x24]
	cmp r0, #4
	bhi _08008BD2
	ldr r0, [r7, #0x24]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08008B90 @ =_08008B94
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08008B90: .4byte _08008B94
_08008B94: @ jump table
	.4byte _08008BA8 @ case 0
	.4byte _08008BB0 @ case 1
	.4byte _08008BB8 @ case 2
	.4byte _08008BC0 @ case 3
	.4byte _08008BC8 @ case 4
_08008BA8:
	ldr r0, [r7, #4]
	adds r1, r0, #3
	str r1, [r7, #4]
	b _08008BD2
_08008BB0:
	ldr r0, [r7, #4]
	adds r1, r0, #4
	str r1, [r7, #4]
	b _08008BD2
_08008BB8:
	ldr r0, [r7, #4]
	adds r1, r0, #5
	str r1, [r7, #4]
	b _08008BD2
_08008BC0:
	ldr r0, [r7, #4]
	adds r1, r0, #7
	str r1, [r7, #4]
	b _08008BD2
_08008BC8:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #9
	str r1, [r7, #4]
	b _08008BD2
_08008BD2:
	ldr r0, [r7, #4]
	movs r1, #0x2f
	cmn r0, r1
	ble _08008BEC
	ldr r0, [r7, #0x24]
	cmp r0, #0
	bne _08008BE6
	movs r0, #4
	str r0, [r7, #0x14]
	b _08008BEC
_08008BE6:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
_08008BEC:
	b _08008D10
_08008BEE:
	ldr r0, [r7, #0x24]
	cmp r0, #4
	bhi _08008C66
	ldr r0, [r7, #0x24]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08008C04 @ =_08008C08
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08008C04: .4byte _08008C08
_08008C08: @ jump table
	.4byte _08008C1C @ case 0
	.4byte _08008C2A @ case 1
	.4byte _08008C38 @ case 2
	.4byte _08008C46 @ case 3
	.4byte _08008C54 @ case 4
_08008C1C:
	ldr r0, [r7, #4]
	adds r1, r0, #3
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #3
	str r1, [r7, #8]
	b _08008C66
_08008C2A:
	ldr r0, [r7, #4]
	adds r1, r0, #4
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #4
	str r1, [r7, #8]
	b _08008C66
_08008C38:
	ldr r0, [r7, #4]
	adds r1, r0, #5
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #5
	str r1, [r7, #8]
	b _08008C66
_08008C46:
	ldr r0, [r7, #4]
	adds r1, r0, #7
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #7
	str r1, [r7, #8]
	b _08008C66
_08008C54:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #9
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #9
	str r1, [r7, #8]
	b _08008C66
_08008C66:
	ldr r0, [r7, #4]
	cmp r0, #0x10
	ble _08008C72
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
_08008C72:
	b _08008D10
_08008C74:
	ldr r0, [r7, #0x24]
	cmp r0, #4
	bhi _08008CE8
	ldr r0, [r7, #0x24]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08008C88 @ =_08008C8C
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08008C88: .4byte _08008C8C
_08008C8C: @ jump table
	.4byte _08008CA0 @ case 0
	.4byte _08008CAE @ case 1
	.4byte _08008CBC @ case 2
	.4byte _08008CCA @ case 3
	.4byte _08008CD8 @ case 4
_08008CA0:
	ldr r0, [r7, #4]
	subs r1, r0, #3
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #3
	str r1, [r7, #8]
	b _08008CE8
_08008CAE:
	ldr r0, [r7, #4]
	subs r1, r0, #4
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #4
	str r1, [r7, #8]
	b _08008CE8
_08008CBC:
	ldr r0, [r7, #4]
	subs r1, r0, #5
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #5
	str r1, [r7, #8]
	b _08008CE8
_08008CCA:
	ldr r0, [r7, #4]
	subs r1, r0, #5
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #7
	str r1, [r7, #8]
	b _08008CE8
_08008CD8:
	ldr r0, [r7, #4]
	subs r1, r0, #5
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #9
	str r1, [r7, #8]
	b _08008CE8
_08008CE8:
	ldr r0, [r7, #4]
	movs r1, #0x77
	cmn r0, r1
	bge _08008CF6
	movs r0, #0x77
	rsbs r0, r0, #0
	str r0, [r7, #4]
_08008CF6:
	ldr r0, [r7, #8]
	cmp r0, #0xb4
	ble _08008D06
	movs r0, #0xb4
	str r0, [r7, #8]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
_08008D06:
	b _08008D10
_08008D08:
	ldr r0, [r7, #0x30]
	adds r1, r0, #1
	str r1, [r7, #0x30]
	b _08008D10
_08008D10:
	ldr r1, [r7, #4]
	ldr r2, [r7, #0xc]
	movs r0, #0
	bl sub_80216C8
	ldr r1, [r7, #8]
	ldr r2, [r7, #0x10]
	movs r0, #1
	bl sub_80216C8
	movs r0, #0
	bl sub_80204F8
	bl sub_801FD34
	bl sub_801FC2C
	ldr r0, [r7, #0x30]
	cmp r0, #1
	bne _08008D8E
	movs r0, #0
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x24]
	cmp r0, #0
	beq _08008D52
	ldr r0, [r7, #0x2c]
	adds r1, r0, #1
	str r1, [r7, #0x2c]
	ldr r0, [r7, #0x34]
	adds r1, r0, #0
	adds r1, #0x64
	str r1, [r7, #0x34]
	b _08008D56
_08008D52:
	movs r0, #4
	str r0, [r7, #0x2c]
_08008D56:
	ldr r0, [r7, #0x2c]
	cmp r0, #4
	bne _08008D62
	movs r0, #2
	str r0, [r7, #0x30]
	b _08008D8E
_08008D62:
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x1c]
	ldr r2, [r1, #0x30]
	movs r3, #0xa0
	lsls r3, r3, #6
	adds r1, r2, r3
	str r1, [r0, #0x30]
	movs r0, #0
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x6f
	rsbs r0, r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0x10]
_08008D8E:
	ldr r0, [r7, #0x30]
	cmp r0, #0x3c
	bls _08008D96
	b _08008DA2
_08008D96:
	adds r0, r7, #0
	adds r0, #0x38
	ldr r1, [r7, #0x34]
	bl sub_8007A68
	b _080089F6
_08008DA2:
	ldr r0, _08008DBC @ =0x030010F4
	ldr r1, [r0]
	ldr r0, [r7, #0x34]
	cmp r1, r0
	bge _08008DB2
	ldr r0, _08008DBC @ =0x030010F4
	ldr r1, [r7, #0x34]
	str r1, [r0]
_08008DB2:
	add sp, #0x74
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008DBC: .4byte 0x030010F4

	thumb_func_start sub_8008DC0
sub_8008DC0: @ 0x08008DC0
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7]
	bl sub_8009000
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08008EB0
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x56
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, _08008E68 @ =0x03000EE8
	ldr r3, [r1]
	adds r2, r3, #0
	adds r1, r3, #0
	adds r1, #0x46
	adds r2, r0, #0
	adds r0, #0x51
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08008E6C
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	movs r0, #0x39
	bl PlaySfx
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08008EB0
	.align 2, 0
_08008E68: .4byte 0x03000EE8
_08008E6C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #0
	beq _08008E92
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08008EB0
_08008E92:
	ldr r1, [r7]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	movs r0, #0x39
	bl PlaySfx
_08008EB0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #0
	beq _08008F78
	ldr r0, _08008F0C @ =0x030010E0
	ldr r1, [r0]
	cmp r1, #0
	beq _08008F10
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x51
	ldrb r2, [r1]
	ldr r0, [r7]
	movs r1, #0x66
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	ldr r1, [r7, #4]
	cmp r0, r1
	beq _08008F0A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	ldr r2, [r7, #4]
	adds r1, r2, #1
	cmp r0, r1
	beq _08008F0A
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
_08008F0A:
	b _08008F76
	.align 2, 0
_08008F0C: .4byte 0x030010E0
_08008F10:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x53
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _08008F5E
	ldr r1, [r7]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	movs r0, #0x39
	bl PlaySfx
	b _08008F76
_08008F5E:
	ldr r1, [r7]
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
_08008F76:
	b _08008FF2
_08008F78:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #0
	beq _08008FF2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x52
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _08008FFC @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x51
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	ldr r1, [r7, #4]
	cmp r0, r1
	beq _08008FF2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	ldr r2, [r7, #4]
	adds r1, r2, #1
	cmp r0, r1
	beq _08008FF2
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
_08008FF2:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008FFC: .4byte 0x00000333

	thumb_func_start sub_8009000
sub_8009000: @ 0x08009000
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x58
	ldrh r0, [r1]
	cmp r0, #0
	beq _08009034
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x58
	ldrh r0, [r1]
	str r0, [r7, #0x14]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x58
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x14]
	adds r0, r1, #0
	b _0800931C
_08009034:
	ldr r0, _08009040 @ =0x030010E4
	ldr r1, [r0]
	cmp r1, #2
	beq _08009044
	movs r0, #0
	b _0800931C
	.align 2, 0
_08009040: .4byte 0x030010E4
_08009044:
	ldr r0, [r7]
	ldr r2, _08009058 @ =0x03000EE8
	ldr r1, [r2]
	ldrb r0, [r0, #0x17]
	ldrb r1, [r1, #0x17]
	cmp r0, r1
	beq _0800905C
	movs r0, #0
	b _0800931C
	.align 2, 0
_08009058: .4byte 0x03000EE8
_0800905C:
	ldr r0, _08009080 @ =0x0300114C
	ldr r1, [r0]
	cmp r1, #1
	bne _08009088
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08009088
	ldr r0, _08009084 @ =0x03001188
	ldr r1, [r0]
	adds r0, r1, #0
	b _0800931C
	.align 2, 0
_08009080: .4byte 0x0300114C
_08009084: .4byte 0x03001188
_08009088:
	ldr r0, _080090A4 @ =0x03000EE8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #7
	bls _08009098
	b _080092AC
_08009098:
	lsls r1, r0, #2
	ldr r2, _080090A8 @ =_080090AC
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080090A4: .4byte 0x03000EE8
_080090A8: .4byte _080090AC
_080090AC: @ jump table
	.4byte _080090CC @ case 0
	.4byte _0800910C @ case 1
	.4byte _08009144 @ case 2
	.4byte _08009184 @ case 3
	.4byte _080091BC @ case 4
	.4byte _080091FC @ case 5
	.4byte _08009234 @ case 6
	.4byte _08009274 @ case 7
_080090CC:
	ldr r1, _08009100 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009104 @ =0x0300114C
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r1, _08009100 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0x10]
	ldr r1, _08009100 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009108 @ =0x03001164
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, _08009100 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009108 @ =0x03001164
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #8]
	b _080092AC
	.align 2, 0
_08009100: .4byte 0x03000EE8
_08009104: .4byte 0x0300114C
_08009108: .4byte 0x03001164
_0800910C:
	ldr r1, _0800913C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009140 @ =0x0300114C
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r1, _0800913C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0x10]
	ldr r1, _0800913C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r1, _0800913C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009140 @ =0x0300114C
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #8]
	b _080092AC
	.align 2, 0
_0800913C: .4byte 0x03000EE8
_08009140: .4byte 0x0300114C
_08009144:
	ldr r1, _08009178 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _0800917C @ =0x03001164
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r1, _08009178 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _0800917C @ =0x03001164
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r1, _08009178 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r1, _08009178 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009180 @ =0x0300114C
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #8]
	b _080092AC
	.align 2, 0
_08009178: .4byte 0x03000EE8
_0800917C: .4byte 0x03001164
_08009180: .4byte 0x0300114C
_08009184:
	ldr r1, _080091B4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0xc]
	ldr r1, _080091B4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080091B8 @ =0x0300114C
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r1, _080091B4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r1, _080091B4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080091B8 @ =0x0300114C
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #8]
	b _080092AC
	.align 2, 0
_080091B4: .4byte 0x03000EE8
_080091B8: .4byte 0x0300114C
_080091BC:
	ldr r1, _080091F0 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0xc]
	ldr r1, _080091F0 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080091F4 @ =0x0300114C
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r1, _080091F0 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080091F8 @ =0x03001164
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, _080091F0 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080091F8 @ =0x03001164
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #8]
	b _080092AC
	.align 2, 0
_080091F0: .4byte 0x03000EE8
_080091F4: .4byte 0x0300114C
_080091F8: .4byte 0x03001164
_080091FC:
	ldr r1, _0800922C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0xc]
	ldr r1, _0800922C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009230 @ =0x0300114C
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r1, _0800922C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009230 @ =0x0300114C
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, _0800922C @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #8]
	b _080092AC
	.align 2, 0
_0800922C: .4byte 0x03000EE8
_08009230: .4byte 0x0300114C
_08009234:
	ldr r1, _08009268 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _0800926C @ =0x03001164
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r1, _08009268 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _0800926C @ =0x03001164
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r1, _08009268 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _08009270 @ =0x0300114C
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, _08009268 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #8]
	b _080092AC
	.align 2, 0
_08009268: .4byte 0x03000EE8
_0800926C: .4byte 0x03001164
_08009270: .4byte 0x0300114C
_08009274:
	ldr r1, _080092A4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080092A8 @ =0x0300114C
	ldr r0, [r0, #0x34]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r1, _080092A4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0x10]
	ldr r1, _080092A4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, _080092A8 @ =0x0300114C
	ldr r0, [r0, #0x30]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, _080092A4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #8]
	b _080092AC
	.align 2, 0
_080092A4: .4byte 0x03000EE8
_080092A8: .4byte 0x0300114C
_080092AC:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldr r0, [r7, #4]
	cmp r1, r0
	ble _08009318
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldr r0, [r7, #8]
	cmp r1, r0
	bge _08009318
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	ble _08009318
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #0x10]
	cmp r1, r0
	bge _08009318
	ldr r0, _08009308 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _080092FA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x53
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800930C @ =0x030010E0
	movs r1, #1
	str r1, [r0]
_080092FA:
	ldr r0, _08009310 @ =0x03001158
	movs r1, #1
	str r1, [r0]
	ldr r0, _08009314 @ =0x03001188
	ldr r1, [r0]
	adds r0, r1, #0
	b _0800931C
	.align 2, 0
_08009308: .4byte 0x03001110
_0800930C: .4byte 0x030010E0
_08009310: .4byte 0x03001158
_08009314: .4byte 0x03001188
_08009318:
	movs r0, #0
	b _0800931C
_0800931C:
	add sp, #0x18
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8009324
sub_8009324: @ 0x08009324
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800933C @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #4]
_08009332:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08009340
	b _08009374
	.align 2, 0
_0800933C: .4byte 0x03001B4C
_08009340:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800936C
	ldr r1, [r7, #4]
	movs r2, #0xa0
	lsls r2, r2, #7
	ldr r0, [r7]
	bl sub_80093A8
	cmp r0, #0
	beq _0800936C
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _08009378
_0800936C:
	ldr r0, [r7, #4]
	ldr r1, [r0]
	str r1, [r7, #4]
	b _08009332
_08009374:
	movs r0, #0
	b _08009378
_08009378:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8009380
sub_8009380: @ 0x08009380
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0800939C @ =0x03000EE8
	ldr r1, [r0]
	ldr r2, [r7, #4]
	ldr r0, [r7]
	bl sub_80093A8
	adds r1, r0, #0
	adds r0, r1, #0
	b _080093A0
	.align 2, 0
_0800939C: .4byte 0x03000EE8
_080093A0:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80093A8
sub_80093A8: @ 0x080093A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r0, #0x30]
	ldr r2, [r1, #0x30]
	subs r1, r0, r2
	adds r0, r1, #0
	cmp r0, #0
	bge _080093CA
	rsbs r0, r0, #0
_080093CA:
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r2, [r1, #0x34]
	subs r1, r0, r2
	adds r0, r1, #0
	cmp r0, #0
	bge _080093DE
	rsbs r0, r0, #0
_080093DE:
	lsls r0, r0, #1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #8]
	cmp r0, r1
	bgt _080093F4
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #8]
	cmp r0, r1
	bgt _080093F4
	b _080093F8
_080093F4:
	movs r0, #0
	b _0800945C
_080093F8:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldrb r0, [r0, #0x17]
	ldrb r1, [r1, #0x17]
	cmp r0, r1
	beq _08009408
	movs r0, #0
	b _0800945C
_08009408:
	ldr r2, [r7, #8]
	ldr r4, [r7, #8]
	asrs r3, r4, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r4, [r7, #8]
	ldr r6, [r7, #8]
	asrs r5, r6, #0x1f
	adds r2, r4, #0
	adds r3, r5, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r4, r3, #0x16
	lsrs r5, r2, #0xa
	adds r0, r4, #0
	orrs r0, r5
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	lsls r1, r2, #1
	ldr r3, [r7, #4]
	ldr r2, [r3, #0x30]
	ldr r3, [r7, #4]
	ldr r4, [r3, #0x34]
	lsls r3, r4, #1
	bl sub_8021C9C
	str r0, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	blt _08009458
	movs r0, #1
	b _0800945C
_08009458:
	movs r0, #0
	b _0800945C
_0800945C:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8009464
sub_8009464: @ 0x08009464
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x14]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [r0, #0x30]
	subs r1, r1, r0
	adds r0, r1, #0
	cmp r0, #0
	bge _08009486
	rsbs r0, r0, #0
_08009486:
	str r0, [r7, #0x18]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	ldr r0, [r0, #0x34]
	subs r1, r1, r0
	adds r0, r1, #0
	cmp r0, #0
	bge _08009498
	rsbs r0, r0, #0
_08009498:
	lsls r0, r0, #1
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	bgt _080094AE
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	bgt _080094AE
	b _080094B2
_080094AE:
	movs r0, #0
	b _08009502
_080094B2:
	ldr r2, [r7, #0xc]
	ldr r4, [r7, #0xc]
	asrs r3, r4, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r4, [r7, #0xc]
	ldr r6, [r7, #0xc]
	asrs r5, r6, #0x1f
	adds r2, r4, #0
	adds r3, r5, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r4, r3, #0x16
	lsrs r5, r2, #0xa
	adds r0, r4, #0
	orrs r0, r5
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r7, #0xc]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	ldr r4, [r7, #8]
	lsls r3, r4, #1
	bl sub_8021C9C
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _080094FE
	movs r0, #1
	b _08009502
_080094FE:
	movs r0, #0
	b _08009502
_08009502:
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800950C
sub_800950C: @ 0x0800950C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, _08009564 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	subs r0, r0, r1
	str r0, [r7, #4]
	ldr r1, _08009564 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	subs r0, r0, r1
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08009538
	rsbs r0, r0, #0
_08009538:
	str r0, [r7, #0xc]
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _08009542
	rsbs r0, r0, #0
_08009542:
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	cmp r0, #9
	bls _08009568
	ldr r0, [r7, #0x10]
	cmp r0, #9
	bls _08009568
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	adds r0, r1, #0
	cmp r0, #0
	bge _0800955E
	rsbs r0, r0, #0
_0800955E:
	cmp r0, #9
	ble _08009568
	b _0800956C
	.align 2, 0
_08009564: .4byte 0x03000EE8
_08009568:
	movs r0, #0
	b _0800968A
_0800956C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #0
	beq _08009586
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #4
	beq _08009586
	b _080095D8
_08009586:
	ldr r1, _080095A8 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	cmp r0, r1
	ble _080095B6
	ldr r1, _080095A8 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	cmp r0, r1
	ble _080095AE
	movs r0, #1
	b _0800968A
	.align 2, 0
_080095A8: .4byte 0x03000EE8
_080095AC:
	.byte 0x02, 0xE0
_080095AE:
	movs r0, #1
	rsbs r0, r0, #0
	b _0800968A
_080095B4:
	.byte 0x0F, 0xE0
_080095B6:
	ldr r1, _080095CC @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	cmp r0, r1
	ble _080095D2
	movs r0, #1
	rsbs r0, r0, #0
	b _0800968A
	.align 2, 0
_080095CC: .4byte 0x03000EE8
_080095D0:
	.byte 0x01, 0xE0
_080095D2:
	movs r0, #1
	b _0800968A
_080095D6:
	.byte 0x58, 0xE0
_080095D8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #6
	beq _080095F2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #2
	beq _080095F2
	b _08009642
_080095F2:
	ldr r1, _08009614 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	cmp r0, r1
	ble _08009620
	ldr r1, _08009614 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	cmp r0, r1
	ble _0800961A
	movs r0, #1
	rsbs r0, r0, #0
	b _0800968A
	.align 2, 0
_08009614: .4byte 0x03000EE8
_08009618:
	.byte 0x01, 0xE0
_0800961A:
	movs r0, #1
	b _0800968A
_0800961E:
	.byte 0x0F, 0xE0
_08009620:
	ldr r1, _08009634 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	cmp r0, r1
	ble _0800963A
	movs r0, #1
	b _0800968A
	.align 2, 0
_08009634: .4byte 0x03000EE8
_08009638:
	.byte 0x02, 0xE0
_0800963A:
	movs r0, #1
	rsbs r0, r0, #0
	b _0800968A
_08009640:
	.byte 0x23, 0xE0
_08009642:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #1
	beq _0800965C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #5
	beq _0800965C
	b _08009674
_0800965C:
	ldr r1, [r7, #0x10]
	lsls r0, r1, #1
	ldr r1, [r7, #0xc]
	cmp r0, r1
	bls _0800966C
	movs r0, #1
	b _0800968A
_0800966A:
	.byte 0x02, 0xE0
_0800966C:
	movs r0, #1
	rsbs r0, r0, #0
	b _0800968A
_08009672:
	.byte 0x0A, 0xE0
_08009674:
	ldr r1, [r7, #0x10]
	lsls r0, r1, #1
	ldr r1, [r7, #0xc]
	cmp r0, r1
	bls _08009686
	movs r0, #1
	rsbs r0, r0, #0
	b _0800968A
_08009684:
	.byte 0x01, 0xE0
_08009686:
	movs r0, #1
	b _0800968A
_0800968A:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8009694
sub_8009694: @ 0x08009694
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #1
	adds r1, r2, #0
	movs r2, #7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08009710 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	subs r0, r0, r1
	str r0, [r7, #8]
	ldr r1, _08009710 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	lsls r1, r0, #1
	str r1, [r7, #0xc]
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _080096DC
	rsbs r0, r0, #0
_080096DC:
	ldr r1, [r7, #0xc]
	cmp r1, #0
	bge _080096E4
	rsbs r1, r1, #0
_080096E4:
	cmp r0, r1
	ble _0800974E
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _080096F0
	rsbs r0, r0, #0
_080096F0:
	ldr r1, [r7, #0xc]
	lsls r2, r1, #1
	adds r1, r2, #0
	cmp r1, #0
	bge _080096FC
	rsbs r1, r1, #0
_080096FC:
	cmp r0, r1
	ble _0800971C
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _08009714
	adds r0, r7, #4
	movs r1, #2
	strb r1, [r0]
	b _0800971A
	.align 2, 0
_08009710: .4byte 0x03000EE8
_08009714:
	adds r0, r7, #4
	movs r1, #6
	strb r1, [r0]
_0800971A:
	b _0800974C
_0800971C:
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _08009738
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08009730
	adds r0, r7, #4
	movs r1, #3
	strb r1, [r0]
	b _08009736
_08009730:
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_08009736:
	b _0800974C
_08009738:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08009746
	adds r0, r7, #4
	movs r1, #5
	strb r1, [r0]
	b _0800974C
_08009746:
	adds r0, r7, #4
	movs r1, #7
	strb r1, [r0]
_0800974C:
	b _080097AC
_0800974E:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08009756
	rsbs r0, r0, #0
_08009756:
	ldr r1, [r7, #8]
	lsls r2, r1, #1
	adds r1, r2, #0
	cmp r1, #0
	bge _08009762
	rsbs r1, r1, #0
_08009762:
	cmp r0, r1
	ble _0800977C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08009774
	adds r0, r7, #4
	movs r1, #4
	strb r1, [r0]
	b _0800977A
_08009774:
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
_0800977A:
	b _080097AC
_0800977C:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08009798
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _08009790
	adds r0, r7, #4
	movs r1, #3
	strb r1, [r0]
	b _08009796
_08009790:
	adds r0, r7, #4
	movs r1, #5
	strb r1, [r0]
_08009796:
	b _080097AC
_08009798:
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _080097A6
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
	b _080097AC
_080097A6:
	adds r0, r7, #4
	movs r1, #7
	strb r1, [r0]
_080097AC:
	adds r0, r7, #4
	ldrb r1, [r0]
	adds r0, r1, #0
	b _080097B4
_080097B4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80097BC
sub_80097BC: @ 0x080097BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009694
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	ldr r0, [r7]
	bl sub_8020E18
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80097DC
sub_80097DC: @ 0x080097DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009694
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	adds r1, r0, #4
	movs r0, #7
	ands r1, r0
	ldr r0, [r7]
	bl sub_8020E18
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8009804
sub_8009804: @ 0x08009804
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #8
	bl sub_8021B2C
	adds r1, r0, #0
	ldr r0, [r7]
	bl sub_8020E18
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8009824
sub_8009824: @ 0x08009824
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r4, r7, #4
	ldr r0, [r7]
	bl sub_8009694
	adds r1, r0, #2
	adds r0, r1, #0
	strb r0, [r4]
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	movs r3, #7
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #4
	ldrb r1, [r0]
	ldr r0, [r7]
	bl sub_8020E18
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800985C
sub_800985C: @ 0x0800985C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r4, r7, #4
	ldr r0, [r7]
	bl sub_8009694
	adds r1, r0, #2
	adds r0, r1, #0
	strb r0, [r4]
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _0800988E
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	movs r3, #7
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080098A2
_0800988E:
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #4
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080098A2:
	adds r0, r7, #4
	ldrb r1, [r0]
	ldr r0, [r7]
	bl sub_8020E18
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80098B4
sub_80098B4: @ 0x080098B4
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	str r1, [r7, #0xc]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #8]
	adds r1, r1, r0
	str r1, [r7, #0x10]
	ldr r1, [r7, #0xc]
	asrs r0, r1, #0xa
	ldr r2, [r7, #0x10]
	asrs r1, r2, #0xa
	bl sub_8023978
	adds r1, r7, #0
	adds r1, #0x14
	strb r0, [r1]
	ldr r1, [r7, #0xc]
	asrs r0, r1, #0xa
	ldr r2, [r7, #0x10]
	asrs r1, r2, #0xa
	bl sub_8023B04
	adds r1, r7, #0
	adds r1, #0x15
	strb r0, [r1]
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	cmp r1, #2
	bne _08009914
	adds r0, r7, #0
	adds r0, #0x14
	ldrb r1, [r0]
	cmp r1, #2
	bne _08009912
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #1
	strb r1, [r0]
_08009912:
	b _08009926
_08009914:
	adds r0, r7, #0
	adds r0, #0x14
	ldrb r1, [r0]
	cmp r1, #3
	bne _08009926
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #1
	strb r1, [r0]
_08009926:
	adds r0, r7, #0
	adds r0, #0x14
	ldrb r1, [r0]
	cmp r1, #1
	bne _08009934
	movs r0, #1
	b _0800999C
_08009934:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	str r1, [r0, #0x34]
	adds r0, r7, #0
	adds r0, #0x15
	ldrb r1, [r0]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08009958
	b _08009998
_08009958:
	adds r0, r7, #0
	adds r0, #0x15
	ldrb r1, [r0]
	cmp r1, #0xf
	bne _08009964
	b _08009998
_08009964:
	adds r0, r7, #0
	adds r0, #0x15
	ldrb r1, [r0]
	cmp r1, #0
	bne _08009984
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	b _08009998
_08009984:
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
_08009998:
	movs r0, #0
	b _0800999C
_0800999C:
	add sp, #0x18
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80099A4
sub_80099A4: @ 0x080099A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08009AB4 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0xc]
	ldr r0, _08009AB4 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, [r7, #8]
	str r0, [r7, #0x14]
	ldr r2, [r7, #0xc]
	ldr r4, [r7, #0xc]
	asrs r3, r4, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r4, [r7, #4]
	ldr r6, [r7, #4]
	asrs r5, r6, #0x1f
	adds r2, r4, #0
	adds r3, r5, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r4, r3, #0x16
	lsrs r5, r2, #0xa
	adds r0, r4, #0
	orrs r0, r5
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r4, [r7, #0x10]
	asrs r3, r4, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r4, [r7, #4]
	ldr r6, [r7, #4]
	asrs r5, r6, #0x1f
	adds r2, r4, #0
	adds r3, r5, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r4, r3, #0x16
	lsrs r5, r2, #0xa
	adds r0, r4, #0
	orrs r0, r5
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r7, #0x10]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r0, [r7]
	bl sub_80098B4
	cmp r0, #0
	beq _08009AB8
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #9
	str r1, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #7
	ands r0, r1
	str r0, [r7, #8]
	ldr r0, _08009AB4 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0xc]
	ldr r0, _08009AB4 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r0, [r7]
	bl sub_80098B4
	cmp r0, #0
	beq _08009AB8
	ldr r1, [r7, #0x14]
	adds r0, r1, #7
	movs r1, #7
	ands r0, r1
	str r0, [r7, #8]
	ldr r0, _08009AB4 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0xc]
	ldr r0, _08009AB4 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r0, [r7]
	bl sub_80098B4
	adds r1, r0, #0
	adds r0, r1, #0
	b _08009ABC
	.align 2, 0
_08009AB4: .4byte 0x08032510
_08009AB8:
	movs r0, #0
	b _08009ABC
_08009ABC:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8009AC4
sub_8009AC4: @ 0x08009AC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08009B64 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0xc]
	ldr r0, _08009B64 @ =0x08032510
	ldr r2, [r7, #8]
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	ldr r4, [r7, #0xc]
	asrs r3, r4, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r4, [r7, #4]
	ldr r6, [r7, #4]
	asrs r5, r6, #0x1f
	adds r2, r4, #0
	adds r3, r5, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r4, r3, #0x16
	lsrs r5, r2, #0xa
	adds r0, r4, #0
	orrs r0, r5
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r4, [r7, #0x10]
	asrs r3, r4, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r4, [r7, #4]
	ldr r6, [r7, #4]
	asrs r5, r6, #0x1f
	adds r2, r4, #0
	adds r3, r5, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r4, r3, #0x16
	lsrs r5, r2, #0xa
	adds r0, r4, #0
	orrs r0, r5
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r7, #0x10]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	ldr r1, [r7, #0xc]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldr r1, [r7, #0x10]
	adds r2, r2, r1
	str r2, [r0, #0x34]
	movs r0, #0
	b _08009B68
	.align 2, 0
_08009B64: .4byte 0x08032510
_08009B68:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8009B70
sub_8009B70: @ 0x08009B70
	push {r4, r7, lr}
	sub sp, #0x48
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x28]
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x2c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	bl sub_8021AE4
	str r0, [r7, #0x24]
	ldr r1, [r7, #0x24]
	subs r0, r1, #1
	cmp r0, #7
	bhi _08009BF8
	lsls r1, r0, #2
	ldr r2, _08009BA4 @ =_08009BA8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08009BA4: .4byte _08009BA8
_08009BA8: @ jump table
	.4byte _08009BC8 @ case 0
	.4byte _08009BCE @ case 1
	.4byte _08009BD4 @ case 2
	.4byte _08009BDA @ case 3
	.4byte _08009BE0 @ case 4
	.4byte _08009BE6 @ case 5
	.4byte _08009BEC @ case 6
	.4byte _08009BF2 @ case 7
_08009BC8:
	movs r0, #0xff
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BCE:
	movs r0, #0x7f
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BD4:
	movs r0, #0x55
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BDA:
	movs r0, #0x3f
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BE0:
	movs r0, #0x33
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BE6:
	movs r0, #0x2a
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BEC:
	movs r0, #0x24
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BF2:
	movs r0, #0x1f
	str r0, [r7, #0x1c]
	b _08009BF8
_08009BF8:
	ldr r1, [r7, #0x1c]
	movs r0, #0
	bl sub_8021AE4
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x10]
_08009C06:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x24]
	cmp r0, r1
	blo _08009C10
	b _08009D22
_08009C10:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _08009C18
	b _08009CDE
_08009C18:
	movs r0, #0
	str r0, [r7, #0x30]
	movs r0, #0
	str r0, [r7, #0x34]
	ldr r0, _08009C40 @ =0x030011A8
	ldr r1, _08009C44 @ =0x00002710
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r7, #0x38]
	ldr r0, _08009C48 @ =0x0300115C
	ldr r1, _08009C44 @ =0x00002710
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r7, #0x3c]
_08009C34:
	ldr r0, [r7, #0x38]
	ldr r1, _08009C4C @ =0x000003E7
	cmp r0, r1
	bhi _08009C50
	b _08009C64
	.align 2, 0
_08009C40: .4byte 0x030011A8
_08009C44: .4byte 0x00002710
_08009C48: .4byte 0x0300115C
_08009C4C: .4byte 0x000003E7
_08009C50:
	ldr r0, [r7, #0x30]
	adds r1, r0, #1
	str r1, [r7, #0x30]
	ldr r0, [r7, #0x38]
	ldr r2, _08009C60 @ =0xFFFFFC18
	adds r1, r0, r2
	str r1, [r7, #0x38]
	b _08009C34
	.align 2, 0
_08009C60: .4byte 0xFFFFFC18
_08009C64:
	ldr r0, [r7, #0x3c]
	ldr r1, _08009C70 @ =0x000007CF
	cmp r0, r1
	bhi _08009C74
	b _08009C88
	.align 2, 0
_08009C70: .4byte 0x000007CF
_08009C74:
	ldr r0, [r7, #0x34]
	adds r1, r0, #1
	str r1, [r7, #0x34]
	ldr r0, [r7, #0x3c]
	ldr r2, _08009C84 @ =0xFFFFF830
	adds r1, r0, r2
	str r1, [r7, #0x3c]
	b _08009C64
	.align 2, 0
_08009C84: .4byte 0xFFFFF830
_08009C88:
	ldr r0, [r7, #0x34]
	ldr r1, [r7, #0x30]
	adds r0, r0, r1
	str r0, [r7, #0x34]
	movs r0, #0xf
	bl sub_8021B2C
	str r0, [r7, #0x3c]
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x30]
	cmp r0, r1
	bhs _08009CC0
	ldr r0, [r7, #0x28]
	cmp r0, #0
	bne _08009CC0
	movs r0, #0xa
	bl sub_8021B2C
	cmp r0, #0
	bne _08009CB6
	movs r0, #4
	str r0, [r7, #0x14]
	b _08009CBA
_08009CB6:
	movs r0, #3
	str r0, [r7, #0x14]
_08009CBA:
	movs r0, #1
	str r0, [r7, #0x28]
	b _08009CDC
_08009CC0:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x34]
	cmp r0, r1
	bhs _08009CD8
	ldr r0, [r7, #0x28]
	cmp r0, #0
	bne _08009CD8
	movs r0, #5
	str r0, [r7, #0x14]
	movs r0, #1
	str r0, [r7, #0x28]
	b _08009CDC
_08009CD8:
	movs r0, #1
	str r0, [r7, #0x14]
_08009CDC:
	b _08009CE2
_08009CDE:
	ldr r0, [r7, #8]
	str r0, [r7, #0x14]
_08009CE2:
	ldr r1, [r7, #4]
	ldr r2, [r7, #0x14]
	ldr r3, [r7, #0x2c]
	ldr r0, [r7, #0x1c]
	ldr r4, [r7, #0x10]
	muls r0, r4, r0
	ldr r4, [r7, #0x20]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r7]
	bl sub_80136CC
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	ldr r2, [r7, #0x54]
	adds r1, r2, #0
	ldrb r2, [r0, #0x17]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x24]
	cmp r0, #1
	bne _08009D1A
_08009D1A:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08009C06
_08009D22:
	add sp, #0x48
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8009D2C
sub_8009D2C: @ 0x08009D2C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r2, [r7]
	ldr r3, [r2, #0x5c]
	adds r2, r3, #0
	adds r3, #0x3b
	ldrb r2, [r3]
	ldr r3, [r7]
	ldr r4, [r3, #0x5c]
	adds r3, r4, #0
	adds r4, #0x39
	ldrb r3, [r4]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	adds r4, r5, #0
	adds r5, #0x3a
	ldrb r4, [r5]
	str r4, [sp]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	adds r4, r5, #0
	adds r5, #0x38
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #8]
	bl sub_8009B70
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8009D80
sub_8009D80: @ 0x08009D80
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #4]
	ldr r1, [r7, #0x24]
	cmp r0, r1
	bgt _08009DB0
	ldr r0, [r7]
	ldr r1, [r7, #0x20]
	cmp r0, r1
	bgt _08009DB0
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x1c]
	cmp r0, r1
	blt _08009DB0
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	cmp r0, r1
	blt _08009DB0
	b _08009DB6
_08009DB0:
	movs r0, #0
	b _08009DBA
_08009DB4:
	.byte 0x01, 0xE0
_08009DB6:
	movs r0, #1
	b _08009DBA
_08009DBA:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8009DC4
sub_8009DC4: @ 0x08009DC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08009E0C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrb r2, [r1]
	adds r0, r2, #0
	movs r1, #1
	bl sub_8025244
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	movs r1, #8
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08009E0C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrb r2, [r1]
	adds r0, r2, #0
	bl AddRespawn
_08009E0C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8009E24
sub_8009E24: @ 0x08009E24
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, _08009E48 @ =0x00000216
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _08009E4C @ =sub_80142EC
	str r1, [r0, #0x4c]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009E48: .4byte 0x00000216
_08009E4C: .4byte sub_80142EC

	thumb_func_start sub_8009E50
sub_8009E50: @ 0x08009E50
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, _08009E74 @ =0x0000022F
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _08009E78 @ =sub_80142EC
	str r1, [r0, #0x4c]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009E74: .4byte 0x0000022F
_08009E78: .4byte sub_80142EC

	thumb_func_start sub_8009E7C
sub_8009E7C: @ 0x08009E7C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xff
	ands r0, r1
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x50
	lsrs r1, r1, #5
	movs r0, #7
	ands r1, r0
	adds r0, r1, #0
	b _08009E9C
_08009E9C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8009EA4
sub_8009EA4: @ 0x08009EA4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #2
	movs r2, #0x88
	lsls r2, r2, #0x14
	subs r0, r2, r1
	ldr r1, [r0]
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	str r1, [r0, #0x5c]
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x5c]
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0xc]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8009EE8
sub_8009EE8: @ 0x08009EE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	movs r1, #0x10
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08009F1E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_800A034
	b _08009F3A
_08009F1E:
	ldr r0, [r7]
	bl sub_8009D2C
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8009E24
	ldr r0, [r7]
	bl sub_8009DC4
_08009F3A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8009F44
sub_8009F44: @ 0x08009F44
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800A024
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	movs r1, #0xf
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _08009FAA
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #1
	adds r1, r2, #0
	bl sub_8009E50
	b _0800A01A
_08009FAA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	movs r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0800A01A
	movs r1, #0x12
	rsbs r1, r1, #0
	adds r0, r1, #0
	movs r1, #0x12
	bl sub_8021AE4
	str r0, [r7, #4]
	movs r1, #0x20
	rsbs r1, r1, #0
	adds r0, r1, #0
	movs r1, #0
	bl sub_8021AE4
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldr r2, _0800A01C @ =0x00000206
	bl sub_8014E8C
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	rsbs r2, r1, #0
	adds r3, r2, #0
	adds r1, r3, #1
	ldrb r2, [r0, #0x18]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x18]
	ldr r0, [r7, #0xc]
	ldr r1, _0800A020 @ =sub_80142EC
	str r1, [r0, #0x4c]
_0800A01A:
	b _0800A02A
	.align 2, 0
_0800A01C: .4byte 0x00000206
_0800A020: .4byte sub_80142EC
_0800A024:
	ldr r0, [r7]
	bl sub_8009EE8
_0800A02A:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A034
sub_800A034: @ 0x0800A034
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _0800A08C @ =sub_8009F44
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x78
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0800A090 @ =0x0300100C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800A07C
	movs r0, #2
	movs r1, #2
	movs r2, #0x79
	bl sub_80237D0
_0800A07C:
	movs r0, #0x3d
	bl PlaySfx
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A08C: .4byte sub_8009F44
_0800A090: .4byte 0x0300100C

	thumb_func_start sub_800A094
sub_800A094: @ 0x0800A094
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #4
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldr r2, [r7]
	ldrb r3, [r2, #0x17]
	str r3, [sp, #8]
	movs r2, #0
	movs r3, #1
	bl sub_8009B70
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8009E24
	ldr r0, [r7]
	bl sub_8009DC4
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800A0DC
sub_800A0DC: @ 0x0800A0DC
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #0xc
	adds r2, r7, #0
	adds r2, #0x10
	bl sub_8002DC8
	ldr r0, _0800A120 @ =0x08032578
	ldr r1, [r7, #0xc]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7]
	muls r1, r0, r1
	ldr r0, _0800A120 @ =0x08032578
	ldr r2, [r7, #0x10]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r3, [r7, #4]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r1, r1, #0xa
	adds r0, r1, #0
	b _0800A124
	.align 2, 0
_0800A120: .4byte 0x08032578
_0800A124:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800A12C
sub_800A12C: @ 0x0800A12C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800A150
	movs r0, #1
	b _0800A154
_0800A14E:
	.byte 0x01, 0xE0
_0800A150:
	movs r0, #0
	b _0800A154
_0800A154:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800A15C
sub_800A15C: @ 0x0800A15C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #5
	ldr r0, [r7]
	movs r2, #5
	bl sub_8009AC4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	blt _0800A1FA
	cmp r0, #2
	ble _0800A186
	cmp r0, #3
	beq _0800A1DE
	b _0800A1FA
_0800A186:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x3c
	bls _0800A1A2
	ldr r0, [r7]
	bl sub_8009DC4
_0800A1A2:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800A1DC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800A1DC:
	b _0800A1FA
_0800A1DE:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800A1F8
	ldr r0, [r7]
	bl sub_8009DC4
_0800A1F8:
	b _0800A1FA
_0800A1FA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A204
sub_800A204: @ 0x0800A204
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _0800A21E
	cmp r0, #1
	beq _0800A22E
	b _0800A240
_0800A21E:
	ldr r1, [r7, #4]
	movs r2, #0x9b
	lsls r2, r2, #2
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	b _0800A240
_0800A22E:
	ldr r1, [r7, #4]
	ldr r2, _0800A23C @ =0x0000026D
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	b _0800A240
	.align 2, 0
_0800A23C: .4byte 0x0000026D
_0800A240:
	ldr r0, [r7, #8]
	ldr r1, _0800A270 @ =sub_800A15C
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A270: .4byte sub_800A15C

	thumb_func_start sub_800A274
sub_800A274: @ 0x0800A274
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _0800A28E
	cmp r0, #1
	beq _0800A29E
	b _0800A2B0
_0800A28E:
	ldr r1, [r7, #4]
	movs r2, #0xa4
	lsls r2, r2, #2
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	b _0800A2B0
_0800A29E:
	ldr r1, [r7, #4]
	ldr r2, _0800A2AC @ =0x0000028B
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	b _0800A2B0
	.align 2, 0
_0800A2AC: .4byte 0x0000028B
_0800A2B0:
	ldr r4, [r7, #8]
	movs r0, #8
	bl sub_8021B2C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8020E18
	ldr r0, [r7, #8]
	ldr r1, _0800A2E0 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A2E0: .4byte sub_80142EC

	thumb_func_start sub_800A2E4
sub_800A2E4: @ 0x0800A2E4
	push {r4, r7, lr}
	sub sp, #0x2c
	add r7, sp, #8
	str r0, [r7]
	movs r0, #1
	str r0, [r7, #4]
	ldr r0, _0800A32C @ =0x03001178
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A344
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800A344
	ldr r0, _0800A330 @ =0x030011A8
	ldr r1, [r0]
	cmp r1, #1
	ble _0800A338
	ldr r0, _0800A334 @ =0x0300118C
	ldr r2, [r0]
	adds r1, r2, #1
	adds r0, r1, #0
	bl sub_800C708
	ldr r0, _0800A32C @ =0x03001178
	movs r1, #0
	str r1, [r0]
	b _0800A33E
	.align 2, 0
_0800A32C: .4byte 0x03001178
_0800A330: .4byte 0x030011A8
_0800A334: .4byte 0x0300118C
_0800A338:
	ldr r0, _0800A340 @ =0x03001178
	movs r1, #0
	str r1, [r0]
_0800A33E:
	b _0800A354
	.align 2, 0
_0800A340: .4byte 0x03001178
_0800A344:
	ldr r0, _0800A350 @ =0x03001178
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A354
	bl _0800B1B8
	.align 2, 0
_0800A350: .4byte 0x03001178
_0800A354:
	ldr r0, _0800A3A0 @ =0x030010D8
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A368
	ldr r1, _0800A3A0 @ =0x030010D8
	ldr r0, _0800A3A0 @ =0x030010D8
	ldr r1, _0800A3A0 @ =0x030010D8
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
_0800A368:
	ldr r0, _0800A3A4 @ =0x030010E8
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A37C
	ldr r1, _0800A3A4 @ =0x030010E8
	ldr r0, _0800A3A4 @ =0x030010E8
	ldr r1, _0800A3A4 @ =0x030010E8
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
_0800A37C:
	ldr r0, _0800A3A8 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #9
	bne _0800A3CE
	ldr r0, _0800A3AC @ =0x03001124
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A3B4
	ldr r1, _0800A3AC @ =0x03001124
	ldr r0, _0800A3AC @ =0x03001124
	ldr r1, _0800A3AC @ =0x03001124
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, _0800A3B0 @ =0x03005574
	movs r1, #0x40
	strh r1, [r0]
	b _0800A3CE
	.align 2, 0
_0800A3A0: .4byte 0x030010D8
_0800A3A4: .4byte 0x030010E8
_0800A3A8: .4byte 0x03001010
_0800A3AC: .4byte 0x03001124
_0800A3B0: .4byte 0x03005574
_0800A3B4:
	ldr r0, _0800A410 @ =0x030010DC
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A3CE
	ldr r1, _0800A410 @ =0x030010DC
	ldr r0, _0800A410 @ =0x030010DC
	ldr r1, _0800A410 @ =0x030010DC
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, _0800A414 @ =0x03005574
	movs r1, #0x80
	strh r1, [r0]
_0800A3CE:
	ldr r0, _0800A418 @ =0x030011A0
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	str r2, [r0]
	ldr r0, _0800A41C @ =0x03001118
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	str r2, [r0]
	ldr r0, _0800A420 @ =0x03001104
	ldr r1, [r0]
	cmp r1, #1
	bne _0800A472
	ldr r0, _0800A424 @ =0x0300119C
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800A428 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #3
	bhi _0800A42C
	movs r0, #0x28
	bl PlaySfx
	b _0800A432
	.align 2, 0
_0800A410: .4byte 0x030010DC
_0800A414: .4byte 0x03005574
_0800A418: .4byte 0x030011A0
_0800A41C: .4byte 0x03001118
_0800A420: .4byte 0x03001104
_0800A424: .4byte 0x0300119C
_0800A428: .4byte 0x0300118C
_0800A42C:
	movs r0, #0x3e
	bl PlaySfx
_0800A432:
	ldr r0, _0800A45C @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800A460 @ =0x03001140
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A464 @ =0x030010E4
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A468 @ =0x030010D8
	movs r1, #0
	str r1, [r0]
	ldr r1, _0800A46C @ =0x03001104
	ldr r0, _0800A46C @ =0x03001104
	ldr r1, _0800A46C @ =0x03001104
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	bl _0800B1B8
	.align 2, 0
_0800A45C: .4byte 0x0300111C
_0800A460: .4byte 0x03001140
_0800A464: .4byte 0x030010E4
_0800A468: .4byte 0x030010D8
_0800A46C: .4byte 0x03001104
_0800A470:
	.byte 0x32, 0xE0
_0800A472:
	ldr r0, _0800A4C4 @ =0x03001104
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A4D8
	ldr r1, _0800A4C4 @ =0x03001104
	ldr r0, _0800A4C4 @ =0x03001104
	ldr r1, _0800A4C4 @ =0x03001104
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _0800A4C8 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800A4CC @ =0x03001140
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A4D0 @ =0x030010E4
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A4C4 @ =0x03001104
	ldr r1, [r0]
	cmp r1, #0x77
	bls _0800A4C0
	movs r0, #1
	bl sub_801E718
	ldr r0, _0800A4D4 @ =0xCDC9A400
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x8b
	movs r1, #2
	movs r2, #2
	movs r3, #2
	bl sub_801F2AC
	movs r0, #0xfe
	bl SoftReset
_0800A4C0:
	bl _0800B1B8
	.align 2, 0
_0800A4C4: .4byte 0x03001104
_0800A4C8: .4byte 0x0300111C
_0800A4CC: .4byte 0x03001140
_0800A4D0: .4byte 0x030010E4
_0800A4D4: .4byte 0xCDC9A400
_0800A4D8:
	ldr r0, _0800A52C @ =0x03001140
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A54E
	ldr r0, _0800A530 @ =0x03001170
	ldr r1, [r0]
	cmp r1, #0
	bne _0800A54E
	ldr r0, _0800A534 @ =0x03001198
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800A538 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800A52C @ =0x03001140
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A53C @ =0x030010E4
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A540 @ =0x030010D8
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A544 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #3
	bhi _0800A548
	movs r0, #0x1f
	bl PlaySfx
	b _0800A54E
	.align 2, 0
_0800A52C: .4byte 0x03001140
_0800A530: .4byte 0x03001170
_0800A534: .4byte 0x03001198
_0800A538: .4byte 0x0300111C
_0800A53C: .4byte 0x030010E4
_0800A540: .4byte 0x030010D8
_0800A544: .4byte 0x0300118C
_0800A548:
	movs r0, #0x3a
	bl PlaySfx
_0800A54E:
	ldr r0, _0800A5B0 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #1
	bne _0800A586
	ldr r0, _0800A5B0 @ =0x03001148
	movs r1, #2
	str r1, [r0]
	ldr r0, _0800A5B4 @ =0x0300111C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A5B8 @ =0x030010E4
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A5BC @ =0x03001168
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A5C0 @ =0x030010D8
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800A5C4 @ =0x03001150
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
_0800A586:
	ldr r0, _0800A5B0 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #2
	bne _0800A668
	ldr r0, _0800A5C8 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A5D0
	ldr r1, _0800A5CC @ =0x03001174
	ldr r0, _0800A5CC @ =0x03001174
	ldr r1, _0800A5CC @ =0x03001174
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0800A648
	.align 2, 0
_0800A5B0: .4byte 0x03001148
_0800A5B4: .4byte 0x0300111C
_0800A5B8: .4byte 0x030010E4
_0800A5BC: .4byte 0x03001168
_0800A5C0: .4byte 0x030010D8
_0800A5C4: .4byte 0x03001150
_0800A5C8: .4byte 0x03005578
_0800A5CC: .4byte 0x03001174
_0800A5D0:
	ldr r0, _0800A5F4 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A5FC
	ldr r1, _0800A5F8 @ =0x03001174
	ldr r0, _0800A5F8 @ =0x03001174
	ldr r1, _0800A5F8 @ =0x03001174
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0800A648
	.align 2, 0
_0800A5F4: .4byte 0x03005578
_0800A5F8: .4byte 0x03001174
_0800A5FC:
	ldr r0, _0800A620 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A628
	ldr r1, _0800A624 @ =0x03001174
	ldr r0, _0800A624 @ =0x03001174
	ldr r1, _0800A624 @ =0x03001174
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0800A648
	.align 2, 0
_0800A620: .4byte 0x03005578
_0800A624: .4byte 0x03001174
_0800A628:
	ldr r0, _0800A65C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A648
	ldr r1, _0800A660 @ =0x03001174
	ldr r0, _0800A660 @ =0x03001174
	ldr r1, _0800A660 @ =0x03001174
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
_0800A648:
	ldr r0, _0800A660 @ =0x03001174
	ldr r1, [r0]
	cmp r1, #5
	ble _0800A656
	ldr r0, _0800A664 @ =0x03001148
	movs r1, #0
	str r1, [r0]
_0800A656:
	bl _0800B1B8
	.align 2, 0
_0800A65C: .4byte 0x03005578
_0800A660: .4byte 0x03001174
_0800A664: .4byte 0x03001148
_0800A668:
	ldr r0, _0800A698 @ =0x03001120
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A69C
	ldr r1, _0800A698 @ =0x03001120
	ldr r0, _0800A698 @ =0x03001120
	ldr r1, _0800A698 @ =0x03001120
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #4
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x46
	ldrb r0, [r2]
	adds r2, r0, #4
	movs r0, #7
	ands r2, r0
	ldr r0, [r7]
	bl sub_80099A4
	bl _0800B1B8
	.align 2, 0
_0800A698: .4byte 0x03001120
_0800A69C:
	ldr r0, _0800A6C8 @ =0x03001168
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A6D0
	ldr r0, _0800A6CC @ =0x030010E0
	movs r1, #1
	str r1, [r0]
	ldr r1, _0800A6C8 @ =0x03001168
	ldr r0, _0800A6C8 @ =0x03001168
	ldr r1, _0800A6C8 @ =0x03001168
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r2, [r1]
	ldr r0, [r7]
	movs r1, #0x66
	bl sub_80099A4
	b _0800A6D6
	.align 2, 0
_0800A6C8: .4byte 0x03001168
_0800A6CC: .4byte 0x030010E0
_0800A6D0:
	ldr r0, _0800A6EC @ =0x030010E0
	movs r1, #0
	str r1, [r0]
_0800A6D6:
	ldr r0, _0800A6F0 @ =0x03001114
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A6F8
	ldr r0, _0800A6F4 @ =0x03001150
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	bl _0800B1B8
	.align 2, 0
_0800A6EC: .4byte 0x030010E0
_0800A6F0: .4byte 0x03001114
_0800A6F4: .4byte 0x03001150
_0800A6F8:
	ldr r0, _0800A744 @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A702
	b _0800AD66
_0800A702:
	ldr r0, _0800A748 @ =0x0300112C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800A70C
	b _0800AD66
_0800A70C:
	ldr r0, _0800A74C @ =0x0300116C
	ldr r1, [r0]
	cmp r1, #1
	beq _0800A716
	b _0800A83C
_0800A716:
	movs r0, #1
	str r0, [r7, #0xc]
	ldr r0, _0800A750 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A754
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #9
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800A788
	.align 2, 0
_0800A744: .4byte 0x0300111C
_0800A748: .4byte 0x0300112C
_0800A74C: .4byte 0x0300116C
_0800A750: .4byte 0x03005574
_0800A754:
	ldr r0, _0800A780 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A784
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #9
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
	b _0800A788
	.align 2, 0
_0800A780: .4byte 0x03005574
_0800A784:
	movs r0, #0
	str r0, [r7, #0xc]
_0800A788:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _0800A7E4
	ldr r0, _0800A7B4 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A7B8
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
	b _0800A7DC
	.align 2, 0
_0800A7B4: .4byte 0x03005574
_0800A7B8:
	ldr r0, _0800A7E0 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A7DC
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
_0800A7DC:
	b _0800A834
	.align 2, 0
_0800A7E0: .4byte 0x03005574
_0800A7E4:
	ldr r0, _0800A80C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A810
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xb
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
	b _0800A834
	.align 2, 0
_0800A80C: .4byte 0x03005574
_0800A810:
	ldr r0, _0800A838 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A834
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xb
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
_0800A834:
	b _0800AC08
	.align 2, 0
_0800A838: .4byte 0x03005574
_0800A83C:
	ldr r0, _0800A884 @ =0x0300116C
	ldr r1, [r0]
	cmp r1, #2
	beq _0800A846
	b _0800AA6C
_0800A846:
	ldr r0, _0800A888 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A88C
	ldr r0, _0800A888 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A88C
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #9
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
	b _0800AA60
	.align 2, 0
_0800A884: .4byte 0x0300116C
_0800A888: .4byte 0x03005574
_0800A88C:
	ldr r0, _0800A8D8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A8DC
	ldr r0, _0800A8D8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A8DC
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xb
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AA60
	.align 2, 0
_0800A8D8: .4byte 0x03005574
_0800A8DC:
	ldr r0, _0800A928 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A92C
	ldr r0, _0800A928 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A92C
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xb
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AA60
	.align 2, 0
_0800A928: .4byte 0x03005574
_0800A92C:
	ldr r0, _0800A96C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A970
	ldr r0, _0800A96C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A970
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #9
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
	b _0800AA60
	.align 2, 0
_0800A96C: .4byte 0x03005574
_0800A970:
	ldr r0, _0800A9A8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A9AC
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	movs r3, #0xcc
	muls r2, r3, r2
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AA60
	.align 2, 0
_0800A9A8: .4byte 0x03005574
_0800A9AC:
	ldr r0, _0800A9E8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800A9EC
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	movs r3, #0xcc
	muls r2, r3, r2
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #9
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AA60
	.align 2, 0
_0800A9E8: .4byte 0x03005574
_0800A9EC:
	ldr r0, _0800AA24 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AA2C
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xb
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, _0800AA28 @ =0x00000199
	muls r2, r3, r2
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AA60
	.align 2, 0
_0800AA24: .4byte 0x03005574
_0800AA28: .4byte 0x00000199
_0800AA2C:
	ldr r0, _0800AA64 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AA60
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #0xb
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, _0800AA68 @ =0x00000199
	muls r2, r3, r2
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
_0800AA60:
	b _0800AC08
	.align 2, 0
_0800AA64: .4byte 0x03005574
_0800AA68: .4byte 0x00000199
_0800AA6C:
	ldr r0, _0800AAB8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AB10
	ldr r0, _0800AAB8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AABC
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #1
	lsls r3, r2, #0xa
	ldr r1, [r1, #0x30]
	subs r2, r1, r3
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r3, [r7, #4]
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AB08
	.align 2, 0
_0800AAB8: .4byte 0x03005574
_0800AABC:
	ldr r0, _0800AAF4 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AAF8
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #1
	lsls r3, r2, #0xa
	ldr r1, [r1, #0x30]
	subs r2, r1, r3
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r3, [r7, #4]
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AB08
	.align 2, 0
_0800AAF4: .4byte 0x03005574
_0800AAF8:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, _0800AB0C @ =0x000008CC
	muls r2, r3, r2
	ldr r1, [r1, #0x30]
	subs r2, r1, r2
	str r2, [r0, #0x30]
_0800AB08:
	b _0800AC08
	.align 2, 0
_0800AB0C: .4byte 0x000008CC
_0800AB10:
	ldr r0, _0800AB5C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800ABB4
	ldr r0, _0800AB5C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AB60
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #1
	lsls r3, r2, #0xa
	ldr r1, [r1, #0x30]
	adds r2, r1, r3
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r3, [r7, #4]
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800ABAC
	.align 2, 0
_0800AB5C: .4byte 0x03005574
_0800AB60:
	ldr r0, _0800AB98 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AB9C
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #1
	lsls r3, r2, #0xa
	ldr r1, [r1, #0x30]
	adds r2, r1, r3
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r3, [r7, #4]
	lsls r2, r3, #0xa
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
	b _0800ABAC
	.align 2, 0
_0800AB98: .4byte 0x03005574
_0800AB9C:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, _0800ABB0 @ =0x000008CC
	muls r2, r3, r2
	ldr r1, [r1, #0x30]
	adds r2, r1, r2
	str r2, [r0, #0x30]
_0800ABAC:
	b _0800AC08
	.align 2, 0
_0800ABB0: .4byte 0x000008CC
_0800ABB4:
	ldr r0, _0800ABDC @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800ABE4
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, _0800ABE0 @ =0x00000599
	muls r2, r3, r2
	ldr r1, [r1, #0x34]
	subs r2, r1, r2
	str r2, [r0, #0x34]
	b _0800AC08
	.align 2, 0
_0800ABDC: .4byte 0x03005574
_0800ABE0: .4byte 0x00000599
_0800ABE4:
	ldr r0, _0800AC3C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AC08
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, _0800AC40 @ =0x00000599
	muls r2, r3, r2
	ldr r1, [r1, #0x34]
	adds r2, r1, r2
	str r2, [r0, #0x34]
_0800AC08:
	ldr r0, _0800AC3C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AC72
	ldr r0, _0800AC3C @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AC44
	ldr r0, [r7]
	movs r1, #7
	bl sub_8020E18
	b _0800AC70
	.align 2, 0
_0800AC3C: .4byte 0x03005574
_0800AC40: .4byte 0x00000599
_0800AC44:
	ldr r0, _0800AC64 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AC68
	ldr r0, [r7]
	movs r1, #1
	bl sub_8020E18
	b _0800AC70
	.align 2, 0
_0800AC64: .4byte 0x03005574
_0800AC68:
	ldr r0, [r7]
	movs r1, #0
	bl sub_8020E18
_0800AC70:
	b _0800AD14
_0800AC72:
	ldr r0, _0800ACA4 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800ACD6
	ldr r0, _0800ACA4 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800ACA8
	ldr r0, [r7]
	movs r1, #5
	bl sub_8020E18
	b _0800ACD4
	.align 2, 0
_0800ACA4: .4byte 0x03005574
_0800ACA8:
	ldr r0, _0800ACC8 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800ACCC
	ldr r0, [r7]
	movs r1, #3
	bl sub_8020E18
	b _0800ACD4
	.align 2, 0
_0800ACC8: .4byte 0x03005574
_0800ACCC:
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
_0800ACD4:
	b _0800AD14
_0800ACD6:
	ldr r0, _0800ACF4 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800ACF8
	ldr r0, [r7]
	movs r1, #6
	bl sub_8020E18
	b _0800AD14
	.align 2, 0
_0800ACF4: .4byte 0x03005574
_0800ACF8:
	ldr r0, _0800AD44 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AD14
	ldr r0, [r7]
	movs r1, #2
	bl sub_8020E18
_0800AD14:
	ldr r0, _0800AD44 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0xf0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800AD54
	ldr r0, _0800AD48 @ =0x030011A4
	ldr r1, [r0]
	cmp r1, #0
	beq _0800AD54
	ldr r0, _0800AD4C @ =0x030010D8
	ldr r1, [r0]
	cmp r1, #0
	bne _0800AD42
	ldr r0, _0800AD50 @ =0x03001194
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
_0800AD42:
	b _0800AD66
	.align 2, 0
_0800AD44: .4byte 0x03005574
_0800AD48: .4byte 0x030011A4
_0800AD4C: .4byte 0x030010D8
_0800AD50: .4byte 0x03001194
_0800AD54:
	ldr r0, _0800ADA0 @ =0x030010D8
	ldr r1, [r0]
	cmp r1, #0
	bne _0800AD66
	ldr r0, _0800ADA4 @ =0x03001150
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
_0800AD66:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8023978
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	ldr r0, _0800ADA8 @ =0x030010B4
	ldr r1, [r0]
	cmp r1, #0
	beq _0800AD8C
	movs r0, #0
	str r0, [r7, #0xc]
_0800AD8C:
	ldr r0, _0800ADAC @ =0x03001010
	ldr r1, [r0]
	cmp r1, #6
	beq _0800ADB0
	ldr r0, _0800ADAC @ =0x03001010
	ldr r1, [r0]
	cmp r1, #3
	beq _0800ADB0
	b _0800AE64
	.align 2, 0
_0800ADA0: .4byte 0x030010D8
_0800ADA4: .4byte 0x03001150
_0800ADA8: .4byte 0x030010B4
_0800ADAC: .4byte 0x03001010
_0800ADB0:
	ldr r0, _0800ADC0 @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #0x18]
_0800ADB6:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bne _0800ADC4
	b _0800AE64
	.align 2, 0
_0800ADC0: .4byte 0x03001B4C
_0800ADC4:
	ldr r0, [r7, #0x18]
	ldr r1, [r0, #0x4c]
	ldr r0, _0800AE18 @ =sub_80144A4
	cmp r1, r0
	bne _0800AE2E
	ldr r0, [r7, #0x18]
	movs r1, #0xc0
	lsls r1, r1, #7
	bl sub_8009380
	cmp r0, #0
	beq _0800AE2C
	ldr r0, _0800AE1C @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #1
	bne _0800AE28
	movs r0, #1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800AE20 @ =0x030010D8
	ldr r1, [r0]
	cmp r1, #0
	bne _0800AE10
	ldr r1, _0800AE24 @ =0x00000262
	ldr r0, [r7]
	bl sub_8020D1C
_0800AE10:
	ldr r0, _0800AE20 @ =0x030010D8
	movs r1, #3
	str r1, [r0]
	b _0800AE2C
	.align 2, 0
_0800AE18: .4byte sub_80144A4
_0800AE1C: .4byte 0x0300118C
_0800AE20: .4byte 0x030010D8
_0800AE24: .4byte 0x00000262
_0800AE28:
	movs r0, #1
	str r0, [r7, #0xc]
_0800AE2C:
	b _0800AE56
_0800AE2E:
	ldr r0, [r7, #0x18]
	ldr r1, [r0, #0x4c]
	ldr r0, _0800AE60 @ =sub_801447C
	cmp r1, r0
	bne _0800AE56
	ldr r1, [r7, #0x18]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800AE56
	ldr r0, [r7, #0x18]
	movs r1, #0xc0
	lsls r1, r1, #8
	bl sub_8009380
	cmp r0, #0
	beq _0800AE56
	movs r0, #1
	str r0, [r7, #0xc]
_0800AE56:
	ldr r0, [r7, #0x18]
	ldr r1, [r0]
	str r1, [r7, #0x18]
	b _0800ADB6
	.align 2, 0
_0800AE60: .4byte sub_801447C
_0800AE64:
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	cmp r1, #2
	bne _0800AE78
	ldr r0, [r7, #0xc]
	cmp r0, #2
	bne _0800AE76
	movs r0, #1
	str r0, [r7, #0xc]
_0800AE76:
	b _0800AE82
_0800AE78:
	ldr r0, [r7, #0xc]
	cmp r0, #3
	bne _0800AE82
	movs r0, #1
	str r0, [r7, #0xc]
_0800AE82:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8000938
	cmp r0, #0
	beq _0800AE9A
	movs r0, #1
	str r0, [r7, #0xc]
_0800AE9A:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_80274C4
	cmp r0, #0
	beq _0800AEB2
	movs r0, #1
	str r0, [r7, #0xc]
_0800AEB2:
	ldr r0, _0800AED8 @ =0x0300116C
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _0800AEE8
	ldr r0, _0800AEDC @ =0x030011A4
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, _0800AEE0 @ =0x030011A0
	ldr r2, [r1]
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, _0800AEE4 @ =0x03001118
	ldr r2, [r1]
	str r2, [r0, #0x34]
	b _0800AEEE
	.align 2, 0
_0800AED8: .4byte 0x0300116C
_0800AEDC: .4byte 0x030011A4
_0800AEE0: .4byte 0x030011A0
_0800AEE4: .4byte 0x03001118
_0800AEE8:
	ldr r0, _0800AF2C @ =0x030011A4
	movs r1, #1
	str r1, [r0]
_0800AEEE:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8023B04
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0800AF5E
	ldr r0, [r7, #0x14]
	lsrs r1, r0, #6
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x18]
	cmp r0, #3
	bne _0800AF34
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	cmp r1, #1
	bne _0800AF28
	ldr r0, _0800AF30 @ =0x0300116C
	movs r1, #2
	str r1, [r0]
_0800AF28:
	b _0800AF56
	.align 2, 0
_0800AF2C: .4byte 0x030011A4
_0800AF30: .4byte 0x0300116C
_0800AF34:
	ldr r0, [r7, #0x18]
	cmp r0, #2
	bne _0800AF50
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	cmp r1, #1
	bne _0800AF48
	ldr r0, _0800AF4C @ =0x0300116C
	movs r1, #1
	str r1, [r0]
_0800AF48:
	b _0800AF56
	.align 2, 0
_0800AF4C: .4byte 0x0300116C
_0800AF50:
	ldr r0, _0800AF68 @ =0x0300116C
	movs r1, #1
	str r1, [r0]
_0800AF56:
	ldr r0, [r7, #0x14]
	movs r1, #0x3f
	ands r0, r1
	str r0, [r7, #0x14]
_0800AF5E:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	bne _0800AF6C
	b _0800AF9C
	.align 2, 0
_0800AF68: .4byte 0x0300116C
_0800AF6C:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bne _0800AF88
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	b _0800AF9C
_0800AF88:
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
_0800AF9C:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #0xc]
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #9
	ldr r1, [r7, #0x14]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800B018 @ =0x030010BC
	ldr r1, [r0]
	cmp r1, #0
	beq _0800AFEC
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0x1c]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x20]
	ldr r2, _0800B01C @ =0x080325D8
	adds r3, r7, #0
	adds r3, #0x1c
	movs r0, #0xd
	movs r1, #0x13
	bl sub_80224B0
	ldr r0, [r7, #0x10]
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x20]
	ldr r2, _0800B020 @ =0x080325E8
	adds r3, r7, #0
	adds r3, #0x1c
	movs r0, #0x10
	movs r1, #0x12
	bl sub_80224B0
_0800AFEC:
	ldr r0, _0800B024 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B070
	ldr r0, _0800B028 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80031B8
	ldr r0, _0800B02C @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #0x18]
_0800B010:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bne _0800B030
	b _0800B05C
	.align 2, 0
_0800B018: .4byte 0x030010BC
_0800B01C: .4byte 0x080325D8
_0800B020: .4byte 0x080325E8
_0800B024: .4byte 0x03005578
_0800B028: .4byte 0x0300118C
_0800B02C: .4byte 0x03001B4C
_0800B030:
	ldr r0, [r7, #0x18]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800B054
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800B054:
	ldr r0, [r7, #0x18]
	ldr r1, [r0]
	str r1, [r7, #0x18]
	b _0800B010
_0800B05C:
	bl sub_8000B54
	bl sub_8000C3C
	ldr r0, _0800B06C @ =0x03005578
	movs r1, #0
	strh r1, [r0]
	b _0800B0D4
	.align 2, 0
_0800B06C: .4byte 0x03005578
_0800B070:
	ldr r0, _0800B098 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B0D4
	ldr r0, _0800B09C @ =0x03001010
	ldr r1, [r0]
	cmp r1, #0x13
	bne _0800B0A4
	ldr r0, _0800B0A0 @ =0x03001008
	ldr r1, [r0]
	cmp r1, #2
	beq _0800B0C0
	b _0800B0A4
	.align 2, 0
_0800B098: .4byte 0x03005578
_0800B09C: .4byte 0x03001010
_0800B0A0: .4byte 0x03001008
_0800B0A4:
	ldr r0, _0800B0B8 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #0x1e
	bne _0800B0C8
	ldr r0, _0800B0BC @ =0x03001008
	ldr r1, [r0]
	cmp r1, #3
	beq _0800B0C0
	b _0800B0C8
	.align 2, 0
_0800B0B8: .4byte 0x03001010
_0800B0BC: .4byte 0x03001008
_0800B0C0:
	movs r0, #0
	bl sub_8001718
	b _0800B0CE
_0800B0C8:
	movs r0, #1
	bl sub_8001718
_0800B0CE:
	ldr r0, _0800B120 @ =0x03005578
	movs r1, #0
	strh r1, [r0]
_0800B0D4:
	ldr r0, _0800B120 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B0EA
_0800B0EA:
	ldr r0, _0800B124 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #9
	bne _0800B0FE
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	ldr r0, [r7]
	bl sub_800C294
_0800B0FE:
	ldr r0, _0800B128 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B142
	ldr r0, _0800B124 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #9
	beq _0800B130
	ldr r0, _0800B124 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #0x12
	bne _0800B13A
	ldr r0, _0800B12C @ =0x03001008
	ldr r1, [r0]
	cmp r1, #2
	beq _0800B130
	b _0800B13A
	.align 2, 0
_0800B120: .4byte 0x03005578
_0800B124: .4byte 0x03001010
_0800B128: .4byte 0x03001148
_0800B12C: .4byte 0x03001008
_0800B130:
	ldr r0, [r7]
	movs r1, #0
	bl sub_800B698
	b _0800B142
_0800B13A:
	ldr r0, [r7]
	movs r1, #1
	bl sub_800B698
_0800B142:
	ldr r0, _0800B1C0 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B180
	ldr r0, _0800B1C4 @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B180
	ldr r0, _0800B1C8 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B180
	movs r0, #1
	bl sub_800C628
	cmp r0, #0
	beq _0800B180
	ldr r1, _0800B1CC @ =0x00000243
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, _0800B1D0 @ =0x03001178
	movs r1, #1
	str r1, [r0]
_0800B180:
	ldr r0, _0800B1D4 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #0x12
	bne _0800B1A6
	ldr r0, _0800B1D8 @ =0x03001008
	ldr r1, [r0]
	cmp r1, #7
	bne _0800B1A6
	ldr r0, _0800B1DC @ =0x030010F8
	ldr r1, [r0]
	cmp r1, #0x13
	ble _0800B1A6
	ldr r0, _0800B1E0 @ =0x03000E30
	ldr r1, _0800B1E0 @ =0x03000E30
	ldr r2, [r1, #0x18]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r2, r1
	str r2, [r0, #0x18]
_0800B1A6:
	movs r0, #6
	bl sub_800284C
	ldr r0, _0800B1E4 @ =0x03001158
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800B1E8 @ =0x0300113C
	movs r1, #0
	str r1, [r0]
_0800B1B8:
	add sp, #0x2c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B1C0: .4byte 0x03001148
_0800B1C4: .4byte 0x0300111C
_0800B1C8: .4byte 0x03005578
_0800B1CC: .4byte 0x00000243
_0800B1D0: .4byte 0x03001178
_0800B1D4: .4byte 0x03001010
_0800B1D8: .4byte 0x03001008
_0800B1DC: .4byte 0x030010F8
_0800B1E0: .4byte 0x03000E30
_0800B1E4: .4byte 0x03001158
_0800B1E8: .4byte 0x0300113C

	thumb_func_start sub_800B1EC
sub_800B1EC: @ 0x0800B1EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800B220 @ =0x030010D4
	movs r1, #3
	str r1, [r0]
	ldr r0, _0800B224 @ =0x03001144
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800B228 @ =0x030010FC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800B22C @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #6
	bls _0800B210
	b _0800B690
_0800B210:
	ldr r0, [r0]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _0800B230 @ =_0800B234
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800B220: .4byte 0x030010D4
_0800B224: .4byte 0x03001144
_0800B228: .4byte 0x030010FC
_0800B22C: .4byte 0x0300118C
_0800B230: .4byte _0800B234
_0800B234: @ jump table
	.4byte _0800B2D6 @ case 0
	.4byte _0800B3A6 @ case 1
	.4byte _0800B482 @ case 2
	.4byte _0800B566 @ case 3
	.4byte _0800B646 @ case 4
	.4byte _0800B64A @ case 5
	.4byte _0800B250 @ case 6
_0800B250:
	ldr r0, [r7]
	cmp r0, #1
	beq _0800B26A
	cmp r0, #1
	blo _0800B264
	cmp r0, #2
	beq _0800B28C
	cmp r0, #3
	beq _0800B2B0
	b _0800B2D4
_0800B264:
	movs r0, #1
	b _0800B690
_0800B268:
	.byte 0x34, 0xE0
_0800B26A:
	ldr r1, _0800B280 @ =0x00000898
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B286
	movs r0, #0x40
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B280: .4byte 0x00000898
_0800B284:
	.byte 0x01, 0xE0
_0800B286:
	movs r0, #0
	b _0800B690
_0800B28A:
	.byte 0x23, 0xE0
_0800B28C:
	ldr r1, _0800B2A4 @ =0x00000BB8
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B2AA
	movs r0, #0x20
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B2A4: .4byte 0x00000BB8
_0800B2A8:
	.byte 0x01, 0xE0
_0800B2AA:
	movs r0, #0
	b _0800B690
_0800B2AE:
	.byte 0x11, 0xE0
_0800B2B0:
	ldr r1, _0800B2C8 @ =0x000036B0
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B2CE
	movs r0, #0x40
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B2C8: .4byte 0x000036B0
_0800B2CC:
	.byte 0x01, 0xE0
_0800B2CE:
	movs r0, #0
	b _0800B690
_0800B2D2:
	.byte 0xFF, 0xE7
_0800B2D4:
	b _0800B690
_0800B2D6:
	ldr r0, [r7]
	cmp r0, #1
	beq _0800B2F0
	cmp r0, #1
	blo _0800B2EA
	cmp r0, #2
	beq _0800B32C
	cmp r0, #3
	beq _0800B368
	b _0800B3A4
_0800B2EA:
	movs r0, #1
	b _0800B690
_0800B2EE:
	.byte 0x59, 0xE0
_0800B2F0:
	ldr r0, _0800B304 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B308
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B304: .4byte 0x03000E30
_0800B308:
	ldr r1, _0800B320 @ =0x00000898
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B326
	movs r0, #0x40
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B320: .4byte 0x00000898
_0800B324:
	.byte 0x01, 0xE0
_0800B326:
	movs r0, #0
	b _0800B690
_0800B32A:
	.byte 0x3B, 0xE0
_0800B32C:
	ldr r0, _0800B340 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B344
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B340: .4byte 0x03000E30
_0800B344:
	ldr r1, _0800B35C @ =0x00000BB8
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B362
	movs r0, #0x20
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B35C: .4byte 0x00000BB8
_0800B360:
	.byte 0x01, 0xE0
_0800B362:
	movs r0, #0
	b _0800B690
_0800B366:
	.byte 0x1D, 0xE0
_0800B368:
	ldr r0, _0800B37C @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B380
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B37C: .4byte 0x03000E30
_0800B380:
	ldr r1, _0800B398 @ =0x000036B0
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B39E
	movs r0, #0x40
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B398: .4byte 0x000036B0
_0800B39C:
	.byte 0x01, 0xE0
_0800B39E:
	movs r0, #0
	b _0800B690
_0800B3A2:
	.byte 0xFF, 0xE7
_0800B3A4:
	b _0800B690
_0800B3A6:
	ldr r0, [r7]
	cmp r0, #1
	beq _0800B3C0
	cmp r0, #1
	blo _0800B3BA
	cmp r0, #2
	beq _0800B404
	cmp r0, #3
	beq _0800B43C
	b _0800B480
_0800B3BA:
	movs r0, #1
	b _0800B690
_0800B3BE:
	.byte 0x5F, 0xE0
_0800B3C0:
	ldr r0, _0800B3D4 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B3D8
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B3D4: .4byte 0x03000E30
_0800B3D8:
	ldr r1, _0800B3F4 @ =0x00000BB8
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B3FE
	ldr r0, _0800B3F8 @ =0x03001170
	movs r1, #1
	str r1, [r0]
	movs r0, #0x20
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B3F4: .4byte 0x00000BB8
_0800B3F8: .4byte 0x03001170
_0800B3FC:
	.byte 0x01, 0xE0
_0800B3FE:
	movs r0, #0
	b _0800B690
_0800B402:
	.byte 0x3D, 0xE0
_0800B404:
	ldr r0, _0800B418 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B41C
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B418: .4byte 0x03000E30
_0800B41C:
	movs r1, #0xfa
	lsls r1, r1, #4
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B436
	movs r0, #0x20
	bl PlaySfx
	movs r0, #1
	b _0800B690
_0800B434:
	.byte 0x01, 0xE0
_0800B436:
	movs r0, #0
	b _0800B690
_0800B43A:
	.byte 0x21, 0xE0
_0800B43C:
	ldr r0, _0800B450 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x14
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B454
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B450: .4byte 0x03000E30
_0800B454:
	ldr r1, _0800B470 @ =0x00002AF8
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B47A
	movs r0, #0x20
	bl PlaySfx
	ldr r0, _0800B474 @ =0x03001170
	movs r1, #1
	str r1, [r0]
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B470: .4byte 0x00002AF8
_0800B474: .4byte 0x03001170
_0800B478:
	.byte 0x01, 0xE0
_0800B47A:
	movs r0, #0
	b _0800B690
_0800B47E:
	.byte 0xFF, 0xE7
_0800B480:
	b _0800B690
_0800B482:
	ldr r0, [r7]
	cmp r0, #1
	beq _0800B49C
	cmp r0, #1
	blo _0800B496
	cmp r0, #2
	beq _0800B4D8
	cmp r0, #3
	beq _0800B51C
	b _0800B564
_0800B496:
	movs r0, #1
	b _0800B690
_0800B49A:
	.byte 0x63, 0xE0
_0800B49C:
	ldr r0, _0800B4B0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x15
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B4B4
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B4B0: .4byte 0x03000E30
_0800B4B4:
	movs r1, #0xfa
	lsls r1, r1, #3
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B4D2
	ldr r0, _0800B4CC @ =0x030010D4
	movs r1, #1
	str r1, [r0]
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B4CC: .4byte 0x030010D4
_0800B4D0:
	.byte 0x01, 0xE0
_0800B4D2:
	movs r0, #0
	b _0800B690
_0800B4D6:
	.byte 0x45, 0xE0
_0800B4D8:
	ldr r0, _0800B4EC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x16
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B4F0
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B4EC: .4byte 0x03000E30
_0800B4F0:
	ldr r1, _0800B50C @ =0x00000BB8
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B516
	ldr r0, _0800B510 @ =0x030010D4
	movs r1, #1
	str r1, [r0]
	movs r0, #0x20
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B50C: .4byte 0x00000BB8
_0800B510: .4byte 0x030010D4
_0800B514:
	.byte 0x01, 0xE0
_0800B516:
	movs r0, #0
	b _0800B690
_0800B51A:
	.byte 0x23, 0xE0
_0800B51C:
	ldr r0, _0800B530 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x80
	lsls r2, r2, #0x17
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B534
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B530: .4byte 0x03000E30
_0800B534:
	ldr r1, _0800B550 @ =0x00004A38
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B55E
	movs r0, #0x20
	bl PlaySfx
	ldr r0, _0800B554 @ =0x03001B44
	ldr r1, _0800B558 @ =sub_800A12C
	str r1, [r0]
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B550: .4byte 0x00004A38
_0800B554: .4byte 0x03001B44
_0800B558: .4byte sub_800A12C
_0800B55C:
	.byte 0x01, 0xE0
_0800B55E:
	movs r0, #0
	b _0800B690
_0800B562:
	.byte 0xFF, 0xE7
_0800B564:
	b _0800B690
_0800B566:
	ldr r0, [r7]
	cmp r0, #1
	beq _0800B580
	cmp r0, #1
	blo _0800B57A
	cmp r0, #2
	beq _0800B5B4
	cmp r0, #3
	beq _0800B5F0
	b _0800B644
_0800B57A:
	movs r0, #1
	b _0800B690
_0800B57E:
	.byte 0x61, 0xE0
_0800B580:
	ldr r0, _0800B590 @ =0x03000E30
	ldr r1, [r0, #0x18]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	bne _0800B594
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B590: .4byte 0x03000E30
_0800B594:
	movs r1, #0xaf
	lsls r1, r1, #4
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B5AE
	movs r0, #0x3f
	bl PlaySfx
	movs r0, #1
	b _0800B690
_0800B5AC:
	.byte 0x01, 0xE0
_0800B5AE:
	movs r0, #0
	b _0800B690
_0800B5B2:
	.byte 0x47, 0xE0
_0800B5B4:
	ldr r0, _0800B5C8 @ =0x03000E30
	ldr r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B5CC
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B5C8: .4byte 0x03000E30
_0800B5CC:
	ldr r1, _0800B5E4 @ =0x00003A98
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B5EA
	movs r0, #0x3f
	bl PlaySfx
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B5E4: .4byte 0x00003A98
_0800B5E8:
	.byte 0x01, 0xE0
_0800B5EA:
	movs r0, #0
	b _0800B690
_0800B5EE:
	.byte 0x29, 0xE0
_0800B5F0:
	ldr r0, _0800B604 @ =0x03000E30
	ldr r1, [r0, #0x1c]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B608
	movs r0, #0
	b _0800B690
	.align 2, 0
_0800B604: .4byte 0x03000E30
_0800B608:
	ldr r1, _0800B62C @ =0x00007530
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B63E
	movs r0, #0x3f
	bl PlaySfx
	ldr r0, _0800B630 @ =0x030010D4
	movs r1, #0xb
	str r1, [r0]
	ldr r0, _0800B634 @ =0x03001B44
	ldr r1, _0800B638 @ =sub_800A12C
	str r1, [r0]
	movs r0, #1
	b _0800B690
	.align 2, 0
_0800B62C: .4byte 0x00007530
_0800B630: .4byte 0x030010D4
_0800B634: .4byte 0x03001B44
_0800B638: .4byte sub_800A12C
_0800B63C:
	.byte 0x01, 0xE0
_0800B63E:
	movs r0, #0
	b _0800B690
_0800B642:
	.byte 0xFF, 0xE7
_0800B644:
	b _0800B690
_0800B646:
	movs r0, #0
	b _0800B690
_0800B64A:
	ldr r0, [r7]
	cmp r0, #1
	beq _0800B664
	cmp r0, #1
	blo _0800B65E
	cmp r0, #2
	beq _0800B682
	cmp r0, #3
	beq _0800B688
	b _0800B68E
_0800B65E:
	movs r0, #1
	b _0800B690
_0800B662:
	.byte 0x14, 0xE0
_0800B664:
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_8002E64
	cmp r0, #0
	beq _0800B67C
	movs r0, #0x20
	bl PlaySfx
	movs r0, #1
	b _0800B690
_0800B67C:
	movs r0, #0
	b _0800B690
_0800B680:
	.byte 0x05, 0xE0
_0800B682:
	movs r0, #0
	b _0800B690
_0800B686:
	.byte 0x02, 0xE0
_0800B688:
	movs r0, #0
	b _0800B690
_0800B68C:
	.byte 0xFF, 0xE7
_0800B68E:
	b _0800B690
_0800B690:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800B698
sub_800B698: @ 0x0800B698
	push {r4, r5, r7, lr}
	sub sp, #0x20
	add r7, sp, #0x14
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0800B6AA
	b _0800B94A
_0800B6AA:
	ldr r0, _0800B718 @ =0x03005574
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0800B6C2
	b _0800B798
_0800B6C2:
	ldr r0, _0800B71C @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B730
	ldr r0, _0800B720 @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B714
	movs r0, #2
	bl sub_800B1EC
	cmp r0, #0
	beq _0800B714
	ldr r0, _0800B724 @ =0x030010EC
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800B720 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B728 @ =0x030010E4
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B72C @ =0x03001110
	movs r1, #3
	str r1, [r0]
_0800B714:
	b _0800B782
	.align 2, 0
_0800B718: .4byte 0x03005574
_0800B71C: .4byte 0x03005578
_0800B720: .4byte 0x0300111C
_0800B724: .4byte 0x030010EC
_0800B728: .4byte 0x030010E4
_0800B72C: .4byte 0x03001110
_0800B730:
	ldr r0, _0800B784 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B782
	ldr r0, _0800B788 @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B782
	movs r0, #3
	bl sub_800B1EC
	cmp r0, #0
	beq _0800B782
	ldr r0, _0800B78C @ =0x03001184
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800B788 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B790 @ =0x030010E4
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B794 @ =0x03001110
	movs r1, #4
	str r1, [r0]
_0800B782:
	b _0800B94A
	.align 2, 0
_0800B784: .4byte 0x03005578
_0800B788: .4byte 0x0300111C
_0800B78C: .4byte 0x03001184
_0800B790: .4byte 0x030010E4
_0800B794: .4byte 0x03001110
_0800B798:
	ldr r0, _0800B7B8 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0800B7C0
	ldr r0, _0800B7BC @ =0x03001100
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B7C0
	b _0800B8F8
	.align 2, 0
_0800B7B8: .4byte 0x03005578
_0800B7BC: .4byte 0x03001100
_0800B7C0:
	ldr r0, _0800B7CC @ =0x030010E8
	ldr r1, [r0]
	cmp r1, #0
	beq _0800B7D0
	b _0800B8F2
	.align 2, 0
_0800B7CC: .4byte 0x030010E8
_0800B7D0:
	movs r0, #0
	bl sub_800B1EC
	cmp r0, #0
	bne _0800B7DC
	b _0800B8F2
_0800B7DC:
	ldr r0, _0800B7F0 @ =0x030010F0
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B7F8
	ldr r0, _0800B7F4 @ =0x0300110C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800B7EE
	b _0800B8BC
_0800B7EE:
	b _0800B7F8
	.align 2, 0
_0800B7F0: .4byte 0x030010F0
_0800B7F4: .4byte 0x0300110C
_0800B7F8:
	ldr r0, _0800B820 @ =0x0300110C
	ldr r1, [r0]
	cmp r1, #2
	bhi _0800B8BC
	ldr r1, _0800B820 @ =0x0300110C
	ldr r0, _0800B820 @ =0x0300110C
	ldr r1, _0800B820 @ =0x0300110C
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r1, _0800B820 @ =0x0300110C
	ldr r0, [r1]
	cmp r0, #2
	beq _0800B83C
	cmp r0, #2
	bhi _0800B824
	cmp r0, #1
	beq _0800B82A
	b _0800B84C
	.align 2, 0
_0800B820: .4byte 0x0300110C
_0800B824:
	cmp r0, #3
	beq _0800B84C
	b _0800B84C
_0800B82A:
	ldr r0, _0800B838 @ =0x03001154
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	b _0800B85C
	.align 2, 0
_0800B838: .4byte 0x03001154
_0800B83C:
	ldr r0, _0800B848 @ =0x03001160
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	b _0800B85C
	.align 2, 0
_0800B848: .4byte 0x03001160
_0800B84C:
	ldr r0, _0800B858 @ =0x03001138
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	b _0800B85C
	.align 2, 0
_0800B858: .4byte 0x03001138
_0800B85C:
	ldr r0, _0800B8A0 @ =0x030010E4
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B8A4 @ =0x03001110
	movs r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800B8A8 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B8AC @ =0x0300110C
	ldr r1, [r0]
	cmp r1, #1
	bls _0800B88C
	ldr r0, _0800B8B0 @ =0x03001168
	movs r1, #0x23
	str r1, [r0]
_0800B88C:
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _0800B8B4
	movs r0, #0x20
	bl PlaySfx
	b _0800B8BA
	.align 2, 0
_0800B8A0: .4byte 0x030010E4
_0800B8A4: .4byte 0x03001110
_0800B8A8: .4byte 0x0300111C
_0800B8AC: .4byte 0x0300110C
_0800B8B0: .4byte 0x03001168
_0800B8B4:
	movs r0, #0x29
	bl PlaySfx
_0800B8BA:
	b _0800B8F2
_0800B8BC:
	ldr r0, _0800B8CC @ =0x0300110C
	ldr r1, [r0]
	cmp r1, #2
	bls _0800B8D4
	ldr r0, _0800B8D0 @ =0x030010E8
	movs r1, #0xa
	str r1, [r0]
	b _0800B8F2
	.align 2, 0
_0800B8CC: .4byte 0x0300110C
_0800B8D0: .4byte 0x030010E8
_0800B8D4:
	b _0800B8EC
_0800B8D6:
	.byte 0x03, 0x48, 0x00, 0x21, 0x01, 0x60, 0x02, 0x48, 0x00, 0x21
	.byte 0x01, 0x60, 0x06, 0xE0, 0x00, 0x11, 0x00, 0x03, 0x0C, 0x11, 0x00, 0x03
_0800B8EC:
	ldr r0, _0800B8F4 @ =0x03001100
	movs r1, #1
	str r1, [r0]
_0800B8F2:
	b _0800B94A
	.align 2, 0
_0800B8F4: .4byte 0x03001100
_0800B8F8:
	ldr r0, _0800B9C8 @ =0x03005578
	ldrh r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0800B94A
	ldr r0, _0800B9CC @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B94A
	movs r0, #1
	bl sub_800B1EC
	cmp r0, #0
	beq _0800B94A
	ldr r0, _0800B9D0 @ =0x03001190
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800B9CC @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B9D4 @ =0x030010E4
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B9D8 @ =0x03001110
	movs r1, #2
	str r1, [r0]
_0800B94A:
	ldr r0, _0800B9DC @ =0x0300112C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B954
	b _0800BA98
_0800B954:
	ldr r1, _0800B9DC @ =0x0300112C
	ldr r0, _0800B9DC @ =0x0300112C
	ldr r1, _0800B9DC @ =0x0300112C
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	ldr r0, _0800B9E0 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #3
	bne _0800B9F4
	ldr r0, _0800B9DC @ =0x0300112C
	ldr r1, [r0]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800B996
	movs r0, #0
	movs r1, #0xfa
	bl sub_8021AE4
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r0, r1, r0
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	subs r2, #0x50
	adds r1, r2, #0
	bl sub_800A204
_0800B996:
	ldr r0, _0800B9DC @ =0x0300112C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800B9C4
	ldr r0, _0800B9E4 @ =0x03001B44
	movs r1, #0
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0
	bl sub_800A0DC
	ldr r1, _0800B9E8 @ =0x03001188
	str r0, [r1]
	ldr r0, _0800B9D4 @ =0x030010E4
	movs r1, #2
	str r1, [r0]
	ldr r0, _0800B9EC @ =0x0300114C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800B9F0 @ =0x03001164
	movs r1, #1
	str r1, [r0]
_0800B9C4:
	b _0800BA7A
	.align 2, 0
_0800B9C8: .4byte 0x03005578
_0800B9CC: .4byte 0x0300111C
_0800B9D0: .4byte 0x03001190
_0800B9D4: .4byte 0x030010E4
_0800B9D8: .4byte 0x03001110
_0800B9DC: .4byte 0x0300112C
_0800B9E0: .4byte 0x0300118C
_0800B9E4: .4byte 0x03001B44
_0800B9E8: .4byte 0x03001188
_0800B9EC: .4byte 0x0300114C
_0800B9F0: .4byte 0x03001164
_0800B9F4:
	ldr r0, _0800BA80 @ =0x0300112C
	ldr r1, [r0]
	cmp r1, #0x1e
	ble _0800BA3A
	ldr r0, _0800BA80 @ =0x0300112C
	ldr r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0800BA3A
	movs r1, #0x5a
	rsbs r1, r1, #0
	adds r0, r1, #0
	movs r1, #0x5a
	bl sub_8021AE4
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r4, r1, r0
	movs r1, #0x3c
	rsbs r1, r1, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, r0
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_800A274
_0800BA3A:
	ldr r0, _0800BA80 @ =0x0300112C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800BA7A
	ldr r0, _0800BA84 @ =0x03001B44
	movs r1, #0
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_800A0DC
	ldr r1, _0800BA88 @ =0x03001188
	str r0, [r1]
	ldr r0, _0800BA8C @ =0x030010E4
	movs r1, #2
	str r1, [r0]
	ldr r0, _0800BA90 @ =0x0300114C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800BA94 @ =0x03001164
	movs r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800BA7A:
	bl _0800C16A
	.align 2, 0
_0800BA80: .4byte 0x0300112C
_0800BA84: .4byte 0x03001B44
_0800BA88: .4byte 0x03001188
_0800BA8C: .4byte 0x030010E4
_0800BA90: .4byte 0x0300114C
_0800BA94: .4byte 0x03001164
_0800BA98:
	ldr r0, _0800BAE8 @ =0x030010E4
	ldr r1, [r0]
	cmp r1, #1
	beq _0800BAA2
	b _0800C144
_0800BAA2:
	ldr r0, _0800BAEC @ =0x030010F0
	movs r1, #0
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	ldr r1, _0800BAF0 @ =0x030010D4
	ldr r2, [r1]
	cmp r0, r2
	beq _0800BABA
	b _0800C12E
_0800BABA:
	ldr r0, _0800BAF4 @ =0x03001144
	ldr r1, [r0]
	cmp r1, #0
	beq _0800BAC4
	b _0800C12E
_0800BAC4:
	ldr r1, _0800BAE8 @ =0x030010E4
	ldr r0, _0800BAE8 @ =0x030010E4
	ldr r1, _0800BAE8 @ =0x030010E4
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _0800BAF8 @ =0x03001188
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800BAFC @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800BB00
	ldr r0, _0800BAFC @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #6
	beq _0800BB00
	b _0800BD3C
	.align 2, 0
_0800BAE8: .4byte 0x030010E4
_0800BAEC: .4byte 0x030010F0
_0800BAF0: .4byte 0x030010D4
_0800BAF4: .4byte 0x03001144
_0800BAF8: .4byte 0x03001188
_0800BAFC: .4byte 0x0300118C
_0800BB00:
	ldr r0, _0800BB2C @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _0800BB3C
	ldr r0, _0800BB30 @ =0x0300114C
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BB34 @ =0x03001164
	movs r1, #0xc0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	bl sub_800A0DC
	ldr r1, _0800BB38 @ =0x03001188
	str r0, [r1]
	b _0800BD28
	.align 2, 0
_0800BB2C: .4byte 0x03001110
_0800BB30: .4byte 0x0300114C
_0800BB34: .4byte 0x03001164
_0800BB38: .4byte 0x03001188
_0800BB3C:
	ldr r0, _0800BB98 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #2
	bne _0800BBA8
	movs r1, #0x80
	lsls r1, r1, #4
	movs r0, #0
	bl sub_800A0DC
	str r0, [r7, #8]
	ldr r0, _0800BB9C @ =0x0300114C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800BBA0 @ =0x03001164
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x40
	movs r3, #0xc0
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0800BBA4 @ =0x0000018B
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r4, [r7, #8]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	b _0800BD28
	.align 2, 0
_0800BB98: .4byte 0x03001110
_0800BB9C: .4byte 0x0300114C
_0800BBA0: .4byte 0x03001164
_0800BBA4: .4byte 0x0000018B
_0800BBA8:
	ldr r0, _0800BBD4 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #3
	bne _0800BBE4
	ldr r0, _0800BBD8 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BBDC @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_800A0DC
	ldr r1, _0800BBE0 @ =0x03001188
	str r0, [r1]
	b _0800BD28
	.align 2, 0
_0800BBD4: .4byte 0x03001110
_0800BBD8: .4byte 0x0300114C
_0800BBDC: .4byte 0x03001164
_0800BBE0: .4byte 0x03001188
_0800BBE4:
	ldr r0, _0800BD2C @ =0x03001110
	ldr r1, [r0]
	cmp r1, #4
	beq _0800BBEE
	b _0800BD28
_0800BBEE:
	movs r1, #0xc0
	lsls r1, r1, #4
	movs r0, #0
	bl sub_800A0DC
	str r0, [r7, #8]
	ldr r0, _0800BD30 @ =0x0300114C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800BD34 @ =0x03001164
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x60
	movs r3, #0xc0
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0800BD38 @ =0x0000018B
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r4, [r7, #8]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x50
	movs r3, #0xc0
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0800BD38 @ =0x0000018B
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r4, [r7, #8]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x40
	movs r3, #0xc0
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0800BD38 @ =0x0000018B
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r4, [r7, #8]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x30
	movs r3, #0xc0
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0800BD38 @ =0x0000018B
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r4, [r7, #8]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x20
	movs r3, #0xc0
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0800BD38 @ =0x0000018B
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r4, [r7, #8]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
_0800BD28:
	b _0800C12E
	.align 2, 0
_0800BD2C: .4byte 0x03001110
_0800BD30: .4byte 0x0300114C
_0800BD34: .4byte 0x03001164
_0800BD38: .4byte 0x0000018B
_0800BD3C:
	ldr r0, _0800BD70 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #1
	beq _0800BD46
	b _0800BE7C
_0800BD46:
	ldr r0, _0800BD74 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _0800BD84
	ldr r0, _0800BD78 @ =0x0300114C
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BD7C @ =0x03001164
	movs r1, #0xc0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	bl sub_800A0DC
	ldr r1, _0800BD80 @ =0x03001188
	str r0, [r1]
	b _0800BE70
	.align 2, 0
_0800BD70: .4byte 0x0300118C
_0800BD74: .4byte 0x03001110
_0800BD78: .4byte 0x0300114C
_0800BD7C: .4byte 0x03001164
_0800BD80: .4byte 0x03001188
_0800BD84:
	ldr r0, _0800BDB0 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #2
	bne _0800BDC0
	ldr r0, _0800BDB4 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BDB8 @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #0xc0
	lsls r1, r1, #3
	bl sub_800A0DC
	ldr r1, _0800BDBC @ =0x03001188
	str r0, [r1]
	b _0800BE70
	.align 2, 0
_0800BDB0: .4byte 0x03001110
_0800BDB4: .4byte 0x0300114C
_0800BDB8: .4byte 0x03001164
_0800BDBC: .4byte 0x03001188
_0800BDC0:
	ldr r0, _0800BDEC @ =0x03001110
	ldr r1, [r0]
	cmp r1, #3
	bne _0800BDFC
	ldr r0, _0800BDF0 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BDF4 @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_800A0DC
	ldr r1, _0800BDF8 @ =0x03001188
	str r0, [r1]
	b _0800BE70
	.align 2, 0
_0800BDEC: .4byte 0x03001110
_0800BDF0: .4byte 0x0300114C
_0800BDF4: .4byte 0x03001164
_0800BDF8: .4byte 0x03001188
_0800BDFC:
	ldr r0, _0800BE48 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #4
	bne _0800BE70
	ldr r0, _0800BE4C @ =0x0300114C
	movs r1, #0x80
	lsls r1, r1, #9
	str r1, [r0]
	ldr r0, _0800BE50 @ =0x03001164
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #0xc0
	lsls r1, r1, #4
	bl sub_800A0DC
	ldr r1, _0800BE54 @ =0x03001188
	str r0, [r1]
	ldr r0, _0800BE58 @ =0x030010FC
	ldr r1, [r0]
	cmp r1, #4
	bgt _0800BE64
	ldr r0, _0800BE5C @ =0x03001144
	movs r1, #1
	str r1, [r0]
	ldr r1, _0800BE58 @ =0x030010FC
	ldr r0, _0800BE58 @ =0x030010FC
	ldr r1, _0800BE58 @ =0x030010FC
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _0800BE60 @ =0x030010E4
	movs r1, #2
	str r1, [r0]
	b _0800BE70
	.align 2, 0
_0800BE48: .4byte 0x03001110
_0800BE4C: .4byte 0x0300114C
_0800BE50: .4byte 0x03001164
_0800BE54: .4byte 0x03001188
_0800BE58: .4byte 0x030010FC
_0800BE5C: .4byte 0x03001144
_0800BE60: .4byte 0x030010E4
_0800BE64:
	ldr r0, _0800BE74 @ =0x03001144
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800BE78 @ =0x030010FC
	movs r1, #0
	str r1, [r0]
_0800BE70:
	b _0800C12E
	.align 2, 0
_0800BE74: .4byte 0x03001144
_0800BE78: .4byte 0x030010FC
_0800BE7C:
	ldr r0, _0800BEB0 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #2
	beq _0800BE86
	b _0800BF84
_0800BE86:
	ldr r0, _0800BEB4 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _0800BEC4
	ldr r0, _0800BEB8 @ =0x0300114C
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BEBC @ =0x03001164
	movs r1, #0xc0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	bl sub_800A0DC
	ldr r1, _0800BEC0 @ =0x03001188
	str r0, [r1]
	b _0800BF6E
	.align 2, 0
_0800BEB0: .4byte 0x0300118C
_0800BEB4: .4byte 0x03001110
_0800BEB8: .4byte 0x0300114C
_0800BEBC: .4byte 0x03001164
_0800BEC0: .4byte 0x03001188
_0800BEC4:
	ldr r0, _0800BEE8 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #2
	bne _0800BEF4
	ldr r0, [r7]
	bl sub_800CAFC
	ldr r0, _0800BEEC @ =0x0300111C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800BEE8 @ =0x03001110
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800BEF0 @ =0x030010E4
	movs r1, #0
	str r1, [r0]
	b _0800BF6E
	.align 2, 0
_0800BEE8: .4byte 0x03001110
_0800BEEC: .4byte 0x0300111C
_0800BEF0: .4byte 0x030010E4
_0800BEF4:
	ldr r0, _0800BF24 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #3
	bne _0800BF34
	ldr r0, _0800BF28 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BF2C @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	ldr r0, [r7]
	bl sub_800CAFC
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_800A0DC
	ldr r1, _0800BF30 @ =0x03001188
	str r0, [r1]
	b _0800BF6E
	.align 2, 0
_0800BF24: .4byte 0x03001110
_0800BF28: .4byte 0x0300114C
_0800BF2C: .4byte 0x03001164
_0800BF30: .4byte 0x03001188
_0800BF34:
	ldr r0, _0800BF70 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #4
	bne _0800BF6E
	ldr r0, _0800BF74 @ =0x0300112C
	movs r1, #0x78
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800BF78 @ =0x0300114C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800BF7C @ =0x03001164
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_800A0DC
	ldr r1, _0800BF80 @ =0x03001188
	str r0, [r1]
_0800BF6E:
	b _0800C12E
	.align 2, 0
_0800BF70: .4byte 0x03001110
_0800BF74: .4byte 0x0300112C
_0800BF78: .4byte 0x0300114C
_0800BF7C: .4byte 0x03001164
_0800BF80: .4byte 0x03001188
_0800BF84:
	ldr r0, _0800BFB8 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #3
	beq _0800BF8E
	b _0800C0C8
_0800BF8E:
	ldr r0, _0800BFBC @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _0800BFCC
	ldr r0, _0800BFC0 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800BFC4 @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	bl sub_800A0DC
	ldr r1, _0800BFC8 @ =0x03001188
	str r0, [r1]
	b _0800C0B0
	.align 2, 0
_0800BFB8: .4byte 0x0300118C
_0800BFBC: .4byte 0x03001110
_0800BFC0: .4byte 0x0300114C
_0800BFC4: .4byte 0x03001164
_0800BFC8: .4byte 0x03001188
_0800BFCC:
	ldr r0, _0800BFF8 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #2
	bne _0800C008
	ldr r0, _0800BFFC @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800C000 @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	bl sub_800A0DC
	ldr r1, _0800C004 @ =0x03001188
	str r0, [r1]
	b _0800C0B0
	.align 2, 0
_0800BFF8: .4byte 0x03001110
_0800BFFC: .4byte 0x0300114C
_0800C000: .4byte 0x03001164
_0800C004: .4byte 0x03001188
_0800C008:
	ldr r0, _0800C050 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #3
	bne _0800C088
	ldr r0, _0800C054 @ =0x0300114C
	movs r1, #0x80
	lsls r1, r1, #9
	str r1, [r0]
	ldr r0, _0800C058 @ =0x03001164
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ldr r1, _0800C05C @ =0x00000133
	bl sub_800A0DC
	ldr r1, _0800C060 @ =0x03001188
	str r0, [r1]
	ldr r0, _0800C064 @ =0x030010FC
	ldr r1, [r0]
	cmp r1, #2
	bgt _0800C070
	ldr r0, _0800C068 @ =0x03001144
	movs r1, #1
	str r1, [r0]
	ldr r1, _0800C064 @ =0x030010FC
	ldr r0, _0800C064 @ =0x030010FC
	ldr r1, _0800C064 @ =0x030010FC
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _0800C06C @ =0x030010E4
	movs r1, #2
	str r1, [r0]
	b _0800C07C
	.align 2, 0
_0800C050: .4byte 0x03001110
_0800C054: .4byte 0x0300114C
_0800C058: .4byte 0x03001164
_0800C05C: .4byte 0x00000133
_0800C060: .4byte 0x03001188
_0800C064: .4byte 0x030010FC
_0800C068: .4byte 0x03001144
_0800C06C: .4byte 0x030010E4
_0800C070:
	ldr r0, _0800C080 @ =0x03001144
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C084 @ =0x030010FC
	movs r1, #0
	str r1, [r0]
_0800C07C:
	b _0800C0B0
	.align 2, 0
_0800C080: .4byte 0x03001144
_0800C084: .4byte 0x030010FC
_0800C088:
	ldr r0, _0800C0B4 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #4
	bne _0800C0B0
	ldr r0, _0800C0B8 @ =0x0300112C
	movs r1, #0x78
	str r1, [r0]
	ldr r0, _0800C0BC @ =0x0300114C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800C0C0 @ =0x03001164
	movs r1, #1
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0
	bl sub_800A0DC
	ldr r1, _0800C0C4 @ =0x03001188
	str r0, [r1]
_0800C0B0:
	b _0800C12E
	.align 2, 0
_0800C0B4: .4byte 0x03001110
_0800C0B8: .4byte 0x0300112C
_0800C0BC: .4byte 0x0300114C
_0800C0C0: .4byte 0x03001164
_0800C0C4: .4byte 0x03001188
_0800C0C8:
	ldr r0, _0800C0D4 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #4
	bne _0800C0D8
	b _0800C12E
	.align 2, 0
_0800C0D4: .4byte 0x0300118C
_0800C0D8:
	ldr r0, _0800C130 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #5
	bne _0800C12E
	ldr r0, _0800C134 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _0800C108
	ldr r0, _0800C138 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800C13C @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	bl sub_800A0DC
	ldr r1, _0800C140 @ =0x03001188
	str r0, [r1]
_0800C108:
	ldr r0, _0800C134 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #2
	bne _0800C12E
	ldr r0, _0800C138 @ =0x0300114C
	movs r1, #0xc0
	lsls r1, r1, #8
	str r1, [r0]
	ldr r0, _0800C13C @ =0x03001164
	movs r1, #0xe0
	lsls r1, r1, #7
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl sub_800A0DC
	ldr r1, _0800C140 @ =0x03001188
	str r0, [r1]
_0800C12E:
	b _0800C16A
	.align 2, 0
_0800C130: .4byte 0x0300118C
_0800C134: .4byte 0x03001110
_0800C138: .4byte 0x0300114C
_0800C13C: .4byte 0x03001164
_0800C140: .4byte 0x03001188
_0800C144:
	ldr r0, _0800C15C @ =0x030010E4
	ldr r1, [r0]
	cmp r1, #2
	bne _0800C16A
	ldr r0, _0800C160 @ =0x03001144
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C164
	ldr r0, _0800C15C @ =0x030010E4
	movs r1, #1
	str r1, [r0]
	b _0800C16A
	.align 2, 0
_0800C15C: .4byte 0x030010E4
_0800C160: .4byte 0x03001144
_0800C164:
	ldr r0, _0800C1E0 @ =0x030010E4
	movs r1, #0
	str r1, [r0]
_0800C16A:
	ldr r0, _0800C1E4 @ =0x0300110C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C180
	ldr r0, _0800C1E8 @ =0x03001158
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C180
	ldr r0, _0800C1EC @ =0x030010F0
	movs r1, #1
	str r1, [r0]
_0800C180:
	ldr r0, _0800C1F0 @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C23A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800C23A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800C23A
	ldr r0, _0800C1F4 @ =0x03001144
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C1FC
	ldr r0, _0800C1F4 @ =0x03001144
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C1F8 @ =0x0300118C
	ldr r1, [r0]
	cmp r1, #1
	bne _0800C1DE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	adds r1, r0, #3
	movs r0, #7
	ands r1, r0
	ldr r0, [r7]
	bl sub_8020E18
_0800C1DE:
	b _0800C23A
	.align 2, 0
_0800C1E0: .4byte 0x030010E4
_0800C1E4: .4byte 0x0300110C
_0800C1E8: .4byte 0x03001158
_0800C1EC: .4byte 0x030010F0
_0800C1F0: .4byte 0x0300111C
_0800C1F4: .4byte 0x03001144
_0800C1F8: .4byte 0x0300118C
_0800C1FC:
	ldr r0, _0800C26C @ =0x03001150
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800C270 @ =0x0300111C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C274 @ =0x03001130
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C278 @ =0x03001170
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C27C @ =0x0300110C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C280 @ =0x030010F0
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C284 @ =0x03001100
	movs r1, #0
	str r1, [r0]
_0800C23A:
	ldr r0, _0800C288 @ =0x03001158
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C262
	ldr r0, _0800C27C @ =0x0300110C
	ldr r1, [r0]
	cmp r1, #1
	bne _0800C262
	ldr r0, _0800C27C @ =0x0300110C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800C280 @ =0x030010F0
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800C28C @ =0x03001168
	movs r1, #0x23
	str r1, [r0]
	ldr r0, _0800C290 @ =0x030010E0
	movs r1, #1
	str r1, [r0]
_0800C262:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C26C: .4byte 0x03001150
_0800C270: .4byte 0x0300111C
_0800C274: .4byte 0x03001130
_0800C278: .4byte 0x03001170
_0800C27C: .4byte 0x0300110C
_0800C280: .4byte 0x030010F0
_0800C284: .4byte 0x03001100
_0800C288: .4byte 0x03001158
_0800C28C: .4byte 0x03001168
_0800C290: .4byte 0x030010E0

	thumb_func_start sub_800C294
sub_800C294: @ 0x0800C294
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strb r0, [r1]
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #0
	bne _0800C2AC
	b _0800C4A4
_0800C2AC:
	ldr r0, _0800C2DC @ =0x03001130
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C2B6
	b _0800C4A4
_0800C2B6:
	ldr r0, _0800C2E0 @ =0x0300111C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800C2C0
	b _0800C4A4
_0800C2C0:
	movs r0, #0
	str r0, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #7
	bls _0800C2D2
	b _0800C420
_0800C2D2:
	lsls r1, r0, #2
	ldr r2, _0800C2E4 @ =_0800C2E8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800C2DC: .4byte 0x03001130
_0800C2E0: .4byte 0x0300111C
_0800C2E4: .4byte _0800C2E8
_0800C2E8: @ jump table
	.4byte _0800C308 @ case 0
	.4byte _0800C308 @ case 1
	.4byte _0800C3DA @ case 2
	.4byte _0800C3DA @ case 3
	.4byte _0800C394 @ case 4
	.4byte _0800C394 @ case 5
	.4byte _0800C34E @ case 6
	.4byte _0800C34E @ case 7
_0800C308:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #0xe
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	adds r1, r2, #0
	subs r1, #0x34
	adds r2, r1, #0
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #0xc
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r7, #0
	adds r1, #0xe
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	bl sub_8023978
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800C34C
	movs r0, #1
	str r0, [r7, #8]
_0800C34C:
	b _0800C420
_0800C34E:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	adds r1, r2, #0
	subs r1, #0x34
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #0xe
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r7, #0
	adds r1, #0xe
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	bl sub_8023978
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800C392
	movs r0, #1
	str r0, [r7, #8]
_0800C392:
	b _0800C420
_0800C394:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #0xe
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x34
	adds r2, r1, #0
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r7, #0
	adds r1, #0xe
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	bl sub_8023978
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800C3D8
	movs r0, #1
	str r0, [r7, #8]
_0800C3D8:
	b _0800C420
_0800C3DA:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x34
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #0xe
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	adds r2, r1, #0
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r7, #0
	adds r1, #0xe
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	bl sub_8023978
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800C41E
	movs r0, #1
	str r0, [r7, #8]
_0800C41E:
	b _0800C420
_0800C420:
	ldr r0, _0800C430 @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #0x10]
_0800C426:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0800C434
	b _0800C48A
	.align 2, 0
_0800C430: .4byte 0x03001B4C
_0800C434:
	ldr r0, [r7, #0x10]
	ldr r1, [r0, #0x4c]
	ldr r0, _0800C458 @ =sub_8014684
	cmp r1, r0
	bne _0800C482
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C45C
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800C45C
	b _0800C482
	.align 2, 0
_0800C458: .4byte sub_8014684
_0800C45C:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r2, [r1, r4]
	lsls r1, r2, #0xa
	adds r2, r7, #0
	adds r2, #0xe
	movs r4, #0
	ldrsh r3, [r2, r4]
	lsls r2, r3, #0xa
	movs r3, #0xc0
	lsls r3, r3, #8
	bl sub_8009464
	cmp r0, #0
	beq _0800C482
	movs r0, #1
	str r0, [r7, #8]
_0800C482:
	ldr r0, [r7, #0x10]
	ldr r1, [r0]
	str r1, [r7, #0x10]
	b _0800C426
_0800C48A:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _0800C4A4
	ldr r0, _0800C4C8 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800C4CC @ =0x03001130
	movs r1, #1
	str r1, [r0]
	ldr r1, _0800C4D0 @ =0x0000025D
	ldr r0, [r7]
	bl sub_8020D1C
_0800C4A4:
	ldr r0, _0800C4CC @ =0x03001130
	ldr r1, [r0]
	cmp r1, #1
	beq _0800C4AE
	b _0800C620
_0800C4AE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800C4D4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	beq _0800C4D4
	b _0800C4D6
	.align 2, 0
_0800C4C8: .4byte 0x0300111C
_0800C4CC: .4byte 0x03001130
_0800C4D0: .4byte 0x0000025D
_0800C4D4:
	b _0800C620
_0800C4D6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	beq _0800C4F0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	beq _0800C4F0
	b _0800C512
_0800C4F0:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x44
	ldrb r3, [r2]
	subs r1, r3, #6
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800C594
_0800C512:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #6
	bne _0800C594
	ldr r0, _0800C52C @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #0x10]
_0800C524:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0800C530
	b _0800C594
	.align 2, 0
_0800C52C: .4byte 0x03001B4C
_0800C530:
	ldr r0, [r7, #0x10]
	ldr r1, [r0, #0x4c]
	ldr r0, _0800C58C @ =sub_8014684
	cmp r1, r0
	bne _0800C582
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C582
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800C582
	ldr r1, [r7, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #8
	ldr r0, [r7]
	bl sub_80093A8
	cmp r0, #0
	beq _0800C582
	ldr r0, _0800C590 @ =0x0300117C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800C582
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_0800C582:
	ldr r0, [r7, #0x10]
	ldr r1, [r0]
	str r1, [r7, #0x10]
	b _0800C524
	.align 2, 0
_0800C58C: .4byte sub_8014684
_0800C590: .4byte 0x0300117C
_0800C594:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0800C620
	lsls r1, r0, #2
	ldr r2, _0800C5AC @ =_0800C5B0
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800C5AC: .4byte _0800C5B0
_0800C5B0: @ jump table
	.4byte _0800C5D0 @ case 0
	.4byte _0800C5D0 @ case 1
	.4byte _0800C60C @ case 2
	.4byte _0800C60C @ case 3
	.4byte _0800C5F8 @ case 4
	.4byte _0800C5F8 @ case 5
	.4byte _0800C5E4 @ case 6
	.4byte _0800C5E4 @ case 7
_0800C5D0:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldr r3, _0800C5E0 @ =0xFFFFF967
	adds r1, r2, r3
	str r1, [r0, #0x34]
	b _0800C620
	.align 2, 0
_0800C5E0: .4byte 0xFFFFF967
_0800C5E4:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	ldr r4, _0800C5F4 @ =0xFFFFF892
	adds r1, r2, r4
	str r1, [r0, #0x30]
	b _0800C620
	.align 2, 0
_0800C5F4: .4byte 0xFFFFF892
_0800C5F8:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldr r3, _0800C608 @ =0x00000699
	adds r1, r2, r3
	str r1, [r0, #0x34]
	b _0800C620
	.align 2, 0
_0800C608: .4byte 0x00000699
_0800C60C:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	ldr r4, _0800C61C @ =0x0000076E
	adds r1, r2, r4
	str r1, [r0, #0x30]
	b _0800C620
	.align 2, 0
_0800C61C: .4byte 0x0000076E
_0800C620:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800C628
sub_800C628: @ 0x0800C628
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C648
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C648:
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C65C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C65C:
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C670
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C670:
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C684
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C684:
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C698
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C698:
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C6AC
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C6AC:
	ldr r0, _0800C6CC @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C6C0
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
_0800C6C0:
	ldr r0, _0800C6D0 @ =0x030011A8
	ldr r1, [r0]
	cmp r1, #0
	bgt _0800C6D4
	movs r0, #0
	b _0800C6FE
	.align 2, 0
_0800C6CC: .4byte 0x03000E30
_0800C6D0: .4byte 0x030011A8
_0800C6D4:
	ldr r0, [r7]
	cmp r0, #0
	beq _0800C6F0
	ldr r0, _0800C6E8 @ =0x0300115C
	ldr r1, [r0]
	ldr r0, _0800C6EC @ =0x0000270F
	cmp r1, r0
	bgt _0800C6F0
	movs r0, #0
	b _0800C6FE
	.align 2, 0
_0800C6E8: .4byte 0x0300115C
_0800C6EC: .4byte 0x0000270F
_0800C6F0:
	ldr r0, [r7, #4]
	cmp r0, #1
	bhi _0800C6FA
	movs r0, #0
	b _0800C6FE
_0800C6FA:
	movs r0, #1
	b _0800C6FE
_0800C6FE:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C708
sub_800C708: @ 0x0800C708
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #7
	bls _0800C718
	b _0800C82C
_0800C718:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _0800C728 @ =_0800C72C
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800C728: .4byte _0800C72C
_0800C72C: @ jump table
	.4byte _0800C74C @ case 0
	.4byte _0800C76C @ case 1
	.4byte _0800C78C @ case 2
	.4byte _0800C7AC @ case 3
	.4byte _0800C7CC @ case 4
	.4byte _0800C7EC @ case 5
	.4byte _0800C80C @ case 6
	.4byte _0800C74C @ case 7
_0800C74C:
	ldr r0, _0800C760 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C764
	bl sub_800C834
	b _0800C76A
	.align 2, 0
_0800C760: .4byte 0x03000E30
_0800C764:
	movs r0, #1
	bl sub_800C708
_0800C76A:
	b _0800C82C
_0800C76C:
	ldr r0, _0800C780 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C784
	bl sub_800C8E0
	b _0800C78A
	.align 2, 0
_0800C780: .4byte 0x03000E30
_0800C784:
	movs r0, #2
	bl sub_800C708
_0800C78A:
	b _0800C82C
_0800C78C:
	ldr r0, _0800C7A0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C7A4
	bl sub_800C994
	b _0800C7AA
	.align 2, 0
_0800C7A0: .4byte 0x03000E30
_0800C7A4:
	movs r0, #3
	bl sub_800C708
_0800C7AA:
	b _0800C82C
_0800C7AC:
	ldr r0, _0800C7C0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C7C4
	bl sub_800CA44
	b _0800C7CA
	.align 2, 0
_0800C7C0: .4byte 0x03000E30
_0800C7C4:
	movs r0, #4
	bl sub_800C708
_0800C7CA:
	b _0800C82C
_0800C7CC:
	ldr r0, _0800C7E0 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C7E4
	bl sub_800CC34
	b _0800C7EA
	.align 2, 0
_0800C7E0: .4byte 0x03000E30
_0800C7E4:
	movs r0, #5
	bl sub_800C708
_0800C7EA:
	b _0800C82C
_0800C7EC:
	ldr r0, _0800C800 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C804
	bl sub_800CCD4
	b _0800C80A
	.align 2, 0
_0800C800: .4byte 0x03000E30
_0800C804:
	movs r0, #6
	bl sub_800C708
_0800C80A:
	b _0800C82C
_0800C80C:
	ldr r0, _0800C820 @ =0x03000E30
	ldr r1, [r0, #0x18]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800C824
	bl sub_800CD80
	b _0800C82A
	.align 2, 0
_0800C820: .4byte 0x03000E30
_0800C824:
	movs r0, #0
	bl sub_800C708
_0800C82A:
	b _0800C82C
_0800C82C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800C834
sub_800C834: @ 0x0800C834
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800C8A0 @ =0x0300118C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800C8A4 @ =0x0300119C
	movs r1, #0xc5
	lsls r1, r1, #1
	str r1, [r0]
	ldr r0, _0800C8A8 @ =0x03001198
	ldr r1, _0800C8AC @ =0x00000193
	str r1, [r0]
	ldr r0, _0800C8B0 @ =0x03001150
	ldr r1, _0800C8B4 @ =0x0000018F
	str r1, [r0]
	ldr r0, _0800C8B8 @ =0x03001154
	movs r1, #0xc9
	lsls r1, r1, #1
	str r1, [r0]
	ldr r0, _0800C8BC @ =0x03001160
	ldr r1, _0800C8C0 @ =0x00000191
	str r1, [r0]
	ldr r0, _0800C8C4 @ =0x03001138
	movs r1, #0xc8
	lsls r1, r1, #1
	str r1, [r0]
	ldr r0, _0800C8C8 @ =0x03001194
	movs r1, #0xca
	lsls r1, r1, #1
	str r1, [r0]
	ldr r0, _0800C8CC @ =0x03001190
	movs r1, #0xcb
	lsls r1, r1, #1
	str r1, [r0]
	ldr r0, _0800C8D0 @ =0x030010EC
	ldr r1, _0800C8D4 @ =0x00000195
	str r1, [r0]
	ldr r0, _0800C8D8 @ =0x03001184
	ldr r1, _0800C8D4 @ =0x00000195
	str r1, [r0]
	ldr r0, _0800C8DC @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #0x33
	bl sub_80028E8
	ldr r0, _0800C8A0 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C8A0: .4byte 0x0300118C
_0800C8A4: .4byte 0x0300119C
_0800C8A8: .4byte 0x03001198
_0800C8AC: .4byte 0x00000193
_0800C8B0: .4byte 0x03001150
_0800C8B4: .4byte 0x0000018F
_0800C8B8: .4byte 0x03001154
_0800C8BC: .4byte 0x03001160
_0800C8C0: .4byte 0x00000191
_0800C8C4: .4byte 0x03001138
_0800C8C8: .4byte 0x03001194
_0800C8CC: .4byte 0x03001190
_0800C8D0: .4byte 0x030010EC
_0800C8D4: .4byte 0x00000195
_0800C8D8: .4byte 0x03001184
_0800C8DC: .4byte 0x03001108

	thumb_func_start sub_800C8E0
sub_800C8E0: @ 0x0800C8E0
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800C948 @ =0x0300118C
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800C94C @ =0x0300119C
	ldr r1, _0800C950 @ =0x0000025B
	str r1, [r0]
	ldr r0, _0800C954 @ =0x03001198
	ldr r1, _0800C958 @ =0x00000263
	str r1, [r0]
	ldr r0, _0800C95C @ =0x03001150
	movs r1, #0x97
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800C960 @ =0x03001154
	ldr r1, _0800C964 @ =0x00000261
	str r1, [r0]
	ldr r0, _0800C968 @ =0x03001160
	movs r1, #0x98
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800C96C @ =0x03001138
	ldr r1, _0800C970 @ =0x0000025E
	str r1, [r0]
	ldr r0, _0800C974 @ =0x03001194
	movs r1, #0x99
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800C978 @ =0x03001190
	ldr r1, _0800C97C @ =0x00000265
	str r1, [r0]
	ldr r0, _0800C980 @ =0x030010EC
	ldr r1, _0800C984 @ =0x0000025F
	str r1, [r0]
	ldr r0, _0800C988 @ =0x03001184
	ldr r1, _0800C98C @ =0x00000266
	str r1, [r0]
	ldr r0, _0800C990 @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #0x19
	bl sub_80028E8
	ldr r0, _0800C948 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C948: .4byte 0x0300118C
_0800C94C: .4byte 0x0300119C
_0800C950: .4byte 0x0000025B
_0800C954: .4byte 0x03001198
_0800C958: .4byte 0x00000263
_0800C95C: .4byte 0x03001150
_0800C960: .4byte 0x03001154
_0800C964: .4byte 0x00000261
_0800C968: .4byte 0x03001160
_0800C96C: .4byte 0x03001138
_0800C970: .4byte 0x0000025E
_0800C974: .4byte 0x03001194
_0800C978: .4byte 0x03001190
_0800C97C: .4byte 0x00000265
_0800C980: .4byte 0x030010EC
_0800C984: .4byte 0x0000025F
_0800C988: .4byte 0x03001184
_0800C98C: .4byte 0x00000266
_0800C990: .4byte 0x03001108

	thumb_func_start sub_800C994
sub_800C994: @ 0x0800C994
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800CA00 @ =0x0300118C
	movs r1, #2
	str r1, [r0]
	ldr r0, _0800CA04 @ =0x0300119C
	ldr r1, _0800CA08 @ =0x00000287
	str r1, [r0]
	ldr r0, _0800CA0C @ =0x03001198
	ldr r1, _0800CA10 @ =0x0000028D
	str r1, [r0]
	ldr r0, _0800CA14 @ =0x03001150
	movs r1, #0xa2
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CA18 @ =0x03001154
	movs r1, #0xa3
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CA1C @ =0x03001160
	ldr r1, _0800CA20 @ =0x00000289
	str r1, [r0]
	ldr r0, _0800CA24 @ =0x03001138
	ldr r1, _0800CA28 @ =0x0000028B
	str r1, [r0]
	ldr r0, _0800CA2C @ =0x03001194
	ldr r1, _0800CA30 @ =0x0000028E
	str r1, [r0]
	ldr r0, _0800CA34 @ =0x03001190
	movs r1, #0xa2
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CA38 @ =0x030010EC
	movs r1, #0xa4
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CA3C @ =0x03001184
	movs r1, #0xa4
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CA40 @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #0x10
	bl sub_80028E8
	ldr r0, _0800CA00 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA00: .4byte 0x0300118C
_0800CA04: .4byte 0x0300119C
_0800CA08: .4byte 0x00000287
_0800CA0C: .4byte 0x03001198
_0800CA10: .4byte 0x0000028D
_0800CA14: .4byte 0x03001150
_0800CA18: .4byte 0x03001154
_0800CA1C: .4byte 0x03001160
_0800CA20: .4byte 0x00000289
_0800CA24: .4byte 0x03001138
_0800CA28: .4byte 0x0000028B
_0800CA2C: .4byte 0x03001194
_0800CA30: .4byte 0x0000028E
_0800CA34: .4byte 0x03001190
_0800CA38: .4byte 0x030010EC
_0800CA3C: .4byte 0x03001184
_0800CA40: .4byte 0x03001108

	thumb_func_start sub_800CA44
sub_800CA44: @ 0x0800CA44
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800CAAC @ =0x0300118C
	movs r1, #3
	str r1, [r0]
	ldr r0, _0800CAB0 @ =0x0300119C
	ldr r1, _0800CAB4 @ =0x00000267
	str r1, [r0]
	ldr r0, _0800CAB8 @ =0x03001198
	ldr r1, _0800CABC @ =0x0000026B
	str r1, [r0]
	ldr r0, _0800CAC0 @ =0x03001150
	movs r1, #0x9a
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CAC4 @ =0x03001154
	ldr r1, _0800CAC8 @ =0x0000026A
	str r1, [r0]
	ldr r0, _0800CACC @ =0x03001160
	ldr r1, _0800CAD0 @ =0x00000269
	str r1, [r0]
	ldr r0, _0800CAD4 @ =0x03001138
	ldr r1, _0800CAD8 @ =0x00000271
	str r1, [r0]
	ldr r0, _0800CADC @ =0x03001194
	ldr r1, _0800CAE0 @ =0x0000026E
	str r1, [r0]
	ldr r0, _0800CAE4 @ =0x03001190
	ldr r1, _0800CAE8 @ =0x00000272
	str r1, [r0]
	ldr r0, _0800CAEC @ =0x030010EC
	ldr r1, _0800CAF0 @ =0x0000026F
	str r1, [r0]
	ldr r0, _0800CAF4 @ =0x03001184
	movs r1, #0x9c
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CAF8 @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #0x18
	bl sub_80028E8
	ldr r0, _0800CAAC @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CAAC: .4byte 0x0300118C
_0800CAB0: .4byte 0x0300119C
_0800CAB4: .4byte 0x00000267
_0800CAB8: .4byte 0x03001198
_0800CABC: .4byte 0x0000026B
_0800CAC0: .4byte 0x03001150
_0800CAC4: .4byte 0x03001154
_0800CAC8: .4byte 0x0000026A
_0800CACC: .4byte 0x03001160
_0800CAD0: .4byte 0x00000269
_0800CAD4: .4byte 0x03001138
_0800CAD8: .4byte 0x00000271
_0800CADC: .4byte 0x03001194
_0800CAE0: .4byte 0x0000026E
_0800CAE4: .4byte 0x03001190
_0800CAE8: .4byte 0x00000272
_0800CAEC: .4byte 0x030010EC
_0800CAF0: .4byte 0x0000026F
_0800CAF4: .4byte 0x03001184
_0800CAF8: .4byte 0x03001108

	thumb_func_start sub_800CAFC
sub_800CAFC: @ 0x0800CAFC
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0800CBC0
	lsls r1, r0, #2
	ldr r2, _0800CB2C @ =_0800CB30
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800CB2C: .4byte _0800CB30
_0800CB30: @ jump table
	.4byte _0800CB50 @ case 0
	.4byte _0800CBAE @ case 1
	.4byte _0800CBA4 @ case 2
	.4byte _0800CB92 @ case 3
	.4byte _0800CB88 @ case 4
	.4byte _0800CB76 @ case 5
	.4byte _0800CB6C @ case 6
	.4byte _0800CB5A @ case 7
_0800CB50:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x1e
	str r1, [r7, #0xc]
	b _0800CBC0
_0800CB5A:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x1e
	str r1, [r7, #0xc]
	b _0800CBC0
_0800CB6C:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #8]
	b _0800CBC0
_0800CB76:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r1, #0x1e
	str r1, [r7, #0xc]
	b _0800CBC0
_0800CB88:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r1, #0x1e
	str r1, [r7, #0xc]
	b _0800CBC0
_0800CB92:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x28
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r1, #0x1e
	str r1, [r7, #0xc]
	b _0800CBC0
_0800CBA4:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x28
	str r1, [r7, #8]
	b _0800CBC0
_0800CBAE:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x28
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	subs r1, #0x1e
	str r1, [r7, #0xc]
	b _0800CBC0
_0800CBC0:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	bl sub_8023978
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #4]
	ldr r0, _0800CC24 @ =0x0300100C
	ldr r1, [r0]
	cmp r1, #0
	bne _0800CBEA
	bl sub_8000780
	ldr r0, _0800CC28 @ =0x03000E20
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CC2C @ =0x03000FF8
	movs r1, #0
	str r1, [r0]
	bl sub_80007B4
_0800CBEA:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0800CC1C
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x8a
	lsls r2, r2, #2
	bl sub_8014E8C
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, _0800CC30 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
_0800CC1C:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC24: .4byte 0x0300100C
_0800CC28: .4byte 0x03000E20
_0800CC2C: .4byte 0x03000FF8
_0800CC30: .4byte sub_80142EC

	thumb_func_start sub_800CC34
sub_800CC34: @ 0x0800CC34
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800CC98 @ =0x0300118C
	movs r1, #4
	str r1, [r0]
	ldr r0, _0800CC9C @ =0x0300119C
	ldr r1, _0800CCA0 @ =0x0000027F
	str r1, [r0]
	ldr r0, _0800CCA4 @ =0x03001198
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCAC @ =0x03001150
	movs r1, #0xa0
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CCB0 @ =0x03001154
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCB4 @ =0x03001160
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCB8 @ =0x03001138
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCBC @ =0x03001194
	ldr r1, _0800CCC0 @ =0x00000282
	str r1, [r0]
	ldr r0, _0800CCC4 @ =0x03001190
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCC8 @ =0x030010EC
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCCC @ =0x03001184
	ldr r1, _0800CCA8 @ =0x00000281
	str r1, [r0]
	ldr r0, _0800CCD0 @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #0x13
	bl sub_80028E8
	ldr r0, _0800CC98 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC98: .4byte 0x0300118C
_0800CC9C: .4byte 0x0300119C
_0800CCA0: .4byte 0x0000027F
_0800CCA4: .4byte 0x03001198
_0800CCA8: .4byte 0x00000281
_0800CCAC: .4byte 0x03001150
_0800CCB0: .4byte 0x03001154
_0800CCB4: .4byte 0x03001160
_0800CCB8: .4byte 0x03001138
_0800CCBC: .4byte 0x03001194
_0800CCC0: .4byte 0x00000282
_0800CCC4: .4byte 0x03001190
_0800CCC8: .4byte 0x030010EC
_0800CCCC: .4byte 0x03001184
_0800CCD0: .4byte 0x03001108

	thumb_func_start sub_800CCD4
sub_800CCD4: @ 0x0800CCD4
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800CD40 @ =0x0300118C
	movs r1, #5
	str r1, [r0]
	ldr r0, _0800CD44 @ =0x0300119C
	ldr r1, _0800CD48 @ =0x000002D5
	str r1, [r0]
	ldr r0, _0800CD4C @ =0x03001198
	movs r1, #0xb6
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CD50 @ =0x03001150
	ldr r1, _0800CD54 @ =0x000002D6
	str r1, [r0]
	ldr r0, _0800CD58 @ =0x03001154
	ldr r1, _0800CD5C @ =0x000002D3
	str r1, [r0]
	ldr r0, _0800CD60 @ =0x03001160
	ldr r1, _0800CD5C @ =0x000002D3
	str r1, [r0]
	ldr r0, _0800CD64 @ =0x03001138
	ldr r1, _0800CD5C @ =0x000002D3
	str r1, [r0]
	ldr r0, _0800CD68 @ =0x03001194
	ldr r1, _0800CD6C @ =0x000002D9
	str r1, [r0]
	ldr r0, _0800CD70 @ =0x03001190
	movs r1, #0xb5
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CD74 @ =0x030010EC
	movs r1, #0xb5
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CD78 @ =0x03001184
	movs r1, #0xb5
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CD7C @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #4
	bl sub_80028E8
	ldr r0, _0800CD40 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CD40: .4byte 0x0300118C
_0800CD44: .4byte 0x0300119C
_0800CD48: .4byte 0x000002D5
_0800CD4C: .4byte 0x03001198
_0800CD50: .4byte 0x03001150
_0800CD54: .4byte 0x000002D6
_0800CD58: .4byte 0x03001154
_0800CD5C: .4byte 0x000002D3
_0800CD60: .4byte 0x03001160
_0800CD64: .4byte 0x03001138
_0800CD68: .4byte 0x03001194
_0800CD6C: .4byte 0x000002D9
_0800CD70: .4byte 0x03001190
_0800CD74: .4byte 0x030010EC
_0800CD78: .4byte 0x03001184
_0800CD7C: .4byte 0x03001108

	thumb_func_start sub_800CD80
sub_800CD80: @ 0x0800CD80
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800CDE4 @ =0x0300118C
	movs r1, #6
	str r1, [r0]
	ldr r0, _0800CDE8 @ =0x0300119C
	ldr r1, _0800CDEC @ =0x0000029D
	str r1, [r0]
	ldr r0, _0800CDF0 @ =0x03001198
	ldr r1, _0800CDF4 @ =0x000002A2
	str r1, [r0]
	ldr r0, _0800CDF8 @ =0x03001150
	ldr r1, _0800CDFC @ =0x0000029E
	str r1, [r0]
	ldr r0, _0800CE00 @ =0x03001154
	movs r1, #0xa8
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CE04 @ =0x03001160
	ldr r1, _0800CE08 @ =0x000002A1
	str r1, [r0]
	ldr r0, _0800CE0C @ =0x03001138
	ldr r1, _0800CE10 @ =0x0000029F
	str r1, [r0]
	ldr r0, _0800CE14 @ =0x03001194
	ldr r1, _0800CE18 @ =0x000002A3
	str r1, [r0]
	ldr r0, _0800CE1C @ =0x03001190
	movs r1, #0xa9
	lsls r1, r1, #2
	str r1, [r0]
	ldr r0, _0800CE20 @ =0x030010EC
	ldr r1, _0800CE24 @ =0x000002A5
	str r1, [r0]
	ldr r0, _0800CE28 @ =0x03001184
	ldr r1, _0800CE24 @ =0x000002A5
	str r1, [r0]
	ldr r0, _0800CE2C @ =0x03001108
	ldr r2, [r0]
	movs r0, #0
	movs r1, #0xc
	bl sub_80028E8
	movs r0, #0
	bl sub_80029CC
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CDE4: .4byte 0x0300118C
_0800CDE8: .4byte 0x0300119C
_0800CDEC: .4byte 0x0000029D
_0800CDF0: .4byte 0x03001198
_0800CDF4: .4byte 0x000002A2
_0800CDF8: .4byte 0x03001150
_0800CDFC: .4byte 0x0000029E
_0800CE00: .4byte 0x03001154
_0800CE04: .4byte 0x03001160
_0800CE08: .4byte 0x000002A1
_0800CE0C: .4byte 0x03001138
_0800CE10: .4byte 0x0000029F
_0800CE14: .4byte 0x03001194
_0800CE18: .4byte 0x000002A3
_0800CE1C: .4byte 0x03001190
_0800CE20: .4byte 0x030010EC
_0800CE24: .4byte 0x000002A5
_0800CE28: .4byte 0x03001184
_0800CE2C: .4byte 0x03001108

	thumb_func_start sub_800CE30
sub_800CE30: @ 0x0800CE30
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0800CF74 @ =0x03001150
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _0800CF78 @ =sub_800A2E4
	str r1, [r0, #0x4c]
	ldr r0, _0800CF7C @ =0x0300111C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CF80 @ =0x03001140
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CF84 @ =0x03001148
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CF88 @ =0x03001104
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CF8C @ =0x030011A4
	movs r1, #1
	str r1, [r0]
	ldr r0, _0800CF90 @ =0x03001168
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CF94 @ =0x03001108
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CF98 @ =0x0300118C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_800C708
	ldr r0, _0800CF9C @ =0x030010F8
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFA0 @ =0x03001178
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800CFA4 @ =0x0300113C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFA8 @ =0x030010D8
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0800CFAC @ =0x030010E4
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFB0 @ =0x03001188
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFB4 @ =0x03001110
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFB8 @ =0x03001158
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFBC @ =0x030010E0
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFC0 @ =0x03001100
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFC4 @ =0x0300110C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFC8 @ =0x030010F0
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFA4 @ =0x0300113C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFCC @ =0x03001120
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFD0 @ =0x03001144
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFD4 @ =0x030010FC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFD8 @ =0x0300112C
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFDC @ =0x03001124
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFE0 @ =0x030010DC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFE4 @ =0x03001170
	movs r1, #0
	str r1, [r0]
	ldr r0, _0800CFE8 @ =0x0300117C
	movs r1, #0
	str r1, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800CFEC
	.align 2, 0
_0800CF74: .4byte 0x03001150
_0800CF78: .4byte sub_800A2E4
_0800CF7C: .4byte 0x0300111C
_0800CF80: .4byte 0x03001140
_0800CF84: .4byte 0x03001148
_0800CF88: .4byte 0x03001104
_0800CF8C: .4byte 0x030011A4
_0800CF90: .4byte 0x03001168
_0800CF94: .4byte 0x03001108
_0800CF98: .4byte 0x0300118C
_0800CF9C: .4byte 0x030010F8
_0800CFA0: .4byte 0x03001178
_0800CFA4: .4byte 0x0300113C
_0800CFA8: .4byte 0x030010D8
_0800CFAC: .4byte 0x030010E4
_0800CFB0: .4byte 0x03001188
_0800CFB4: .4byte 0x03001110
_0800CFB8: .4byte 0x03001158
_0800CFBC: .4byte 0x030010E0
_0800CFC0: .4byte 0x03001100
_0800CFC4: .4byte 0x0300110C
_0800CFC8: .4byte 0x030010F0
_0800CFCC: .4byte 0x03001120
_0800CFD0: .4byte 0x03001144
_0800CFD4: .4byte 0x030010FC
_0800CFD8: .4byte 0x0300112C
_0800CFDC: .4byte 0x03001124
_0800CFE0: .4byte 0x030010DC
_0800CFE4: .4byte 0x03001170
_0800CFE8: .4byte 0x0300117C
_0800CFEC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800CFF4
sub_800CFF4: @ 0x0800CFF4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0800D084 @ =0x0000024E
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x51
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800D088 @ =0x08032948
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800D08C @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800D090
	.align 2, 0
_0800D084: .4byte 0x0000024E
_0800D088: .4byte 0x08032948
_0800D08C: .4byte sub_800D1C4
_0800D090:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800D098
sub_800D098: @ 0x0800D098
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800CFF4
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x52
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800D0C8 @ =0x0000024D
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800D0CC
	.align 2, 0
_0800D0C8: .4byte 0x0000024D
_0800D0CC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800D0D4
sub_800D0D4: @ 0x0800D0D4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800CFF4
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x53
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800D104 @ =0x00000252
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800D108
	.align 2, 0
_0800D104: .4byte 0x00000252
_0800D108:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800D110
sub_800D110: @ 0x0800D110
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800CFF4
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x53
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800D148 @ =0x00000252
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	ldr r1, _0800D14C @ =sub_800D158
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800D150
	.align 2, 0
_0800D148: .4byte 0x00000252
_0800D14C: .4byte sub_800D158
_0800D150:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800D158
sub_800D158: @ 0x0800D158
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800D168
sub_800D168: @ 0x0800D168
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x66
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x65
	ldrb r0, [r0]
	ldrb r1, [r2]
	cmp r0, r1
	blo _0800D1BA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800D1BA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800D1C4
sub_800D1C4: @ 0x0800D1C4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800D1E4
	bl _0800DBAE
_0800D1E4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800D22E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	beq _0800D22E
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
_0800D22E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0xb4
	bls _0800D27A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D27A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	bls _0800D28A
	bl sub_0800DB74
_0800D28A:
	lsls r1, r0, #2
	ldr r2, _0800D294 @ =_0800D298
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800D294: .4byte _0800D298
_0800D298: @ jump table
	.4byte _0800D44C @ case 0
	.4byte _0800D2F4 @ case 1
	.4byte _0800D468 @ case 2
	.4byte _0800D4B4 @ case 3
	.4byte _0800D52A @ case 4
	.4byte _0800D576 @ case 5
	.4byte _0800D5BC @ case 6
	.4byte _0800D604 @ case 7
	.4byte _0800D682 @ case 8
	.4byte _0800D6DC @ case 9
	.4byte _0800D71A @ case 10
	.4byte _0800D762 @ case 11
	.4byte _0800D7E8 @ case 12
	.4byte _0800D826 @ case 13
	.4byte _0800D86E @ case 14
	.4byte _0800D8F4 @ case 15
	.4byte _0800D932 @ case 16
	.4byte _0800D99E @ case 17
	.4byte _0800D9F6 @ case 18
	.4byte _0800DA62 @ case 19
	.4byte _0800DABA @ case 20
	.4byte _0800DB1C @ case 21
	.4byte _0800DB4C @ case 22
_0800D2F4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800D3B0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x1c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800D356
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800D3AE
_0800D356:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x24]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800D396
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800D3AE
_0800D396:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D3AE:
	b _0800D448
_0800D3B0:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800D430
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800D3EC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800D42E
_0800D3EC:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800D416
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800D42E
_0800D416:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D42E:
	b _0800D448
_0800D430:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D448:
	bl _0800DB84
_0800D44C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0800DB84
_0800D468:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800D4B4:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0800D4E6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D4E6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800D510
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0800D510
	b _0800D528
_0800D510:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D528:
	b _0800DB84
_0800D52A:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800D576:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800D5BA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D5BA:
	b _0800DB84
_0800D5BC:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800D604:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800D680
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800D660
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800D65C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800D680
	.align 2, 0
_0800D65C: .4byte 0x03001140
_0800D660:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800D680:
	b _0800DB84
_0800D682:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800D6DA
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800D6C2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800D6DA
_0800D6C2:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D6DA:
	b _0800DB84
_0800D6DC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800D700
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800D718
	b _0800D700
_0800D700:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D718:
	b _0800DB84
_0800D71A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800D762:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800D7E6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800D7C0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800D7BC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800D7E6
	.align 2, 0
_0800D7BC: .4byte 0x03001140
_0800D7C0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800D7E6:
	b _0800DB84
_0800D7E8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800D80C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800D824
	b _0800D80C
_0800D80C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D824:
	b _0800DB84
_0800D826:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800D86E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800D8F2
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800D8CC
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800D8C8 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800D8F2
	.align 2, 0
_0800D8C8: .4byte 0x03001140
_0800D8CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800D8F2:
	b _0800DB84
_0800D8F4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800D918
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800D930
	b _0800D918
_0800D918:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D930:
	b _0800DB84
_0800D932:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800D99E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800D9D0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800D9D0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800D9F4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800D9F4:
	b _0800DB84
_0800D9F6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800DA62:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800DA94
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800DA94:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800DAB8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DAB8:
	b _0800DB84
_0800DABA:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800DAF0
_0800DADC:
	.byte 0x39, 0x68, 0x08, 0x1C
	.byte 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D, 0x14, 0xF0, 0xCC, 0xFB
_0800DAF0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800DB84
_0800DB18:
	.byte 0x6C, 0x29, 0x03, 0x08
_0800DB1C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800DB4A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DB4A:
	b _0800DB84
_0800DB4C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0800DB84

	thumb_func_start sub_0800DB74
sub_0800DB74: @ 0x0800DB74
	ldr r1, _0800DB80 @ =0x0803297C
	adds r0, r1, #0
	bl sub_8022288
	b _0800DB84
	.align 2, 0
_0800DB80: .4byte 0x0803297C
_0800DB84:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x12
	beq _0800DB9E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #2
	beq _0800DB9E
	b _0800DBAE
_0800DB9E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800DBAE:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800DBB8
sub_800DBB8: @ 0x0800DBB8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800DC0A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	beq _0800DC0A
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
_0800DC0A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0xb4
	bls _0800DC56
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DC56:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	bls _0800DC66
	bl sub_0800E550
_0800DC66:
	lsls r1, r0, #2
	ldr r2, _0800DC70 @ =_0800DC74
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800DC70: .4byte _0800DC74
_0800DC74: @ jump table
	.4byte _0800DE28 @ case 0
	.4byte _0800DCD0 @ case 1
	.4byte _0800DE44 @ case 2
	.4byte _0800DE90 @ case 3
	.4byte _0800DF06 @ case 4
	.4byte _0800DF52 @ case 5
	.4byte _0800DF98 @ case 6
	.4byte _0800DFE0 @ case 7
	.4byte _0800E05E @ case 8
	.4byte _0800E0B8 @ case 9
	.4byte _0800E0F6 @ case 10
	.4byte _0800E13E @ case 11
	.4byte _0800E1C4 @ case 12
	.4byte _0800E202 @ case 13
	.4byte _0800E24A @ case 14
	.4byte _0800E2D0 @ case 15
	.4byte _0800E30E @ case 16
	.4byte _0800E37A @ case 17
	.4byte _0800E3D2 @ case 18
	.4byte _0800E43E @ case 19
	.4byte _0800E496 @ case 20
	.4byte _0800E4F8 @ case 21
	.4byte _0800E528 @ case 22
_0800DCD0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800DD8C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x1c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800DD32
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800DD8A
_0800DD32:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x24]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800DD72
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800DD8A
_0800DD72:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DD8A:
	b _0800DE24
_0800DD8C:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800DE0C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800DDC8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800DE0A
_0800DDC8:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800DDF2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800DE0A
_0800DDF2:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DE0A:
	b _0800DE24
_0800DE0C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DE24:
	bl _0800E560
_0800DE28:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0800E560
_0800DE44:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800DE90:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0800DEC2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DEC2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800DEEC
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0800DEEC
	b _0800DF04
_0800DEEC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DF04:
	b _0800E560
_0800DF06:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800DF52:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800DF96
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800DF96:
	b _0800E560
_0800DF98:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800DFE0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800E05C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800E03C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800E038 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E05C
	.align 2, 0
_0800E038: .4byte 0x03001140
_0800E03C:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800E05C:
	b _0800E560
_0800E05E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800E0B6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800E09E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800E0B6
_0800E09E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E0B6:
	b _0800E560
_0800E0B8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800E0DC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800E0F4
	b _0800E0DC
_0800E0DC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E0F4:
	b _0800E560
_0800E0F6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800E13E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800E1C2
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800E19C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800E198 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E1C2
	.align 2, 0
_0800E198: .4byte 0x03001140
_0800E19C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800E1C2:
	b _0800E560
_0800E1C4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800E1E8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800E200
	b _0800E1E8
_0800E1E8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E200:
	b _0800E560
_0800E202:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800E24A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800E2CE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800E2A8
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800E2A4 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E2CE
	.align 2, 0
_0800E2A4: .4byte 0x03001140
_0800E2A8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800E2CE:
	b _0800E560
_0800E2D0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800E2F4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800E30C
	b _0800E2F4
_0800E2F4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E30C:
	b _0800E560
_0800E30E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800E37A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800E3AC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800E3AC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800E3D0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E3D0:
	b _0800E560
_0800E3D2:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800E43E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800E470
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800E470:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800E494
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E494:
	b _0800E560
_0800E496:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800E4CC
_0800E4B8:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22
	.byte 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D, 0x13, 0xF0, 0xDE, 0xFE
_0800E4CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800E560
_0800E4F4:
	.byte 0x6C, 0x29, 0x03, 0x08
_0800E4F8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800E526
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E526:
	b _0800E560
_0800E528:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0800E560

	thumb_func_start sub_0800E550
sub_0800E550: @ 0x0800E550
	ldr r1, _0800E55C @ =0x0803297C
	adds r0, r1, #0
	bl sub_8022288
	b _0800E560
	.align 2, 0
_0800E55C: .4byte 0x0803297C
_0800E560:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x12
	beq _0800E57A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #2
	beq _0800E57A
	b _0800E58A
_0800E57A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800E58A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E594
sub_800E594: @ 0x0800E594
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800E5E6
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	beq _0800E5E6
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
_0800E5E6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0xb4
	bls _0800E632
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E632:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	bls _0800E642
	bl sub_0800EF78
_0800E642:
	lsls r1, r0, #2
	ldr r2, _0800E64C @ =_0800E650
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800E64C: .4byte _0800E650
_0800E650: @ jump table
	.4byte _0800E804 @ case 0
	.4byte _0800E6AC @ case 1
	.4byte _0800E820 @ case 2
	.4byte _0800E86E @ case 3
	.4byte _0800E8E4 @ case 4
	.4byte _0800E930 @ case 5
	.4byte _0800E976 @ case 6
	.4byte _0800E9BE @ case 7
	.4byte _0800EA3E @ case 8
	.4byte _0800EA98 @ case 9
	.4byte _0800EAD6 @ case 10
	.4byte _0800EB1E @ case 11
	.4byte _0800EBA4 @ case 12
	.4byte _0800EBE2 @ case 13
	.4byte _0800EC2A @ case 14
	.4byte _0800ECB0 @ case 15
	.4byte _0800ECEE @ case 16
	.4byte _0800ED5A @ case 17
	.4byte _0800EDB2 @ case 18
	.4byte _0800EE1E @ case 19
	.4byte _0800EE76 @ case 20
	.4byte _0800EED8 @ case 21
	.4byte _0800EF08 @ case 22
_0800E6AC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800E768
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x1c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800E70E
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800E766
_0800E70E:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x24]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800E74E
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800E766
_0800E74E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E766:
	b _0800E800
_0800E768:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800E7E8
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800E7A4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800E7E6
_0800E7A4:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800E7CE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800E7E6
_0800E7CE:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E7E6:
	b _0800E800
_0800E7E8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E800:
	bl _0800EF88
_0800E804:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0800EF88
_0800E820:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0800EF88
_0800E86E:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0800E8A0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E8A0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800E8CA
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0800E8CA
	b _0800E8E2
_0800E8CA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E8E2:
	b _0800EF88
_0800E8E4:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800E930:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800E974
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800E974:
	b _0800EF88
_0800E976:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800E9BE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800EA3C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800EA1C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800EA18 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EA3C
	.align 2, 0
_0800EA18: .4byte 0x03001140
_0800EA1C:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800EA3C:
	b _0800EF88
_0800EA3E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800EA96
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0800EA7E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800EA96
_0800EA7E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800EA96:
	b _0800EF88
_0800EA98:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800EABC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800EAD4
	b _0800EABC
_0800EABC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800EAD4:
	b _0800EF88
_0800EAD6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800EB1E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800EBA2
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800EB7C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800EB78 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EBA2
	.align 2, 0
_0800EB78: .4byte 0x03001140
_0800EB7C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800EBA2:
	b _0800EF88
_0800EBA4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800EBC8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800EBE0
	b _0800EBC8
_0800EBC8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800EBE0:
	b _0800EF88
_0800EBE2:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800EC2A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800ECAE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800EC88
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800EC84 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800ECAE
	.align 2, 0
_0800EC84: .4byte 0x03001140
_0800EC88:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800ECAE:
	b _0800EF88
_0800ECB0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800ECD4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800ECEC
	b _0800ECD4
_0800ECD4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800ECEC:
	b _0800EF88
_0800ECEE:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800ED5A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800ED8C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800ED8C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800EDB0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800EDB0:
	b _0800EF88
_0800EDB2:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800EE1E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800EE50
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800EE50:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800EE74
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800EE74:
	b _0800EF88
_0800EE76:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800EEAC
_0800EE98:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22
	.byte 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D, 0x13, 0xF0, 0xEE, 0xF9
_0800EEAC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800EF88
_0800EED4:
	.byte 0x6C, 0x29, 0x03, 0x08
_0800EED8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800EF06
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800EF06:
	b _0800EF88
_0800EF08:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	bl sub_800FB84
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _0800EF70 @ =0x0000025B
	bl sub_8020D1C
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	ldr r1, _0800EF74 @ =sub_800D168
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x8c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009DC4
	b _0800EF88
	.align 2, 0
_0800EF70: .4byte 0x0000025B
_0800EF74: .4byte sub_800D168

	thumb_func_start sub_0800EF78
sub_0800EF78: @ 0x0800EF78
	ldr r1, _0800EF84 @ =0x0803297C
	adds r0, r1, #0
	bl sub_8022288
	b _0800EF88
	.align 2, 0
_0800EF84: .4byte 0x0803297C
_0800EF88:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x12
	beq _0800EFA2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #2
	beq _0800EFA2
	b _0800EFB2
_0800EFA2:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800EFB2:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800EFBC
sub_800EFBC: @ 0x0800EFBC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x60
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800F058 @ =0x080329BC
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800F05C @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F060
	.align 2, 0
_0800F058: .4byte 0x080329BC
_0800F05C: .4byte sub_800D1C4
_0800F060:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F068
sub_800F068: @ 0x0800F068
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800EFBC
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x61
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800F0B8 @ =0x000001CF
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F0BC
	.align 2, 0
_0800F0B8: .4byte 0x000001CF
_0800F0BC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F0C4
sub_800F0C4: @ 0x0800F0C4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800EFBC
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x62
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xea
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F116
_0800F116:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F120
sub_800F120: @ 0x0800F120
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800EFBC
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x62
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xea
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, _0800F178 @ =sub_800D158
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F17C
	.align 2, 0
_0800F178: .4byte sub_800D158
_0800F17C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F184
sub_800F184: @ 0x0800F184
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xd9
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x6c
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800F214 @ =0x080329E0
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800F218 @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F21C
	.align 2, 0
_0800F214: .4byte 0x080329E0
_0800F218: .4byte sub_800D1C4
_0800F21C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F224
sub_800F224: @ 0x0800F224
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800F184
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x6d
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800F254 @ =0x000001B1
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F258
	.align 2, 0
_0800F254: .4byte 0x000001B1
_0800F258:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F260
sub_800F260: @ 0x0800F260
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800F184
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x6e
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xdb
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F292
_0800F292:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F29C
sub_800F29C: @ 0x0800F29C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800F184
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x6e
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xdb
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	ldr r1, _0800F2D4 @ =sub_800D158
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F2D8
	.align 2, 0
_0800F2D4: .4byte sub_800D158
_0800F2D8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F2E0
sub_800F2E0: @ 0x0800F2E0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0800F370 @ =0x00000199
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x7c
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800F374 @ =0x08032A04
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800F378 @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F37C
	.align 2, 0
_0800F370: .4byte 0x00000199
_0800F374: .4byte 0x08032A04
_0800F378: .4byte sub_800D1C4
_0800F37C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F384
sub_800F384: @ 0x0800F384
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_800F2E0
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x7d
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xcc
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800F3B6
_0800F3B6:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F3C0
sub_800F3C0: @ 0x0800F3C0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xc
	movs r2, #0xe
	movs r3, #8
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xe
	bls _0800F3E2
	b _0800FA14
_0800F3E2:
	lsls r1, r0, #2
	ldr r2, _0800F3EC @ =_0800F3F0
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0800F3EC: .4byte _0800F3F0
_0800F3F0: @ jump table
	.4byte _0800F7B6 @ case 0
	.4byte _0800F72C @ case 1
	.4byte _0800F42C @ case 2
	.4byte _0800F49C @ case 3
	.4byte _0800F50C @ case 4
	.4byte _0800F57C @ case 5
	.4byte _0800F5EC @ case 6
	.4byte _0800F6B4 @ case 7
	.4byte _0800F7D0 @ case 8
	.4byte _0800F83C @ case 9
	.4byte _0800F894 @ case 10
	.4byte _0800F900 @ case 11
	.4byte _0800F958 @ case 12
	.4byte _0800F9BC @ case 13
	.4byte _0800F9EC @ case 14
_0800F42C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #0
	bl sub_8020E18
	ldr r0, [r7]
	ldr r2, _0800F498 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r2, _0800F498 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	movs r3, #0xc8
	lsls r3, r3, #9
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x28
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
	.align 2, 0
_0800F498: .4byte 0x03000EE8
_0800F49C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
	ldr r0, [r7]
	ldr r2, _0800F504 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r2, _0800F504 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	ldr r3, _0800F508 @ =0xFFFE7000
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x28
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #3
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
	.align 2, 0
_0800F504: .4byte 0x03000EE8
_0800F508: .4byte 0xFFFE7000
_0800F50C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #6
	bl sub_8020E18
	ldr r0, [r7]
	ldr r2, _0800F578 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	movs r3, #0x8c
	lsls r3, r3, #0xa
	adds r1, r2, r3
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r2, _0800F578 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	str r2, [r0, #0x34]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x28
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
	.align 2, 0
_0800F578: .4byte 0x03000EE8
_0800F57C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #2
	bl sub_8020E18
	ldr r0, [r7]
	ldr r2, _0800F5E4 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	ldr r3, _0800F5E8 @ =0xFFFDD000
	adds r1, r2, r3
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r2, _0800F5E4 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	str r2, [r0, #0x34]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x28
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
	.align 2, 0
_0800F5E4: .4byte 0x03000EE8
_0800F5E8: .4byte 0xFFFDD000
_0800F5EC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800F620
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _0800F64C
_0800F620:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800F64C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800F64C:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0800F696
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0800F6B0 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800F696:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_8009AC4
	b _0800FA24
	.align 2, 0
_0800F6B0: .4byte 0x03001140
_0800F6B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800F6E8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _0800F714
_0800F6E8:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0800F714
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800F714:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_8009AC4
	b _0800FA24
_0800F72C:
	movs r0, #0
	movs r1, #3
	bl sub_8021AE4
	cmp r0, #1
	beq _0800F766
	cmp r0, #1
	bgt _0800F742
	cmp r0, #0
	beq _0800F74C
	b _0800F7B4
_0800F742:
	cmp r0, #2
	beq _0800F780
	cmp r0, #3
	beq _0800F79A
	b _0800F7B4
_0800F74C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800F7B4
_0800F766:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800F7B4
_0800F780:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800F7B4
_0800F79A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800F7B4
_0800F7B4:
	b _0800FA24
_0800F7B6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0800FA24
_0800F7D0:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
_0800F83C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800F86E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800F86E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800F892
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800F892:
	b _0800FA24
_0800F894:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
_0800F900:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800F932
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0800F932:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800F956
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800F956:
	b _0800FA24
_0800F958:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800F98E
_0800F97A:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31
	.byte 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0C, 0x48, 0x39, 0x1D, 0x12, 0xF0, 0x7D, 0xFC
_0800F98E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0800FA24
	.align 2, 0
_0800F9B8:
	.byte 0x24, 0x2A, 0x03, 0x08
_0800F9BC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800F9EA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0800F9EA:
	b _0800FA24
_0800F9EC:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0800FA24
_0800FA14:
	ldr r1, _0800FA20 @ =0x08032A34
	adds r0, r1, #0
	bl sub_8022288
	b _0800FA24
	.align 2, 0
_0800FA20: .4byte 0x08032A34
_0800FA24:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800FA2C
sub_800FA2C: @ 0x0800FA2C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0800FAC8 @ =0x08032A54
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x37
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800FAC8 @ =0x08032A54
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800FACC @ =sub_800F3C0
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800FAD0
	.align 2, 0
_0800FAC8: .4byte 0x08032A54
_0800FACC: .4byte sub_800F3C0
_0800FAD0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800FAD8
sub_800FAD8: @ 0x0800FAD8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0800FB74 @ =0x08032A54
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x38
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800FB74 @ =0x08032A54
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800FB78 @ =sub_800F3C0
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800FB7C
	.align 2, 0
_0800FB74: .4byte 0x08032A54
_0800FB78: .4byte sub_800F3C0
_0800FB7C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800FB84
sub_800FB84: @ 0x0800FB84
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0800FC20 @ =0x08032A7C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x4e
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800FC20 @ =0x08032A7C
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800FC24 @ =sub_800E594
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800FC28
	.align 2, 0
_0800FC20: .4byte 0x08032A7C
_0800FC24: .4byte sub_800E594
_0800FC28:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800FC30
sub_800FC30: @ 0x0800FC30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800FC5E
	movs r1, #0x9a
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	ldr r1, _0800FC68 @ =sub_800D158
	str r1, [r0, #0x4c]
_0800FC5E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FC68: .4byte sub_800D158

	thumb_func_start sub_800FC6C
sub_800FC6C: @ 0x0800FC6C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800FC9A
	movs r1, #0xa2
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	ldr r1, _0800FCA4 @ =sub_800D158
	str r1, [r0, #0x4c]
_0800FC9A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FCA4: .4byte sub_800D158

	thumb_func_start sub_800FCA8
sub_800FCA8: @ 0x0800FCA8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0800FD44 @ =0x08032AA4
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x66
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800FD44 @ =0x08032AA4
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800FD48 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800FD4C
	.align 2, 0
_0800FD44: .4byte 0x08032AA4
_0800FD48: .4byte sub_800DBB8
_0800FD4C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800FD54
sub_800FD54: @ 0x0800FD54
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0800FDF0 @ =0x08032AA4
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x67
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0800FDF0 @ =0x08032AA4
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0800FDF4 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0800FDF8
	.align 2, 0
_0800FDF0: .4byte 0x08032AA4
_0800FDF4: .4byte sub_800DBB8
_0800FDF8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800FE00
sub_800FE00: @ 0x0800FE00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800FE56
	movs r1, #0xf5
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800FECE
_0800FE56:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #4
	bhi _0800FEBE
	ldr r0, [r7]
	movs r1, #1
	bl sub_8020E18
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800FEBC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800FEBC:
	b _0800FECE
_0800FEBE:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800FECE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800FED8
sub_800FED8: @ 0x0800FED8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800FF2E
	movs r1, #0xf5
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0800FFA6
_0800FF2E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #4
	bhi _0800FF96
	ldr r0, [r7]
	movs r1, #7
	bl sub_8020E18
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800FF94
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0800FF94:
	b _0800FFA6
_0800FF96:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0800FFA6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800FFB0
sub_800FFB0: @ 0x0800FFB0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009000
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08010046
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	beq _08010046
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _08010046
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #2
	beq _08010046
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x56
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _0801002E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08010046
_0801002E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08010046:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #4
	bls _08010054
	b _08010154
_08010054:
	lsls r1, r0, #2
	ldr r2, _08010060 @ =_08010064
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08010060: .4byte _08010064
_08010064: @ jump table
	.4byte _08010078 @ case 0
	.4byte _080100B4 @ case 1
	.4byte _080100F4 @ case 2
	.4byte _0801014C @ case 3
	.4byte _08010154 @ case 4
_08010078:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _080100B0 @ =0x000001E9
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801017E
	.align 2, 0
_080100B0: .4byte 0x000001E9
_080100B4:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801017E
_080100F4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08010126
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08010126:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801014A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801014A:
	b _0801017E
_0801014C:
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801017E
_08010154:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_80097BC
	movs r1, #0xf4
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	b _0801017E
_0801017E:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8010188
sub_8010188: @ 0x08010188
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08010234 @ =0x08032ACC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x5b
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08010234 @ =0x08032ACC
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010238 @ =sub_800D158
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801023C
	.align 2, 0
_08010234: .4byte 0x08032ACC
_08010238: .4byte sub_800D158
_0801023C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010244
sub_8010244: @ 0x08010244
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080102F0 @ =0x08032ACC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x5b
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080102F0 @ =0x08032ACC
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080102F4 @ =sub_800D158
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080102F8
	.align 2, 0
_080102F0: .4byte 0x08032ACC
_080102F4: .4byte sub_800D158
_080102F8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010300
sub_8010300: @ 0x08010300
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0801039C @ =0x08032ACC
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x5b
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801039C @ =0x08032ACC
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080103A0 @ =sub_800FFB0
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080103A4
	.align 2, 0
_0801039C: .4byte 0x08032ACC
_080103A0: .4byte sub_800FFB0
_080103A4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80103AC
sub_80103AC: @ 0x080103AC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08010448 @ =0x08032B00
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x48
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08010448 @ =0x08032B00
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0801044C @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010450
	.align 2, 0
_08010448: .4byte 0x08032B00
_0801044C: .4byte sub_800DBB8
_08010450:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010458
sub_8010458: @ 0x08010458
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080104F4 @ =0x08032B20
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x4f
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080104F4 @ =0x08032B20
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080104F8 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080104FC
	.align 2, 0
_080104F4: .4byte 0x08032B20
_080104F8: .4byte sub_800DBB8
_080104FC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010504
sub_8010504: @ 0x08010504
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080105A0 @ =0x08032B20
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x50
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080105A0 @ =0x08032B20
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080105A4 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080105A8
	.align 2, 0
_080105A0: .4byte 0x08032B20
_080105A4: .4byte sub_800DBB8
_080105A8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80105B0
sub_80105B0: @ 0x080105B0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0801064C @ =0x08032B48
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x65
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801064C @ =0x08032B48
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010650 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010654
	.align 2, 0
_0801064C: .4byte 0x08032B48
_08010650: .4byte sub_800DBB8
_08010654:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801065C
sub_801065C: @ 0x0801065C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080106F8 @ =0x08032B48
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x39
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080106F8 @ =0x08032B48
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080106FC @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010700
	.align 2, 0
_080106F8: .4byte 0x08032B48
_080106FC: .4byte sub_800DBB8
_08010700:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010708
sub_8010708: @ 0x08010708
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080107A4 @ =0x08032B70
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x54
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080107A4 @ =0x08032B70
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080107A8 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080107AC
	.align 2, 0
_080107A4: .4byte 0x08032B70
_080107A8: .4byte sub_800DBB8
_080107AC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80107B4
sub_80107B4: @ 0x080107B4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08010850 @ =0x08032B70
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x55
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08010850 @ =0x08032B70
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010854 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010858
	.align 2, 0
_08010850: .4byte 0x08032B70
_08010854: .4byte sub_800DBB8
_08010858:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010860
sub_8010860: @ 0x08010860
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080108FC @ =0x08032B98
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x46
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080108FC @ =0x08032B98
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010900 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010904
	.align 2, 0
_080108FC: .4byte 0x08032B98
_08010900: .4byte sub_800DBB8
_08010904:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801090C
sub_801090C: @ 0x0801090C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080109A8 @ =0x08032B98
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x47
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080109A8 @ =0x08032B98
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _080109AC @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080109B0
	.align 2, 0
_080109A8: .4byte 0x08032B98
_080109AC: .4byte sub_800DBB8
_080109B0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80109B8
sub_80109B8: @ 0x080109B8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08010A64 @ =0x08032BC0
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x76
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08010A64 @ =0x08032BC0
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010A68 @ =sub_8011E48
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010A6C
	.align 2, 0
_08010A64: .4byte 0x08032BC0
_08010A68: .4byte sub_8011E48
_08010A6C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010A74
sub_8010A74: @ 0x08010A74
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08010B20 @ =0x08032BC0
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x77
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08010B20 @ =0x08032BC0
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010B24 @ =sub_8011E48
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010B28
	.align 2, 0
_08010B20: .4byte 0x08032BC0
_08010B24: .4byte sub_8011E48
_08010B28:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010B30
sub_8010B30: @ 0x08010B30
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08010BCC @ =0x08032BE8
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x7b
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08010BCC @ =0x08032BE8
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08010BD0 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08010BD4
	.align 2, 0
_08010BCC: .4byte 0x08032BE8
_08010BD0: .4byte sub_800DBB8
_08010BD4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8010BDC
sub_8010BDC: @ 0x08010BDC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08010C44 @ =0x030011AC
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r7]
	movs r1, #0xe
	movs r2, #0x10
	movs r3, #0xa
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x10
	bne _08010C0E
	ldr r0, _08010C44 @ =0x030011AC
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08010C48 @ =0x03001174
	movs r1, #0xa
	str r1, [r0]
_08010C0E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x10
	bne _08010C2A
	ldr r0, [r7]
	movs r1, #0x82
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	ldr r0, [r7]
	movs r1, #0xae
	lsls r1, r1, #9
	str r1, [r0, #0x34]
_08010C2A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x10
	bls _08010C38
	b _08011218
_08010C38:
	lsls r1, r0, #2
	ldr r2, _08010C4C @ =_08010C50
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08010C44: .4byte 0x030011AC
_08010C48: .4byte 0x03001174
_08010C4C: .4byte _08010C50
_08010C50: @ jump table
	.4byte _08010EC8 @ case 0
	.4byte _08010E36 @ case 1
	.4byte _08010C94 @ case 2
	.4byte _08010CF8 @ case 3
	.4byte _08010D5C @ case 4
	.4byte _08010DC0 @ case 5
	.4byte _08010E06 @ case 6
	.4byte _08011124 @ case 7
	.4byte _0801119C @ case 8
	.4byte _080111E8 @ case 9
	.4byte _08010EE2 @ case 10
	.4byte _08010F4E @ case 11
	.4byte _08010FA6 @ case 12
	.4byte _08011012 @ case 13
	.4byte _0801106A @ case 14
	.4byte _080110CC @ case 15
	.4byte _080110FC @ case 16
_08010C94:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x8a
	lsls r2, r2, #2
	bl sub_8014E8C
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _08010CF4 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7]
	movs r1, #0xb4
	lsls r1, r1, #8
	str r1, [r0, #0x34]
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #3
	bl sub_8020E18
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011228
	.align 2, 0
_08010CF4: .4byte sub_80142EC
_08010CF8:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x8a
	lsls r2, r2, #2
	bl sub_8014E8C
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _08010D58 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	ldr r0, [r7]
	movs r1, #0xf8
	lsls r1, r1, #7
	str r1, [r0, #0x34]
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011228
	.align 2, 0
_08010D58: .4byte sub_80142EC
_08010D5C:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x8a
	lsls r2, r2, #2
	bl sub_8014E8C
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _08010DBC @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	movs r1, #0xe2
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	ldr r0, [r7]
	movs r1, #0xdc
	lsls r1, r1, #8
	str r1, [r0, #0x34]
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #5
	bl sub_8020E18
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011228
	.align 2, 0
_08010DBC: .4byte sub_80142EC
_08010DC0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #5
	bne _08010E04
	ldr r0, [r7]
	ldr r2, [r0, #0x30]
	asrs r1, r2, #0xa
	ldr r0, [r7]
	ldr r3, [r0, #0x34]
	asrs r2, r3, #0xa
	ldr r0, [r7]
	bl sub_8011480
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08010E04:
	b _08011228
_08010E06:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08010E34
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08010E34:
	b _08011228
_08010E36:
	ldr r0, _08010E58 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #0
	beq _08010E5C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08010EC6
	.align 2, 0
_08010E58: .4byte 0x03001148
_08010E5C:
	movs r0, #0
	movs r1, #2
	bl sub_8021AE4
	cmp r0, #1
	beq _08010E92
	cmp r0, #1
	bgt _08010E72
	cmp r0, #0
	beq _08010E78
	b _08010EC6
_08010E72:
	cmp r0, #2
	beq _08010EAC
	b _08010EC6
_08010E78:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08010EC6
_08010E92:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08010EC6
_08010EAC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08010EC6
_08010EC6:
	b _08011228
_08010EC8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011228
_08010EE2:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011228
_08010F4E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08010F80
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08010F80:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08010FA4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08010FA4:
	b _08011228
_08010FA6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011228
_08011012:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08011044
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08011044:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08011068
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011068:
	b _08011228
_0801106A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _080110A0
_0801108C:
	.byte 0x39, 0x68, 0x08, 0x1C
	.byte 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D, 0x11, 0xF0, 0xF4, 0xF8
_080110A0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011228
_080110C8:
	.byte 0x08, 0x2C, 0x03, 0x08
_080110CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080110FA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080110FA:
	b _08011228
_080110FC:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _08011228
_08011124:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _08011168
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	movs r0, #0xae
	lsls r0, r0, #9
	cmp r1, r0
	beq _08011168
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x8a
	lsls r2, r2, #2
	bl sub_8014E8C
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _08011198 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	movs r1, #0x82
	lsls r1, r1, #0xa
	str r1, [r0, #0x30]
	ldr r0, [r7]
	movs r1, #0xae
	lsls r1, r1, #9
	str r1, [r0, #0x34]
_08011168:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	bl sub_80097BC
	b _08011228
	.align 2, 0
_08011198: .4byte sub_80142EC
_0801119C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bne _080111E0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _080111E4 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_080111E0:
	b _08011228
	.align 2, 0
_080111E4: .4byte 0x03001140
_080111E8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08011216
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011216:
	b _08011228
_08011218:
	ldr r1, _08011224 @ =0x08032C18
	adds r0, r1, #0
	bl sub_8022288
	b _08011228
	.align 2, 0
_08011224: .4byte 0x08032C18
_08011228:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8011230
sub_8011230: @ 0x08011230
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0x1e
	bls _08011292
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080112CC @ =0x03001174
	ldr r1, _080112CC @ =0x03001174
	ldr r2, [r1]
	subs r1, r2, #2
	str r1, [r0]
	ldr r0, _080112CC @ =0x03001174
	ldr r1, [r0]
	cmp r1, #0
	bge _08011292
	ldr r0, _080112CC @ =0x03001174
	movs r1, #0
	str r1, [r0]
_08011292:
	ldr r0, _080112CC @ =0x03001174
	ldr r1, [r0]
	cmp r1, #4
	ble _080112AA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080112AA:
	ldr r0, _080112D0 @ =0x030011AC
	ldrb r1, [r0]
	cmp r1, #0
	bne _080112C2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080112C2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080112CC: .4byte 0x03001174
_080112D0: .4byte 0x030011AC

	thumb_func_start sub_80112D4
sub_80112D4: @ 0x080112D4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _08011378 @ =0x000002BA
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _0801137C @ =sub_8011230
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _08011380
	.align 2, 0
_08011378: .4byte 0x000002BA
_0801137C: .4byte sub_8011230
_08011380:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8011388
sub_8011388: @ 0x08011388
	push {r4, r7, lr}
	sub sp, #0x24
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080113B4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080113B4:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x30]
	ldr r2, [r2, #0x64]
	adds r1, r1, r2
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x34]
	ldr r2, [r2, #0x68]
	adds r1, r1, r2
	str r1, [r0, #0x34]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r1, _08011460 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, _08011460 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x10]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	subs r0, #9
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r1, #8
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r2, #9
	ldr r4, [r7, #8]
	adds r3, r4, #4
	ldr r4, [r7, #0xc]
	str r4, [sp]
	ldr r4, [r7, #0x10]
	str r4, [sp, #4]
	ldr r4, [r7, #0xc]
	str r4, [sp, #8]
	ldr r4, [r7, #0x10]
	str r4, [sp, #0xc]
	bl sub_8009D80
	cmp r0, #0
	beq _08011472
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x70
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08011464 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #0
	bne _0801146C
	ldr r0, _08011464 @ =0x03001148
	movs r1, #1
	str r1, [r0]
	ldr r0, _08011468 @ =0x03001174
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	bl sub_80112D4
	b _08011472
	.align 2, 0
_08011460: .4byte 0x03000EE8
_08011464: .4byte 0x03001148
_08011468: .4byte 0x03001174
_0801146C:
	ldr r0, _0801147C @ =0x03001174
	movs r1, #0
	str r1, [r0]
_08011472:
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801147C: .4byte 0x03001174

	thumb_func_start sub_8011480
sub_8011480: @ 0x08011480
	push {r4, r5, r7, lr}
	sub sp, #0x24
	add r7, sp, #0x14
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0xc
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	ldr r3, _080114DC @ =0x000008CC
	movs r4, #0xb4
	str r4, [sp]
	ldr r4, _080114E0 @ =0x000002B9
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, _080114E4 @ =sub_8011388
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080114E8
	.align 2, 0
_080114DC: .4byte 0x000008CC
_080114E0: .4byte 0x000002B9
_080114E4: .4byte sub_8011388
_080114E8:
	add sp, #0x24
	pop {r4, r5, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80114F0
sub_80114F0: @ 0x080114F0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0801158C @ =0x08032C44
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x40
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801158C @ =0x08032C44
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08011590 @ =sub_8010BDC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08011594
	.align 2, 0
_0801158C: .4byte 0x08032C44
_08011590: .4byte sub_8010BDC
_08011594:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801159C
sub_801159C: @ 0x0801159C
	push {r4, r5, r7, lr}
	sub sp, #0x28
	add r7, sp, #0x14
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xb
	bls _080115B2
	b _0801173A
_080115B2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _080115C0
	b _08011714
_080115C0:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r1, _08011640 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, _08011640 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x10]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	subs r0, #0x18
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r1, #0x1c
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r2, #0x18
	ldr r4, [r7, #8]
	adds r3, r4, #0
	adds r3, #0x1c
	ldr r4, [r7, #0xc]
	str r4, [sp]
	ldr r4, [r7, #0x10]
	str r4, [sp, #4]
	ldr r4, [r7, #0xc]
	str r4, [sp, #8]
	ldr r4, [r7, #0x10]
	str r4, [sp, #0xc]
	bl sub_8009D80
	cmp r0, #0
	bne _08011616
	b _0801170E
_08011616:
	ldr r0, _08011644 @ =0x00000179
	movs r1, #0xb9
	lsls r1, r1, #1
	bl sub_8006620
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	ble _08011650
	ldr r1, _08011640 @ =0x03000EE8
	ldr r0, [r1]
	ldr r2, _08011640 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	ldr r3, _08011648 @ =0xFFFF2000
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, _0801164C @ =0x03001124
	movs r1, #0x3c
	str r1, [r0]
	b _08011668
	.align 2, 0
_08011640: .4byte 0x03000EE8
_08011644: .4byte 0x00000179
_08011648: .4byte 0xFFFF2000
_0801164C: .4byte 0x03001124
_08011650:
	ldr r1, _080116E8 @ =0x03000EE8
	ldr r0, [r1]
	ldr r2, _080116E8 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	movs r3, #0xe0
	lsls r3, r3, #8
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, _080116EC @ =0x030010DC
	movs r1, #0x3c
	str r1, [r0]
_08011668:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _08011692
	bl sub_8001A34
_08011692:
	bl sub_80009C0
	bl sub_8000C3C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #1
	ble _080116F0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x56
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801170E
	.align 2, 0
_080116E8: .4byte 0x03000EE8
_080116EC: .4byte 0x030010DC
_080116F0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08011710 @ =0x0300117C
	movs r1, #1
	str r1, [r0]
_0801170E:
	b _0801173A
	.align 2, 0
_08011710: .4byte 0x0300117C
_08011714:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801173A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xc
	bls _08011748
	b _08011CA0
_08011748:
	lsls r1, r0, #2
	ldr r2, _08011754 @ =_08011758
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08011754: .4byte _08011758
_08011758: @ jump table
	.4byte _0801178C @ case 0
	.4byte _08011B54 @ case 1
	.4byte _08011B98 @ case 2
	.4byte _08011AE0 @ case 3
	.4byte _08011B24 @ case 4
	.4byte _080117A6 @ case 5
	.4byte _080117EC @ case 6
	.4byte _08011954 @ case 7
	.4byte _08011984 @ case 8
	.4byte _080119C6 @ case 9
	.4byte _08011AB0 @ case 10
	.4byte _08011BC8 @ case 11
	.4byte _08011C7C @ case 12
_0801178C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011CA0
_080117A6:
	ldr r1, _080117E8 @ =0x000002D1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011CA0
	.align 2, 0
_080117E8: .4byte 0x000002D1
_080117EC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	beq _080117FA
	b _0801194C
_080117FA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #4
	bne _08011898
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r2, #0x78
	str r2, [sp]
	ldr r2, _08011894 @ =0x000002CD
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xfa
	lsls r2, r2, #1
	str r2, [sp, #0xc]
	ldr r2, [r7]
	ldrb r4, [r2, #0x17]
	str r4, [sp, #0x10]
	movs r2, #0x60
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r2, #0x78
	str r2, [sp]
	ldr r2, _08011894 @ =0x000002CD
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xfa
	lsls r2, r2, #1
	str r2, [sp, #0xc]
	ldr r2, [r7]
	ldrb r4, [r2, #0x17]
	str r4, [sp, #0x10]
	movs r2, #0x40
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r2, #0x78
	str r2, [sp]
	ldr r2, _08011894 @ =0x000002CD
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xfa
	lsls r2, r2, #1
	str r2, [sp, #0xc]
	ldr r2, [r7]
	ldrb r4, [r2, #0x17]
	str r4, [sp, #0x10]
	movs r2, #0x20
	bl sub_8013C18
	b _08011926
	.align 2, 0
_08011894: .4byte 0x000002CD
_08011898:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r2, #0x78
	str r2, [sp]
	ldr r2, _08011950 @ =0x000002CD
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xfa
	lsls r2, r2, #1
	str r2, [sp, #0xc]
	ldr r2, [r7]
	ldrb r4, [r2, #0x17]
	str r4, [sp, #0x10]
	movs r2, #0xa0
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x40
	rsbs r2, r2, #0
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08011950 @ =0x000002CD
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0x20
	rsbs r2, r2, #0
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08011950 @ =0x000002CD
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
_08011926:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801194C:
	b _08011CA0
	.align 2, 0
_08011950: .4byte 0x000002CD
_08011954:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08011982
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011982:
	b _08011CA0
_08011984:
	movs r1, #0xb4
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011CA0
_080119C6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _08011AA8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r0, [r1]
	cmp r0, #4
	bne _08011A34
	movs r0, #0x14
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08011A30 @ =0x000002D2
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	b _08011A82
	.align 2, 0
_08011A30: .4byte 0x000002D2
_08011A34:
	movs r0, #0x14
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08011AAC @ =0x000002D2
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
_08011A82:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08011AA8:
	b _08011CA0
	.align 2, 0
_08011AAC: .4byte 0x000002D2
_08011AB0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08011ADE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011ADE:
	b _08011CA0
_08011AE0:
	ldr r1, _08011B20 @ =0x000002CE
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011CA0
	.align 2, 0
_08011B20: .4byte 0x000002CE
_08011B24:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08011B52
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011B52:
	b _08011CA0
_08011B54:
	ldr r1, _08011B94 @ =0x000002CF
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08011CA0
	.align 2, 0
_08011B94: .4byte 0x000002CF
_08011B98:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08011BC6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011BC6:
	b _08011CA0
_08011BC8:
	movs r0, #3
	bl sub_8021B2C
	cmp r0, #1
	beq _08011BFC
	cmp r0, #1
	bgt _08011BDC
	cmp r0, #0
	beq _08011BE2
	b _08011C7A
_08011BDC:
	cmp r0, #2
	beq _08011C3A
	b _08011C7A
_08011BE2:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011C7A
_08011BFC:
	ldr r1, _08011C14 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	cmp r0, r1
	ble _08011C18
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
	b _08011C20
	.align 2, 0
_08011C14: .4byte 0x03000EE8
_08011C18:
	ldr r0, [r7]
	movs r1, #0
	bl sub_8020E18
_08011C20:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011C7A
_08011C3A:
	ldr r1, _08011C54 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r7]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	cmp r0, r1
	ble _08011C58
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
	b _08011C60
	.align 2, 0
_08011C54: .4byte 0x03000EE8
_08011C58:
	ldr r0, [r7]
	movs r1, #0
	bl sub_8020E18
_08011C60:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08011C7A
_08011C7A:
	b _08011CA0
_08011C7C:
	ldr r1, _08011C9C @ =0x000002CE
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _08011CA0
	.align 2, 0
_08011C9C: .4byte 0x000002CE
_08011CA0:
	add sp, #0x28
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8011CA8
sub_8011CA8: @ 0x08011CA8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08011D58 @ =0x000002CE
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _08011D5C @ =sub_801159C
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x3a
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08011D60
	.align 2, 0
_08011D58: .4byte 0x000002CE
_08011D5C: .4byte sub_801159C
_08011D60:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8011D68
sub_8011D68: @ 0x08011D68
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xb2
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x3b
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08011DF8 @ =0x08032C98
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08011DFC @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08011E00
	.align 2, 0
_08011DF8: .4byte 0x08032C98
_08011DFC: .4byte sub_800D1C4
_08011E00:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8011E08
sub_8011E08: @ 0x08011E08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08011E1C @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7]
_08011E14:
	ldr r0, [r7]
	cmp r0, #0
	bne _08011E20
	b _08011E3C
	.align 2, 0
_08011E1C: .4byte 0x03001B4C
_08011E20:
	ldr r0, [r7]
	ldr r1, [r0, #0x4c]
	ldr r0, _08011E30 @ =sub_8013960
	cmp r1, r0
	bne _08011E34
	movs r0, #1
	b _08011E40
	.align 2, 0
_08011E30: .4byte sub_8013960
_08011E34:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7]
	b _08011E14
_08011E3C:
	movs r0, #0
	b _08011E40
_08011E40:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8011E48
sub_8011E48: @ 0x08011E48
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1c
	beq _08011E80
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1d
	beq _08011E80
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1e
	beq _08011E80
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
_08011E80:
	bl sub_8011E08
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08011ECA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #0
	bne _08011EC8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08011EC8:
	b _08011EDA
_08011ECA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08011EDA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1e
	bls _08011EEA
	bl sub_08012AE2
_08011EEA:
	lsls r1, r0, #2
	ldr r2, _08011EF4 @ =_08011EF8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08011EF4: .4byte _08011EF8
_08011EF8: @ jump table
	.4byte _08012192 @ case 0
	.4byte _08011F74 @ case 1
	.4byte _080121AE @ case 2
	.4byte _080121FC @ case 3
	.4byte _08012274 @ case 4
	.4byte _080122C2 @ case 5
	.4byte _0801230A @ case 6
	.4byte _08012354 @ case 7
	.4byte _080123D4 @ case 8
	.4byte _0801242E @ case 9
	.4byte _0801246C @ case 10
	.4byte _080124B4 @ case 11
	.4byte _08012538 @ case 12
	.4byte _08012576 @ case 13
	.4byte _080125BE @ case 14
	.4byte _08012644 @ case 15
	.4byte _08012682 @ case 16
	.4byte _080126EE @ case 17
	.4byte _08012746 @ case 18
	.4byte _080127B2 @ case 19
	.4byte _0801280A @ case 20
	.4byte _0801286C @ case 21
	.4byte _0801289C @ case 22
	.4byte _080128C4 @ case 23
	.4byte _08012910 @ case 24
	.4byte _080120D2 @ case 25
	.4byte _08012116 @ case 26
	.4byte _08012160 @ case 27
	.4byte _08012956 @ case 28
	.4byte _08012998 @ case 29
	.4byte _08012A34 @ case 30
_08011F74:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08012036
	movs r0, #8
	bl sub_8021B2C
	cmp r0, #7
	bhi _08012034
	lsls r1, r0, #2
	ldr r2, _08011F9C @ =_08011FA0
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08011F9C: .4byte _08011FA0
_08011FA0: @ jump table
	.4byte _08011FC0 @ case 0
	.4byte _08011FDA @ case 1
	.4byte _08011FDA @ case 2
	.4byte _08011FDA @ case 3
	.4byte _08011FDA @ case 4
	.4byte _08011FFA @ case 5
	.4byte _08011FFA @ case 6
	.4byte _0801201A @ case 7
_08011FC0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012034
_08011FDA:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012034
_08011FFA:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x19
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012034
_0801201A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012034
_08012034:
	b _080120CE
_08012036:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080120B6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08012072
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080120B4
_08012072:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0801209C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080120B4
_0801209C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080120B4:
	b _080120CE
_080120B6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080120CE:
	bl _08012AFC
_080120D2:
	movs r1, #0xd5
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08012AFC
_08012116:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08012158
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _0801215C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012158:
	bl _08012AFC
	.align 2, 0
_0801215C: .4byte 0x03001140
_08012160:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801218E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801218E:
	bl _08012AFC
_08012192:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _08012AFC
_080121AE:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08012AFC
_080121FC:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0801222E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801222E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08012258
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _08012258
	b _08012270
_08012258:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012270:
	bl _08012AFC
_08012274:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08012AFC
_080122C2:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08012306
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012306:
	bl _08012AFC
_0801230A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08012AFC
_08012354:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _080123D0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080123B0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _080123AC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080123D0
	.align 2, 0
_080123AC: .4byte 0x03001140
_080123B0:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_080123D0:
	bl _08012AFC
_080123D4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801242C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08012414
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801242C
_08012414:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801242C:
	b _08012AFC
_0801242E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08012452
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801246A
	b _08012452
_08012452:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801246A:
	b _08012AFC
_0801246C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_080124B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08012536
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08012510
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801250C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012536
	.align 2, 0
_0801250C: .4byte 0x03001140
_08012510:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012536:
	b _08012AFC
_08012538:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801255C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _08012574
	b _0801255C
_0801255C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012574:
	b _08012AFC
_08012576:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_080125BE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08012642
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801261C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08012618 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012642
	.align 2, 0
_08012618: .4byte 0x03001140
_0801261C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012642:
	b _08012AFC
_08012644:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08012668
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _08012680
	b _08012668
_08012668:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012680:
	b _08012AFC
_08012682:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_080126EE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08012720
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08012720:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08012744
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012744:
	b _08012AFC
_08012746:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_080127B2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _080127E4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080127E4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08012808
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012808:
	b _08012AFC
_0801280A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08012840
_0801282C:
	.byte 0x39, 0x68, 0x08, 0x1C
	.byte 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D, 0x0F, 0xF0, 0x24, 0xFD
_08012840:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_08012868:
	.byte 0xC0, 0x2C, 0x03, 0x08
_0801286C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801289A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801289A:
	b _08012AFC
_0801289C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _08012AFC
_080128C4:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_08012910:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08012954
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012954:
	b _08012AFC
_08012956:
	movs r1, #0xd7
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08012AFC
_08012998:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bne _08012A2E
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08012A30 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x56
	ldrh r3, [r2]
	adds r1, r3, #0
	adds r1, #0x28
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0xc]
	cmp r0, r1
	ble _08012A08
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x5c]
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0xc]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08012A08:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012A2E:
	b _08012AFC
	.align 2, 0
_08012A30: .4byte 0x03001140
_08012A34:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08012A58
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _08012AE0
	b _08012A58
_08012A58:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #2
	bhi _08012A78
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _08012AA2
	b _08012A78
_08012A78:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012AE0
_08012AA2:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012AE0:
	b _08012AFC

	non_word_aligned_thumb_func_start sub_08012AE2
sub_08012AE2: @ 0x08012AE2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012AFC
_08012AFC:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8012B04
sub_8012B04: @ 0x08012B04
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08012BB0 @ =0x000001A9
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _08012BB4 @ =sub_8011E48
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x76
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08012BB8
	.align 2, 0
_08012BB0: .4byte 0x000001A9
_08012BB4: .4byte sub_8011E48
_08012BB8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8012BC0
sub_8012BC0: @ 0x08012BC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009000
	cmp r0, #0
	beq _08012C8E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xe
	bhi _08012C8E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x56
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08012C70
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1f
	bl PlaySfx
	ldr r0, [r7]
	ldr r1, _08012C6C @ =0x03000EE8
	ldr r3, [r1]
	adds r2, r3, #0
	adds r1, r3, #0
	adds r1, #0x46
	adds r2, r0, #0
	adds r0, #0x51
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08012C8E
	.align 2, 0
_08012C6C: .4byte 0x03000EE8
_08012C70:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1f
	bl PlaySfx
_08012C8E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #0
	beq _08012CD2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x52
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _08012CEC @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x51
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
_08012CD2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x10
	bls _08012CE0
	b _08013210
_08012CE0:
	lsls r1, r0, #2
	ldr r2, _08012CF0 @ =_08012CF4
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08012CEC: .4byte 0x00000333
_08012CF0: .4byte _08012CF4
_08012CF4: @ jump table
	.4byte _08012D38 @ case 0
	.4byte _08012D52 @ case 1
	.4byte _08012DA0 @ case 2
	.4byte _08012DF6 @ case 3
	.4byte _08012E44 @ case 4
	.4byte _08012E8C @ case 5
	.4byte _08012ED4 @ case 6
	.4byte _08012F1C @ case 7
	.4byte _08012F4C @ case 8
	.4byte _08012F94 @ case 9
	.4byte _08012FDC @ case 10
	.4byte _0801300C @ case 11
	.4byte _08013054 @ case 12
	.4byte _080130FC @ case 13
	.4byte _08013084 @ case 14
	.4byte _080130CC @ case 15
	.4byte _08013208 @ case 16
_08012D38:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08013210
_08012D52:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08013210
_08012DA0:
	ldr r1, _08012DD8 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08012DDC
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	bne _08012DDC
	b _08012DF4
	.align 2, 0
_08012DD8: .4byte 0x00000333
_08012DDC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012DF4:
	b _08013210
_08012DF6:
	ldr r0, [r7]
	bl sub_8009824
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08013210
_08012E44:
	ldr r1, _08012E88 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08012E84
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012E84:
	b _08013210
	.align 2, 0
_08012E88: .4byte 0x00000333
_08012E8C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x68
	ldrh r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08013210
_08012ED4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _08012F16
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08012F18 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012F16:
	b _08013210
	.align 2, 0
_08012F18: .4byte 0x03001140
_08012F1C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08012F4A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08012F4A:
	b _08013210
_08012F4C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6a
	ldrh r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08013210
_08012F94:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08012FD6
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08012FD8 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08012FD6:
	b _08013210
	.align 2, 0
_08012FD8: .4byte 0x03001140
_08012FDC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801300A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801300A:
	b _08013210
_0801300C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08013210
_08013054:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08013082
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08013082:
	b _08013210
_08013084:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrh r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08013210
_080130CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080130FA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080130FA:
	b _08013210
_080130FC:
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _0801319E
	movs r0, #4
	bl sub_8021B2C
	cmp r0, #1
	beq _08013142
	cmp r0, #1
	bgt _0801311E
	cmp r0, #0
	beq _08013128
	b _0801319C
_0801311E:
	cmp r0, #2
	beq _08013162
	cmp r0, #3
	beq _08013182
	b _0801319C
_08013128:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801319C
_08013142:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801319C
_08013162:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801319C
_08013182:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801319C
_0801319C:
	b _08013206
_0801319E:
	movs r0, #3
	bl sub_8021B2C
	cmp r0, #1
	beq _080131D2
	cmp r0, #1
	bgt _080131B2
	cmp r0, #0
	beq _080131B8
	b _08013206
_080131B2:
	cmp r0, #2
	beq _080131EC
	b _08013206
_080131B8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08013206
_080131D2:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08013206
_080131EC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08013206
_08013206:
	b _08013210
_08013208:
	ldr r0, [r7]
	bl sub_800A094
	b _08013210
_08013210:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8013218
sub_8013218: @ 0x08013218
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	adds r5, r3, #0
	ldr r4, [r7, #0x30]
	ldr r3, [r7, #0x34]
	ldr r2, [r7, #0x38]
	ldr r1, [r7, #0x3c]
	ldr r0, [r7, #0x40]
	adds r6, r7, #0
	adds r6, #0xc
	strh r5, [r6]
	adds r5, r7, #0
	adds r5, #0xe
	strh r4, [r5]
	adds r4, r7, #0
	adds r4, #0x10
	strh r3, [r4]
	adds r3, r7, #0
	adds r3, #0x12
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #0x14
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0x16
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0xe
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0x18]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0x18]
	ldr r1, _08013398 @ =sub_8012BC0
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r7, #0
	adds r1, #0xc
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r7, #0
	adds r1, #0xe
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r7, #0
	adds r1, #0x10
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r7, #0
	adds r1, #0x12
	adds r2, r0, #0
	adds r0, #0x6a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r7, #0
	adds r1, #0x14
	adds r2, r0, #0
	adds r0, #0x6c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r7, #0
	adds r1, #0x16
	adds r2, r0, #0
	adds r0, #0x6e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7, #0x18]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x18]
	adds r0, r1, #0
	b _0801339C
	.align 2, 0
_08013398: .4byte sub_8012BC0
_0801339C:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80133A4
sub_80133A4: @ 0x080133A4
	push {r4, r7, lr}
	sub sp, #0x24
	add r7, sp, #0x10
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #4
	bls _080133BA
	b _080136C4
_080133BA:
	lsls r1, r0, #2
	ldr r2, _080133C4 @ =_080133C8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080133C4: .4byte _080133C8
_080133C8: @ jump table
	.4byte _080133DC @ case 0
	.4byte _08013428 @ case 1
	.4byte _0801349A @ case 2
	.4byte _080135BC @ case 3
	.4byte _080136A6 @ case 4
_080133DC:
	ldr r0, [r7]
	ldr r1, [r0, #0x64]
	ldr r0, [r7]
	ldr r2, [r0, #0x68]
	ldr r0, [r7]
	bl sub_80098B4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08013426
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08013426:
	b _080136C4
_08013428:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrb r2, [r1]
	subs r0, r2, #1
	cmp r0, #4
	bhi _08013478
	lsls r1, r0, #2
	ldr r2, _08013440 @ =_08013444
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08013440: .4byte _08013444
_08013444: @ jump table
	.4byte _08013458 @ case 0
	.4byte _08013458 @ case 1
	.4byte _08013460 @ case 2
	.4byte _08013468 @ case 3
	.4byte _08013470 @ case 4
_08013458:
	movs r0, #0xf8
	lsls r0, r0, #1
	str r0, [r7, #4]
	b _08013478
_08013460:
	movs r0, #0xfa
	lsls r0, r0, #1
	str r0, [r7, #4]
	b _08013478
_08013468:
	movs r0, #0xf9
	lsls r0, r0, #1
	str r0, [r7, #4]
	b _08013478
_08013470:
	movs r0, #0xfb
	lsls r0, r0, #1
	str r0, [r7, #4]
	b _08013478
_08013478:
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080136C4
_0801349A:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r1, _080134FC @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, _080134FC @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x10]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	movs r1, #0xa0
	lsls r1, r1, #1
	cmp r0, r1
	bls _08013502
	ldr r0, [r7]
	bl sub_8009DC4
	b _080136C4
	.align 2, 0
_080134FC: .4byte 0x03000EE8
_08013500:
	.byte 0x23, 0xE0
_08013502:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0xf0
	bls _0801354A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	lsrs r1, r0, #3
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0801353A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801354A
_0801353A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0801354A:
	movs r1, #0xf0
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08013570
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _080135B8 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_8009AC4
_08013570:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	subs r0, #9
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r1, #8
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r2, #9
	ldr r4, [r7, #8]
	adds r3, r4, #4
	ldr r4, [r7, #0xc]
	str r4, [sp]
	ldr r4, [r7, #0x10]
	str r4, [sp, #4]
	ldr r4, [r7, #0xc]
	str r4, [sp, #8]
	ldr r4, [r7, #0x10]
	str r4, [sp, #0xc]
	bl sub_8009D80
	cmp r0, #0
	beq _080135B6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080135B6:
	b _080136C4
	.align 2, 0
_080135B8: .4byte 0x00000333
_080135BC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrb r2, [r1]
	subs r0, r2, #1
	cmp r0, #4
	bhi _08013664
	lsls r1, r0, #2
	ldr r2, _080135D4 @ =_080135D8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080135D4: .4byte _080135D8
_080135D8: @ jump table
	.4byte _080135EC @ case 0
	.4byte _080135EC @ case 1
	.4byte _08013604 @ case 2
	.4byte _08013624 @ case 3
	.4byte _08013644 @ case 4
_080135EC:
	movs r0, #0x24
	bl PlaySfx
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6d
	ldrb r2, [r1]
	adds r0, r2, #0
	movs r1, #0
	bl sub_8002F20
	b _08013664
_08013604:
	movs r0, #0x25
	bl PlaySfx
	ldr r0, _08013620 @ =0x030011A8
	ldr r1, [r0]
	cmp r1, #0
	ble _0801361C
	movs r1, #0xfa
	lsls r1, r1, #3
	adds r0, r1, #0
	bl sub_8002804
_0801361C:
	b _08013664
	.align 2, 0
_08013620: .4byte 0x030011A8
_08013624:
	movs r0, #0x25
	bl PlaySfx
	ldr r0, _0801363C @ =0x030011A8
	ldr r1, [r0]
	cmp r1, #0
	ble _0801363A
	ldr r1, _08013640 @ =0x00002710
	adds r0, r1, #0
	bl sub_8002804
_0801363A:
	b _08013664
	.align 2, 0
_0801363C: .4byte 0x030011A8
_08013640: .4byte 0x00002710
_08013644:
	movs r0, #0x26
	bl PlaySfx
	ldr r0, _0801365C @ =0x030011A8
	ldr r1, [r0]
	cmp r1, #0
	ble _0801365A
	ldr r1, _08013660 @ =0x00002710
	adds r0, r1, #0
	bl sub_800284C
_0801365A:
	b _08013664
	.align 2, 0
_0801365C: .4byte 0x030011A8
_08013660: .4byte 0x00002710
_08013664:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r1, #0xfc
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080136C4
_080136A6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080136C2
	ldr r0, [r7]
	bl sub_8009DC4
_080136C2:
	b _080136C4
_080136C4:
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80136CC
sub_80136CC: @ 0x080136CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	bne _080136E2
	b _080137CC
_080136E2:
	ldr r1, [r7, #8]
	subs r0, r1, #1
	cmp r0, #4
	bhi _0801373C
	lsls r1, r0, #2
	ldr r2, _080136F4 @ =_080136F8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080136F4: .4byte _080136F8
_080136F8: @ jump table
	.4byte _0801370C @ case 0
	.4byte _0801370C @ case 1
	.4byte _08013718 @ case 2
	.4byte _08013724 @ case 3
	.4byte _08013730 @ case 4
_0801370C:
	ldr r0, _08013714 @ =0x000001F1
	str r0, [r7, #0x14]
	b _0801373C
	.align 2, 0
_08013714: .4byte 0x000001F1
_08013718:
	ldr r0, _08013720 @ =0x000001F5
	str r0, [r7, #0x14]
	b _0801373C
	.align 2, 0
_08013720: .4byte 0x000001F5
_08013724:
	ldr r0, _0801372C @ =0x000001F3
	str r0, [r7, #0x14]
	b _0801373C
	.align 2, 0
_0801372C: .4byte 0x000001F3
_08013730:
	ldr r0, _08013738 @ =0x000001F7
	str r0, [r7, #0x14]
	b _0801373C
	.align 2, 0
_08013738: .4byte 0x000001F7
_0801373C:
	ldr r1, [r7, #0x14]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, _080137C4 @ =0x0803435C
	ldr r2, [r7, #0x2c]
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r3, [r1]
	ldr r5, [r1]
	asrs r4, r5, #0x1f
	adds r1, r3, #0
	adds r2, r4, #0
	adds r4, r2, #0
	adds r3, r1, #0
	lsrs r5, r3, #0x16
	lsls r6, r4, #0xa
	adds r2, r5, #0
	orrs r2, r6
	lsls r1, r3, #0xa
	lsls r5, r2, #0x16
	lsrs r6, r1, #0xa
	adds r3, r5, #0
	orrs r3, r6
	asrs r4, r2, #0xa
	adds r1, r3, #0
	str r1, [r0, #0x64]
	ldr r0, [r7, #0x10]
	ldr r1, _080137C8 @ =0x08033F5C
	ldr r2, [r7, #0x2c]
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r3, [r1]
	ldr r5, [r1]
	asrs r4, r5, #0x1f
	adds r1, r3, #0
	adds r2, r4, #0
	adds r4, r2, #0
	adds r3, r1, #0
	lsrs r5, r3, #0x17
	lsls r6, r4, #9
	adds r2, r5, #0
	orrs r2, r6
	lsls r1, r3, #9
	lsls r5, r2, #0x16
	lsrs r6, r1, #0xa
	adds r3, r5, #0
	orrs r3, r6
	asrs r4, r2, #0xa
	adds r1, r3, #0
	str r1, [r0, #0x68]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08013846
	.align 2, 0
_080137C4: .4byte 0x0803435C
_080137C8: .4byte 0x08033F5C
_080137CC:
	ldr r1, [r7, #8]
	subs r0, r1, #1
	cmp r0, #4
	bhi _08013818
	lsls r1, r0, #2
	ldr r2, _080137E0 @ =_080137E4
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080137E0: .4byte _080137E4
_080137E4: @ jump table
	.4byte _080137F8 @ case 0
	.4byte _080137F8 @ case 1
	.4byte _08013800 @ case 2
	.4byte _08013808 @ case 3
	.4byte _08013810 @ case 4
_080137F8:
	movs r0, #0xf8
	lsls r0, r0, #1
	str r0, [r7, #0x14]
	b _08013818
_08013800:
	movs r0, #0xfa
	lsls r0, r0, #1
	str r0, [r7, #0x14]
	b _08013818
_08013808:
	movs r0, #0xf9
	lsls r0, r0, #1
	str r0, [r7, #0x14]
	b _08013818
_08013810:
	movs r0, #0xfb
	lsls r0, r0, #1
	str r0, [r7, #0x14]
	b _08013818
_08013818:
	ldr r1, [r7, #0x14]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	movs r1, #0
	str r1, [r0, #0x64]
	ldr r0, [r7, #0x10]
	movs r1, #0
	str r1, [r0, #0x68]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08013846:
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0x10]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x10]
	ldr r1, _080138D8 @ =sub_80133A4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	b _080138DC
	.align 2, 0
_080138D8: .4byte sub_80133A4
_080138DC:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80138E4
sub_80138E4: @ 0x080138E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x30]
	ldr r2, [r2, #0x64]
	adds r1, r1, r2
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x34]
	ldr r2, [r2, #0x68]
	adds r1, r1, r2
	str r1, [r0, #0x34]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801393A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6c
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x6c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801393A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrh r0, [r1]
	cmp r0, #0
	bne _08013956
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08013956:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013960
sub_8013960: @ 0x08013960
	push {r4, r7, lr}
	sub sp, #0x28
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8023978
	adds r1, r7, #4
	strb r0, [r1]
	ldr r0, _080139A8 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #0x24
	beq _080139EC
	ldr r0, _080139A8 @ =0x03001010
	ldr r1, [r0]
	cmp r1, #9
	beq _080139EC
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	cmp r1, #1
	bne _080139C0
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #1
	beq _080139AC
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #3
	beq _080139AC
	b _080139BE
	.align 2, 0
_080139A8: .4byte 0x03001010
_080139AC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08013C0E
_080139BE:
	b _080139EC
_080139C0:
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	cmp r1, #2
	bne _080139EC
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #1
	beq _080139DA
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #2
	beq _080139DA
	b _080139EC
_080139DA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08013C0E
_080139EC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	beq _080139FE
	cmp r0, #1
	beq _08013A18
	b _08013C0E
_080139FE:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08013C0E
_08013A18:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x30]
	ldr r2, [r2, #0x64]
	adds r1, r1, r2
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x34]
	ldr r2, [r2, #0x68]
	adds r1, r1, r2
	str r1, [r0, #0x34]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08013AB8
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, _08013AB4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0x10]
	ldr r1, _08013AB4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x14]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	subs r0, #9
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	subs r1, #8
	ldr r3, [r7, #8]
	adds r2, r3, #0
	adds r2, #9
	ldr r4, [r7, #0xc]
	adds r3, r4, #4
	ldr r4, [r7, #0x10]
	str r4, [sp]
	ldr r4, [r7, #0x14]
	str r4, [sp, #4]
	ldr r4, [r7, #0x10]
	str r4, [sp, #8]
	ldr r4, [r7, #0x14]
	str r4, [sp, #0xc]
	bl sub_8009D80
	cmp r0, #0
	beq _08013AB0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x70
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_8002E04
_08013AB0:
	b _08013B38
	.align 2, 0
_08013AB4: .4byte 0x03000EE8
_08013AB8:
	ldr r0, [r7]
	bl sub_8009324
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _08013B12
	ldr r0, [r7, #0x14]
	ldr r1, [r0, #0x4c]
	ldr r0, _08013AE0 @ =sub_801AA94
	cmp r1, r0
	bne _08013AE4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6e
	ldrb r0, [r1]
	cmp r0, #1
	bne _08013AE4
	b _08013B12
	.align 2, 0
_08013AE0: .4byte sub_801AA94
_08013AE4:
	ldr r0, [r7, #0x14]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x70
	adds r2, r0, #0
	adds r0, #0x58
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_08013B12:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08013B38
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08013C0E
_08013B38:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrh r0, [r1]
	movs r1, #7
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _08013BBA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6e
	ldrb r0, [r1]
	cmp r0, #1
	bne _08013BBA
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0xc7
	lsls r2, r2, #1
	bl sub_8014E8C
	str r0, [r7, #0x14]
	ldr r0, _08013BF0 @ =0xFFFFFC00
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_8021AE4
	ldr r1, [r7, #0x14]
	ldr r2, [r7]
	ldr r3, [r2, #0x64]
	asrs r2, r3, #1
	adds r0, r2, r0
	str r0, [r1, #0x64]
	ldr r0, _08013BF4 @ =0xFFFFFE00
	movs r1, #0x80
	lsls r1, r1, #2
	bl sub_8021AE4
	ldr r1, [r7, #0x14]
	ldr r2, [r7]
	ldr r3, [r2, #0x68]
	asrs r2, r3, #1
	adds r0, r2, r0
	str r0, [r1, #0x68]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	adds r0, #0x6c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x19
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x14]
	ldr r1, _08013BF8 @ =sub_80138E4
	str r1, [r0, #0x4c]
_08013BBA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldrh r0, [r1]
	cmp r0, #0
	beq _08013BFC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6c
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x6c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08013C0C
	.align 2, 0
_08013BF0: .4byte 0xFFFFFC00
_08013BF4: .4byte 0xFFFFFE00
_08013BF8: .4byte sub_80138E4
_08013BFC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08013C0C:
	b _08013C0E
_08013C0E:
	add sp, #0x28
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C18
sub_8013C18: @ 0x08013C18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, [r7, #0x30]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x3c]
	adds r1, r2, #0
	ldrb r2, [r0, #0x17]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x34]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6f
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r4, [r7, #0x10]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_8009E7C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8020E18
	ldr r0, [r7, #0x10]
	ldr r1, _08013D90 @ =sub_8013960
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x2c]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6c
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x38]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x70
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r4, [r7, #0x10]
	ldr r2, [r7, #0xc]
	ldr r5, [r7, #0xc]
	asrs r3, r5, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r2, _08013D94 @ =0x0803435C
	ldr r3, [r7, #8]
	movs r5, #0xff
	ands r3, r5
	adds r5, r3, #0
	lsls r3, r5, #2
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r3, [r2]
	mov r8, r3
	mov r2, r8
	asrs r6, r2, #0x1f
	adds r2, r5, #0
	adds r3, r6, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r5, r3, #0x16
	lsrs r6, r2, #0xa
	adds r0, r5, #0
	orrs r0, r6
	asrs r1, r3, #0xa
	adds r2, r0, #0
	str r2, [r4, #0x64]
	ldr r4, [r7, #0x10]
	ldr r2, [r7, #0xc]
	ldr r5, [r7, #0xc]
	asrs r3, r5, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	ldr r2, _08013D98 @ =0x08033F5C
	ldr r3, [r7, #8]
	movs r5, #0xff
	ands r3, r5
	adds r5, r3, #0
	lsls r3, r5, #2
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r3, [r2]
	mov r8, r3
	mov r2, r8
	asrs r6, r2, #0x1f
	adds r2, r5, #0
	adds r3, r6, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	lsls r5, r3, #0x16
	lsrs r6, r2, #0xa
	adds r0, r5, #0
	orrs r0, r6
	asrs r1, r3, #0xa
	lsls r5, r1, #0x1f
	lsrs r6, r0, #1
	adds r2, r5, #0
	orrs r2, r6
	asrs r3, r1, #1
	adds r0, r2, #0
	str r0, [r4, #0x68]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x30]
	ldr r1, _08013D9C @ =0x0000018B
	cmp r0, r1
	bne _08013DA0
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x6e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08013DB0
	.align 2, 0
_08013D90: .4byte sub_8013960
_08013D94: .4byte 0x0803435C
_08013D98: .4byte 0x08033F5C
_08013D9C: .4byte 0x0000018B
_08013DA0:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x6e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08013DB0:
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	b _08013DB6
_08013DB6:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8013DC4
sub_8013DC4: @ 0x08013DC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _08013E80
	cmp r0, #1
	bgt _08013DE2
	cmp r0, #0
	beq _08013DEE
	b _08013F8A
_08013DE2:
	cmp r0, #2
	beq _08013EC0
	cmp r0, #3
	bne _08013DEC
	b _08013F52
_08013DEC:
	b _08013F8A
_08013DEE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	beq _08013E0E
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
_08013E0E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #2
	beq _08013E28
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #3
	beq _08013E28
	b _08013E6E
_08013E28:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08013E6E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08013F8A
_08013E80:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08013EBE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08013EBE:
	b _08013F8A
_08013EC0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	beq _08013EE0
	ldr r0, [r7]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
_08013EE0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #1
	beq _08013EFA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #3
	beq _08013EFA
	b _08013F40
_08013EFA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08013F40:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08013F8A
_08013F52:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08013F88
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08013F88:
	b _08013F8A
_08013F8A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013F94
sub_8013F94: @ 0x08013F94
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0x10]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x10]
	ldr r1, _08014080 @ =sub_8013DC4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x87
	lsls r1, r1, #2
	cmp r0, r1
	bne _08014060
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08014060:
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _08014084
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_8021030
	b _080140A4
	.align 2, 0
_08014080: .4byte sub_8013DC4
_08014084:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_8021048
_080140A4:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	b _080140CA
_080140CA:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80140D4
sub_80140D4: @ 0x080140D4
	push {r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	ldr r0, _08014104 @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
	ldr r0, _08014108 @ =0x000F4240
	str r0, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x10]
	ldr r0, [r7]
	cmp r0, #0
	beq _0801410C
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	str r1, [r7, #0x14]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0x18]
	b _0801411C
	.align 2, 0
_08014104: .4byte 0x03001B4C
_08014108: .4byte 0x000F4240
_0801410C:
	ldr r1, _08014124 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	str r1, [r7, #0x14]
	ldr r1, _08014124 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0x18]
_0801411C:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08014128
	b _08014188
	.align 2, 0
_08014124: .4byte 0x03000EE8
_08014128:
	ldr r0, [r7, #4]
	ldr r1, [r0, #0x4c]
	ldr r0, _08014184 @ =sub_80141CC
	cmp r1, r0
	bne _0801417A
	ldr r0, [r7, #4]
	ldr r1, [r7]
	cmp r0, r1
	beq _0801417A
	ldr r0, [r7, #4]
	ldr r1, [r0, #0x30]
	ldr r2, [r7, #0x14]
	subs r0, r1, r2
	asrs r1, r0, #0xa
	adds r0, r1, #0
	cmp r0, #0
	bge _0801414C
	rsbs r0, r0, #0
_0801414C:
	ldr r1, [r7, #4]
	ldr r2, [r1, #0x34]
	ldr r3, [r7, #0x18]
	subs r1, r2, r3
	asrs r2, r1, #0xa
	adds r1, r2, #0
	cmp r1, #0
	bge _0801415E
	rsbs r1, r1, #0
_0801415E:
	asrs r1, r1, #1
	adds r0, r0, r1
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	bge _08014174
	ldr r0, [r7, #0x1c]
	str r0, [r7, #0xc]
	ldr r0, [r7, #4]
	str r0, [r7, #8]
_08014174:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0801417A:
	ldr r0, [r7, #4]
	ldr r1, [r0]
	str r1, [r7, #4]
	b _0801411C
	.align 2, 0
_08014184: .4byte sub_80141CC
_08014188:
	ldr r0, [r7, #0x10]
	cmp r0, #0xa
	bhi _0801419A
	ldr r0, _080141B0 @ =0x03000E30
	ldr r1, _080141B0 @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #4
	orrs r2, r1
	str r2, [r0, #0x1c]
_0801419A:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080141B4
	ldr r0, _080141B0 @ =0x03000E30
	ldr r1, _080141B0 @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #8
	orrs r2, r1
	str r2, [r0, #0x1c]
	b _080141C4
	.align 2, 0
_080141B0: .4byte 0x03000E30
_080141B4:
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7, #8]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8003A08
_080141C4:
	add sp, #0x20
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80141CC
sub_80141CC: @ 0x080141CC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080141EA
	b _0801423A
_080141EA:
	movs r1, #0xa0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _0801423A
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #0xfc
	lsls r2, r2, #1
	bl sub_8014E8C
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _08014244 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, _08014248 @ =0x030010F8
	ldr r1, _08014248 @ =0x030010F8
	ldr r2, [r1]
	adds r1, r2, #5
	str r1, [r0]
	ldr r0, _08014248 @ =0x030010F8
	ldr r1, [r0]
	movs r0, #0
	bl sub_8004010
	movs r0, #0x26
	bl PlaySfx
	ldr r0, [r7]
	bl sub_8009DC4
	ldr r0, [r7]
	bl sub_80140D4
_0801423A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014244: .4byte sub_80142EC
_08014248: .4byte 0x030010F8

	thumb_func_start sub_801424C
sub_801424C: @ 0x0801424C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08014284
	movs r1, #0xf0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08014284
	movs r0, #0x64
	bl sub_8002E04
	ldr r0, _0801428C @ =0x03001140
	movs r1, #1
	str r1, [r0]
_08014284:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801428C: .4byte 0x03001140

	thumb_func_start sub_8014290
sub_8014290: @ 0x08014290
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r4, _080142E4 @ =0x00000199
	movs r0, #8
	bl sub_8021B2C
	adds r2, r0, #0
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080142DA
	movs r1, #0xf0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _080142DA
	movs r0, #0x64
	bl sub_8002E04
	ldr r0, _080142E8 @ =0x03001140
	movs r1, #1
	str r1, [r0]
_080142DA:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080142E4: .4byte 0x00000199
_080142E8: .4byte 0x03001140

	thumb_func_start sub_80142EC
sub_80142EC: @ 0x080142EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08014310
	ldr r0, [r7]
	bl sub_8009DC4
_08014310:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8014318
sub_8014318: @ 0x08014318
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08014336
	b _08014360
_08014336:
	movs r1, #0x80
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08014360
	ldr r1, _08014368 @ =0x00001388
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, [r7]
	ldr r1, _0801436C @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r1, _08014370 @ =0x0000022F
	ldr r0, [r7]
	bl sub_8020D1C
	movs r0, #0x3c
	bl PlaySfx
_08014360:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014368: .4byte 0x00001388
_0801436C: .4byte sub_80142EC
_08014370: .4byte 0x0000022F

	thumb_func_start sub_8014374
sub_8014374: @ 0x08014374
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009000
	str r0, [r7, #4]
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801439A
	b _08014454
_0801439A:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _080143B0
	movs r1, #0xa0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	bne _080143B0
	b _08014454
_080143B0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _080143F0
	cmp r0, #1
	bgt _080143C6
	cmp r0, #0
	beq _080143CC
	b _0801443E
_080143C6:
	cmp r0, #2
	beq _08014414
	b _0801443E
_080143CC:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldr r2, [r7]
	ldrb r3, [r2, #0x17]
	str r3, [sp, #8]
	movs r2, #3
	movs r3, #1
	bl sub_8009B70
	b _0801443E
_080143F0:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #1
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldr r2, [r7]
	ldrb r3, [r2, #0x17]
	str r3, [sp, #8]
	movs r2, #5
	movs r3, #1
	bl sub_8009B70
	b _0801443E
_08014414:
	bl sub_8000F1C
	adds r1, r0, #3
	ldr r0, [r7]
	ldr r2, [r0, #0x30]
	asrs r0, r2, #0xa
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	asrs r2, r3, #0xa
	movs r3, #8
	str r3, [sp]
	str r1, [sp, #4]
	ldr r1, [r7]
	ldrb r3, [r1, #0x17]
	str r3, [sp, #8]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_8009B70
	b _0801443E
_0801443E:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8009E24
	ldr r0, [r7]
	bl sub_8009DC4
_08014454:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801445C
sub_801445C: @ 0x0801445C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801447C
sub_801447C: @ 0x0801447C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	bgt _0801449A
	cmp r0, #0
	blt _0801449A
	b _08014496
_08014496:
	b _0801449A
_08014498:
	.byte 0xFF, 0xE7
_0801449A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80144A4
sub_80144A4: @ 0x080144A4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	str r1, [r7, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	beq _080144D6
	cmp r0, #0
	bge _080144CE
	b _08014668
_080144CE:
	cmp r0, #3
	ble _080144D4
	b _08014668
_080144D4:
	b _080144E8
_080144D6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08014668
_080144E8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08014560 @ =0x03000EE8
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x46
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r0, [r0]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08014522
	ldr r0, _08014560 @ =0x03000EE8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r1, #0x46
	ldrb r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020E18
_08014522:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08014550
	ldr r1, _08014564 @ =0x00000333
	ldr r0, _08014560 @ =0x03000EE8
	ldr r2, [r0]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _08014550
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08014550:
	ldr r0, _08014568 @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7, #0x10]
_08014556:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0801456C
	b _08014640
	.align 2, 0
_08014560: .4byte 0x03000EE8
_08014564: .4byte 0x00000333
_08014568: .4byte 0x03001B4C
_0801456C:
	ldr r0, [r7, #0x10]
	ldr r1, [r0, #0x4c]
	ldr r0, _080145F0 @ =sub_801447C
	cmp r1, r0
	bne _080145FE
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	bne _080145FE
	ldr r1, [r7, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #8
	ldr r0, [r7]
	bl sub_80093A8
	cmp r0, #0
	beq _080145FC
	ldr r0, [r7]
	bl sub_8009DC4
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _080145F4 @ =0x030010F8
	ldr r0, _080145F4 @ =0x030010F8
	ldr r1, _080145F4 @ =0x030010F8
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _080145F4 @ =0x030010F8
	ldr r1, [r0]
	cmp r1, #3
	ble _080145EE
	ldr r0, _080145F8 @ =0x03000E30
	ldr r1, _080145F8 @ =0x03000E30
	ldr r2, [r1, #0x1c]
	movs r1, #0x20
	orrs r2, r1
	str r2, [r0, #0x1c]
_080145EE:
	b _0801467A
	.align 2, 0
_080145F0: .4byte sub_801447C
_080145F4: .4byte 0x030010F8
_080145F8: .4byte 0x03000E30
_080145FC:
	b _08014634
_080145FE:
	ldr r0, [r7, #0x10]
	ldr r1, [r0, #0x4c]
	ldr r0, _0801463C @ =sub_80144A4
	cmp r1, r0
	bne _08014634
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	cmp r0, r1
	beq _08014634
	ldr r1, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r0, [r7]
	bl sub_80093A8
	cmp r0, #0
	beq _08014634
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #1
	str r0, [r7, #4]
_08014634:
	ldr r0, [r7, #0x10]
	ldr r1, [r0]
	str r1, [r7, #0x10]
	b _08014556
	.align 2, 0
_0801463C: .4byte sub_80144A4
_08014640:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08014668
_08014668:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0801467A
	ldr r0, [r7]
	ldr r1, [r7, #8]
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x34]
_0801467A:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014684
sub_8014684: @ 0x08014684
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _08014734
	cmp r0, #1
	bgt _080146A2
	cmp r0, #0
	beq _080146B0
	b _080148A4
_080146A2:
	cmp r0, #2
	bne _080146A8
	b _080147C8
_080146A8:
	cmp r0, #3
	bne _080146AE
	b _08014850
_080146AE:
	b _080148A4
_080146B0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _080146E2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080146E2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0x3c
	bls _0801472C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08014730 @ =0x00000225
	ldr r0, [r7]
	bl sub_8020D1C
_0801472C:
	b _080148A4
	.align 2, 0
_08014730: .4byte 0x00000225
_08014734:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080147BC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	movs r1, #0xc0
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _080147BC
	ldr r0, _080147C0 @ =0x03001130
	ldr r1, [r0]
	cmp r1, #0
	bne _080147BC
	ldr r0, _080147C4 @ =0x03001104
	movs r1, #1
	str r1, [r0]
_080147BC:
	b _080148A4
	.align 2, 0
_080147C0: .4byte 0x03001130
_080147C4: .4byte 0x03001104
_080147C8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0xb4
	bls _08014848
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0801484C @ =0x00000226
	ldr r0, [r7]
	bl sub_8020D1C
_08014848:
	b _080148A4
	.align 2, 0
_0801484C: .4byte 0x00000226
_08014850:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801489E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _080148A0 @ =0x00000227
	ldr r0, [r7]
	bl sub_8020D1C
_0801489E:
	b _080148A4
	.align 2, 0
_080148A0: .4byte 0x00000227
_080148A4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80148AC
sub_80148AC: @ 0x080148AC
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0x77
	bls _08014918
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08014934
_08014918:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0x3c
	bne _08014934
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08014934:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801494A
	b _080149E6
_0801494A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	movs r1, #4
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080149E6
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	movs r1, #7
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080149E6
	ldr r1, _080149B4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #4]
	ldr r1, _080149B4 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x10]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7, #4]
	cmp r1, r0
	bgt _080149B8
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #8
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _080149B8
	b _080149BA
	.align 2, 0
_080149B4: .4byte 0x03000EE8
_080149B8:
	b _080149E6
_080149BA:
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r7, #8]
	cmp r1, r0
	bgt _080149D4
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	subs r0, #0x4a
	ldr r1, [r7, #8]
	cmp r1, r0
	blt _080149D4
	b _080149D6
_080149D4:
	b _080149E6
_080149D6:
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _080149F0 @ =0x03001140
	movs r1, #1
	str r1, [r0]
_080149E6:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080149F0: .4byte 0x03001140

	thumb_func_start sub_80149F4
sub_80149F4: @ 0x080149F4
	push {r7, lr}
	sub sp, #0x18
	add r7, sp, #0xc
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	bne _08014A14
	movs r0, #1
	str r0, [r7, #8]
_08014A14:
	ldr r0, [r7]
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	bne _08014A36
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _08014A36
	movs r0, #1
	str r0, [r7, #4]
_08014A36:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08014A7C
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x60]
	adds r1, r2, #4
	str r1, [r0, #0x60]
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	cmp r1, #2
	bls _08014A7C
	ldr r1, _08014A94 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r2, _08014A94 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #1
	str r2, [sp]
	movs r2, #7
	str r2, [sp, #4]
	ldr r2, [r7]
	ldrb r3, [r2, #0x17]
	str r3, [sp, #8]
	movs r2, #0
	movs r3, #1
	bl sub_8009B70
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x60]
_08014A7C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _08014AAE
	cmp r0, #1
	bgt _08014A98
	cmp r0, #0
	beq _08014AA2
	b _08014B6C
	.align 2, 0
_08014A94: .4byte 0x03000EE8
_08014A98:
	cmp r0, #2
	beq _08014AF4
	cmp r0, #3
	beq _08014B1C
	b _08014B6C
_08014AA2:
	movs r1, #0x88
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	b _08014B6C
_08014AAE:
	ldr r1, _08014AF0 @ =0x00000221
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08014B6C
	.align 2, 0
_08014AF0: .4byte 0x00000221
_08014AF4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08014B1A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08014B1A:
	b _08014B6C
_08014B1C:
	ldr r0, [r7]
	bl sub_8009EE8
	ldr r0, _08014B58 @ =0x03000EE8
	ldr r1, [r0]
	ldr r2, _08014B5C @ =0x00000265
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, _08014B58 @ =0x03000EE8
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08014B60 @ =0x0300111C
	movs r1, #1
	str r1, [r0]
	ldr r0, _08014B64 @ =0x030010E4
	movs r1, #1
	str r1, [r0]
	ldr r0, _08014B68 @ =0x03001110
	movs r1, #2
	str r1, [r0]
	b _08014B6C
	.align 2, 0
_08014B58: .4byte 0x03000EE8
_08014B5C: .4byte 0x00000265
_08014B60: .4byte 0x0300111C
_08014B64: .4byte 0x030010E4
_08014B68: .4byte 0x03001110
_08014B6C:
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8014B74
sub_8014B74: @ 0x08014B74
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r2, #0x88
	lsls r2, r2, #2
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _08014BD8 @ =sub_80149F4
	str r1, [r0, #0x4c]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	movs r1, #0x3f
	bl sub_8009EA4
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _08014BDC
	.align 2, 0
_08014BD8: .4byte sub_80149F4
_08014BDC:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8014BE4
sub_8014BE4: @ 0x08014BE4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0xc0
	lsls r1, r1, #4
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x58
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xf
	bls _08014C52
	ldr r0, _08014C68 @ =0x03001120
	ldr r1, [r0]
	cmp r1, #0
	bne _08014C42
	movs r1, #0xdc
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08014C42
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08014C6C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r0, _08014C68 @ =0x03001120
	movs r1, #0x1e
	str r1, [r0]
_08014C42:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x58
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_08014C52:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	blt _08014CE8
	cmp r0, #2
	ble _08014C70
	cmp r0, #3
	beq _08014CCC
	b _08014CE8
	.align 2, 0
_08014C68: .4byte 0x03001120
_08014C6C: .4byte 0x03001140
_08014C70:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	movs r1, #0x96
	lsls r1, r1, #1
	cmp r0, r1
	bls _08014C90
	ldr r0, [r7]
	bl sub_8009DC4
_08014C90:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08014CCA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08014CCA:
	b _08014CE8
_08014CCC:
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08014CE6
	ldr r0, [r7]
	bl sub_8009DC4
_08014CE6:
	b _08014CE8
_08014CE8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8014CF0
sub_8014CF0: @ 0x08014CF0
	push {r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r0, [r7, #0xc]
	movs r1, #1
	cmn r0, r1
	bne _08014D18
	movs r0, #0xe
	bl sub_8021B2C
	str r0, [r7, #0x18]
	b _08014D1C
_08014D18:
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x18]
_08014D1C:
	ldr r0, [r7, #0x18]
	cmp r0, #0xd
	bhi _08014DF0
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08014D30 @ =_08014D34
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08014D30: .4byte _08014D34
_08014D34: @ jump table
	.4byte _08014D6C @ case 0
	.4byte _08014D72 @ case 1
	.4byte _08014D78 @ case 2
	.4byte _08014D78 @ case 3
	.4byte _08014D88 @ case 4
	.4byte _08014D98 @ case 5
	.4byte _08014D98 @ case 6
	.4byte _08014DA8 @ case 7
	.4byte _08014DB8 @ case 8
	.4byte _08014DB8 @ case 9
	.4byte _08014DC8 @ case 10
	.4byte _08014DD8 @ case 11
	.4byte _08014DD8 @ case 12
	.4byte _08014DE4 @ case 13
_08014D6C:
	movs r0, #0
	str r0, [r7, #0x14]
	b _08014DF0
_08014D72:
	movs r0, #1
	str r0, [r7, #0x14]
	b _08014DF0
_08014D78:
	ldr r0, _08014D84 @ =0x0000020F
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	b _08014DF0
	.align 2, 0
_08014D84: .4byte 0x0000020F
_08014D88:
	ldr r0, _08014D94 @ =0x0000023F
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08014DF0
	.align 2, 0
_08014D94: .4byte 0x0000023F
_08014D98:
	ldr r0, _08014DA4 @ =0x00000211
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	b _08014DF0
	.align 2, 0
_08014DA4: .4byte 0x00000211
_08014DA8:
	ldr r0, _08014DB4 @ =0x00000241
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08014DF0
	.align 2, 0
_08014DB4: .4byte 0x00000241
_08014DB8:
	ldr r0, _08014DC4 @ =0x00000212
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	b _08014DF0
	.align 2, 0
_08014DC4: .4byte 0x00000212
_08014DC8:
	ldr r0, _08014DD4 @ =0x00000242
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08014DF0
	.align 2, 0
_08014DD4: .4byte 0x00000242
_08014DD8:
	movs r0, #0x84
	lsls r0, r0, #2
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
	b _08014DF0
_08014DE4:
	movs r0, #0x90
	lsls r0, r0, #2
	str r0, [r7, #0x10]
	movs r0, #1
	str r0, [r7, #0x14]
	b _08014DF0
_08014DF0:
	ldr r0, [r7, #0x14]
	cmp r0, #1
	beq _08014E14
	cmp r0, #1
	blo _08014E00
	cmp r0, #2
	beq _08014E28
	b _08014E3C
_08014E00:
	ldr r1, [r7, #4]
	ldr r2, _08014E10 @ =0x0000020E
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #0x1c]
	b _08014E3C
	.align 2, 0
_08014E10: .4byte 0x0000020E
_08014E14:
	ldr r1, [r7, #4]
	ldr r2, _08014E24 @ =0x0000023E
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #0x1c]
	b _08014E3C
	.align 2, 0
_08014E24: .4byte 0x0000023E
_08014E28:
	ldr r1, [r7, #4]
	ldr r2, _08014E38 @ =0x00000246
	ldr r0, [r7]
	bl sub_8014E8C
	str r0, [r7, #0x1c]
	b _08014E3C
	.align 2, 0
_08014E38: .4byte 0x00000246
_08014E3C:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08014E4A
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x10]
	bl sub_8020DDC
_08014E4A:
	ldr r0, [r7, #0x1c]
	ldr r1, _08014E80 @ =sub_8014BE4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	b _08014E84
	.align 2, 0
_08014E80: .4byte sub_8014BE4
_08014E84:
	add sp, #0x20
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8014E8C
sub_8014E8C: @ 0x08014E8C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08014EF8
_08014EF8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8014F00
sub_8014F00: @ 0x08014F00
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08014F24
	bl _080158F0
_08014F24:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xc
	bls _08014F40
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _08014F40
	movs r0, #1
	str r0, [r7, #4]
_08014F40:
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08014F72
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xc
	bls _08014F6C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _08014F6C
	b _08014F72
_08014F6C:
	ldr r0, _08014FAC @ =0x03001148
	movs r1, #0
	str r1, [r0]
_08014F72:
	ldr r0, _08014FB0 @ =0x03001104
	ldr r1, [r0]
	cmp r1, #0
	beq _08014F92
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08014F92:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	bls _08014FA2
	bl sub_080158E0
_08014FA2:
	lsls r1, r0, #2
	ldr r2, _08014FB4 @ =_08014FB8
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08014FAC: .4byte 0x03001148
_08014FB0: .4byte 0x03001104
_08014FB4: .4byte _08014FB8
_08014FB8: @ jump table
	.4byte _0801514E @ case 0
	.4byte _08015014 @ case 1
	.4byte _0801516A @ case 2
	.4byte _080151B8 @ case 3
	.4byte _0801522E @ case 4
	.4byte _0801527A @ case 5
	.4byte _080152C0 @ case 6
	.4byte _08015308 @ case 7
	.4byte _08015386 @ case 8
	.4byte _080153E0 @ case 9
	.4byte _0801541E @ case 10
	.4byte _08015466 @ case 11
	.4byte _080154EC @ case 12
	.4byte _0801552A @ case 13
	.4byte _080155B0 @ case 14
	.4byte _0801561C @ case 15
	.4byte _0801569C @ case 16
	.4byte _08015708 @ case 17
	.4byte _08015760 @ case 18
	.4byte _080157CC @ case 19
	.4byte _08015824 @ case 20
	.4byte _08015888 @ case 21
	.4byte _080158B8 @ case 22
_08015014:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080150B2
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x1c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08015056
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080150B0
_08015056:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x24]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08015098
	ldr r0, _08015094 @ =0x03001148
	ldr r1, [r0]
	cmp r1, #0
	bne _08015098
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, _08015094 @ =0x03001148
	movs r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080150B0
	.align 2, 0
_08015094: .4byte 0x03001148
_08015098:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080150B0:
	b _0801514A
_080150B2:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08015132
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _080150EE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08015130
_080150EE:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08015118
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08015130
_08015118:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08015130:
	b _0801514A
_08015132:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801514A:
	bl _080158F0
_0801514E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _080158F0
_0801516A:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _080158F0
_080151B8:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _080151EA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080151EA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08015214
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _08015214
	b _0801522C
_08015214:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801522C:
	b _080158F0
_0801522E:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
_0801527A:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080152BE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080152BE:
	b _080158F0
_080152C0:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
_08015308:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _08015384
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08015364
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08015360 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08015384
	.align 2, 0
_08015360: .4byte 0x03001140
_08015364:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08015384:
	b _080158F0
_08015386:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080153DE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _080153C6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080153DE
_080153C6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080153DE:
	b _080158F0
_080153E0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08015404
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801541C
	b _08015404
_08015404:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801541C:
	b _080158F0
_0801541E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
_08015466:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _080154EA
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080154C4
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _080154C0 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080154EA
	.align 2, 0
_080154C0: .4byte 0x03001140
_080154C4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_080154EA:
	b _080158F0
_080154EC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08015510
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _08015528
	b _08015510
_08015510:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08015528:
	b _080158F0
_0801552A:
	ldr r0, [r7]
	ldr r2, _0801559C @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r2, _0801559C @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	ldr r3, _080155A0 @ =0xFFFFF800
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080155A4 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r0, _080155A8 @ =0x03001148
	movs r1, #1
	str r1, [r0]
	ldr r0, _080155AC @ =0x03001174
	movs r1, #0
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
	.align 2, 0
_0801559C: .4byte 0x03000EE8
_080155A0: .4byte 0xFFFFF800
_080155A4: .4byte 0x03001140
_080155A8: .4byte 0x03001148
_080155AC: .4byte 0x03001174
_080155B0:
	ldr r0, [r7]
	ldr r2, _08015610 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x30]
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r2, _08015610 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	ldr r3, _08015614 @ =0xFFFFF800
	adds r1, r2, r3
	str r1, [r0, #0x34]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801560C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08015618 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801560C:
	b _080158F0
	.align 2, 0
_08015610: .4byte 0x03000EE8
_08015614: .4byte 0xFFFFF800
_08015618: .4byte 0x03001140
_0801561C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08015694
	ldr r0, _0801565C @ =0x03001174
	ldr r1, [r0]
	cmp r1, #4
	ble _08015664
	ldr r0, _08015660 @ =0x03001148
	movs r1, #0
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08015694
	.align 2, 0
_0801565C: .4byte 0x03001174
_08015660: .4byte 0x03001148
_08015664:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08015698 @ =0x03001174
	ldr r1, _08015698 @ =0x03001174
	ldr r2, [r1]
	subs r1, r2, #2
	str r1, [r0]
	ldr r0, _08015698 @ =0x03001174
	ldr r1, [r0]
	cmp r1, #0
	bge _08015694
	ldr r0, _08015698 @ =0x03001174
	movs r1, #0
	str r1, [r0]
_08015694:
	b _080158F0
	.align 2, 0
_08015698: .4byte 0x03001174
_0801569C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
_08015708:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801573A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801573A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801575E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801575E:
	b _080158F0
_08015760:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
_080157CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _080157FE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080157FE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08015822
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08015822:
	b _080158F0
_08015824:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801585C
_08015846:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E
	.byte 0xB8, 0x60, 0x0C, 0x48, 0x39, 0x1C, 0x08, 0x31, 0x0C, 0xF0, 0x16, 0xFD
_0801585C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080158F0
_08015884:
	.byte 0xAC, 0x2D, 0x03, 0x08
_08015888:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080158B6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080158B6:
	b _080158F0
_080158B8:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _080158F0

	thumb_func_start sub_080158E0
sub_080158E0: @ 0x080158E0
	ldr r1, _080158EC @ =0x08032DBC
	adds r0, r1, #0
	bl sub_8022288
	b _080158F0
	.align 2, 0
_080158EC: .4byte 0x08032DBC
_080158F0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80158F8
sub_80158F8: @ 0x080158F8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xad
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x42
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08015994 @ =0x08032DE8
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08015998 @ =sub_8014F00
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801599C
	.align 2, 0
_08015994: .4byte 0x08032DE8
_08015998: .4byte sub_8014F00
_0801599C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80159A4
sub_80159A4: @ 0x080159A4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_80158F8
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x41
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _080159D4 @ =0x000002B3
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080159D8
	.align 2, 0
_080159D4: .4byte 0x000002B3
_080159D8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80159E0
sub_80159E0: @ 0x080159E0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_80158F8
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x41
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08015A18 @ =0x000002B3
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	ldr r1, _08015A1C @ =sub_800D158
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08015A20
	.align 2, 0
_08015A18: .4byte 0x000002B3
_08015A1C: .4byte sub_800D158
_08015A20:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8015A28
sub_8015A28: @ 0x08015A28
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08015AD0 @ =0x000002C3
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x3c
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08015AD4 @ =0x08032E0C
	str r1, [r0, #0x60]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	ldr r1, _08015AD8 @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08015ADC
	.align 2, 0
_08015AD0: .4byte 0x000002C3
_08015AD4: .4byte 0x08032E0C
_08015AD8: .4byte sub_800D1C4
_08015ADC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8015AE4
sub_8015AE4: @ 0x08015AE4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xfd
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x56
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08015B80 @ =0x08032E2C
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08015B84 @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08015B88
	.align 2, 0
_08015B80: .4byte 0x08032E2C
_08015B84: .4byte sub_800D1C4
_08015B88:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8015B90
sub_8015B90: @ 0x08015B90
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_8015AE4
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x57
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xfe
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08015BC2
_08015BC2:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8015BCC
sub_8015BCC: @ 0x08015BCC
	push {r4, r5, r7, lr}
	sub sp, #0x1c
	add r7, sp, #0x14
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009000
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08015C82
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1c
	beq _08015C82
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1d
	beq _08015C82
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x56
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0x39
	bl PlaySfx
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08015C4C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08015C82
_08015C4C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	beq _08015C6A
	movs r0, #0xbc
	lsls r0, r0, #1
	ldr r1, _08015C9C @ =0x00000175
	bl sub_8006620
	bl sub_80009C0
	bl sub_8000C3C
_08015C6A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08015C82:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1e
	bls _08015C92
	bl sub_080166B6
_08015C92:
	lsls r1, r0, #2
	ldr r2, _08015CA0 @ =_08015CA4
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08015C9C: .4byte 0x00000175
_08015CA0: .4byte _08015CA4
_08015CA4: @ jump table
	.4byte _08015D20 @ case 0
	.4byte _08015D3C @ case 1
	.4byte _08015DA4 @ case 2
	.4byte _08015E3C @ case 3
	.4byte _08015E84 @ case 4
	.4byte _08015EDC @ case 5
	.4byte _08015EDC @ case 6
	.4byte _08015EDC @ case 7
	.4byte _08015EDC @ case 8
	.4byte _08015EDC @ case 9
	.4byte _08015F6C @ case 10
	.4byte _08015FEC @ case 11
	.4byte _08016030 @ case 12
	.4byte _08016088 @ case 13
	.4byte _080160B8 @ case 14
	.4byte _080160FA @ case 15
	.4byte _08016144 @ case 16
	.4byte _08016174 @ case 17
	.4byte _080161D4 @ case 18
	.4byte _0801622C @ case 19
	.4byte _0801628C @ case 20
	.4byte _08016358 @ case 21
	.4byte _08016494 @ case 22
	.4byte _080164E0 @ case 23
	.4byte _08016568 @ case 24
	.4byte _080165A6 @ case 25
	.4byte _080165F0 @ case 26
	.4byte _08016678 @ case 27
	.4byte _080162E4 @ case 28
	.4byte _08016328 @ case 29
	.4byte _08016470 @ case 30
_08015D20:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _080166D0
_08015D3C:
	ldr r0, [r7]
	bl sub_80097BC
	movs r1, #0xab
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1e
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _080166D0
_08015DA4:
	ldr r1, _08015E1C @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08015DE8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08015DE8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08015E38
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08015E20
	movs r1, #0xf0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	bne _08015E20
	b _08015E38
	.align 2, 0
_08015E1C: .4byte 0x00000333
_08015E20:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08015E38:
	bl _080166D0
_08015E3C:
	ldr r1, _08015E80 @ =0x000002AF
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _080166D0
	.align 2, 0
_08015E80: .4byte 0x000002AF
_08015E84:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08015ED8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08015ED8:
	bl _080166D0
_08015EDC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08015F10
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08015F62
_08015F10:
	ldr r1, _08015F68 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r2, _08015F68 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_80167C4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08015F62:
	bl _080166D0
	.align 2, 0
_08015F68: .4byte 0x03000EE8
_08015F6C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08015FA0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08015FE4
_08015FA0:
	ldr r1, _08015FE8 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r2, _08015FE8 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_80167C4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x13
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08015FE4:
	bl _080166D0
	.align 2, 0
_08015FE8: .4byte 0x03000EE8
_08015FEC:
	ldr r1, _0801602C @ =0x000002AA
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
	.align 2, 0
_0801602C: .4byte 0x000002AA
_08016030:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bne _08016082
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _0801605C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08016084 @ =0x03001140
	movs r1, #1
	str r1, [r0]
_0801605C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08016082:
	b _080166D0
	.align 2, 0
_08016084: .4byte 0x03001140
_08016088:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080160B6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080160B6:
	b _080166D0
_080160B8:
	movs r1, #0xaa
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
_080160FA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bne _0801613E
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08016140 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801613E:
	b _080166D0
	.align 2, 0
_08016140: .4byte 0x03001140
_08016144:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08016172
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x11
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016172:
	b _080166D0
_08016174:
	movs r1, #0xaa
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xf
	movs r1, #0x14
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
_080161D4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08016206
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08016206:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801622A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801622A:
	b _080166D0
_0801622C:
	movs r1, #0xaa
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x19
	movs r1, #0x23
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
_0801628C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _080162BE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080162BE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _080162E2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080162E2:
	b _080166D0
_080162E4:
	ldr r1, _08016324 @ =0x000002AB
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
	.align 2, 0
_08016324: .4byte 0x000002AB
_08016328:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08016356
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016356:
	b _080166D0
_08016358:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080163BC
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _08016380
	cmp r0, #1
	beq _0801639A
	b _080163BA
_08016380:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080163BA
_0801639A:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080163BA
_080163BA:
	b _0801646E
_080163BC:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08016456
	movs r0, #4
	bl sub_8021B2C
	cmp r0, #1
	beq _08016406
	cmp r0, #1
	bgt _080163E2
	cmp r0, #0
	beq _080163EC
	b _08016454
_080163E2:
	cmp r0, #2
	beq _08016420
	cmp r0, #3
	beq _0801643A
	b _08016454
_080163EC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x13
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016454
_08016406:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x19
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016454
_08016420:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016454
_0801643A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016454
_08016454:
	b _0801646E
_08016456:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801646E:
	b _080166D0
_08016470:
	ldr r1, _08016490 @ =0x000002AB
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _080166D0
	.align 2, 0
_08016490: .4byte 0x000002AB
_08016494:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _080164DC @ =0x000002AE
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
	.align 2, 0
_080164DC: .4byte 0x000002AE
_080164E0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bls _08016562
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0xc
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0xa0
	lsls r3, r3, #4
	movs r4, #0x3c
	str r4, [sp]
	ldr r4, _08016564 @ =0x000002A6
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	ldrh r4, [r5, #0x12]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
_08016562:
	b _080166D0
	.align 2, 0
_08016564: .4byte 0x000002A6
_08016568:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801658C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _080165A4
	b _0801658C
_0801658C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x13
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080165A4:
	b _080166D0
_080165A6:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _080165EC @ =0x000002AD
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080166D0
	.align 2, 0
_080165EC: .4byte 0x000002AD
_080165F0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bls _08016672
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0xc
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0xa0
	lsls r3, r3, #4
	movs r4, #0x3c
	str r4, [sp]
	ldr r4, _08016674 @ =0x000002A7
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	ldrh r4, [r5, #0x12]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
_08016672:
	b _080166D0
	.align 2, 0
_08016674: .4byte 0x000002A7
_08016678:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801669C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _080166B4
	b _0801669C
_0801669C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x13
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080166B4:
	b _080166D0

	non_word_aligned_thumb_func_start sub_080166B6
sub_080166B6: @ 0x080166B6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080166D0
_080166D0:
	add sp, #0x1c
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80166D8
sub_80166D8: @ 0x080166D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _08016744
	cmp r0, #1
	bgt _080166F6
	cmp r0, #0
	beq _080166FC
	b _0801679E
_080166F6:
	cmp r0, #2
	beq _0801679C
	b _0801679E
_080166FC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08016742
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r1, #0xac
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
_08016742:
	b _0801679E
_08016744:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #2
	bls _08016794
	movs r1, #0xc0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08016794
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08016798 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08016794:
	b _0801679E
	.align 2, 0
_08016798: .4byte 0x03001140
_0801679C:
	b _0801679E
_0801679E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080167BA
	ldr r0, [r7]
	bl sub_8009DC4
_080167BA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80167C4
sub_80167C4: @ 0x080167C4
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _0801684C @ =0x000002A9
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	ldr r4, [r7, #8]
	movs r0, #8
	bl sub_8021B2C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8020E18
	ldr r0, [r7, #8]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #8]
	ldr r1, _08016850 @ =sub_80166D8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x63
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _08016854
	.align 2, 0
_0801684C: .4byte 0x000002A9
_08016850: .4byte sub_80166D8
_08016854:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801685C
sub_801685C: @ 0x0801685C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _0801690C @ =sub_8015BCC
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x43
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08016910
	.align 2, 0
_0801690C: .4byte sub_8015BCC
_08016910:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8016918
sub_8016918: @ 0x08016918
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _080169C0 @ =sub_8015BCC
	str r1, [r0, #0x4c]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x44
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080169C4
	.align 2, 0
_080169C0: .4byte sub_8015BCC
_080169C4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80169CC
sub_80169CC: @ 0x080169CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, sp, #0x14
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009000
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08016A64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x14
	beq _08016A64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x15
	beq _08016A64
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x56
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	movs r0, #0x39
	bl PlaySfx
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08016A4C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016A64
_08016A4C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016A64:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x22
	bls _08016A74
	bl _0801743C
_08016A74:
	lsls r1, r0, #2
	ldr r2, _08016A80 @ =_08016A84
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08016A80: .4byte _08016A84
_08016A84: @ jump table
	.4byte _08017390 @ case 0
	.4byte _08016B10 @ case 1
	.4byte _08016C52 @ case 2
	.4byte _08016CBA @ case 3
	.4byte _080173AA @ case 4
	.4byte _080173F6 @ case 5
	.4byte _0801743C @ case 6
	.4byte _0801743C @ case 7
	.4byte _0801743C @ case 8
	.4byte _0801743C @ case 9
	.4byte _0801743C @ case 10
	.4byte _0801743C @ case 11
	.4byte _0801743C @ case 12
	.4byte _0801743C @ case 13
	.4byte _0801743C @ case 14
	.4byte _0801743C @ case 15
	.4byte _0801711A @ case 16
	.4byte _08017182 @ case 17
	.4byte _080171DA @ case 18
	.4byte _08017242 @ case 19
	.4byte _0801729A @ case 20
	.4byte _080172E0 @ case 21
	.4byte _08017310 @ case 22
	.4byte _08017362 @ case 23
	.4byte _08016EFC @ case 24
	.4byte _08016F34 @ case 25
	.4byte _08016FD0 @ case 26
	.4byte _08017026 @ case 27
	.4byte _08017060 @ case 28
	.4byte _08016D4E @ case 29
	.4byte _08016D90 @ case 30
	.4byte _08016DE8 @ case 31
	.4byte _08016E40 @ case 32
	.4byte _08016E84 @ case 33
	.4byte _08016ECC @ case 34
_08016B10:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08016B9C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x1c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08016B52
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1d
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016B9A
_08016B52:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x1c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08016B82
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016B9A
_08016B82:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016B9A:
	b _08016C4E
_08016B9C:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08016C10
	movs r0, #6
	bl sub_8021B2C
	cmp r0, #0
	beq _08016BF6
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _08016BDC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x18
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016BF4
_08016BDC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016BF4:
	b _08016C0E
_08016BF6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016C0E:
	b _08016C4E
_08016C10:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	beq _08016C36
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016C4E
_08016C36:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016C4E:
	bl _0801743C
_08016C52:
	ldr r0, [r7]
	bl sub_80097BC
	movs r1, #0xdf
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1e
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801743C
_08016CBA:
	ldr r1, _08016D30 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08016CFE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08016CFE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08016D4C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08016D34
	movs r1, #0xf0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	bne _08016D34
	b _08016D4C
	.align 2, 0
_08016D30: .4byte 0x00000333
_08016D34:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016D4C:
	b _0801743C
_08016D4E:
	movs r1, #0xde
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
_08016D90:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _08016DE0
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08016DBA
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08016DE4 @ =0x03001140
	movs r1, #1
	str r1, [r0]
_08016DBA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08016DE0:
	b _0801743C
	.align 2, 0
_08016DE4: .4byte 0x03001140
_08016DE8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08016E3E
	movs r1, #0x8c
	lsls r1, r1, #8
	adds r0, r1, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08016E26
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08016E3E
_08016E26:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016E3E:
	b _0801743C
_08016E40:
	ldr r1, _08016E80 @ =0x000001BB
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
	.align 2, 0
_08016E80: .4byte 0x000001BB
_08016E84:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _08016EC6
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08016EC8 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08016EC6:
	b _0801743C
	.align 2, 0
_08016EC8: .4byte 0x03001140
_08016ECC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08016EFA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08016EFA:
	b _0801743C
_08016EFC:
	ldr r0, [r7]
	bl sub_80097BC
	movs r1, #0xe0
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
_08016F34:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bls _08016FC8
	movs r0, #0xc
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0xc0
	lsls r3, r3, #5
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x64
	ldrb r4, [r5]
	adds r6, r4, #0
	lsls r5, r6, #4
	subs r5, r5, r4
	lsls r4, r5, #2
	adds r5, r4, #0
	adds r5, #0x3c
	str r5, [sp]
	ldr r4, _08016FCC @ =0x000001B9
	str r4, [sp, #4]
	movs r4, #0x63
	str r4, [sp, #8]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	ldrh r4, [r5, #0x12]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08016FC8:
	b _0801743C
	.align 2, 0
_08016FCC: .4byte 0x000001B9
_08016FD0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017024
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801700C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08017024
_0801700C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017024:
	b _0801743C
_08017026:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _0801705C @ =0x000001BF
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
	.align 2, 0
_0801705C: .4byte 0x000001BF
_08017060:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017118
	movs r0, #0xc
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0xc0
	lsls r3, r3, #5
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x64
	ldrb r4, [r5]
	adds r6, r4, #0
	lsls r5, r6, #4
	subs r5, r5, r4
	lsls r4, r5, #2
	adds r5, r4, #0
	adds r5, #0x3c
	str r5, [sp]
	movs r4, #0xdc
	lsls r4, r4, #1
	str r4, [sp, #4]
	movs r4, #0x63
	str r4, [sp, #8]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	ldrh r4, [r5, #0x12]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	beq _08017100
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08017118
_08017100:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017118:
	b _0801743C
_0801711A:
	movs r1, #0xdd
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
_08017182:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _080171B4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080171B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _080171D8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080171D8:
	b _0801743C
_080171DA:
	movs r1, #0xdd
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
_08017242:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017274
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08017274:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08017298
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017298:
	b _0801743C
_0801729A:
	ldr r1, _080172DC @ =0x000001BD
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
	.align 2, 0
_080172DC: .4byte 0x000001BD
_080172E0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801730E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801730E:
	b _0801743C
_08017310:
	movs r1, #0xdd
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
_08017362:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801743C
_08017390:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801743C
_080173AA:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801743C
_080173F6:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801743A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801743A:
	b _0801743C
_0801743C:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8017444
sub_8017444: @ 0x08017444
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xdd
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _0801750C @ =sub_80169CC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x68
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08017510
	.align 2, 0
_0801750C: .4byte sub_80169CC
_08017510:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8017518
sub_8017518: @ 0x08017518
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xdd
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _080175E0 @ =sub_80169CC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x6b
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080175E4
	.align 2, 0
_080175E0: .4byte sub_80169CC
_080175E4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80175EC
sub_80175EC: @ 0x080175EC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xdd
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _080176AC @ =sub_80169CC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x69
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080176B0
	.align 2, 0
_080176AC: .4byte sub_80169CC
_080176B0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80176B8
sub_80176B8: @ 0x080176B8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xdd
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _08017778 @ =sub_80169CC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x6a
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801777C
	.align 2, 0
_08017778: .4byte sub_80169CC
_0801777C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8017784
sub_8017784: @ 0x08017784
	push {r4, r5, r7, lr}
	sub sp, #0x1c
	add r7, sp, #0x14
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8009000
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08017850
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x13
	beq _08017850
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x14
	beq _08017850
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x15
	beq _08017850
	movs r0, #0x39
	bl PlaySfx
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x56
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08017810
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x13
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08017850
_08017810:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x15
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	movs r1, #0x10
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017850
	ldr r0, _08017894 @ =0x00000177
	movs r1, #0xbe
	lsls r1, r1, #1
	bl sub_8006620
	bl sub_80009C0
	bl sub_8000C3C
_08017850:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x13
	bne _080178C0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldrb r0, [r1]
	cmp r0, #4
	bls _08017898
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080178BE
	.align 2, 0
_08017894: .4byte 0x00000177
_08017898:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x66
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_080178BE:
	b _080178D0
_080178C0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_080178D0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017902
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08017902:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x15
	bls _08017912
	bl _0801814C
_08017912:
	lsls r1, r0, #2
	ldr r2, _0801791C @ =_08017920
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0801791C: .4byte _08017920
_08017920: @ jump table
	.4byte _08017978 @ case 0
	.4byte _08017994 @ case 1
	.4byte _080179FC @ case 2
	.4byte _08017A92 @ case 3
	.4byte _08017AF8 @ case 4
	.4byte _08017B28 @ case 5
	.4byte _08017B64 @ case 6
	.4byte _08017C54 @ case 7
	.4byte _08017C84 @ case 8
	.4byte _08017CC6 @ case 9
	.4byte _08017D1C @ case 10
	.4byte _08017D74 @ case 11
	.4byte _08017DB8 @ case 12
	.4byte _08017E00 @ case 13
	.4byte _08017E30 @ case 14
	.4byte _08017E90 @ case 15
	.4byte _08017EE8 @ case 16
	.4byte _08017F48 @ case 17
	.4byte _08018014 @ case 18
	.4byte _08017FA0 @ case 19
	.4byte _08017FE4 @ case 20
	.4byte _08018126 @ case 21
_08017978:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0801814C
_08017994:
	ldr r0, [r7]
	bl sub_80097BC
	movs r1, #0xf0
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1e
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801814C
_080179FC:
	ldr r1, _08017A74 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017A40
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08017A40:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08017A90
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08017A78
	movs r1, #0xf0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	bne _08017A78
	b _08017A90
	.align 2, 0
_08017A74: .4byte 0x00000333
_08017A78:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017A90:
	b _0801814C
_08017A92:
	ldr r0, [r7]
	bl sub_80097BC
	movs r1, #0xf1
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #3
	bl sub_80070BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
_08017AF8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017B26
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017B26:
	b _0801814C
_08017B28:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _08017B60 @ =0x000001E1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
	.align 2, 0
_08017B60: .4byte 0x000001E1
_08017B64:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08017C4E
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #7
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	subs r2, #0x40
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08017C50 @ =0x000001DB
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x40
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08017C50 @ =0x000001DB
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	subs r2, #0x40
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _08017C50 @ =0x000001DB
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #0xfa
	lsls r4, r4, #1
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08017C4E:
	b _0801814C
	.align 2, 0
_08017C50: .4byte 0x000001DB
_08017C54:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017C82
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017C82:
	b _0801814C
_08017C84:
	movs r1, #0xef
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
_08017CC6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _08017D16
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08017CF0
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08017D18 @ =0x03001140
	movs r1, #1
	str r1, [r0]
_08017CF0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08017D16:
	b _0801814C
	.align 2, 0
_08017D18: .4byte 0x03001140
_08017D1C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017D72
	movs r1, #0xdc
	lsls r1, r1, #8
	adds r0, r1, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08017D5A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08017D72
_08017D5A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017D72:
	b _0801814C
_08017D74:
	ldr r1, _08017DB4 @ =0x000001DD
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
	.align 2, 0
_08017DB4: .4byte 0x000001DD
_08017DB8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _08017DFA
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _08017DFC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08017DFA:
	b _0801814C
	.align 2, 0
_08017DFC: .4byte 0x03001140
_08017E00:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08017E2E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017E2E:
	b _0801814C
_08017E30:
	movs r1, #0xee
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xf
	movs r1, #0x14
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
_08017E90:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017EC2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08017EC2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08017EE6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017EE6:
	b _0801814C
_08017EE8:
	movs r1, #0xee
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x19
	movs r1, #0x23
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
_08017F48:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017F7A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08017F7A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08017F9E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08017F9E:
	b _0801814C
_08017FA0:
	ldr r1, _08017FE0 @ =0x000001DF
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801814C
	.align 2, 0
_08017FE0: .4byte 0x000001DF
_08017FE4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08018012
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018012:
	b _0801814C
_08018014:
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _0801806E
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _08018032
	cmp r0, #1
	beq _0801804C
	b _0801806C
_08018032:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xe
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801806C
_0801804C:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801806C
_0801806C:
	b _08018124
_0801806E:
	movs r1, #0xf0
	lsls r1, r1, #9
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _0801810C
	movs r0, #4
	bl sub_8021B2C
	cmp r0, #2
	bgt _08018090
	cmp r0, #1
	bge _080180B0
	cmp r0, #0
	beq _08018096
	b _0801810A
_08018090:
	cmp r0, #3
	beq _080180CA
	b _0801810A
_08018096:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801810A
_080180B0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801810A
_080180CA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrh r0, [r1]
	cmp r0, #0
	bne _080180F0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018108
_080180F0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018108:
	b _0801810A
_0801810A:
	b _08018124
_0801810C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018124:
	b _0801814C
_08018126:
	ldr r1, _08018148 @ =0x000001DF
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801814C
	.align 2, 0
_08018148: .4byte 0x000001DF
_0801814C:
	add sp, #0x1c
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8018154
sub_8018154: @ 0x08018154
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _080181FC @ =sub_8017784
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x5c
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08018200
	.align 2, 0
_080181FC: .4byte sub_8017784
_08018200:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8018208
sub_8018208: @ 0x08018208
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _080182B0 @ =sub_8017784
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x5d
	bl sub_8009EA4
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _080182B4
	.align 2, 0
_080182B0: .4byte sub_8017784
_080182B4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80182BC
sub_80182BC: @ 0x080182BC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, _0801836C @ =0x03001110
	ldr r1, [r0]
	cmp r1, #1
	bne _0801838C
	ldr r0, [r7]
	bl sub_8009000
	cmp r0, #0
	beq _0801838C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _0801838C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x56
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, _08018370 @ =0x03000EE8
	ldr r3, [r1]
	adds r2, r3, #0
	adds r1, r3, #0
	adds r1, #0x46
	adds r2, r0, #0
	adds r0, #0x51
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x52
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08018374
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801838C
	.align 2, 0
_0801836C: .4byte 0x03001110
_08018370: .4byte 0x03000EE8
_08018374:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801838C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #0
	beq _080183D0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x52
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x52
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _080183EC @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x51
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
_080183D0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x13
	bls _080183E0
	bl _08018AE2
_080183E0:
	lsls r1, r0, #2
	ldr r2, _080183F0 @ =_080183F4
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080183EC: .4byte 0x00000333
_080183F0: .4byte _080183F4
_080183F4: @ jump table
	.4byte _08018444 @ case 0
	.4byte _0801855E @ case 1
	.4byte _080185C8 @ case 2
	.4byte _0801845E @ case 3
	.4byte _080184C8 @ case 4
	.4byte _0801864C @ case 5
	.4byte _08018690 @ case 6
	.4byte _080186E8 @ case 7
	.4byte _08018740 @ case 8
	.4byte _08018784 @ case 9
	.4byte _080187CC @ case 10
	.4byte _080187FC @ case 11
	.4byte _0801885C @ case 12
	.4byte _080188B4 @ case 13
	.4byte _08018914 @ case 14
	.4byte _080189DE @ case 15
	.4byte _0801896C @ case 16
	.4byte _080189AE @ case 17
	.4byte _08018A9C @ case 18
	.4byte _08018AE0 @ case 19
_08018444:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018AE2
_0801845E:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r1, _080184C4 @ =0x00000189
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1e
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
	.align 2, 0
_080184C4: .4byte 0x00000189
_080184C8:
	ldr r1, _08018540 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801850C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801850C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801855C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08018544
	movs r1, #0xf0
	lsls r1, r1, #7
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	bne _08018544
	b _0801855C
	.align 2, 0
_08018540: .4byte 0x00000333
_08018544:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801855C:
	b _08018AE2
_0801855E:
	ldr r0, [r7]
	bl sub_8009804
	ldr r1, _080185C4 @ =0x00000189
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1e
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
	.align 2, 0
_080185C4: .4byte 0x00000189
_080185C8:
	ldr r1, _08018648 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801860C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801860C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08018646
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08018646
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018646:
	b _08018AE2
	.align 2, 0
_08018648: .4byte 0x00000333
_0801864C:
	ldr r1, _0801868C @ =0x00000187
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
	.align 2, 0
_0801868C: .4byte 0x00000187
_08018690:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _080186E0
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _080186BA
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _080186E4 @ =0x03001140
	movs r1, #1
	str r1, [r0]
_080186BA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_080186E0:
	b _08018AE2
	.align 2, 0
_080186E4: .4byte 0x03001140
_080186E8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801873E
	movs r1, #0x8c
	lsls r1, r1, #8
	adds r0, r1, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08018726
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801873E
_08018726:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801873E:
	b _08018AE2
_08018740:
	ldr r1, _08018780 @ =0x00000183
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
	.align 2, 0
_08018780: .4byte 0x00000183
_08018784:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #4
	bne _080187C6
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_8002E04
	ldr r0, _080187C8 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_080187C6:
	b _08018AE2
	.align 2, 0
_080187C8: .4byte 0x03001140
_080187CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080187FA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080187FA:
	b _08018AE2
_080187FC:
	movs r1, #0xc1
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xf
	movs r1, #0x14
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
_0801885C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801888E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801888E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _080188B2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080188B2:
	b _08018AE2
_080188B4:
	movs r1, #0xc1
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x19
	movs r1, #0x23
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
_08018914:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08018946
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08018946:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801896A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801896A:
	b _08018AE2
_0801896C:
	movs r1, #0xc4
	lsls r1, r1, #1
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018AE2
_080189AE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080189DC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080189DC:
	b _08018AE2
_080189DE:
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08018A38
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _080189FC
	cmp r0, #1
	beq _08018A16
	b _08018A36
_080189FC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018A36
_08018A16:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018A36
_08018A36:
	b _08018A9A
_08018A38:
	movs r1, #0xf0
	lsls r1, r1, #9
	ldr r0, [r7]
	bl sub_8009380
	cmp r0, #0
	beq _08018A60
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018A9A
_08018A60:
	movs r0, #4
	bl sub_8021B2C
	cmp r0, #0
	bne _08018A82
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018A82:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018A9A:
	b _08018AE2
_08018A9C:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0xa
	ldr r1, [r7, #0xc]
	bl sub_8018D8C
	str r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	subs r0, #0xa
	ldr r1, [r7, #0xc]
	bl sub_8018D8C
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8009E24
	ldr r0, [r7]
	bl sub_8009DC4
	b _08018AE2
_08018AE0:
	b _08018AE2
_08018AE2:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8018AEC
sub_8018AEC: @ 0x08018AEC
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r0, _08018B60 @ =0x03001110
	ldr r1, [r0]
	cmp r1, #2
	bne _08018B7C
	ldr r0, [r7]
	bl sub_8009000
	cmp r0, #0
	beq _08018B7C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _08018B7C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x56
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x56
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08018B64
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018B7C
	.align 2, 0
_08018B60: .4byte 0x03001110
_08018B64:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018B7C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x13
	bls _08018B8A
	b _08018D82
_08018B8A:
	lsls r1, r0, #2
	ldr r2, _08018B94 @ =_08018B98
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08018B94: .4byte _08018B98
_08018B98: @ jump table
	.4byte _08018BE8 @ case 0
	.4byte _08018C02 @ case 1
	.4byte _08018C68 @ case 2
	.4byte _08018D82 @ case 3
	.4byte _08018D82 @ case 4
	.4byte _08018D82 @ case 5
	.4byte _08018D82 @ case 6
	.4byte _08018D82 @ case 7
	.4byte _08018D82 @ case 8
	.4byte _08018D82 @ case 9
	.4byte _08018D82 @ case 10
	.4byte _08018D82 @ case 11
	.4byte _08018D82 @ case 12
	.4byte _08018D82 @ case 13
	.4byte _08018D82 @ case 14
	.4byte _08018D82 @ case 15
	.4byte _08018D82 @ case 16
	.4byte _08018D82 @ case 17
	.4byte _08018CEC @ case 18
	.4byte _08018D80 @ case 19
_08018BE8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08018D82
_08018C02:
	ldr r0, [r7]
	bl sub_8009804
	movs r1, #0x95
	lsls r1, r1, #2
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x1e
	movs r1, #0x3c
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08018D82
_08018C68:
	ldr r1, _08018CE8 @ =0x00000333
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08018CAC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08018CAC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08018CE6
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08018CE6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08018CE6:
	b _08018D82
	.align 2, 0
_08018CE8: .4byte 0x00000333
_08018CEC:
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _08018D4E
	ldr r0, _08018D24 @ =0x030011A8
	ldr r1, [r0]
	ldr r0, _08018D28 @ =0x0000270F
	cmp r1, r0
	bgt _08018D2C
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #1
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldr r2, [r7]
	ldrb r3, [r2, #0x17]
	str r3, [sp, #8]
	movs r2, #3
	movs r3, #1
	bl sub_8009B70
	b _08018D4E
	.align 2, 0
_08018D24: .4byte 0x030011A8
_08018D28: .4byte 0x0000270F
_08018D2C:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	movs r2, #1
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldr r2, [r7]
	ldrb r3, [r2, #0x17]
	str r3, [sp, #8]
	movs r2, #5
	movs r3, #1
	bl sub_8009B70
_08018D4E:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_8009E24
	ldr r0, [r7]
	bl sub_8009DC4
	ldr r1, _08018D7C @ =0x030010F8
	ldr r0, _08018D7C @ =0x030010F8
	ldr r1, _08018D7C @ =0x030010F8
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _08018D7C @ =0x030010F8
	ldr r1, [r0]
	movs r0, #2
	bl sub_8004010
	b _08018D82
	.align 2, 0
_08018D7C: .4byte 0x030010F8
_08018D80:
	b _08018D82
_08018D82:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8018D8C
sub_8018D8C: @ 0x08018D8C
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r4, [r7, #8]
	movs r0, #8
	bl sub_8021B2C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8020E18
	ldr r0, [r7, #8]
	ldr r1, _08018E18 @ =sub_8018AEC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _08018E1C
	.align 2, 0
_08018E18: .4byte sub_8018AEC
_08018E1C:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8018E24
sub_8018E24: @ 0x08018E24
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xc1
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r0, [r7, #0xc]
	ldr r1, _08018ED8 @ =sub_80182BC
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #3
	bl sub_8021B2C
	cmp r0, #1
	beq _08018EE4
	cmp r0, #1
	bgt _08018EDC
	cmp r0, #0
	beq _08018EE2
	b _08018EFC
	.align 2, 0
_08018ED8: .4byte sub_80182BC
_08018EDC:
	cmp r0, #2
	beq _08018EF0
	b _08018EFC
_08018EE2:
	b _08018EFC
_08018EE4:
	ldr r0, [r7, #0xc]
	movs r1, #0xc2
	lsls r1, r1, #1
	bl sub_8020DDC
	b _08018EFC
_08018EF0:
	ldr r0, [r7, #0xc]
	movs r1, #0xc3
	lsls r1, r1, #1
	bl sub_8020DDC
	b _08018EFC
_08018EFC:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08018F02
_08018F02:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8018F0C
sub_8018F0C: @ 0x08018F0C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r1, [r2]
	strb r1, [r0]
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08018F68
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	beq _08018F68
	ldr r0, [r7]
	adds r1, r7, #4
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08018F68:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x14
	bne _08018F9A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x65
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x65
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08018F9A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #6
	beq _08018FB4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x17
	beq _08018FB4
	b _08018FC4
_08018FB4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_08018FC4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #2
	bls _08019008
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019008:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1d
	bls _08019018
	bl _08019B90
_08019018:
	lsls r1, r0, #2
	ldr r2, _08019024 @ =_08019028
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08019024: .4byte _08019028
_08019028: @ jump table
	.4byte _080191D0 @ case 0
	.4byte _080190A0 @ case 1
	.4byte _080191EC @ case 2
	.4byte _0801923A @ case 3
	.4byte _080192B2 @ case 4
	.4byte _08019300 @ case 5
	.4byte _08019348 @ case 6
	.4byte _08019392 @ case 7
	.4byte _08019414 @ case 8
	.4byte _08019470 @ case 9
	.4byte _080194AE @ case 10
	.4byte _080194F6 @ case 11
	.4byte _0801957C @ case 12
	.4byte _080195BA @ case 13
	.4byte _08019602 @ case 14
	.4byte _08019688 @ case 15
	.4byte _080196C6 @ case 16
	.4byte _08019732 @ case 17
	.4byte _0801978A @ case 18
	.4byte _080197F6 @ case 19
	.4byte _0801984E @ case 20
	.4byte _080198B4 @ case 21
	.4byte _080198E4 @ case 22
	.4byte _0801990C @ case 23
	.4byte _08019954 @ case 24
	.4byte _080199A0 @ case 25
	.4byte _080199DE @ case 26
	.4byte _08019A2A @ case 27
	.4byte _08019A7E @ case 28
	.4byte _08019ACA @ case 29
_080190A0:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08019134
	movs r0, #6
	bl sub_8021B2C
	cmp r0, #4
	bgt _080190C6
	cmp r0, #1
	bge _080190E6
	cmp r0, #0
	beq _080190CC
	b _0801911A
_080190C6:
	cmp r0, #5
	beq _08019100
	b _0801911A
_080190CC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019132
_080190E6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019132
_08019100:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019132
_0801911A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019132:
	b _080191CC
_08019134:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080191B4
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08019170
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080191B2
_08019170:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0801919A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _080191B2
_0801919A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080191B2:
	b _080191CC
_080191B4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080191CC:
	bl _08019B90
_080191D0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _08019B90
_080191EC:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08019B90
_0801923A:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0801926C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801926C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08019296
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _08019296
	b _080192AE
_08019296:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080192AE:
	bl _08019B90
_080192B2:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08019B90
_08019300:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08019344
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019344:
	bl _08019B90
_08019348:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _08019B90
_08019392:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _08019410
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _080193F0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _080193EC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019410
	.align 2, 0
_080193EC: .4byte 0x03001140
_080193F0:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08019410:
	bl _08019B90
_08019414:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801946C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08019454
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801946C
_08019454:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801946C:
	bl _08019B90
_08019470:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08019494
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _080194AC
	b _08019494
_08019494:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080194AC:
	b _08019B90
_080194AE:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_080194F6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801957A
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08019554
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _08019550 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801957A
	.align 2, 0
_08019550: .4byte 0x03001140
_08019554:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801957A:
	b _08019B90
_0801957C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080195A0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _080195B8
	b _080195A0
_080195A0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080195B8:
	b _08019B90
_080195BA:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_08019602:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08019686
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08019660
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801965C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019686
	.align 2, 0
_0801965C: .4byte 0x03001140
_08019660:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08019686:
	b _08019B90
_08019688:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080196AC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _080196C4
	b _080196AC
_080196AC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080196C4:
	b _08019B90
_080196C6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_08019732:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08019764
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08019764:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _08019788
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019788:
	b _08019B90
_0801978A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_080197F6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _08019828
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08019828:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801984C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801984C:
	b _08019B90
_0801984E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08019886
_08019870:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0xB8, 0x60, 0x0C, 0x48, 0x39, 0x1C
	.byte 0x08, 0x31, 0x08, 0xF0, 0x01, 0xFD
_08019886:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
	.align 2, 0
_080198B0:
	.byte 0xE8, 0x2E, 0x03, 0x08
_080198B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080198E2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080198E2:
	b _08019B90
_080198E4:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _08019B90
_0801990C:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_08019954:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _08019998
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801999C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08019998:
	b _08019B90
	.align 2, 0
_0801999C: .4byte 0x03001140
_080199A0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080199C4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _080199DC
	b _080199C4
_080199C4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1a
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080199DC:
	b _08019B90
_080199DE:
	ldr r0, [r7]
	bl sub_8009824
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_08019A2A:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08019A7C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08019A7C:
	b _08019B90
_08019A7E:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08019B90
_08019ACA:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08019B72
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #1
	bls _08019B32
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _08019B70
_08019B32:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019B70:
	b _08019B8E
_08019B72:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
_08019B8E:
	b _08019B90
_08019B90:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8019B98
sub_8019B98: @ 0x08019B98
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08019C48 @ =0x000002BE
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x3d
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08019C4C @ =0x08032ED0
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08019C50 @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08019C54
	.align 2, 0
_08019C48: .4byte 0x000002BE
_08019C4C: .4byte 0x08032ED0
_08019C50: .4byte sub_800DBB8
_08019C54:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8019C5C
sub_8019C5C: @ 0x08019C5C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08019CF4 @ =0x000002BE
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x3e
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08019CF8 @ =0x08032ED0
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	movs r1, #0xb0
	lsls r1, r1, #2
	bl sub_8020DDC
	ldr r0, [r7, #0xc]
	ldr r1, _08019CFC @ =sub_800DBB8
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08019D00
	.align 2, 0
_08019CF4: .4byte 0x000002BE
_08019CF8: .4byte 0x08032ED0
_08019CFC: .4byte sub_800DBB8
_08019D00:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8019D08
sub_8019D08: @ 0x08019D08
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xc1
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x7e
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08019D98 @ =0x08032F14
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _08019D9C @ =sub_800D1C4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08019DA0
	.align 2, 0
_08019D98: .4byte 0x08032F14
_08019D9C: .4byte sub_800D1C4
_08019DA0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8019DA8
sub_8019DA8: @ 0x08019DA8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_8019D08
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x7f
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _08019DD8 @ =0x00000185
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _08019DDC
	.align 2, 0
_08019DD8: .4byte 0x00000185
_08019DDC:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8019DE4
sub_8019DE4: @ 0x08019DE4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1d
	bls _08019E08
	bl _0801A98E
_08019E08:
	lsls r1, r0, #2
	ldr r2, _08019E14 @ =_08019E18
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08019E14: .4byte _08019E18
_08019E18: @ jump table
	.4byte _08019FA0 @ case 0
	.4byte _08019E90 @ case 1
	.4byte _08019FBC @ case 2
	.4byte _0801A00A @ case 3
	.4byte _0801A082 @ case 4
	.4byte _0801A0D0 @ case 5
	.4byte _0801A118 @ case 6
	.4byte _0801A162 @ case 7
	.4byte _0801A1E4 @ case 8
	.4byte _0801A240 @ case 9
	.4byte _0801A27E @ case 10
	.4byte _0801A2C6 @ case 11
	.4byte _0801A34C @ case 12
	.4byte _0801A38A @ case 13
	.4byte _0801A3D2 @ case 14
	.4byte _0801A458 @ case 15
	.4byte _0801A496 @ case 16
	.4byte _0801A502 @ case 17
	.4byte _0801A55A @ case 18
	.4byte _0801A5C6 @ case 19
	.4byte _0801A61E @ case 20
	.4byte _0801A680 @ case 21
	.4byte _0801A6B0 @ case 22
	.4byte _0801A6D8 @ case 23
	.4byte _0801A720 @ case 24
	.4byte _0801A76C @ case 25
	.4byte _0801A7AA @ case 26
	.4byte _0801A7F6 @ case 27
	.4byte _0801A84A @ case 28
	.4byte _0801A896 @ case 29
_08019E90:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08019F04
	movs r0, #6
	bl sub_8021B2C
	cmp r0, #0
	beq _08019EB6
	cmp r0, #0
	blt _08019EEA
	cmp r0, #5
	bgt _08019EEA
	b _08019ED0
_08019EB6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019F02
_08019ED0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019F02
_08019EEA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019F02:
	b _08019F9C
_08019F04:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _08019F84
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x28]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08019F40
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019F82
_08019F40:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x2c]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _08019F6A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _08019F82
_08019F6A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019F82:
	b _08019F9C
_08019F84:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08019F9C:
	bl _0801A98E
_08019FA0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0801A98E
_08019FBC:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801A98E
_0801A00A:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0801A03C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A03C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801A066
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0801A066
	b _0801A07E
_0801A066:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A07E:
	bl _0801A98E
_0801A082:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801A98E
_0801A0D0:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801A114
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A114:
	bl _0801A98E
_0801A118:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801A98E
_0801A162:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801A1E0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801A1C0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801A1BC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A1E0
	.align 2, 0
_0801A1BC: .4byte 0x03001140
_0801A1C0:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801A1E0:
	bl _0801A98E
_0801A1E4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801A23C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0801A224
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801A23C
_0801A224:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A23C:
	bl _0801A98E
_0801A240:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801A264
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801A27C
	b _0801A264
_0801A264:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A27C:
	b _0801A98E
_0801A27E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A2C6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801A34A
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801A324
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801A320 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A34A
	.align 2, 0
_0801A320: .4byte 0x03001140
_0801A324:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801A34A:
	b _0801A98E
_0801A34C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801A370
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801A388
	b _0801A370
_0801A370:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A388:
	b _0801A98E
_0801A38A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A3D2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801A456
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801A430
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801A42C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A456
	.align 2, 0
_0801A42C: .4byte 0x03001140
_0801A430:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801A456:
	b _0801A98E
_0801A458:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801A47C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801A494
	b _0801A47C
_0801A47C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A494:
	b _0801A98E
_0801A496:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A502:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801A534
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801A534:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801A558
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A558:
	b _0801A98E
_0801A55A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A5C6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801A5F8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801A5F8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801A61C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A61C:
	b _0801A98E
_0801A61E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801A654
_0801A640:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D
	.byte 0x07, 0xF0, 0x1A, 0xFE
_0801A654:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A67C:
	.byte 0x4C, 0x2F, 0x03, 0x08
_0801A680:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801A6AE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A6AE:
	b _0801A98E
_0801A6B0:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801A98E
_0801A6D8:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A720:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801A764
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801A768 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801A764:
	b _0801A98E
	.align 2, 0
_0801A768: .4byte 0x03001140
_0801A76C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801A790
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801A7A8
	b _0801A790
_0801A790:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1a
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A7A8:
	b _0801A98E
_0801A7AA:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A7F6:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801A848
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801A848:
	b _0801A98E
_0801A84A:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801A98E
_0801A896:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801A92E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #1
	bls _0801A8DE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801A91C
_0801A8DE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801A91C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801A98C
_0801A92E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x65
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x65
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #0x1e
	bls _0801A976
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_80097BC
_0801A976:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
_0801A98C:
	b _0801A98E
_0801A98E:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801A998
sub_801A998: @ 0x0801A998
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r1, #0xe5
	lsls r1, r1, #1
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x63
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801AA48 @ =0x08032F34
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0801AA4C @ =sub_8019DE4
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801AA50
	.align 2, 0
_0801AA48: .4byte 0x08032F34
_0801AA4C: .4byte sub_8019DE4
_0801AA50:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801AA58
sub_801AA58: @ 0x0801AA58
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_801A998
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x64
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	movs r1, #0xe6
	lsls r1, r1, #1
	bl sub_8020DDC
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801AA8A
_0801AA8A:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801AA94
sub_801AA94: @ 0x0801AA94
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	movs r2, #0xd
	movs r3, #7
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _0801AAD0
	movs r1, #0x89
	lsls r1, r1, #1
	movs r0, #8
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	ldr r0, [r7]
	ldrb r2, [r0, #0x17]
	str r2, [sp, #8]
	movs r0, #0xf7
	movs r2, #0
	movs r3, #8
	bl sub_8009B70
_0801AAD0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0xd
	bls _0801AADE
	b _0801AF38
_0801AADE:
	lsls r1, r0, #2
	ldr r2, _0801AAE8 @ =_0801AAEC
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0801AAE8: .4byte _0801AAEC
_0801AAEC: @ jump table
	.4byte _0801AC4A @ case 0
	.4byte _0801AC30 @ case 1
	.4byte _0801AC64 @ case 2
	.4byte _0801ACB0 @ case 3
	.4byte _0801AB24 @ case 4
	.4byte _0801AB64 @ case 5
	.4byte _0801AC00 @ case 6
	.4byte _0801ACF6 @ case 7
	.4byte _0801AD62 @ case 8
	.4byte _0801ADBA @ case 9
	.4byte _0801AE26 @ case 10
	.4byte _0801AE7E @ case 11
	.4byte _0801AEE0 @ case 12
	.4byte _0801AF10 @ case 13
_0801AB24:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	movs r1, #4
	bl sub_8020E18
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801AF48
_0801AB64:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #6
	bne _0801ABF6
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_801B254
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _0801ABF8 @ =0x00000533
	str r1, [r0, #0x64]
	ldr r0, [r7, #4]
	movs r1, #0xc0
	lsls r1, r1, #3
	str r1, [r0, #0x68]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_801B254
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0, #0x64]
	ldr r0, [r7, #4]
	movs r1, #0xc0
	lsls r1, r1, #3
	str r1, [r0, #0x68]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	bl sub_801B254
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _0801ABFC @ =0xFFFFFACD
	str r1, [r0, #0x64]
	ldr r0, [r7, #4]
	movs r1, #0xc0
	lsls r1, r1, #3
	str r1, [r0, #0x68]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801ABF6:
	b _0801AF48
	.align 2, 0
_0801ABF8: .4byte 0x00000533
_0801ABFC: .4byte 0xFFFFFACD
_0801AC00:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801AC2E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #9
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801AC2E:
	b _0801AF48
_0801AC30:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801AF48
_0801AC4A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801AF48
_0801AC64:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801AF48
_0801ACB0:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801ACF4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801ACF4:
	b _0801AF48
_0801ACF6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801AF48
_0801AD62:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801AD94
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801AD94:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801ADB8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801ADB8:
	b _0801AF48
_0801ADBA:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801AF48
_0801AE26:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801AE58
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801AE58:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801AE7C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801AE7C:
	b _0801AF48
_0801AE7E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801AEB4
_0801AEA0:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D
	.byte 0x07, 0xF0, 0xEA, 0xF9
_0801AEB4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801AF48
_0801AEDC:
	.byte 0x88, 0x2F, 0x03, 0x08
_0801AEE0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801AF0E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801AF0E:
	b _0801AF48
_0801AF10:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801AF48
_0801AF38:
	ldr r1, _0801AF44 @ =0x08032F98
	adds r0, r1, #0
	bl sub_8022288
	b _0801AF48
	.align 2, 0
_0801AF44: .4byte 0x08032F98
_0801AF48:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801AF50
sub_801AF50: @ 0x0801AF50
	push {r4, r7, lr}
	sub sp, #0x28
	add r7, sp, #0x10
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801AF72
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801AF72
	b _0801AFAE
_0801AF72:
	ldr r0, [r7]
	ldr r2, _0801AF90 @ =0x03000EE8
	ldr r1, [r2]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	cmp r0, r1
	ble _0801AF94
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x64]
	adds r1, r2, #0
	subs r1, #0xf
	str r1, [r0, #0x64]
	b _0801AFAE
	.align 2, 0
_0801AF90: .4byte 0x03000EE8
_0801AF94:
	ldr r0, [r7]
	ldr r2, _0801AFC8 @ =0x03000EE8
	ldr r1, [r2]
	ldr r0, [r0, #0x30]
	ldr r1, [r1, #0x30]
	cmp r0, r1
	bge _0801AFAE
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x64]
	adds r1, r2, #0
	adds r1, #0xf
	str r1, [r0, #0x64]
_0801AFAE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801AFCC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #2
	beq _0801AFCC
	b _0801AFE2
	.align 2, 0
_0801AFC8: .4byte 0x03000EE8
_0801AFCC:
	ldr r0, [r7]
	ldr r1, [r0, #0x68]
	ldr r0, _0801AFF8 @ =0xFFFFFA00
	cmp r1, r0
	ble _0801AFE2
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x68]
	adds r1, r2, #0
	subs r1, #0x14
	str r1, [r0, #0x68]
_0801AFE2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801B03C
	cmp r0, #1
	bgt _0801AFFC
	cmp r0, #0
	beq _0801B002
	b _0801B0AA
	.align 2, 0
_0801AFF8: .4byte 0xFFFFFA00
_0801AFFC:
	cmp r0, #2
	beq _0801B090
	b _0801B0AA
_0801B002:
	ldr r0, [r7]
	ldr r2, _0801B038 @ =0x03000EE8
	ldr r1, [r2]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x34]
	cmp r0, r1
	ble _0801B036
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801B036:
	b _0801B0AA
	.align 2, 0
_0801B038: .4byte 0x03000EE8
_0801B03C:
	ldr r0, [r7]
	ldr r2, _0801B088 @ =0x03000EE8
	ldr r1, [r2]
	ldr r2, [r1, #0x34]
	ldr r3, _0801B08C @ =0xFFFFE800
	adds r1, r2, r3
	ldr r0, [r0, #0x34]
	cmp r0, r1
	bge _0801B084
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0801B084:
	b _0801B0AA
	.align 2, 0
_0801B088: .4byte 0x03000EE8
_0801B08C: .4byte 0xFFFFE800
_0801B090:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	cmp r1, #0
	bge _0801B0A8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0801B0A8:
	b _0801B0AA
_0801B0AA:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x30]
	ldr r2, [r2, #0x64]
	adds r1, r1, r2
	str r1, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r1, [r1, #0x34]
	ldr r2, [r2, #0x68]
	adds r1, r1, r2
	str r1, [r0, #0x34]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801B1AC
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #8]
	ldr r1, _0801B1A0 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	str r0, [r7, #0xc]
	ldr r1, _0801B1A0 @ =0x03000EE8
	ldr r0, [r1]
	ldr r1, [r0, #0x34]
	asrs r0, r1, #0xa
	str r0, [r7, #0x10]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	subs r0, #9
	ldr r2, [r7, #8]
	adds r1, r2, #0
	subs r1, #8
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r2, #9
	ldr r4, [r7, #8]
	adds r3, r4, #4
	ldr r4, [r7, #0xc]
	str r4, [sp]
	ldr r4, [r7, #0x10]
	str r4, [sp, #4]
	ldr r4, [r7, #0xc]
	str r4, [sp, #8]
	ldr r4, [r7, #0x10]
	str r4, [sp, #0xc]
	bl sub_8009D80
	cmp r0, #0
	beq _0801B19C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0801B1A4 @ =0x0000022F
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x14]
	movs r0, #0x3c
	bl PlaySfx
	ldr r0, [r7, #0x14]
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	str r2, [r0, #0x30]
	ldr r0, [r7, #0x14]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	str r2, [r0, #0x34]
	ldr r0, [r7, #0x14]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	ldr r1, _0801B1A8 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x70
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_8002E04
_0801B19C:
	b _0801B242
	.align 2, 0
_0801B1A0: .4byte 0x03000EE8
_0801B1A4: .4byte 0x0000022F
_0801B1A8: .4byte sub_80142EC
_0801B1AC:
	ldr r0, [r7]
	bl sub_8009324
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _0801B242
	ldr r0, [r7, #0x14]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x70
	adds r2, r0, #0
	adds r0, #0x58
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _0801B24C @ =0x0000022F
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0x10]
	movs r0, #0x3c
	bl PlaySfx
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	str r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	str r2, [r0, #0x34]
	ldr r0, [r7, #0x10]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x10]
	ldr r1, _0801B250 @ =sub_80142EC
	str r1, [r0, #0x4c]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0801B242:
	add sp, #0x28
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B24C: .4byte 0x0000022F
_0801B250: .4byte sub_80142EC

	thumb_func_start sub_801B254
sub_801B254: @ 0x0801B254
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _0801B304 @ =0x0000027E
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #8]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #8]
	ldr r1, _0801B308 @ =sub_801AF50
	str r1, [r0, #0x4c]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x6f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x70
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x78
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _0801B30C
	.align 2, 0
_0801B304: .4byte 0x0000027E
_0801B308: .4byte sub_801AF50
_0801B30C:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801B314
sub_801B314: @ 0x0801B314
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0801B3B0 @ =0x08032F70
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x4c
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801B3B0 @ =0x08032F70
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0801B3B4 @ =sub_801AA94
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_80098B4
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801B3B8
	.align 2, 0
_0801B3B0: .4byte 0x08032F70
_0801B3B4: .4byte sub_801AA94
_0801B3B8:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801B3C0
sub_801B3C0: @ 0x0801B3C0
	push {r4, r5, r7, lr}
	sub sp, #0x20
	add r7, sp, #0x14
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1a
	bls _0801B3E4
	bl _0801BE0A
_0801B3E4:
	lsls r1, r0, #2
	ldr r2, _0801B3F0 @ =_0801B3F4
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0801B3F0: .4byte _0801B3F4
_0801B3F4: @ jump table
	.4byte _0801B536 @ case 0
	.4byte _0801B460 @ case 1
	.4byte _0801B552 @ case 2
	.4byte _0801B5A0 @ case 3
	.4byte _0801B618 @ case 4
	.4byte _0801B666 @ case 5
	.4byte _0801B6AE @ case 6
	.4byte _0801B6F8 @ case 7
	.4byte _0801B776 @ case 8
	.4byte _0801B7D0 @ case 9
	.4byte _0801B80E @ case 10
	.4byte _0801B856 @ case 11
	.4byte _0801B8DC @ case 12
	.4byte _0801B91A @ case 13
	.4byte _0801B962 @ case 14
	.4byte _0801B9E8 @ case 15
	.4byte _0801BA26 @ case 16
	.4byte _0801BA92 @ case 17
	.4byte _0801BAEA @ case 18
	.4byte _0801BB56 @ case 19
	.4byte _0801BBAE @ case 20
	.4byte _0801BC10 @ case 21
	.4byte _0801BC40 @ case 22
	.4byte _0801BC68 @ case 23
	.4byte _0801BCA6 @ case 24
	.4byte _0801BDBC @ case 25
	.4byte _0801BDF0 @ case 26
_0801B460:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801B4C2
	movs r0, #5
	bl sub_8021B2C
	cmp r0, #0
	beq _0801B486
	cmp r0, #0
	blt _0801B4C0
	cmp r0, #3
	bgt _0801B4C0
	b _0801B4A0
_0801B486:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801B4C0
_0801B4A0:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801B4C0
_0801B4C0:
	b _0801B532
_0801B4C2:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801B51A
	movs r0, #2
	bl sub_8021B2C
	cmp r0, #0
	beq _0801B4E4
	cmp r0, #1
	beq _0801B4FE
	b _0801B518
_0801B4E4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801B518
_0801B4FE:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801B518
_0801B518:
	b _0801B532
_0801B51A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B532:
	bl _0801BE0A
_0801B536:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0801BE0A
_0801B552:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801BE0A
_0801B5A0:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0801B5D2
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B5D2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801B5FC
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0801B5FC
	b _0801B614
_0801B5FC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B614:
	bl _0801BE0A
_0801B618:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801BE0A
_0801B666:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801B6AA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B6AA:
	bl _0801BE0A
_0801B6AE:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801BE0A
_0801B6F8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801B774
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801B754
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801B750 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801B774
	.align 2, 0
_0801B750: .4byte 0x03001140
_0801B754:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801B774:
	b _0801BE0A
_0801B776:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801B7CE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0801B7B6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801B7CE
_0801B7B6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B7CE:
	b _0801BE0A
_0801B7D0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801B7F4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801B80C
	b _0801B7F4
_0801B7F4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B80C:
	b _0801BE0A
_0801B80E:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801BE0A
_0801B856:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801B8DA
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801B8B4
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801B8B0 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801B8DA
	.align 2, 0
_0801B8B0: .4byte 0x03001140
_0801B8B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801B8DA:
	b _0801BE0A
_0801B8DC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801B900
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801B918
	b _0801B900
_0801B900:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801B918:
	b _0801BE0A
_0801B91A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801BE0A
_0801B962:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801B9E6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801B9C0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801B9BC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801B9E6
	.align 2, 0
_0801B9BC: .4byte 0x03001140
_0801B9C0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801B9E6:
	b _0801BE0A
_0801B9E8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801BA0C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801BA24
	b _0801BA0C
_0801BA0C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801BA24:
	b _0801BE0A
_0801BA26:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801BE0A
_0801BA92:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801BAC4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801BAC4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801BAE8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801BAE8:
	b _0801BE0A
_0801BAEA:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801BE0A
_0801BB56:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801BB88
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801BB88:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801BBAC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801BBAC:
	b _0801BE0A
_0801BBAE:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801BBE4
_0801BBD0:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0x78, 0x60, 0x0B, 0x48, 0x39, 0x1D
	.byte 0x06, 0xF0, 0x52, 0xFB
_0801BBE4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801BE0A
_0801BC0C:
	.byte 0xDC, 0x2F, 0x03, 0x08
_0801BC10:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801BC3E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801BC3E:
	b _0801BE0A
_0801BC40:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801BE0A
_0801BC68:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801BE0A
_0801BCA6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801BCB4
	b _0801BDB4
_0801BCB4:
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	asrs r1, r2, #0xa
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r4, r3, #5
	adds r2, r4, #0
	subs r2, #0x40
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0801BDB8 @ =0x00000295
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	ldrh r4, [r5, #0x12]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0x18
	bl sub_8021B2C
	adds r4, r0, #0
	ldr r0, [r7]
	bl sub_800950C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x46
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #5
	adds r2, r1, #0
	subs r2, #0x40
	muls r0, r4, r0
	subs r2, r2, r0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	asrs r0, r1, #0xa
	ldr r1, [r7]
	ldr r3, [r1, #0x34]
	asrs r1, r3, #0xa
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x78
	str r4, [sp]
	ldr r4, _0801BDB8 @ =0x00000295
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	ldr r4, [r7]
	ldr r5, [r4, #0x5c]
	ldrh r4, [r5, #0x12]
	str r4, [sp, #0xc]
	ldr r4, [r7]
	ldrb r5, [r4, #0x17]
	str r5, [sp, #0x10]
	bl sub_8013C18
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801BDB4:
	b _0801BE0A
	.align 2, 0
_0801BDB8: .4byte 0x00000295
_0801BDBC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bls _0801BDEE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801BDEE:
	b _0801BE0A
_0801BDF0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801BE0A
_0801BE0A:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BE14
sub_801BE14: @ 0x0801BE14
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0801BEA4 @ =0x00000291
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x49
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801BEA8 @ =0x08032FC4
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0801BEAC @ =sub_801B3C0
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801BEB0
	.align 2, 0
_0801BEA4: .4byte 0x00000291
_0801BEA8: .4byte 0x08032FC4
_0801BEAC: .4byte sub_801B3C0
_0801BEB0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801BEB8
sub_801BEB8: @ 0x0801BEB8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0801BF48 @ =0x00000291
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x4a
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801BF4C @ =0x08032FC4
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0801BF50 @ =sub_801B3C0
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801BF54
	.align 2, 0
_0801BF48: .4byte 0x00000291
_0801BF4C: .4byte 0x08032FC4
_0801BF50: .4byte sub_801B3C0
_0801BF54:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801BF5C
sub_801BF5C: @ 0x0801BF5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _0801BF70 @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7]
_0801BF68:
	ldr r0, [r7]
	cmp r0, #0
	bne _0801BF74
	b _0801BF90
	.align 2, 0
_0801BF70: .4byte 0x03001B4C
_0801BF74:
	ldr r0, [r7]
	ldr r1, [r0, #0x4c]
	ldr r0, _0801BF84 @ =sub_8013960
	cmp r1, r0
	bne _0801BF88
	movs r0, #1
	b _0801BF94
	.align 2, 0
_0801BF84: .4byte sub_8013960
_0801BF88:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7]
	b _0801BF68
_0801BF90:
	movs r0, #0
	b _0801BF94
_0801BF94:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801BF9C
sub_801BF9C: @ 0x0801BF9C
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x1e
	bls _0801BFD0
	bl _0801C9C6
_0801BFD0:
	lsls r1, r0, #2
	ldr r2, _0801BFDC @ =_0801BFE0
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0801BFDC: .4byte _0801BFE0
_0801BFE0: @ jump table
	.4byte _0801C0D0 @ case 0
	.4byte _0801C05C @ case 1
	.4byte _0801C0EC @ case 2
	.4byte _0801C13A @ case 3
	.4byte _0801C1B2 @ case 4
	.4byte _0801C200 @ case 5
	.4byte _0801C248 @ case 6
	.4byte _0801C292 @ case 7
	.4byte _0801C312 @ case 8
	.4byte _0801C36C @ case 9
	.4byte _0801C3AA @ case 10
	.4byte _0801C3F2 @ case 11
	.4byte _0801C478 @ case 12
	.4byte _0801C4B6 @ case 13
	.4byte _0801C4FE @ case 14
	.4byte _0801C584 @ case 15
	.4byte _0801C5C2 @ case 16
	.4byte _0801C62E @ case 17
	.4byte _0801C686 @ case 18
	.4byte _0801C6F2 @ case 19
	.4byte _0801C74A @ case 20
	.4byte _0801C7B0 @ case 21
	.4byte _0801C7E0 @ case 22
	.4byte _0801C808 @ case 23
	.4byte _0801C870 @ case 24
	.4byte _0801C8CC @ case 25
	.4byte _0801C9C6 @ case 26
	.4byte _0801C9C6 @ case 27
	.4byte _0801C9C6 @ case 28
	.4byte _0801C92A @ case 29
	.4byte _0801C98C @ case 30
_0801C05C:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801C088
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801C0CC
_0801C088:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801C0B4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801C0CC
_0801C0B4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C0CC:
	bl _0801C9C6
_0801C0D0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0801C9C6
_0801C0EC:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801C9C6
_0801C13A:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0801C16C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C16C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801C196
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0801C196
	b _0801C1AE
_0801C196:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C1AE:
	bl _0801C9C6
_0801C1B2:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801C9C6
_0801C200:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801C244
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C244:
	bl _0801C9C6
_0801C248:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801C9C6
_0801C292:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801C310
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801C2F0
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801C2EC @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C310
	.align 2, 0
_0801C2EC: .4byte 0x03001140
_0801C2F0:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801C310:
	b _0801C9C6
_0801C312:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801C36A
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0801C352
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801C36A
_0801C352:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C36A:
	b _0801C9C6
_0801C36C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801C390
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801C3A8
	b _0801C390
_0801C390:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C3A8:
	b _0801C9C6
_0801C3AA:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
_0801C3F2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801C476
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801C450
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801C44C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C476
	.align 2, 0
_0801C44C: .4byte 0x03001140
_0801C450:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801C476:
	b _0801C9C6
_0801C478:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801C49C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801C4B4
	b _0801C49C
_0801C49C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C4B4:
	b _0801C9C6
_0801C4B6:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
_0801C4FE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801C582
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801C55C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801C558 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C582
	.align 2, 0
_0801C558: .4byte 0x03001140
_0801C55C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801C582:
	b _0801C9C6
_0801C584:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801C5A8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801C5C0
	b _0801C5A8
_0801C5A8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C5C0:
	b _0801C9C6
_0801C5C2:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
_0801C62E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801C660
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801C660:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801C684
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C684:
	b _0801C9C6
_0801C686:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
_0801C6F2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801C724
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801C724:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801C748
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C748:
	b _0801C9C6
_0801C74A:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801C782
_0801C76C:
	.byte 0x39, 0x68, 0x08, 0x1C
	.byte 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0xF8, 0x60, 0x0C, 0x48, 0x39, 0x1C, 0x0C, 0x31, 0x05, 0xF0
	.byte 0x83, 0xFD
_0801C782:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
	.align 2, 0
_0801C7AC:
	.byte 0x50, 0x30, 0x03, 0x08
_0801C7B0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801C7DE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C7DE:
	b _0801C9C6
_0801C7E0:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_8009EE8
	b _0801C9C6
_0801C808:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
_0801C870:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801C8C4
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801C8C8 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801C8C4:
	b _0801C9C6
	.align 2, 0
_0801C8C8: .4byte 0x03001140
_0801C8CC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801C900
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801C928
	b _0801C900
_0801C900:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1d
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801C928:
	b _0801C9C6
_0801C92A:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _0801C988 @ =0x08033020
	movs r0, #5
	bl sub_8021B2C
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r1, r4, r0
	ldr r2, [r1]
	ldr r3, [r1, #4]
	str r2, [r7, #4]
	str r3, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801C9C6
	.align 2, 0
_0801C988: .4byte 0x08033020
_0801C98C:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801C9C6
_0801C9C6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x65
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x65
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #0x2d
	bls _0801CA08
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0801CA08:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x65
	ldrb r0, [r1]
	cmp r0, #2
	bhi _0801CA14
_0801CA14:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801CA1C
sub_801CA1C: @ 0x0801CA1C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0801CAE4 @ =0x00000283
	adds r0, r1, #0
	bl sub_80209F8
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	lsls r2, r1, #0xa
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	lsls r2, r1, #0xa
	str r2, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #0x17]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x17]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	bl sub_8020E18
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0x4b
	bl sub_8009EA4
	ldr r0, [r7, #0xc]
	ldr r1, _0801CAE8 @ =0x08033008
	str r1, [r0, #0x60]
	ldr r0, [r7, #0xc]
	ldr r1, _0801CAEC @ =sub_801BF9C
	str r1, [r0, #0x4c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x65
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0801CAF0
	.align 2, 0
_0801CAE4: .4byte 0x00000283
_0801CAE8: .4byte 0x08033008
_0801CAEC: .4byte sub_801BF9C
_0801CAF0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801CAF8
sub_801CAF8: @ 0x0801CAF8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _0801CB0C @ =0x03001B4C
	ldr r1, [r0]
	str r1, [r7]
_0801CB04:
	ldr r0, [r7]
	cmp r0, #0
	bne _0801CB10
	b _0801CB2C
	.align 2, 0
_0801CB0C: .4byte 0x03001B4C
_0801CB10:
	ldr r0, [r7]
	ldr r1, [r0, #0x4c]
	ldr r0, _0801CB20 @ =sub_8013960
	cmp r1, r0
	bne _0801CB24
	movs r0, #1
	b _0801CB30
	.align 2, 0
_0801CB20: .4byte sub_8013960
_0801CB24:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7]
	b _0801CB04
_0801CB2C:
	movs r0, #0
	b _0801CB30
_0801CB30:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801CB38
sub_801CB38: @ 0x0801CB38
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r1, [r2]
	strb r1, [r0]
	ldr r0, [r7]
	movs r1, #0x14
	movs r2, #0x16
	movs r3, #0x10
	bl sub_8008DC0
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #0x1f
	beq _0801CB6A
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _0801CB6A
	b _0801CB90
_0801CB6A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x16
	beq _0801CB90
	ldr r0, [r7]
	adds r1, r7, #4
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801CB90:
	bl sub_801CAF8
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801CBDA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801CBD8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CBD8:
	b _0801CBEA
_0801CBDA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0801CBEA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r0, [r1]
	cmp r0, #0x20
	bls _0801CBFA
	bl _0801D788
_0801CBFA:
	lsls r1, r0, #2
	ldr r2, _0801CC04 @ =_0801CC08
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0801CC04: .4byte _0801CC08
_0801CC08: @ jump table
	.4byte _0801CD00 @ case 0
	.4byte _0801CC8C @ case 1
	.4byte _0801CD1C @ case 2
	.4byte _0801CD6A @ case 3
	.4byte _0801CDE2 @ case 4
	.4byte _0801CE30 @ case 5
	.4byte _0801CE78 @ case 6
	.4byte _0801CEC2 @ case 7
	.4byte _0801CF44 @ case 8
	.4byte _0801CFA0 @ case 9
	.4byte _0801CFE0 @ case 10
	.4byte _0801D02A @ case 11
	.4byte _0801D0B0 @ case 12
	.4byte _0801D0EE @ case 13
	.4byte _0801D136 @ case 14
	.4byte _0801D1BC @ case 15
	.4byte _0801D1FA @ case 16
	.4byte _0801D266 @ case 17
	.4byte _0801D2BE @ case 18
	.4byte _0801D32A @ case 19
	.4byte _0801D382 @ case 20
	.4byte _0801D3E8 @ case 21
	.4byte _0801D418 @ case 22
	.4byte _0801D440 @ case 23
	.4byte _0801D488 @ case 24
	.4byte _0801D4D4 @ case 25
	.4byte _0801D512 @ case 26
	.4byte _0801D560 @ case 27
	.4byte _0801D5AC @ case 28
	.4byte _0801D5F0 @ case 29
	.4byte _0801D63C @ case 30
	.4byte _0801D6A0 @ case 31
	.4byte _0801D6E6 @ case 32
_0801CC8C:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801CCB8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x17
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801CCFC
_0801CCB8:
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x18]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801CCE4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801CCFC
_0801CCE4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1d
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CCFC:
	bl _0801D788
_0801CD00:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	bl _0801D788
_0801CD1C:
	ldr r0, [r7]
	bl sub_80097BC
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801D788
_0801CD6A:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	cmp r0, #0
	beq _0801CD9C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CD9C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801CDC6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	bne _0801CDC6
	b _0801CDDE
_0801CDC6:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CDDE:
	bl _0801D788
_0801CDE2:
	ldr r0, [r7]
	bl sub_800985C
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	ldr r2, [r1]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801D788
_0801CE30:
	ldr r0, [r7]
	ldr r2, [r0, #0x5c]
	ldr r1, [r2]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x46
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_80099A4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801CE74
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CE74:
	bl _0801D788
_0801CE78:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801D788
_0801CEC2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801CF40
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801CF20
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0xe]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801CF1C @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801CF40
	.align 2, 0
_0801CF1C: .4byte 0x03001140
_0801CF20:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801CF40:
	bl _0801D788
_0801CF44:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0801CF9C
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x20]
	adds r0, r2, #0
	bl sub_8021B90
	cmp r0, #0
	beq _0801CF84
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0801CF9C
_0801CF84:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x12
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CF9C:
	bl _0801D788
_0801CFA0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801CFC4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801CFDC
	b _0801CFC4
_0801CFC4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801CFDC:
	bl _0801D788
_0801CFE0:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	bl _0801D788
_0801D02A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801D0AE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801D088
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x10]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801D084 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801D0AE
	.align 2, 0
_0801D084: .4byte 0x03001140
_0801D088:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801D0AE:
	b _0801D788
_0801D0B0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801D0D4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801D0EC
	b _0801D0D4
_0801D0D4:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801D0EC:
	b _0801D788
_0801D0EE:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x10
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801D788
_0801D136:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #3
	bne _0801D1BA
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldr r2, [r1, #0x14]
	ldr r0, [r7]
	adds r1, r2, #0
	bl sub_8009380
	cmp r0, #0
	beq _0801D194
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r2, [r1, #0x12]
	adds r0, r2, #0
	bl sub_8002E04
	ldr r0, _0801D190 @ =0x03001140
	movs r1, #1
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801D1BA
	.align 2, 0
_0801D190: .4byte 0x03001140
_0801D194:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0801D1BA:
	b _0801D788
_0801D1BC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x47
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0801D1E0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x45
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801D1F8
	b _0801D1E0
_0801D1E0:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801D1F8:
	b _0801D788
_0801D1FA:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x32]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801D788
_0801D266:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801D298
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801D298:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801D2BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801D2BC:
	b _0801D788
_0801D2BE:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #4
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	ldrh r0, [r1, #0x34]
	ldr r1, [r7]
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #0x36]
	bl sub_8021AE4
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x54
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x50
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x50
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _0801D788
_0801D32A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801D35C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x54
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0801D35C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x54
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801D380
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0801D380:
	b _0801D788
_0801D382:
	ldr r0, [r7]
	ldr r1, [r0, #0x60]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldr r0, [r7]
	bl sub_8020D1C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x47
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	b _0801D3BA
_0801D3A4:
	.byte 0x39, 0x68, 0x08, 0x1C, 0x56, 0x31, 0x00, 0x22, 0x88, 0x5E, 0xB8, 0x60
	.byte 0x0C, 0x48, 0x39, 0x1C, 0x08, 0x31, 0x04, 0xF0, 0x67, 0xFF
_0801D3BA:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x50
	ldr r0, [r7]
