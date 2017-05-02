//
//  AvoidCrash.m
//  CrashDemo
//
//  Created by xietao on 2017/4/25.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "AvoidCrash.h"

@implementation AvoidCrash

+ (void)setErrorWithException:(NSException *)exception remark:(NSString *)remark {
    CCLog(@"exception = %@",exception);
    CCLog(@"callStackSymbols = %@",[exception callStackSymbols]);
}


@end
