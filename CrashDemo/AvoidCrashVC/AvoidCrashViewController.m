//
//  AvoidCrashViewController.m
//  CrashDemo
//
//  Created by xietao on 2017/4/25.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "AvoidCrashViewController.h"

@interface AvoidCrashViewController ()
@property (nonatomic, strong) NSArray *functionList;
@end

@implementation AvoidCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _functionList = @[@"数组越界",@"数组插入nil",@"1"];
    [self initial];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initial {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.functionList.count;
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
    cell.textLabel.text = self.functionList[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
            // 数组越界
        case 0:
        {
            NSArray *arr = @[@"1",@"2",@"4"];
            NSLog(@"%@",arr[10]);
            
        }
            break;
            // 数组插入nil
        case 1:
        {
            NSString *str = nil;
            NSArray *arr = @[str];
            NSLog(@"%@",arr);
        }
            break;
            // 
        case 2:
        {
            [self performSelector:NSSelectorFromString(@"initial2") withObject:self];
        }
            break;
            //
        case 3:
        {

        }
            break;
            //
        case 4:
        {

            
        }
            break;
            //  
        case 5:
        {

            
        }
            break;
        case 6:
        {

            
        }
            break;
        default:
            break;
    }
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"如果没有闪退请将规避闪退代码注释" delegate:self cancelButtonTitle:@"好" otherButtonTitles: nil];
//    [alert show];
}



@end
