GAS LISTING a-main.s 			page 1


   1              		.file	"main.c"
   2              		.text
   3              		.section	.rodata
   4              	.LC0:
   5 0000 256400   		.string	"%d"
   6              		.text
   7              		.globl	input_arr
   8              		.type	input_arr, @function
   9              	input_arr:
  10              	.LFB6:
  11              		.cfi_startproc
  12 0000 55       		pushq	%rbp
  13              		.cfi_def_cfa_offset 16
  14              		.cfi_offset 6, -16
  15 0001 4889E5   		movq	%rsp, %rbp
  16              		.cfi_def_cfa_register 6
  17 0004 4883EC20 		subq	$32, %rsp
  18 0008 48897DE8 		movq	%rdi, -24(%rbp)
  19 000c 488975E0 		movq	%rsi, -32(%rbp)
  20 0010 C745FC00 		movl	$0, -4(%rbp)
  20      000000
  21 0017 EB16     		jmp	.L2
  22              	.L4:
  23 0019 488B45E0 		movq	-32(%rbp), %rax
  24 001d 488B00   		movq	(%rax), %rax
  25 0020 488D5001 		leaq	1(%rax), %rdx
  26 0024 488B45E0 		movq	-32(%rbp), %rax
  27 0028 488910   		movq	%rdx, (%rax)
  28 002b 8345FC01 		addl	$1, -4(%rbp)
  29              	.L2:
  30 002f 837DFC09 		cmpl	$9, -4(%rbp)
  31 0033 7F2D     		jg	.L3
  32 0035 488B45E0 		movq	-32(%rbp), %rax
  33 0039 488B00   		movq	(%rax), %rax
  34 003c 488D1485 		leaq	0(,%rax,4), %rdx
  34      00000000 
  35 0044 488B45E8 		movq	-24(%rbp), %rax
  36 0048 4801D0   		addq	%rdx, %rax
  37 004b 4889C6   		movq	%rax, %rsi
  38 004e BF000000 		movl	$.LC0, %edi
  38      00
  39 0053 B8000000 		movl	$0, %eax
  39      00
  40 0058 E8000000 		call	__isoc99_scanf
  40      00
  41 005d 83F801   		cmpl	$1, %eax
  42 0060 74B7     		je	.L4
  43              	.L3:
  44 0062 837DFC0A 		cmpl	$10, -4(%rbp)
  45 0066 7522     		jne	.L5
  46 0068 488D45F8 		leaq	-8(%rbp), %rax
  47 006c 4889C6   		movq	%rax, %rsi
  48 006f BF000000 		movl	$.LC0, %edi
  48      00
  49 0074 B8000000 		movl	$0, %eax
  49      00
  50 0079 E8000000 		call	__isoc99_scanf
