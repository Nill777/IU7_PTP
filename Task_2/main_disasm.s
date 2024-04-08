
main.o:     формат файла elf64-x86-64


Дизассемблирование раздела .text:

0000000000000000 <input_arr>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  17:	eb 16                	jmp    2f <input_arr+0x2f>
  19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1d:	48 8b 00             	mov    (%rax),%rax
  20:	48 8d 50 01          	lea    0x1(%rax),%rdx
  24:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  28:	48 89 10             	mov    %rdx,(%rax)
  2b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  2f:	83 7d fc 09          	cmpl   $0x9,-0x4(%rbp)
  33:	7f 2d                	jg     62 <input_arr+0x62>
  35:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  39:	48 8b 00             	mov    (%rax),%rax
  3c:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  43:	00 
  44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  48:	48 01 d0             	add    %rdx,%rax
  4b:	48 89 c6             	mov    %rax,%rsi
  4e:	bf 00 00 00 00       	mov    $0x0,%edi
  53:	b8 00 00 00 00       	mov    $0x0,%eax
  58:	e8 00 00 00 00       	call   5d <input_arr+0x5d>
  5d:	83 f8 01             	cmp    $0x1,%eax
  60:	74 b7                	je     19 <input_arr+0x19>
  62:	83 7d fc 0a          	cmpl   $0xa,-0x4(%rbp)
  66:	75 22                	jne    8a <input_arr+0x8a>
  68:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
  6c:	48 89 c6             	mov    %rax,%rsi
  6f:	bf 00 00 00 00       	mov    $0x0,%edi
  74:	b8 00 00 00 00       	mov    $0x0,%eax
  79:	e8 00 00 00 00       	call   7e <input_arr+0x7e>
  7e:	83 f8 01             	cmp    $0x1,%eax
  81:	75 07                	jne    8a <input_arr+0x8a>
  83:	b8 64 00 00 00       	mov    $0x64,%eax
  88:	eb 18                	jmp    a2 <input_arr+0xa2>
  8a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8e:	48 8b 00             	mov    (%rax),%rax
  91:	48 85 c0             	test   %rax,%rax
  94:	75 07                	jne    9d <input_arr+0x9d>
  96:	b8 01 00 00 00       	mov    $0x1,%eax
  9b:	eb 05                	jmp    a2 <input_arr+0xa2>
  9d:	b8 00 00 00 00       	mov    $0x0,%eax
  a2:	c9                   	leave  
  a3:	c3                   	ret    

00000000000000a4 <bubble_sort>:
  a4:	55                   	push   %rbp
  a5:	48 89 e5             	mov    %rsp,%rbp
  a8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  ac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  b0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  b7:	00 
  b8:	e9 c1 00 00 00       	jmp    17e <bubble_sort+0xda>
  bd:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  c4:	00 
  c5:	e9 99 00 00 00       	jmp    163 <bubble_sort+0xbf>
  ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  ce:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  d5:	00 
  d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  da:	48 01 d0             	add    %rdx,%rax
  dd:	8b 10                	mov    (%rax),%edx
  df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  e3:	48 83 c0 01          	add    $0x1,%rax
  e7:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
  ee:	00 
  ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  f3:	48 01 c8             	add    %rcx,%rax
  f6:	8b 00                	mov    (%rax),%eax
  f8:	39 c2                	cmp    %eax,%edx
  fa:	7e 62                	jle    15e <bubble_sort+0xba>
  fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 100:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 107:	00 
 108:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 10c:	48 01 d0             	add    %rdx,%rax
 10f:	8b 00                	mov    (%rax),%eax
 111:	89 45 ec             	mov    %eax,-0x14(%rbp)
 114:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 118:	48 83 c0 01          	add    $0x1,%rax
 11c:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 123:	00 
 124:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 128:	48 01 d0             	add    %rdx,%rax
 12b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 12f:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
 136:	00 
 137:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
 13b:	48 01 ca             	add    %rcx,%rdx
 13e:	8b 00                	mov    (%rax),%eax
 140:	89 02                	mov    %eax,(%rdx)
 142:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 146:	48 83 c0 01          	add    $0x1,%rax
 14a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 151:	00 
 152:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 156:	48 01 c2             	add    %rax,%rdx
 159:	8b 45 ec             	mov    -0x14(%rbp),%eax
 15c:	89 02                	mov    %eax,(%rdx)
 15e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
 163:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 167:	48 2b 45 f8          	sub    -0x8(%rbp),%rax
 16b:	48 83 e8 01          	sub    $0x1,%rax
 16f:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
 173:	0f 82 51 ff ff ff    	jb     ca <bubble_sort+0x26>
 179:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
 17e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 182:	48 83 e8 01          	sub    $0x1,%rax
 186:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
 18a:	0f 82 2d ff ff ff    	jb     bd <bubble_sort+0x19>
 190:	b8 00 00 00 00       	mov    $0x0,%eax
 195:	5d                   	pop    %rbp
 196:	c3                   	ret    

