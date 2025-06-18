pub const jmp_buf = [10]usize;
pub extern fn setjmp(env: *jmp_buf) i32;
pub extern fn longjmp(env: *jmp_buf, val: i32) noreturn;
