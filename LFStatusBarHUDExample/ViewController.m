//
//  ViewController.m
//  LFStatusBarHUD
//
//  Created by 黎奋 on 16/9/14.
//  Copyright © 2016年 occode. All rights reserved.
//

#import "ViewController.h"
#import "LFStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)sucuss:(id)sender {
    [LFStatusBarHUD showSucess:@"下载成功"];
}
- (IBAction)fail:(id)sender {
    [LFStatusBarHUD showError:@"下载成功"];
}
- (IBAction)loading:(id)sender {
    [LFStatusBarHUD showLoading:@"正在加载..."];
}
- (IBAction)normalMsg:(id)sender {
    [LFStatusBarHUD showMessage:@"heheheh"];
}
- (IBAction)cancle:(id)sender {
    [LFStatusBarHUD dismiss];
}

@end
