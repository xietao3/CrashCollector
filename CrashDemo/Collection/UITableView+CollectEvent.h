//
//  UITableView+CollectEvent.h
//  CrashDemo
//
//  Created by xietao on 2017/4/20.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CollectEvent)

- (void)swizzling_tableViewDidSelectRowAtIndexPathInClass:(id)object;

@end
