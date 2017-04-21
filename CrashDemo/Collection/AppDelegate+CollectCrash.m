//
//  AppDelegate+CollectCrash.m
//  CrashDemo
//
//  Created by xietao on 2017/4/10.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "AppDelegate+CollectCrash.h"
#import "CrashCollect.h"

@implementation AppDelegate (CollectCrash)

- (void)collectCrash {
    
    struct sigaction newSignalAction;
    memset(&newSignalAction, 0,sizeof(newSignalAction));
    newSignalAction.sa_handler = &signalHandler;
    sigaction(SIGABRT, &newSignalAction, NULL);
    sigaction(SIGILL, &newSignalAction, NULL);
    sigaction(SIGSEGV, &newSignalAction, NULL);
    sigaction(SIGFPE, &newSignalAction, NULL);
    sigaction(SIGBUS, &newSignalAction, NULL);
    sigaction(SIGPIPE, &newSignalAction, NULL);
    
    //异常时调用的函数
    NSSetUncaughtExceptionHandler(&handleExceptions);
    
}

void handleExceptions(NSException *exception) {
    CCLog(@"exception = %@",exception);
    CCLog(@"callStackSymbols = %@",[exception callStackSymbols]);
}

void signalHandler(int sig) {
//    //最好不要写，可能会打印太多内容
//    NSLog(@"signal = %d", sig);
}

@end