GAS LISTING a-main.s 			page 2


  50      00
  51 007e 83F801   		cmpl	$1, %eax
  52 0081 7507     		jne	.L5
  53 0083 B8640000 		movl	$100, %eax
  53      00
  54 0088 EB18     		jmp	.L8
  55              	.L5:
  56 008a 488B45E0 		movq	-32(%rbp), %rax
  57 008e 488B00   		movq	(%rax), %rax
  58 0091 4885C0   		testq	%rax, %rax
  59 0094 7507     		jne	.L7
  60 0096 B8010000 		movl	$1, %eax
  60      00
  61 009b EB05     		jmp	.L8
  62              	.L7:
  63 009d B8000000 		movl	$0, %eax
  63      00
  64              	.L8:
  65 00a2 C9       		leave
  66              		.cfi_def_cfa 7, 8
  67 00a3 C3       		ret
  68              		.cfi_endproc
  69              	.LFE6:
  70              		.size	input_arr, .-input_arr
  71              		.globl	bubble_sort
  72              		.type	bubble_sort, @function
  73              	bubble_sort:
  74              	.LFB7:
  75              		.cfi_startproc
  76 00a4 55       		pushq	%rbp
  77              		.cfi_def_cfa_offset 16
  78              		.cfi_offset 6, -16
  79 00a5 4889E5   		movq	%rsp, %rbp
  80              		.cfi_def_cfa_register 6
  81 00a8 48897DD8 		movq	%rdi, -40(%rbp)
  82 00ac 488975D0 		movq	%rsi, -48(%rbp)
  83 00b0 48C745F8 		movq	$0, -8(%rbp)
  83      00000000 
  84 00b8 E9C10000 		jmp	.L10
  84      00
  85              	.L14:
  86 00bd 48C745F0 		movq	$0, -16(%rbp)
  86      00000000 
  87 00c5 E9990000 		jmp	.L11
  87      00
  88              	.L13:
  89 00ca 488B45F0 		movq	-16(%rbp), %rax
  90 00ce 488D1485 		leaq	0(,%rax,4), %rdx
  90      00000000 
  91 00d6 488B45D8 		movq	-40(%rbp), %rax
  92 00da 4801D0   		addq	%rdx, %rax
  93 00dd 8B10     		movl	(%rax), %edx
  94 00df 488B45F0 		movq	-16(%rbp), %rax
  95 00e3 4883C001 		addq	$1, %rax
  96 00e7 488D0C85 		leaq	0(,%rax,4), %rcx
  96      00000000 
  97 00ef 488B45D8 		movq	-40(%rbp), %rax
GAS LISTING a-main.s 			page 3


  98 00f3 4801C8   		addq	%rcx, %rax
  99 00f6 8B00     		movl	(%rax), %eax
 100 00f8 39C2     		cmpl	%eax, %edx
 101 00fa 7E62     		jle	.L12
 102 00fc 488B45F0 		movq	-16(%rbp), %rax
 103 0100 488D1485 		leaq	0(,%rax,4), %rdx
 103      00000000 
 104 0108 488B45D8 		movq	-40(%rbp), %rax
 105 010c 4801D0   		addq	%rdx, %rax
 106 010f 8B00     		movl	(%rax), %eax
 107 0111 8945EC   		movl	%eax, -20(%rbp)
 108 0114 488B45F0 		movq	-16(%rbp), %rax
 109 0118 4883C001 		addq	$1, %rax
 110 011c 488D1485 		leaq	0(,%rax,4), %rdx
 110      00000000 
 111 0124 488B45D8 		movq	-40(%rbp), %rax
 112 0128 4801D0   		addq	%rdx, %rax
 113 012b 488B55F0 		movq	-16(%rbp), %rdx
 114 012f 488D0C95 		leaq	0(,%rdx,4), %rcx
 114      00000000 
 115 0137 488B55D8 		movq	-40(%rbp), %rdx
 116 013b 4801CA   		addq	%rcx, %rdx
 117 013e 8B00     		movl	(%rax), %eax
 118 0140 8902     		movl	%eax, (%rdx)
 119 0142 488B45F0 		movq	-16(%rbp), %rax
 120 0146 4883C001 		addq	$1, %rax
 121 014a 488D1485 		leaq	0(,%rax,4), %rdx
 121      00000000 
 122 0152 488B45D8 		movq	-40(%rbp), %rax
 123 0156 4801C2   		addq	%rax, %rdx
 124 0159 8B45EC   		movl	-20(%rbp), %eax
 125 015c 8902     		movl	%eax, (%rdx)
 126              	.L12:
 127 015e 488345F0 		addq	$1, -16(%rbp)
 127      01
 128              	.L11:
 129 0163 488B45D0 		movq	-48(%rbp), %rax
 130 0167 482B45F8 		subq	-8(%rbp), %rax
 131 016b 4883E801 		subq	$1, %rax
 132 016f 483945F0 		cmpq	%rax, -16(%rbp)
 133 0173 0F8251FF 		jb	.L13
 133      FFFF
 134 0179 488345F8 		addq	$1, -8(%rbp)
 134      01
 135              	.L10:
 136 017e 488B45D0 		movq	-48(%rbp), %rax
 137 0182 4883E801 		subq	$1, %rax
 138 0186 483945F8 		cmpq	%rax, -8(%rbp)
 139 018a 0F822DFF 		jb	.L14
 139      FFFF
 140 0190 B8000000 		movl	$0, %eax
 140      00
 141 0195 5D       		popq	%rbp
 142              		.cfi_def_cfa 7, 8
 143 0196 C3       		ret
 144              		.cfi_endproc
 145              	.LFE7:
