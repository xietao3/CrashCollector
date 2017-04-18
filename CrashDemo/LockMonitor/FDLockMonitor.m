//
//  FDLockMonitor.m
//  CrashDemo
//
//  Created by xietao on 2017/4/18.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "FDLockMonitor.h"
#import "BSBacktraceLogger.h"
#import <mach/mach.h>
#import <sys/sysctl.h>

static const NSTimeInterval monitLockTimeInterval = 2.0;

@interface FDLockMonitor ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation FDLockMonitor


+ (instancetype)shareMonitor {
    static FDLockMonitor *shareMonitor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareMonitor = [[FDLockMonitor alloc] init];
        [shareMonitor initial];
    });
    return shareMonitor;
}

- (void)initial {
    _operationQueue = [[NSOperationQueue alloc] init];
    [self addObserver];
}

// 添加一个监听者
- (void)addObserver {
    
    
    __weak __typeof(&*self)weakSelf = self;
    // 1. 创建监听者
    /**
     *  创建监听者
     *
     *   allocator    分配存储空间
     *   activities   要监听的状态
     *   repeats      是否持续监听
     *   order        优先级, 默认为0
     *   observer     观察者
     *   activity     监听回调的当前状态
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        /*
         kCFRunLoopEntry = (1UL << 0),          进入工作
         kCFRunLoopBeforeTimers = (1UL << 1),   即将处理Timers事件
         kCFRunLoopBeforeSources = (1UL << 2),  即将处理Source事件
         kCFRunLoopBeforeWaiting = (1UL << 5),  即将休眠
         kCFRunLoopAfterWaiting = (1UL << 6),   被唤醒
         kCFRunLoopExit = (1UL << 7),           退出RunLoop
         kCFRunLoopAllActivities = 0x0FFFFFFFU  监听所有事件
         */
        switch (activity) {
            case kCFRunLoopEntry:
//                NSLog(@"进入");
                break;
            case kCFRunLoopBeforeTimers:
//                NSLog(@"即将处理Timer事件");
                break;
            case kCFRunLoopBeforeSources:
//                NSLog(@"即将处理Source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                [weakSelf.operationQueue cancelAllOperations];
//                NSLog(@"op num:%ld",weakSelf.operationQueue.operationCount);
//                NSLog(@"即将休眠");
                break;
            case kCFRunLoopAfterWaiting:
//                NSLog(@"被唤醒");
                [weakSelf startCountDown];
                break;
            case kCFRunLoopExit:
//                NSLog(@"退出RunLoop");
                break;
            default:
                break;
        }
    });
    
    // 2. 添加监听者
    /**
     *  给指定的RunLoop添加监听者
     *
     *  @param rl#>       要添加监听者的RunLoop
     *  @param observer#> 监听者对象
     *  @param mode#>     RunLoop的运行模式, 填写默认模式即可
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
}

- (void)startCountDown {
    __weak __typeof(&*self)weakSelf = self;
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(monitLockTimeInterval);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf appearlockAction];
    }];
    [op2 addDependency:op1];
    [_operationQueue addOperation:op1];
    [_operationQueue addOperation:op2];
    
}

- (void)appearlockAction {
    NSLog(@"----------卡顿-----------");
    BSLOG_MAIN;
}


@end
