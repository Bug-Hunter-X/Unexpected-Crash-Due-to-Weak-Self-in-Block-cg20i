The solution involves using `__strong typeof(self) strongSelf = self;` inside the block. This creates a strong local reference to `self`, preventing its deallocation until the block finishes.  Here's the corrected code:

```objectivec
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
        __strong typeof(self) strongSelf = self; // create a strong local reference to self 
        if (strongSelf) { // Check if self still exists 
            [strongSelf performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:YES]; 
        }
    });
}

- (void)updateUI {
    NSLog("UI Updated");
}
@end
```
This ensures that `self` remains in memory throughout the block's execution, preventing the crash.