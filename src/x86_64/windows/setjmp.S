.globl  setjmp
.globl  longjmp

setjmp:
  movq  (%rsp), %rax
  movq  %rax, 0(%rcx)
  lea   8(%rsp), %rax
  movq  %rax, 8(%rcx)
  movq  %rbp, 16(%rcx)
  movq  %rbx, 24(%rcx)
  movq  %r12, 32(%rcx)
  movq  %r13, 40(%rcx)
  movq  %r14, 48(%rcx)
  movq  %r15, 56(%rcx)
  xor   %eax, %eax
  ret

longjmp:
  movq  16(%rcx), %rbp
  movq  24(%rcx), %rbx
  movq  32(%rcx), %r12
  movq  40(%rcx), %r13
  movq  48(%rcx), %r14
  movq  56(%rcx), %r15
  movq  8(%rcx), %rsp
  movq  0(%rcx), %rcx
  test  %esi, %esi
  mov   %esi, %eax
  jne   1f
  mov   $1, %eax 
1:
  jmp   *%rcx

