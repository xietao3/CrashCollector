//
//  UIControl+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/11.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UIControl+CollectEvent.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIControl (CollectEvent)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //创建新的sendAction:to:forEvent:方法
        [self methodSwap:[self class] firstMethod:@selector(sendAction:to:forEvent:) secondMethod:@selector(fd_sendAction:to:forEvent:)];

    });

}


- (void)fd_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    NSLog(@"%@ send action:%@ to:%@ frame:(x:%.2f y:%.2f w:%.2f h:%.2f)",
          [self class],
          NSStringFromSelector(action),
          NSStringFromClass([target class]),
          self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height);
    [self fd_sendAction:action to:target forEvent:event];
}


+ (void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2 {
    Method firstMethod = class_getInstanceMethod(class, method1);
    Method secondMethod = class_getInstanceMethod(class, method2);
    method_exchangeImplementations(firstMethod, secondMethod);
}
@end
