//
//  FFToast.m
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/14.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import "FFToast.h"
#import "FFBaseToastView.h"
#import "FFCentreToastView.h"

@interface FFToast()

@property (nonatomic, copy) NSString* titleString;
@property (nonatomic, copy) NSString* messageString;
@property (strong, nonatomic) UIImage* iconImage;
//是否是自定义的View
@property (assign, nonatomic) BOOL isCustomToastView;
@property(nonatomic,strong)UIView *customToastView;

@property handler handler;

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
    
    self.isCustomToastView = NO;
    
    self = [self init];
    if(self){
        self.titleString = title;
        self.messageString = message;
        self.iconImage = iconImage;
        self.duration = duration;
        self.toastType = toastType;
    }

    return self;
}

- (instancetype)initToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage{
    
    self.isCustomToastView = NO;
    
    self = [self init];
    if (self) {
        self.titleString = title;
        self.messageString = message;
        self.iconImage = iconImage;
    }
    
    return self;
}

- (instancetype)initCentreToastWithView:(UIView *)customToastView autoDismiss:(BOOL)autoDismiss duration:(NSTimeInterval)duration enableDismissBtn:(BOOL)enableDismissBtn dismissBtnImage:(UIImage*)dismissBtnImage{
    
    self.isCustomToastView = YES;
    
    self = [self init];
    if (self) {
        self.customToastView = customToastView;
        self.autoDismiss = autoDismiss;
        self.duration = duration;
        self.enableDismissBtn = enableDismissBtn;
        self.dismissBtnImage = dismissBtnImage;
    }


    return self;
}

/**
 根据具体属性创建响应的Toast并显示出来
 */
- (void)show{
    if (_isCustomToastView == NO) {
        if (_toastPosition == FFToastPositionCentre || _toastPosition == FFToastPositionCentreWithFillet) {
            
            //FFCentreToastView
            FFCentreToastView *ffCentreToastView = [[FFCentreToastView alloc]initToastWithTitle:_titleString message:_messageString iconImage:_iconImage];
            
            ffCentreToastView.toastBackgroundColor = _toastBackgroundColor;
            ffCentreToastView.titleTextColor = _titleTextColor;
            ffCentreToastView.messageTextColor = _messageTextColor;
            ffCentreToastView.titleFont = _titleFont;
            ffCentreToastView.messageFont = _messageFont;
            ffCentreToastView.toastCornerRadius = _toastCornerRadius;
            ffCentreToastView.toastAlpha = _toastAlpha;
            ffCentreToastView.duration = _duration;
            ffCentreToastView.dismissToastAnimated = _dismissToastAnimated;
            ffCentreToastView.toastPosition = _toastPosition;
            ffCentreToastView.toastType = _toastType;
            ffCentreToastView.enableDismissBtn = _enableDismissBtn;
            ffCentreToastView.autoDismiss = _autoDismiss;
            [ffCentreToastView show];
            
            
        }else{
            //FFBaseToastView
            FFBaseToastView *ffBaseToastView = [[FFBaseToastView alloc]initToastWithTitle:_titleString message:_messageString iconImage:_iconImage];
            
            
            ffBaseToastView.toastBackgroundColor = _toastBackgroundColor;
            ffBaseToastView.titleTextColor = _titleTextColor;
            ffBaseToastView.messageTextColor = _messageTextColor;
            ffBaseToastView.titleFont = _titleFont;
            ffBaseToastView.messageFont = _messageFont;
            ffBaseToastView.toastCornerRadius = _toastCornerRadius;
            ffBaseToastView.toastAlpha = _toastAlpha;
            ffBaseToastView.duration = _duration;
            ffBaseToastView.dismissToastAnimated = _dismissToastAnimated;
            ffBaseToastView.toastPosition = _toastPosition;
            ffBaseToastView.toastType = _toastType;
            [ffBaseToastView show];
            
            
        }

    }else{
        //在屏幕中显示间自定义的View
        //FFCentreToastView
        FFCentreToastView *ffCentreToastView = [[FFCentreToastView alloc]initCentreToastWithView:_customToastView];
        
        ffCentreToastView.toastCornerRadius = _toastCornerRadius;
        ffCentreToastView.toastAlpha = _toastAlpha;
        ffCentreToastView.duration = _duration;
        ffCentreToastView.dismissToastAnimated = _dismissToastAnimated;
        ffCentreToastView.enableDismissBtn = _enableDismissBtn;
        ffCentreToastView.autoDismiss = _autoDismiss;
        [ffCentreToastView show];
    }
}

