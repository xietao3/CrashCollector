//
//  ActionViewController.m
//  CrashDemo
//
//  Created by xietao on 2017/4/21.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "ActionViewController.h"

@interface ActionViewController ()

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBAction
- (IBAction)textFieldDidBeginEdit:(id)sender {
    
}

- (IBAction)sliderValueDidChange:(id)sender {
    
}

- (IBAction)switchValueDidChange:(id)sender {
    
}

- (IBAction)segmentValueDidChange:(id)sender {
    
}

- (IBAction)stepperValueDidChange:(id)sender {
    
}

- (IBAction)buttonDidTouchUpInside:(id)sender {
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
