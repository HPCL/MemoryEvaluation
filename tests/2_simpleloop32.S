	.file	"2_simpleloop.C"
	.text
.Ltext0:
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "2_simpleloop.C"
	.loc 1 2 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	andl	$-8, %esp
	subl	$48, %esp
.LBB2:
	.loc 1 3 0
	fld1
	fstpl	8(%esp)
	fldl	.LC1
	fstpl	16(%esp)
	fldl	.LC2
	fstpl	24(%esp)
	fldl	.LC3
	fstpl	32(%esp)
	fldl	.LC4
	fstpl	40(%esp)
.LBB3:
	.loc 1 5 0
	movl	$0, 4(%esp)
	jmp	.L2
.L3:
	.loc 1 7 0 discriminator 2
	movl	4(%esp), %eax
	fldl	8(%esp,%eax,8)
	fld1
	faddp	%st, %st(1)
	movl	4(%esp), %eax
	fstpl	8(%esp,%eax,8)
	.loc 1 5 0 discriminator 2
	addl	$1, 4(%esp)
.L2:
	.loc 1 5 0 is_stmt 0 discriminator 1
	cmpl	$4, 4(%esp)
	jle	.L3
.LBE3:
	.loc 1 10 0 is_stmt 1
	movl	$0, %eax
.LBE2:
	.loc 1 12 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	1074790400
	.align 8
.LC4:
	.long	0
	.long	1075052544
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x91
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF2
	.byte	0x4
	.long	.LASF3
	.long	.LASF4
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.long	.LASF5
	.byte	0x1
	.byte	0x1
	.long	0x6f
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x6f
	.uleb128 0x3
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x4
	.string	"a"
	.byte	0x1
	.byte	0x3
	.long	0x76
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.uleb128 0x3
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x4
	.string	"i"
	.byte	0x1
	.byte	0x5
	.long	0x6f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	0x8d
	.long	0x86
	.uleb128 0x7
	.long	0x86
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.long	.LASF1
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI2-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF4:
	.string	"/home/users/kewen/bsAnalysis/memory/tests"
.LASF3:
	.string	"2_simpleloop.C"
.LASF0:
	.string	"sizetype"
.LASF1:
	.string	"double"
.LASF2:
	.string	"GNU C++ 4.8.5 -m32 -mtune=generic -march=i686 -gdwarf-2 -O0 -fstack-protector"
.LASF5:
	.string	"main"
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