0000000000000197 <print_arr>:
 197:	55                   	push   %rbp
 198:	48 89 e5             	mov    %rsp,%rbp
 19b:	48 83 ec 20          	sub    $0x20,%rsp
 19f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 1a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 1a7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 1ae:	00 
 1af:	eb 2b                	jmp    1dc <print_arr+0x45>
 1b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1b5:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 1bc:	00 
 1bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1c1:	48 01 d0             	add    %rdx,%rax
 1c4:	8b 00                	mov    (%rax),%eax
 1c6:	89 c6                	mov    %eax,%esi
 1c8:	bf 00 00 00 00       	mov    $0x0,%edi
 1cd:	b8 00 00 00 00       	mov    $0x0,%eax
 1d2:	e8 00 00 00 00       	call   1d7 <print_arr+0x40>
 1d7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
 1dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1e0:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
 1e4:	72 cb                	jb     1b1 <print_arr+0x1a>
 1e6:	90                   	nop
 1e7:	90                   	nop
 1e8:	c9                   	leave  
 1e9:	c3                   	ret    

00000000000001ea <main>:
 1ea:	55                   	push   %rbp
 1eb:	48 89 e5             	mov    %rsp,%rbp
 1ee:	48 83 ec 40          	sub    $0x40,%rsp
 1f2:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
 1f9:	00 
 1fa:	bf 00 00 00 00       	mov    $0x0,%edi
 1ff:	b8 00 00 00 00       	mov    $0x0,%eax
 204:	e8 00 00 00 00       	call   209 <main+0x1f>
 209:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
 20d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
 211:	48 89 d6             	mov    %rdx,%rsi
 214:	48 89 c7             	mov    %rax,%rdi
 217:	e8 00 00 00 00       	call   21c <main+0x32>
 21c:	89 45 fc             	mov    %eax,-0x4(%rbp)
 21f:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
 223:	75 11                	jne    236 <main+0x4c>
 225:	bf 00 00 00 00       	mov    $0x0,%edi
 22a:	e8 00 00 00 00       	call   22f <main+0x45>
 22f:	b8 01 00 00 00       	mov    $0x1,%eax
 234:	eb 42                	jmp    278 <main+0x8e>
 236:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
 23a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
 23e:	48 89 d6             	mov    %rdx,%rsi
 241:	48 89 c7             	mov    %rax,%rdi
 244:	e8 00 00 00 00       	call   249 <main+0x5f>
 249:	bf 00 00 00 00       	mov    $0x0,%edi
 24e:	b8 00 00 00 00       	mov    $0x0,%eax
 253:	e8 00 00 00 00       	call   258 <main+0x6e>
 258:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
 25c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
 260:	48 89 d6             	mov    %rdx,%rsi
 263:	48 89 c7             	mov    %rax,%rdi
 266:	e8 00 00 00 00       	call   26b <main+0x81>
 26b:	bf 0a 00 00 00       	mov    $0xa,%edi
 270:	e8 00 00 00 00       	call   275 <main+0x8b>
 275:	8b 45 fc             	mov    -0x4(%rbp),%eax
 278:	c9                   	leave  
 279:	c3                   	ret    
