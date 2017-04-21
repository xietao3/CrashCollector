//
//  UITableView+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/20.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UITableView+CollectEvent.h"
#import "RuntimeHelper.h"
#import "CrashCollect.h"

// return sel
#define GET_CLASS_CUSTOM_SEL(sel,class)  NSSelectorFromString([NSString stringWithFormat:@"%@_%@",NSStringFromClass(class),NSStringFromSelector(sel)])


@implementation UITableView (CollectEvent)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

    });
}


- (void)swizzling_tableViewDidSelectRowAtIndexPathInClass:(id)object {
    SEL sel = @selector(tableView:didSelectRowAtIndexPath:);

    
    // 为每个含tableView的控件 增加swizzle delegate method
    [self class_addMethod:[object class]
                 selector:GET_CLASS_CUSTOM_SEL(sel,[object class])
                      imp:method_getImplementation(class_getInstanceMethod([self class],@selector(fd_imp_tableView:didSelectRowAtIndexPath:)))
                    types:"v@:@@"];
    
    // 检查页面是否已经实现了origin delegate method  如果没有手动加一个
    if (![self isContainSel:sel inClass:[object class] ]) {
        [self class_addMethod:[object class]
                     selector:sel
                          imp:nil
                        types:"v@:@@"];
    }
    
    // 将swizzle delegate method 和 origin delegate method 交换
    [self sel_exchangeClass:[object class]
                   FirstSel:sel
                  secondSel:GET_CLASS_CUSTOM_SEL(sel,[object class])];
}

/**
 swizzle method IMP
 */
- (void)fd_imp_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CCLog(@"%@ didSelectRowAtIndexPath:%ld:%ld",NSStringFromClass([self class]),indexPath.section,indexPath.row);
    SEL sel = GET_CLASS_CUSTOM_SEL(@selector(tableView:didSelectRowAtIndexPath:),[self class]);
    if ([self respondsToSelector:sel]) {
        IMP imp = [self methodForSelector:sel];
        void (*func)(id, SEL,id,id) = (void *)imp;
        func(self, sel,tableView,indexPath);
    }
}


@end
