	.file	"1_simpleloop.C"
	.text
.Ltext0:
	.globl	_Z3fooPdS_i
	.type	_Z3fooPdS_i, @function
_Z3fooPdS_i:
.LFB0:
	.file 1 "1_simpleloop.C"
	.loc 1 3 0
	.cfi_startproc
	pushq	%rbp
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI1:
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
.LBB2:
	.loc 1 4 0
	movl	$5, -4(%rbp)
.LBB3:
	.loc 1 6 0
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	.loc 1 8 0 discriminator 2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm1
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm0
	addsd	%xmm0, %xmm1
	cvtsi2sd	-4(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 9 0 discriminator 2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm1
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10 0 discriminator 2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm0
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	cvtsi2sd	-4(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11 0 discriminator 2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm0
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 6 0 discriminator 2
	addl	$1, -8(%rbp)
.L2:
	.loc 1 6 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax
	subl	$2, %eax
	cmpl	-8(%rbp), %eax
	jg	.L3
.LBE3:
.LBE2:
	.loc 1 15 0 is_stmt 1
	popq	%rbp
.LCFI2:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3fooPdS_i, .-_Z3fooPdS_i
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 18 0
	.cfi_startproc
	pushq	%rbp
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI4:
	.cfi_def_cfa_register 6
	subq	$96, %rsp
.LBB4:
	.loc 1 19 0
	movabsq	$4607182418800017408, %rax
	movq	%rax, -96(%rbp)
	movabsq	$4611686018427387904, %rax
	movq	%rax, -88(%rbp)
	movabsq	$4613937818241073152, %rax
	movq	%rax, -80(%rbp)
	movabsq	$4616189618054758400, %rax
	movq	%rax, -72(%rbp)
	movabsq	$4617315517961601024, %rax
	movq	%rax, -64(%rbp)
	.loc 1 20 0
	movabsq	$4618441417868443648, %rax
	movq	%rax, -48(%rbp)
	movabsq	$4619567317775286272, %rax
	movq	%rax, -40(%rbp)
	movabsq	$4620693217682128896, %rax
	movq	%rax, -32(%rbp)
	movabsq	$4621256167635550208, %rax
	movq	%rax, -24(%rbp)
	movabsq	$4621819117588971520, %rax
	movq	%rax, -16(%rbp)
	.loc 1 21 0
	leaq	-48(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z3fooPdS_i
	.loc 1 23 0
	movl	$0, %eax
.LBE4:
	.loc 1 24 0
	leave
.LCFI5:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x12e
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF4
	.byte	0x4
	.long	.LASF5
	.long	.LASF6
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.string	"foo"
	.byte	0x1
	.byte	0x2
	.long	.LASF7
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xb5
	.uleb128 0x3
	.string	"a"
	.byte	0x1
	.byte	0x2
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"b"
	.byte	0x1
	.byte	0x2
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x4
	.long	.LASF0
	.byte	0x1
	.byte	0x2
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x5
	.quad	.LBB2
	.quad	.LBE2
	.uleb128 0x6
	.string	"x"
	.byte	0x1
	.byte	0x4
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x6
	.long	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0xbb
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.long	.LASF1
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.byte	0x1
	.long	.LASF2
	.byte	0x1
	.byte	0x11
	.long	0xc2
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x11a
	.uleb128 0x5
	.quad	.LBB4
	.quad	.LBE4
	.uleb128 0x6
	.string	"x"
	.byte	0x1
	.byte	0x13
	.long	0x11a
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x6
	.string	"y"
	.byte	0x1
	.byte	0x14
	.long	0x11a
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0xbb
	.long	0x12a
	.uleb128 0xc
	.long	0x12a
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF3
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
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
	.uleb128 0x5
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
.LLST1:
	.quad	.LFB1-.Ltext0
	.quad	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI3-.Ltext0
	.quad	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI4-.Ltext0
	.quad	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI5-.Ltext0
	.quad	.LFE1-.Ltext0
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
.LASF5:
	.string	"1_simpleloop.C"
.LASF7:
	.string	"_Z3fooPdS_i"
.LASF4:
	.string	"GNU C++ 4.8.5 -mtune=generic -march=x86-64 -gdwarf-2 -O0 -fstack-protector"
.LASF1:
	.string	"double"
.LASF3:
	.string	"sizetype"
.LASF0:
	.string	"size"
.LASF2:
	.string	"main"
.LASF6:
	.string	"/home/users/kewen/bsAnalysis/memory/tests"
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
