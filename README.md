# Unexpected Crash Due to Weak Self in Block

This repository demonstrates a common Objective-C memory management issue involving blocks and weak references.  The `bug.m` file contains code that exhibits the problem, while `bugSolution.m` provides a corrected version.

The issue arises when a block retains a weak reference to `self`. If `self` is deallocated before the block executes, attempting to access `self` within the block results in a crash.

The solution involves using a strong reference to `self` within the block's scope, ensuring that `self` remains in memory until the block completes its execution. This approach prevents the access to deallocated memory, thus resolving the crash.