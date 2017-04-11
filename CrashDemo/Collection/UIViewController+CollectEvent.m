//
//  UIViewController+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/11.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UIViewController+CollectEvent.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIViewController (CollectEvent)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //创建新的viewWillAppear方法
        [self methodSwap:[self class] firstMethod:@selector(viewWillAppear:) secondMethod:@selector(fd_viewWillAppear:)];
        //创建新的viewDidAppear方法
        [self methodSwap:[self class] firstMethod:@selector(viewDidAppear:) secondMethod:@selector(fd_viewDidAppear:)];
        
    });
}

//新的viewWillAppear方法
- (void)fd_viewWillAppear:(BOOL)animated {
    [self fd_viewWillAppear:animated];
    
    NSLog(@"%@ viewWillAppear",NSStringFromClass([self class]));
}

//新的viewWillDisappear方法
- (void)fd_viewDidAppear:(BOOL)animated {
    [self fd_viewDidAppear:animated];
    NSLog(@"%@ viewDidAppear",NSStringFromClass([self class]));
}

+ (void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2 {
    Method firstMethod = class_getInstanceMethod(class, method1);
    Method secondMethod = class_getInstanceMethod(class, method2);
    method_exchangeImplementations(firstMethod, secondMethod);
}
@end
