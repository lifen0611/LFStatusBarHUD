//
//  LFStatusBarHUD.m
//  LFStatusBarHUD
//
//  Created by 黎奋 on 16/9/14.
//  Copyright © 2016年 occode. All rights reserved.
//

#import "LFStatusBarHUD.h"


#define LFScreenW  [UIScreen mainScreen].bounds.size.width
#define LFWindowH   20.0

@implementation LFStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;
static CGFloat const animationTime = 0.25;

+ (void)showWindow
{
    window_.hidden = YES;
    CGFloat windowH = LFWindowH;
    CGFloat screenW = LFScreenW;
    CGRect frame = CGRectMake(0, -windowH, screenW, windowH);
    window_ = [[UIWindow alloc] initWithFrame:frame];
    
    window_.backgroundColor = [UIColor blackColor];
    //设置window的级别为UIWindowLevelStatusBar， 或者以上，代表它能盖住status bar
    window_.windowLevel = UIWindowLevelStatusBar;
    //window_ 显示出来
    window_.hidden = NO;
    
    [UIView animateWithDuration:animationTime animations:^{
        window_.frame = CGRectMake(0, 0, screenW, windowH);
    }];
    
}

/**
 *  显示成功信息
 *
 *  @param msg 要显示的信息
 */
+ (void)showSucess:(NSString *)msg
{
    [self showWindow];
    
    [self showMessage:msg WithImage: [UIImage imageNamed:@"LFStatusBarHUD.bundle/success"]];
}

/**
 *  显示失败信息
 *
 *  @param msg 要显示的信息
 */
+ (void)showError:(NSString *)msg
{
    [self showWindow];
    [self showMessage:msg WithImage: [UIImage imageNamed:@"LFStatusBarHUD.bundle/error"]];
}

+ (void)showLoading:(NSString *)msg
{
    [timer_ invalidate];
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.text = msg;
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = window_.bounds;
    
    [window_ addSubview:label];
    
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] init];
    [activityIndicator startAnimating];
    
    CGFloat textW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}].width;
    
    activityIndicator.center = CGPointMake((window_.frame.size.width - textW) / 2 - 20, window_.frame.size.height * 0.5);
    
    [window_ addSubview:activityIndicator];
    
    
    
}

+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg WithImage:nil];
    
}

+ (void)showMessage:(NSString *)msg WithImage:(UIImage *)image
{
    [timer_ invalidate];
    [self showWindow];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    //    button.center = CGPointMake(screenW * 0.5, windowH * 0.5);
    [button setTitle:msg forState:UIControlStateNormal];
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button setImage:image forState:UIControlStateNormal];
    }
    
    [window_ addSubview:button];
    
    //显示好之后，过0.25之后又会去
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(dismiss) userInfo:nil repeats:nil];
    
}



+ (void)dismiss
{
    [UIView animateWithDuration:animationTime animations:^{
        window_.frame = CGRectMake(0, -LFWindowH, LFScreenW, LFWindowH);
    } completion:^(BOOL finished) {
        timer_ = nil;
        window_.hidden = YES;
        window_ = nil;
    }];
}

@end
