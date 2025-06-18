.globl  setjmp
.globl  longjmp

setjmp:
  movq  (%rsp), %rax
  movq  %rax, 0(%rdi)
  lea   8(%rsp), %rax
  movq  %rax, 8(%rdi)
  movq  %rbp, 16(%rdi)
  movq  %rbx, 24(%rdi)
  movq  %r12, 32(%rdi)
  movq  %r13, 40(%rdi)
  movq  %r14, 48(%rdi)
  movq  %r15, 56(%rdi)
  xor   %eax, %eax
  ret

longjmp:
  movq  16(%rdi), %rbp
  movq  24(%rdi), %rbx
  movq  32(%rdi), %r12
  movq  40(%rdi), %r13
  movq  48(%rdi), %r14
  movq  56(%rdi), %r15
  movq  8(%rdi), %rsp
  movq  0(%rdi), %rcx
  test  %esi, %esi
  mov   %esi, %eax
  jne   1f
  mov   $1, %eax 
1:
  jmp   *%rcx

