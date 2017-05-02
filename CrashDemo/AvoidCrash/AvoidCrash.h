//
//  AvoidCrash.h
//  CrashDemo
//
//  Created by xietao on 2017/4/25.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RuntimeHelper.h"
#import "CrashCollect.h"

@interface AvoidCrash : NSObject

+ (void)setErrorWithException:(NSException *)exception remark:(NSString *)remark;

@end
