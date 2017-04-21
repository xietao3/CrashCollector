//
//  UIScrollView+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/12.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UIScrollView+CollectEvent.h"
#import "RuntimeHelper.h"
#import "UITableView+CollectEvent.h"
#import "CrashCollect.h"

// return sel
#define GET_CLASS_CUSTOM_SEL(sel,class)  NSSelectorFromString([NSString stringWithFormat:@"%@_%@",NSStringFromClass(class),NSStringFromSelector(sel)])

@implementation UIScrollView (CollectEvent)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sel_exchangeFirstSel:@selector(setDelegate:) secondSel:@selector(fd_setDelegate:)];
    });
}


- (void)fd_setDelegate:(id<UIScrollViewDelegate>)delegate {
    if ([self isMemberOfClass:[UIScrollView class]]) {
        if (![self isContainSel:GET_CLASS_CUSTOM_SEL(@selector(scrollViewWillBeginDragging:),[delegate class]) inClass:[delegate class]]) {
            [self swizzling_scrollViewWillBeginDragging:delegate];
        }
        [self fd_setDelegate:delegate];
    }else if ([NSStringFromClass([self class]) isEqualToString:@"UITableView"]){
        if (![self isContainSel:GET_CLASS_CUSTOM_SEL(@selector(scrollViewWillBeginDragging:),[delegate class]) inClass:[delegate class]]) {
            [self swizzling_scrollViewWillBeginDragging:delegate];
        }
        
        if (![self isContainSel:GET_CLASS_CUSTOM_SEL(@selector(tableView:didSelectRowAtIndexPath:),[delegate class]) inClass:[delegate class]]) {
            [(UITableView *)self swizzling_tableViewDidSelectRowAtIndexPathInClass:delegate];
        }

        [self fd_setDelegate:delegate];
    }else{
        if (![self isContainSel:GET_CLASS_CUSTOM_SEL(@selector(scrollViewWillBeginDragging:),[delegate class]) inClass:[delegate class]]) {
            [self swizzling_scrollViewWillBeginDragging:delegate];
        }
        [self fd_setDelegate:delegate];

    }
}

- (void)swizzling_scrollViewWillBeginDragging:(id<UIScrollViewDelegate>)delegate {
    // 为每个含tableView的控件 增加swizzle delegate method
    [self class_addMethod:[delegate class]
                 selector:GET_CLASS_CUSTOM_SEL(@selector(scrollViewWillBeginDragging:),[delegate class])
                      imp:method_getImplementation(class_getInstanceMethod([self class],@selector(fd_scrollViewWillBeginDragging:)))
                    types:"v@:@"];
    
    // 检查页面是否已经实现了origin delegate method  如果没有手动加一个
    if (![self isContainSel:@selector(scrollViewWillBeginDragging:) inClass:[delegate class] ]) {
        [self class_addMethod:[delegate class]
                     selector:@selector(scrollViewWillBeginDragging:)
                          imp:nil
                        types:"v@"];
    }
    
    // 将swizzle delegate method 和 origin delegate method 交换
    [self sel_exchangeClass:[delegate class]
                   FirstSel:@selector(scrollViewWillBeginDragging:)
                  secondSel:GET_CLASS_CUSTOM_SEL(@selector(scrollViewWillBeginDragging:),[delegate class])];
}


/**
 swizzle method IMP
 
 @param scrollView scrollView description
 */
- (void)fd_scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    CCLog(@"%@ scrollViewWillBeginDragging:",NSStringFromClass([self class]));
    SEL sel = GET_CLASS_CUSTOM_SEL(@selector(scrollViewWillBeginDragging:),[self class]);
    if ([self respondsToSelector:sel]) {
        IMP imp = [self methodForSelector:sel];
        void (*func)(id, SEL,id) = (void *)imp;
        func(self, sel,scrollView);
    }
}



@end
