//
//  ViewController.m
//  CrashDemo
//
//  Created by xietao on 2017/4/10.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "ViewController.h"
#import "LockViewController.h"
#import "ScrollViewController.h"
#import "TableViewController.h"
#import "ActionViewController.h"

@interface ViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentButton;
@property (nonatomic, strong) NSArray *functionlist;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.functionlist = @[@"crash监控",@"卡顿监控",@"页面路径",@"scrollView",@"tableView",@"控件touch监控"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.functionlist.count;
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
    cell.textLabel.text = self.functionlist[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        // 闪退
        case 0:
        {
            NSArray *arr = @[];
            NSLog(@"%@",arr[1]);

        }
            break;
        // 卡顿
        case 1:
        {
            LockViewController *goVC = [[LockViewController alloc] init];
            [goVC setTitle:self.functionlist[indexPath.row]];
            [self.navigationController pushViewController:goVC animated:YES];
        }
            break;
        // 页面路径
        case 2:
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *goVC = [storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
            [goVC setTitle:self.functionlist[indexPath.row]];
            [self.navigationController pushViewController:goVC animated:YES];
        }
            break;
        // scroll view
        case 3:
        {
            ScrollViewController *goVC = [[ScrollViewController alloc] init];
            [goVC setTitle:self.functionlist[indexPath.row]];
            [self.navigationController pushViewController:goVC animated:YES];
        }
            break;
        // table view
        case 4:
        {
            TableViewController *goVC = [[TableViewController alloc] init];
            [goVC setTitle:self.functionlist[indexPath.row]];
            [self.navigationController pushViewController:goVC animated:YES];

        }
            break;
        // 控件touch action
        case 5:
        {
            ActionViewController *goVC = [[ActionViewController alloc] init];
            [goVC setTitle:self.functionlist[indexPath.row]];
            [self.navigationController pushViewController:goVC animated:YES];

        }
            break;
        default:
            break;
    }
}

@end
