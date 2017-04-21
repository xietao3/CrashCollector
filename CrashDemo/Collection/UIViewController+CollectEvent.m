//
//  UIViewController+CollectEvent.m
//  CrashDemo
//
//  Created by xietao on 2017/4/11.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "UIViewController+CollectEvent.h"
#import "RuntimeHelper.h"
#import "CrashCollect.h"


@implementation UIViewController (CollectEvent)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 替换方法
        [self sel_exchangeFirstSel:@selector(viewDidLoad) secondSel:@selector(fd_viewDidLoad)];
        [self sel_exchangeFirstSel:@selector(viewWillAppear:) secondSel:@selector(fd_viewWillAppear:)];
        [self sel_exchangeFirstSel:@selector(viewDidAppear:) secondSel:@selector(fd_viewDidAppear:)];

    });
}

- (void)fd_viewDidLoad {
    CCLog(@"%@ viewDidLoad",NSStringFromClass([self class]));
    [self fd_viewDidLoad];
}

//新的viewWillAppear方法
- (void)fd_viewWillAppear:(BOOL)animated {
    CCLog(@"%@ viewWillAppear",NSStringFromClass([self class]));
    [self fd_viewWillAppear:animated];
}

//新的viewWillDisappear方法
- (void)fd_viewDidAppear:(BOOL)animated {
    CCLog(@"%@ viewDidAppear",NSStringFromClass([self class]));
    [self fd_viewDidAppear:animated];
}



//- (void)fd_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self fd_tableView:tableView didSelectRowAtIndexPath:indexPath];
//    CCLog(@"%@ tableView:didSelectRowAtIndexPath:",NSStringFromClass([self class]));
//}



@end
