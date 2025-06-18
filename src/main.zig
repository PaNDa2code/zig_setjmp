var buf: lib.jmp_buf = undefined;

pub fn main() void {
    const val = lib.setjmp(&buf);

    if (val == 0) {
        std.debug.print("setjmp returned 0\n", .{});
        lib.longjmp(&buf, 42);
    } else {
        std.debug.print("longjmp returned {}\n", .{val});
    }
}

const std = @import("std");

const lib = @import("zig_setjmp_lib");
