//
//  UIControl+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/11.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UIControl+CollectEvent.h"
#import "RuntimeHelper.h"
#import "CrashCollect.h"

@implementation UIControl (CollectEvent)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //创建新的sendAction:to:forEvent:方法
        [self sel_exchangeFirstSel:@selector(sendAction:to:forEvent:) secondSel:@selector(fd_sendAction:to:forEvent:)];

    });

}


- (void)fd_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    CCLog(@"%@ send action:%@ to:%@ frame:(x:%.2f y:%.2f w:%.2f h:%.2f)",
          [self class],
          NSStringFromSelector(action),
          NSStringFromClass([target class]),
          self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height);
    [self fd_sendAction:action to:target forEvent:event];
}


@end
