	.file	"2_simpleloop_int.C"
	.text
.Ltext0:
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "2_simpleloop_int.C"
	.loc 1 2 0
	.cfi_startproc
	pushq	%rbp
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI1:
	.cfi_def_cfa_register 6
.LBB2:
	.loc 1 3 0
	movl	$1, -32(%rbp)
	movl	$2, -28(%rbp)
	movl	$3, -24(%rbp)
	movl	$4, -20(%rbp)
	movl	$5, -16(%rbp)
.LBB3:
	.loc 1 5 0
	movl	$0, -36(%rbp)
	jmp	.L2
.L3:
	.loc 1 7 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-36(%rbp), %eax
	cltq
	movl	%edx, -32(%rbp,%rax,4)
	.loc 1 5 0 discriminator 2
	addl	$1, -36(%rbp)
.L2:
	.loc 1 5 0 is_stmt 0 discriminator 1
	cmpl	$4, -36(%rbp)
	jle	.L3
.LBE3:
	.loc 1 10 0 is_stmt 1
	movl	$0, %eax
.LBE2:
	.loc 1 12 0
	popq	%rbp
.LCFI2:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xaa
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF1
	.byte	0x4
	.long	.LASF2
	.long	.LASF3
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.long	.LASF4
	.byte	0x1
	.byte	0x1
	.long	0x8f
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x8f
	.uleb128 0x3
	.quad	.LBB2
	.quad	.LBE2
	.uleb128 0x4
	.string	"a"
	.byte	0x1
	.byte	0x3
	.long	0x96
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x4
	.string	"i"
	.byte	0x1
	.byte	0x5
	.long	0x8f
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	0x8f
	.long	0xa6
	.uleb128 0x7
	.long	0xa6
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF0
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
	.quad	.LFB0-.Ltext0
	.quad	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI0-.Ltext0
	.quad	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI1-.Ltext0
	.quad	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI2-.Ltext0
	.quad	.LFE0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"/home/users/kewen/bsAnalysis/memory/tests"
.LASF2:
	.string	"2_simpleloop_int.C"
.LASF0:
	.string	"sizetype"
.LASF1:
	.string	"GNU C++ 4.8.5 -mtune=generic -march=x86-64 -gdwarf-2 -O0 -fstack-protector"
.LASF4:
	.string	"main"
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
