	.text
	.file	"main.c"
	.globl	input_arr                       # -- Begin function input_arr
	.p2align	4, 0x90
	.type	input_arr,@function
input_arr:                              # @input_arr
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	$0, -28(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$10, -28(%rbp)
	movb	%al, -33(%rbp)                  # 1-byte Spill
	jge	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	shlq	$2, %rax
	addq	%rax, %rsi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	__isoc99_scanf
	cmpl	$1, %eax
	sete	%al
	movb	%al, -33(%rbp)                  # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-33(%rbp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rcx
	addq	$1, %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, (%rax)
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB0_1
.LBB0_5:
	cmpl	$10, -28(%rbp)
	jne	.LBB0_8
# %bb.6:
	movabsq	$.L.str, %rdi
	leaq	-32(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf
	cmpl	$1, %eax
	jne	.LBB0_8
# %bb.7:
	movl	$100, -4(%rbp)
	jmp	.LBB0_11
.LBB0_8:
	movq	-24(%rbp), %rax
	cmpq	$0, (%rax)
	jne	.LBB0_10
# %bb.9:
	movl	$1, -4(%rbp)
	jmp	.LBB0_11
.LBB0_10:
	movl	$0, -4(%rbp)
.LBB0_11:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	input_arr, .Lfunc_end0-input_arr
	.cfi_endproc
                                        # -- End function
	.globl	bubble_sort                     # -- Begin function bubble_sort
	.p2align	4, 0x90
	.type	bubble_sort,@function
bubble_sort:                            # @bubble_sort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -24(%rbp)
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	$1, %rcx
	cmpq	%rcx, %rax
	jae	.LBB1_10
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	$0, -32(%rbp)
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	-24(%rbp), %rcx
	subq	$1, %rcx
	cmpq	%rcx, %rax
	jae	.LBB1_8
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rdx
	cmpl	4(%rcx,%rdx,4), %eax
	jle	.LBB1_6
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=2
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	4(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-36(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	%edx, 4(%rax,%rcx,4)
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=2
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=2
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB1_3
.LBB1_8:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_9
.LBB1_9:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB1_1
.LBB1_10:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	bubble_sort, .Lfunc_end1-bubble_sort
	.cfi_endproc
                                        # -- End function
	.globl	print_arr                       # -- Begin function print_arr
	.p2align	4, 0x90
	.type	print_arr,@function
print_arr:                              # @print_arr
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -24(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jae	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	print_arr, .Lfunc_end2-print_arr
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movl	$0, -4(%rbp)
	movq	$0, -56(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	leaq	-48(%rbp), %rdi
	leaq	-56(%rbp), %rsi
	callq	input_arr
	movl	%eax, -76(%rbp)
	cmpl	$1, -76(%rbp)
	jne	.LBB3_2
# %bb.1:
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	printf
	movl	$1, -4(%rbp)
	jmp	.LBB3_3
.LBB3_2:
	leaq	-48(%rbp), %rdi
	movq	-56(%rbp), %rsi
	callq	bubble_sort
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	leaq	-48(%rbp), %rdi
	movq	-56(%rbp), %rsi
	callq	print_arr
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	printf
	movl	-76(%rbp), %eax
	movl	%eax, -4(%rbp)
.LBB3_3:
	movl	-4(%rbp), %eax
	addq	$80, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

	.type	global_var_init,@object         # @global_var_init
	.data
	.globl	global_var_init
	.p2align	3
global_var_init:
	.quad	0x4024000000000000              # double 10
	.size	global_var_init, 8

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\215\320\273\320\265\320\274\320\265\320\275\321\202\321\213 \320\274\320\260\321\201\321\201\320\270\320\262\320\260: "
	.size	.L.str.2, 49

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"\320\235\320\265\320\272\320\276\321\200\321\200\320\265\320\272\321\202\320\275\321\213\320\271 \320\262\320\262\320\276\320\264 \320\274\320\260\321\201\321\201\320\270\320\262\320\260\n"
	.size	.L.str.3, 50

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\320\234\320\260\321\201\321\201\320\270\320\262 \321\203\320\277\320\276\321\200\321\217\320\264\320\276\321\207\320\265\320\275\320\275\321\213\321\205 \321\215\320\273\320\265\320\274\320\265\320\275\321\202\320\276\320\262: "
	.size	.L.str.4, 61

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"\n"
	.size	.L.str.5, 2

	.type	global_var,@object              # @global_var
	.bss
	.globl	global_var
	.p2align	3
global_var:
	.quad	0x0000000000000000              # double 0
	.size	global_var, 8

	.ident	"clang version 15.0.7 (Fedora 15.0.7-1.fc37)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym input_arr
	.addrsig_sym __isoc99_scanf
	.addrsig_sym bubble_sort
	.addrsig_sym print_arr
	.addrsig_sym printf
