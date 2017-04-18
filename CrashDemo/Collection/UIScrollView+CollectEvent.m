//
//  UIScrollView+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/12.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UIScrollView+CollectEvent.h"

@implementation UIScrollView (CollectEvent)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        

    });
}

@end
