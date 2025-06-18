# zig_setjmp

A Zig module that implements the functionality of the C standard library’s `setjmp` and `longjmp` for non-local jumps.

## example:

```zig
const std = @import("std");
const zig_setjmp = @import("setjmp");
const jmp_buf = zig_setjmp.jmp_buf;
const setjmp = zig_setjmp.setjmp;
const longjmp = zig_setjmp.longjmp;

var buf: jmp_buf = undefined;

pub fn main() void {
    const val = setjmp(&buf);

    if (val == 0) {
        std.debug.print("setjmp returned 0\n", .{});
        goOut();
    } else {
        std.debug.print("longjmp returned {}\n", .{val});
    }
}

fn goOut() void {
    longjmp(&buf, 42);
}
```
