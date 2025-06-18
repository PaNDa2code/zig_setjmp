#ifndef SETJMP_H
#define SETJMP_H

#ifndef JMP_BUF_LEN
#if defined(__x86_64__) || defined(_M_X64)
#define JMP_BUF_LEN 8 // x86_64: RIP, RSP, RBP, RBX, R12-R15
#elif defined(__aarch64__) || defined(_M_ARM64)
#define JMP_BUF_LEN 11 // aarch64: FP, LR, SP, X19-X28 (may vary)
#elif defined(__arm__) || defined(_M_ARM)
#define JMP_BUF_LEN 6 // ARM: R4–R11 or as needed
#elif defined(__i386__) || defined(_M_IX86)
#define JMP_BUF_LEN 6 // i386: EIP, ESP, EBP, EBX, ESI, EDI
#else
#error "Unsupported architecture: define JMP_BUF_LEN manually"
#endif
#endif // !JMP_BUF_LEN

typedef long jmp_buf[JMP_BUF_LEN];

#ifdef __cplusplus
extern "C" {
#endif

int setjmp(jmp_buf env);
void longjmp(jmp_buf env, int val) __attribute__((noreturn));

#ifdef __cplusplus
}
#endif

#endif // !SETJMP_H
