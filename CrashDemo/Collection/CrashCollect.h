//
//  CrashCollect.h
//  CrashDemo
//
//  Created by xietao on 2017/4/20.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#ifndef CrashCollect_h
#define CrashCollect_h
#define CCLog(frmt,...) NSLog([NSString stringWithFormat:@"Crash Collect: %@",frmt],##__VA_ARGS__)

#endif /* CrashCollect_h */
