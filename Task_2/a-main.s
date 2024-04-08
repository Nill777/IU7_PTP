	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	input_arr
	.type	input_arr, @function
input_arr:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L4:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$9, -4(%rbp)
	jg	.L3
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	cmpl	$1, %eax
	je	.L4
.L3:
	cmpl	$10, -4(%rbp)
	jne	.L5
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	cmpl	$1, %eax
	jne	.L5
	movl	$100, %eax
	jmp	.L8
.L5:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L7
	movl	$1, %eax
	jmp	.L8
.L7:
	movl	$0, %eax
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	input_arr, .-input_arr
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L10
.L14:
	movq	$0, -16(%rbp)
	jmp	.L11
.L13:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L12
	movq	-16(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	-16(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	movl	%eax, (%rdx)
.L12:
	addq	$1, -16(%rbp)
.L11:
	movq	-48(%rbp), %rax
	subq	-8(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L13
	addq	$1, -8(%rbp)
.L10:
	movq	-48(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L14
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	bubble_sort, .-bubble_sort
	.section	.rodata
.LC1:
	.string	"%d "
	.text
	.globl	print_arr
	.type	print_arr, @function
print_arr:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L17
.L18:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	addq	$1, -8(%rbp)
.L17:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L18
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_arr, .-print_arr
	.globl	global_var_init
	.data
	.align 8
	.type	global_var_init, @object
	.size	global_var_init, 8
global_var_init:
	.long	0
	.long	1076101120
	.globl	global_var
	.bss
	.align 8
	.type	global_var, @object
	.size	global_var, 8
global_var:
	.zero	8
	.section	.rodata
	.align 8
.LC3:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\215\320\273\320\265\320\274\320\265\320\275\321\202\321\213 \320\274\320\260\321\201\321\201\320\270\320\262\320\260: "
	.align 8
.LC4:
	.string	"\320\235\320\265\320\272\320\276\321\200\321\200\320\265\320\272\321\202\320\275\321\213\320\271 \320\262\320\262\320\276\320\264 \320\274\320\260\321\201\321\201\320\270\320\262\320\260"
	.align 8
.LC5:
	.string	"\320\234\320\260\321\201\321\201\320\270\320\262 \321\203\320\277\320\276\321\200\321\217\320\264\320\276\321\207\320\265\320\275\320\275\321\213\321\205 \321\215\320\273\320\265\320\274\320\265\320\275\321\202\320\276\320\262: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	$0, -72(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	leaq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	input_arr
	movl	%eax, -12(%rbp)
	cmpl	$1, -12(%rbp)
	jne	.L20
	movl	$.LC4, %edi
	call	puts
	movl	$1, %eax
	jmp	.L22
.L20:
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bubble_sort
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	print_arr
	movl	$10, %edi
	call	putchar
	movl	-12(%rbp), %eax
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
	.section	.note.GNU-stack,"",@progbits
