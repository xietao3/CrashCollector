//
//  ViewController.m
//  CrashDemo
//
//  Created by xietao on 2017/4/10.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "ViewController.h"
#import "FDLockMonitor.h"
#import "BSBacktraceLogger.h"

@interface ViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentButton;

@property (nonatomic, strong) UIButton *tempButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSMutableArray *array = [NSMutableArray array];
//    [array addObject:nil];
    self.mScrollView.contentSize = CGSizeMake(300, 300);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ggg:(id)sender {
    
}

- (IBAction)fff:(id)sender {
    static NSInteger i = 0;
    while (1) {
        if (i == 19999) {
            return;
        }
        i++;
        NSLog(@"%ld",i);
    }
}

- (IBAction)ccc:(id)sender {
    UIButton *btn = [[UIButton alloc] init];
    
}
- (IBAction)eeee:(id)sender {
}

- (IBAction)segmentClickAction:(id)sender {
    NSLog(@"segmentClickAction:xietao");
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = @"333";
    
    return cell;
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

}

@end
