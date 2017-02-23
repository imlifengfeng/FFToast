//
//  FFToast.m
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/14.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import "FFToast.h"
#import "FFBaseToastView.h"

@interface FFToast()

@property (nonatomic, copy) NSString* titleString;
@property (nonatomic, copy) NSString* messageString;
@property (strong, nonatomic) UIImage* iconImage;

@property (assign, nonatomic) FFToastType toastType;

@end


@implementation FFToast


+ (void)showToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage duration:(NSTimeInterval)duration toastType:(FFToastType)toastType{
    
    FFToast *toast = [[FFToast alloc]initWithTitle:title message:message iconImage:iconImage duration:duration toastType:toastType];
    [toast show];

}


/**
 初始化一个FFToast

 @param title 标题
 @param message 消息内容
 @param iconImage 图标
 @param duration 显示时长
 @param toastType toast种类
 @return FFToast
 */
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage duration:(NSTimeInterval)duration toastType:(FFToastType)toastType{
    
    self = [super init];
    if(self){
        _titleString = title;
        _messageString = message;
        _iconImage = iconImage;
        _duration = duration;
        _toastType = toastType;
    }

    return self;
}

- (instancetype)initToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage{
    self = [super init];
    if (self) {
        _titleString = title;
        _messageString = message;
        _iconImage = iconImage;
    }
    
    return self;
}

/**
 根据具体属性创建响应的Toast并显示出来
 */
- (void)show{
    if (_toastPosition == FFToastPositionCentre || _toastPosition == FFToastPositionCentreWithFillet) {
        //TODO:还没写
    }else{
        //FFBaseToastView
        FFBaseToastView *ffBaseToastView = [[FFBaseToastView alloc]initToastWithTitle:_titleString message:_messageString iconImage:_iconImage];
        
        
        ffBaseToastView.toastBackgroundColor = _toastBackgroundColor;
        ffBaseToastView.titleTextColor = _titleTextColor;
        ffBaseToastView.messageTextColor = _messageTextColor;
//        ffBaseToastView.titleFont = _titleFont;
//        ffBaseToastView.messageFont = _messageFont;
        ffBaseToastView.toastCornerRadius = _toastCornerRadius;
//        ffBaseToastView.toastAlpha = _toastAlpha;
        ffBaseToastView.duration = _duration;
        ffBaseToastView.dismissToastAnimated = _dismissToastAnimated;
        ffBaseToastView.toastPosition = _toastPosition;
        [ffBaseToastView show];
        
    }
}

- (void)show:(handler)handler{
}






@end
