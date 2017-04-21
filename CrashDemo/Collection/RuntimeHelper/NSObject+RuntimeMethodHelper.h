//
//  NSObject+RuntimeMethodHelper.h
//  CrashDemo
//
//  Created by xietao on 2017/4/20.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface NSObject (RuntimeMethodHelper)

- (BOOL)class_addMethod:(Class)class selector:(SEL)selector imp:(IMP)imp types:(const char *)types;

- (void)sel_exchangeFirstSel:(SEL)sel1 secondSel:(SEL)sel2;

- (void)sel_exchangeClass:(Class)class FirstSel:(SEL)sel1 secondSel:(SEL)sel2;

- (IMP)method_getImplementation:(Method)method;

- (Method)class_getInstanceMethod:(Class)class selector:(SEL)selector;

- (BOOL)isContainSel:(SEL)sel inClass:(Class)class;

- (void)log_class_copyMethodList:(Class)class;
@end
