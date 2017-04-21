//
//  LockViewController.m
//  CrashDemo
//
//  Created by xietao on 2017/4/21.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "LockViewController.h"

@interface LockViewController ()

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initial];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initial {
    UIButton *lockButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [lockButton setTitle:@"卡顿" forState:UIControlStateNormal];
    [lockButton setBackgroundColor:[UIColor orangeColor]];
    [lockButton addTarget:self action:@selector(lockAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lockButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)lockAction {
    sleep(3);
}

@end
