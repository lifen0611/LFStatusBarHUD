//
//  LFStatusBarHUD.h
//  LFStatusBarHUD
//
//  Created by 黎奋 on 16/9/14.
//  Copyright © 2016年 occode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFStatusBarHUD : NSObject
/**显示成功信息*/
+ (void)showSucess:(NSString *)msg;
/**取消显示*/
+ (void)dismiss;
/**显示失败信息*/
+ (void)showError:(NSString *)msg;
/**显示正在加载信息*/
+ (void)showLoading:(NSString *)msg;
/**显示普通信息*/
+ (void)showMessage:(NSString *)msg;

/**显示带图片的普通信息*/
/**
 *  显示带图片的信息
 *
 *  @param msg   要显示的信息
 *  @param image  要显示的图片
 */
+ (void)showMessage:(NSString *)msg WithImage:(UIImage *)image;
@end