GAS LISTING a-main.s 			page 4


 146              		.size	bubble_sort, .-bubble_sort
 147              		.section	.rodata
 148              	.LC1:
 149 0003 25642000 		.string	"%d "
 150              		.text
 151              		.globl	print_arr
 152              		.type	print_arr, @function
 153              	print_arr:
 154              	.LFB8:
 155              		.cfi_startproc
 156 0197 55       		pushq	%rbp
 157              		.cfi_def_cfa_offset 16
 158              		.cfi_offset 6, -16
 159 0198 4889E5   		movq	%rsp, %rbp
 160              		.cfi_def_cfa_register 6
 161 019b 4883EC20 		subq	$32, %rsp
 162 019f 48897DE8 		movq	%rdi, -24(%rbp)
 163 01a3 488975E0 		movq	%rsi, -32(%rbp)
 164 01a7 48C745F8 		movq	$0, -8(%rbp)
 164      00000000 
 165 01af EB2B     		jmp	.L17
 166              	.L18:
 167 01b1 488B45F8 		movq	-8(%rbp), %rax
 168 01b5 488D1485 		leaq	0(,%rax,4), %rdx
 168      00000000 
 169 01bd 488B45E8 		movq	-24(%rbp), %rax
 170 01c1 4801D0   		addq	%rdx, %rax
 171 01c4 8B00     		movl	(%rax), %eax
 172 01c6 89C6     		movl	%eax, %esi
 173 01c8 BF000000 		movl	$.LC1, %edi
 173      00
 174 01cd B8000000 		movl	$0, %eax
 174      00
 175 01d2 E8000000 		call	printf
 175      00
 176 01d7 488345F8 		addq	$1, -8(%rbp)
 176      01
 177              	.L17:
 178 01dc 488B45F8 		movq	-8(%rbp), %rax
 179 01e0 483B45E0 		cmpq	-32(%rbp), %rax
 180 01e4 72CB     		jb	.L18
 181 01e6 90       		nop
 182 01e7 90       		nop
 183 01e8 C9       		leave
 184              		.cfi_def_cfa 7, 8
 185 01e9 C3       		ret
 186              		.cfi_endproc
 187              	.LFE8:
 188              		.size	print_arr, .-print_arr
 189              		.globl	global_var_init
 190              		.data
 191              		.align 8
 192              		.type	global_var_init, @object
 193              		.size	global_var_init, 8
 194              	global_var_init:
 195 0000 00000000 		.long	0
 196 0004 00002440 		.long	1076101120
