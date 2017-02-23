//
//  FFBaseToastView.h
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/23.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFConfig.h"

@interface FFBaseToastView : UIView

//Toast点击回调
typedef void(^handler)(void);


//背景颜色
@property (strong, nonatomic) UIColor* toastBackgroundColor;
//Toast标题文字颜色
@property (strong, nonatomic) UIColor* titleTextColor;
//Toast内容文字颜色
@property (strong, nonatomic) UIColor* messageTextColor;

//Toast标题文字字体
@property (strong, nonatomic) UIFont* titleFont;
//Toast文字字体
@property (strong, nonatomic) UIFont* messageFont;

//Toast View圆角
@property(assign,nonatomic)CGFloat toastCornerRadius;
//Toast View透明度
@property(assign,nonatomic)CGFloat toastAlpha;

//Toast显示时长
@property(assign,nonatomic)NSTimeInterval duration;
//Toast消失动画是否启用
@property(assign,nonatomic)BOOL dismissToastAnimated;

//Toast显示位置
@property (assign, nonatomic) FFToastPosition toastPosition;




/**
 创建并显示一个Toast
 
 @param title 标题
 @param message 消息内容
 @param iconImage 消息icon，toastType不为FFToastTypeDefault时iconImage为空仍然会有相应icon
 @param duration 显示时长
 */
+ (void)showToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage duration:(NSTimeInterval)duration toastType:(FFToastType)toastType;


/**
 创建一个Toast
 
 @param title 标题
 @param message 消息内容
 @param iconImage 消息icon
 @return Toast
 */
- (instancetype)initToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage;


/**
 显示一个Toast
 */
- (void)show;

/**
 显示一个Toast
 
 @param handler Toast点击回调
 */
- (void)show:(handler)handler;


@end