- (void)show:(handler)handler{
    if (_isCustomToastView == NO) {
        if (_toastPosition == FFToastPositionCentre || _toastPosition == FFToastPositionCentreWithFillet) {
            //FFCentreToastView
            FFCentreToastView *ffCentreToastView = [[FFCentreToastView alloc]initToastWithTitle:_titleString message:_messageString iconImage:_iconImage];
            
            ffCentreToastView.toastBackgroundColor = _toastBackgroundColor;
            ffCentreToastView.titleTextColor = _titleTextColor;
            ffCentreToastView.messageTextColor = _messageTextColor;
            ffCentreToastView.titleFont = _titleFont;
            ffCentreToastView.messageFont = _messageFont;
            ffCentreToastView.toastCornerRadius = _toastCornerRadius;
            ffCentreToastView.toastAlpha = _toastAlpha;
            ffCentreToastView.duration = _duration;
            ffCentreToastView.dismissToastAnimated = _dismissToastAnimated;
            ffCentreToastView.toastPosition = _toastPosition;
            ffCentreToastView.toastType = _toastType;
            ffCentreToastView.enableDismissBtn = _enableDismissBtn;
            ffCentreToastView.autoDismiss = _autoDismiss;
            [ffCentreToastView show];
            
        }else{
            //FFBaseToastView
            FFBaseToastView *ffBaseToastView = [[FFBaseToastView alloc]initToastWithTitle:_titleString message:_messageString iconImage:_iconImage];
            
            ffBaseToastView.toastBackgroundColor = _toastBackgroundColor;
            ffBaseToastView.titleTextColor = _titleTextColor;
            ffBaseToastView.messageTextColor = _messageTextColor;
            ffBaseToastView.titleFont = _titleFont;
            ffBaseToastView.messageFont = _messageFont;
            ffBaseToastView.toastCornerRadius = _toastCornerRadius;
            ffBaseToastView.toastAlpha = _toastAlpha;
            ffBaseToastView.duration = _duration;
            ffBaseToastView.dismissToastAnimated = _dismissToastAnimated;
            ffBaseToastView.toastPosition = _toastPosition;
            ffBaseToastView.toastType = _toastType;
            [ffBaseToastView show:^{
                _handler = handler;
                if (_handler) {
                    _handler();
                }
            }];
            
        }

    }else{
        //在屏幕中显示间自定义的View
        //FFCentreToastView
        FFCentreToastView *ffCentreToastView = [[FFCentreToastView alloc]initCentreToastWithView:_customToastView];
        
        ffCentreToastView.toastCornerRadius = _toastCornerRadius;
        ffCentreToastView.toastAlpha = _toastAlpha;
        ffCentreToastView.duration = _duration;
        ffCentreToastView.dismissToastAnimated = _dismissToastAnimated;
        ffCentreToastView.enableDismissBtn = _enableDismissBtn;
        ffCentreToastView.autoDismiss = _autoDismiss;
        [ffCentreToastView show];
    }
    
}


/**
 重写init方法，加入默认属性
 */
- (id) init
{
    if (self = [super init]){
        [self initToastConfig];
    }
    return self;
}



/**
 初始化Toast基本配置（可以在这里修改一些默认效果）
 */
-(void)initToastConfig{
    
    //默认背景色
    self.toastBackgroundColor = [UIColor darkGrayColor];
    
    //TextColor
    self.titleTextColor = [UIColor whiteColor];
    self.messageTextColor = [UIColor whiteColor];
    
    //TextFont
    self.titleFont = [UIFont systemFontOfSize:15.f weight:UIFontWeightMedium];
    self.messageFont = [UIFont systemFontOfSize:15.f];
    
    self.toastCornerRadius = 0.f;
    self.toastAlpha = 1.f;
    
    self.dismissToastAnimated = YES;
    
    //默认显示3s
    if (self.duration == 0) {
        self.duration = 3.f;
    }
    
    self.toastPosition = FFToastPositionDefault;
    
    self.enableDismissBtn = YES;
    self.autoDismiss = YES;
    
    
}

- (UIImage*)imageNamed:(NSString*)name {
    NSBundle * pbundle = [NSBundle bundleForClass:[self class]];
    NSString *bundleURL = [pbundle pathForResource:@"FFToast" ofType:@"bundle"];
    NSBundle *imagesBundle = [NSBundle bundleWithPath:bundleURL];
    UIImage * image = [UIImage imageNamed:name inBundle:imagesBundle compatibleWithTraitCollection:nil];
    return image;
}



@end
