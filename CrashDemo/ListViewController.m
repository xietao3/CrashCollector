//
//  ListViewController.m
//  CrashDemo
//
//  Created by xietao on 2017/4/11.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//- (void)getCurrentRunLoopMode{
//    // 每次定时器触发, 都去查看当前的RunLoop的运行mode
//    NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)listButtonAction:(id)sender {
    sleep(3);
}

- (IBAction)listSwitchAction:(id)sender {
    sleep(3);
}

- (IBAction)indexCrashAction:(id)sender {
    NSArray *arr = @[];
    NSLog(@"%@",arr[1]);
}







@end
