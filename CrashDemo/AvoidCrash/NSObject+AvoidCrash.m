//
//  NSObject+AvoidCrash.m
//  CrashDemo
//
//  Created by xietao on 2017/5/2.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "NSObject+AvoidCrash.h"
#import "AvoidCrash.h"
#import "BSBacktraceLogger.h"

@implementation NSObject (AvoidCrash)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString * selectorName = NSStringFromSelector(aSelector);
    CCLog(@"unrecognized selector crash:%@:%@",NSStringFromClass([self class]),selectorName);
    BSLOG_MAIN
    Class class = objc_allocateClassPair(NSClassFromString(@"NSObject"),"AvoidCrashTarget",0);
    class_addMethod(class, aSelector, class_getMethodImplementation([self class], @selector(avoidCrashAction)), "@:");
    id tempObject = [[class alloc] init];
    return tempObject;
}
#pragma clang diagnostic pop

- (NSInteger)avoidCrashAction {
    return 0;
}

@end