GAS LISTING a-main.s 			page 5


 197              		.globl	global_var
 198              		.bss
 199              		.align 8
 200              		.type	global_var, @object
 201              		.size	global_var, 8
 202              	global_var:
 203 0000 00000000 		.zero	8
 203      00000000 
 204              		.section	.rodata
 205 0007 00       		.align 8
 206              	.LC3:
 207 0008 D092D0B2 		.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\215\320\273\320\265\320\274
 207      D0B5D0B4 
 207      D0B8D182 
 207      D0B520D1 
 207      8DD0BBD0 
 208 0039 00000000 		.align 8
 208      000000
 209              	.LC4:
 210 0040 D09DD0B5 		.string	"\320\235\320\265\320\272\320\276\321\200\321\200\320\265\320\272\321\202\320\275\321\213\
 210      D0BAD0BE 
 210      D180D180 
 210      D0B5D0BA 
 210      D182D0BD 
 211 0071 00000000 		.align 8
 211      000000
 212              	.LC5:
 213 0078 D09CD0B0 		.string	"\320\234\320\260\321\201\321\201\320\270\320\262 \321\203\320\277\320\276\321\200\321\217
 213      D181D181 
 213      D0B8D0B2 
 213      20D183D0 
 213      BFD0BED1 
 214              		.text
 215              		.globl	main
 216              		.type	main, @function
 217              	main:
 218              	.LFB9:
 219              		.cfi_startproc
 220 01ea 55       		pushq	%rbp
 221              		.cfi_def_cfa_offset 16
 222              		.cfi_offset 6, -16
 223 01eb 4889E5   		movq	%rsp, %rbp
 224              		.cfi_def_cfa_register 6
 225 01ee 4883EC50 		subq	$80, %rsp
 226 01f2 48C745B8 		movq	$0, -72(%rbp)
 226      00000000 
 227 01fa 660FEFC0 		pxor	%xmm0, %xmm0
 228 01fe F20F1145 		movsd	%xmm0, -8(%rbp)
 228      F8
 229 0203 BF000000 		movl	$.LC3, %edi
 229      00
 230 0208 B8000000 		movl	$0, %eax
 230      00
 231 020d E8000000 		call	printf
 231      00
 232 0212 488D55B8 		leaq	-72(%rbp), %rdx
 233 0216 488D45C0 		leaq	-64(%rbp), %rax
GAS LISTING a-main.s 			page 6


 234 021a 4889D6   		movq	%rdx, %rsi
 235 021d 4889C7   		movq	%rax, %rdi
 236 0220 E8000000 		call	input_arr
 236      00
 237 0225 8945F4   		movl	%eax, -12(%rbp)
 238 0228 837DF401 		cmpl	$1, -12(%rbp)
 239 022c 7511     		jne	.L20
 240 022e BF000000 		movl	$.LC4, %edi
 240      00
 241 0233 E8000000 		call	puts
 241      00
 242 0238 B8010000 		movl	$1, %eax
 242      00
 243 023d EB42     		jmp	.L22
 244              	.L20:
 245 023f 488B55B8 		movq	-72(%rbp), %rdx
 246 0243 488D45C0 		leaq	-64(%rbp), %rax
 247 0247 4889D6   		movq	%rdx, %rsi
 248 024a 4889C7   		movq	%rax, %rdi
 249 024d E8000000 		call	bubble_sort
 249      00
 250 0252 BF000000 		movl	$.LC5, %edi
 250      00
 251 0257 B8000000 		movl	$0, %eax
 251      00
 252 025c E8000000 		call	printf
 252      00
 253 0261 488B55B8 		movq	-72(%rbp), %rdx
 254 0265 488D45C0 		leaq	-64(%rbp), %rax
 255 0269 4889D6   		movq	%rdx, %rsi
 256 026c 4889C7   		movq	%rax, %rdi
 257 026f E8000000 		call	print_arr
 257      00
 258 0274 BF0A0000 		movl	$10, %edi
 258      00
 259 0279 E8000000 		call	putchar
 259      00
 260 027e 8B45F4   		movl	-12(%rbp), %eax
 261              	.L22:
 262 0281 C9       		leave
 263              		.cfi_def_cfa 7, 8
 264 0282 C3       		ret
 265              		.cfi_endproc
 266              	.LFE9:
 267              		.size	main, .-main
 268              		.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
 269              		.section	.note.GNU-stack,"",@progbits
GAS LISTING a-main.s 			page 7


DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
            a-main.s:9      .text:0000000000000000 input_arr
            a-main.s:73     .text:00000000000000a4 bubble_sort
            a-main.s:153    .text:0000000000000197 print_arr
            a-main.s:194    .data:0000000000000000 global_var_init
            a-main.s:202    .bss:0000000000000000 global_var
            a-main.s:217    .text:00000000000001ea main

UNDEFINED SYMBOLS
__isoc99_scanf
printf
puts
putchar
