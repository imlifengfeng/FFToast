//
//  FFCentreToastView.m
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/24.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import "FFCentreToastView.h"

#define HORIZONTAL_SPACE_TO_SCREEN 100.f
#define HORIZONTAL_SPACE_TO_TOASTVIEW 10.f
#define TOP_SPACE_TO_TOASTVIEW 10.f
#define ICON_IMG_SIZE CGSizeMake(35.f, 35.f)
#define DISMISS_BTN_IMG_SIZE CGSizeMake(20.f, 20.f)

@interface FFCentreToastView()

//Toast图标ImageView
@property(strong,nonatomic)UIImageView *iconImageView;
//Toast标题Label
@property(strong,nonatomic)UILabel *titleLabel;
//Toast内容Label
@property(strong,nonatomic)UILabel *messageLabel;
//关闭按钮
@property(strong,nonatomic)UIButton *dismissBtn;

@property (nonatomic, copy) NSString* titleString;
@property (nonatomic, copy) NSString* messageString;
@property (strong, nonatomic) UIImage* iconImage;

@property (assign, nonatomic) CGSize titleLabelSize;
@property (assign, nonatomic) CGSize messageLabelSize;
@property (assign, nonatomic) CGSize iconImageSize;
@property (assign, nonatomic) CGRect toastViewFrame;

//是否是自定义的View
@property (assign, nonatomic) BOOL isCustomToastView;
//真正展示内容的View
@property(strong,nonatomic)UIView *toastView;

@property handler handler;


@end


@implementation FFCentreToastView

static NSMutableArray* toastArray = nil;


- (instancetype)initToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage{
    self.isCustomToastView = NO;
    self.titleString = title;
    self.messageString = message;
    self.iconImage = iconImage;
    
    return [self init];
}

-(instancetype)initCentreToastWithView:(UIView *)customToastView{
    self.isCustomToastView = YES;
    
    self.toastView = customToastView;
    
    return [self init];
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        if(_isCustomToastView == NO){
            
            self.toastView = [[UIView alloc]init];
            
            self.iconImageView = [[UIImageView alloc]init];
            [self.toastView addSubview:self.iconImageView];
            
            self.titleLabel = [[UILabel alloc]init];
            self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            self.titleLabel.textAlignment = NSTextAlignmentLeft;
            self.titleLabel.numberOfLines = 0;
            [self.toastView addSubview:self.titleLabel];
            
            self.messageLabel = [[UILabel alloc]init];
            self.messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
            self.messageLabel.textAlignment = NSTextAlignmentLeft;
            self.messageLabel.numberOfLines = 0;
            [self.toastView addSubview:self.messageLabel];
            
            self.dismissBtn = [[UIButton alloc]init];
            [self.toastView addSubview:self.dismissBtn];
            
            [self addSubview:self.toastView];
        
        }else{
            
             [self addSubview:self.toastView];
            
        }
        
        
        

    }
    
    return self;
}


/**
 设置Toast的frame、属性及内部控件的属性等
 */
-(void)layoutToastView{
    
    if(_isCustomToastView == NO){
        
        //设置子控件属性
        self.titleLabel.textColor = _titleTextColor;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = _titleFont;
        
        self.messageLabel.textColor = _messageTextColor;
        self.messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.messageLabel.textAlignment = NSTextAlignmentLeft;
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.font = _messageFont;
        
        self.toastView.alpha = _toastAlpha;
        self.toastView.layer.cornerRadius = _toastCornerRadius;
        self.toastView.layer.masksToBounds = YES;
        
        self.dismissBtn.imageView.image = self.dismissBtnImage;
        
        //根据toastType设置背景色、icon
        //如果同时设置了toastType和toastBackgroundColor时，toastBackgroundColor将无效，视图的背景颜色为toastType相应的颜色。
        if (self.toastType != 0) {
            switch (self.toastType) {
                case FFToastTypeDefault: {
                    self.toastBackgroundColor = [UIColor darkGrayColor];
                    break;
                }
                case FFToastTypeSuccess: {
                    self.toastBackgroundColor = [UIColor colorWithRed:31.f/255.f green:177.f/255.f blue:138.f/255.f alpha:1.f];
                    if (!_iconImage) {
                        self.iconImage = [UIImage imageWithName:@"fftoast_success"];
                    }
                    break;
                }
                case FFToastTypeError: {
                    self.toastBackgroundColor = [UIColor colorWithRed:255.f/255.f green:91.f/255.f blue:65.f/255.f alpha:1.f];
                    if (!_iconImage) {
                        self.iconImage = [UIImage imageWithName:@"fftoast_error"];
                    }
                    break;
                }
                case FFToastTypeWarning: {
                    self.toastBackgroundColor = [UIColor colorWithRed:255.f/255.f green:134.f/255.f blue:0.f/255.f alpha:1.f];
                    if (!_iconImage) {
                        self.iconImage = [UIImage imageWithName:@"fftoast_warning"];
                    }
                    break;
                }
                case FFToastTypeInfo: {
                    self.toastBackgroundColor = [UIColor colorWithRed:75.f/255.f green:107.f/255.f blue:122.f/255.f alpha:1.f];
                    if (!_iconImage) {
                        self.iconImage = [UIImage imageWithName:@"fftoast_info"];
                    }
                    break;
                }
                    
                default:
                    break;
            }
            
        }
        
        self.iconImageSize = self.iconImage == nil ? CGSizeZero : ICON_IMG_SIZE;
        
    }
    
    self.toastViewFrame = [self toastViewFrame];
    self.toastView.frame = _toastViewFrame;

}

/**
 计算ToastView的frame
 
 @return ToastView的frame
 */
-(CGRect)toastViewFrame{
    
    CGFloat toastViewW = 0;
    CGFloat toastViewH = 0;
    CGFloat toastViewX = 0;
    CGFloat toastViewY = 0;
    
    if(_isCustomToastView == NO){
        
        toastViewW = SCREEN_WIDTH - 2 * HORIZONTAL_SPACE_TO_SCREEN;
        toastViewX = (SCREEN_WIDTH - toastViewW)/2;
        
        CGFloat textMaxWidth = SCREEN_WIDTH - 2 * (HORIZONTAL_SPACE_TO_SCREEN + HORIZONTAL_SPACE_TO_TOASTVIEW);

        self.titleLabelSize = [NSString sizeForString:_titleString font:_titleFont maxWidth:textMaxWidth];
        self.messageLabelSize = [NSString sizeForString:_messageString font:_messageFont maxWidth:textMaxWidth];
        
        if (_iconImage != nil) {
            //有图标
            toastViewH = _iconImageSize.height + _titleLabelSize.height + _messageLabelSize.height + 4 * TOP_SPACE_TO_TOASTVIEW;
        }else{
            //没有图标
            toastViewH = _titleLabelSize.height + _messageLabelSize.height + 3 * TOP_SPACE_TO_TOASTVIEW;
        }
        
        toastViewY = (SCREEN_HEIGHT - toastViewH)/2;
        
    }else{
        toastViewW = _toastView.frame.size.width;
        toastViewH = _toastView.frame.size.height;
        toastViewX = (SCREEN_WIDTH - toastViewW)/2;
        toastViewY = (SCREEN_HEIGHT - toastViewH)/2;
    }
    
    return CGRectMake(toastViewX, toastViewY, toastViewW, toastViewH);
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    if(_isCustomToastView == NO){
    
        CGFloat iconImageViewX = (_toastViewFrame.size.width - _iconImageSize.width)/2;
        CGFloat iconImageViewY = TOP_SPACE_TO_TOASTVIEW;
        CGFloat iconImageViewW = _toastViewFrame.size.width;
        CGFloat iconImageViewH = _toastViewFrame.size.height;
        self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
        
        CGFloat titleLabelW = _titleLabelSize.width;
        CGFloat titleLabelH = _titleLabelSize.height;
        CGFloat titleLabelX = (_toastViewFrame.size.width - titleLabelW)/2;
        CGFloat titleLabelY = _iconImage == nil ? TOP_SPACE_TO_TOASTVIEW : iconImageViewY + iconImageViewH +TOP_SPACE_TO_TOASTVIEW ;
        self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
        
        CGFloat messageLabelW = _messageLabelSize.width;
        CGFloat messageLabelH = _messageLabelSize.height;
        CGFloat messageLabelX = (_toastViewFrame.size.width - messageLabelW)/2;
        CGFloat messageLabelY = _titleString == nil ? titleLabelY : titleLabelY + titleLabelH + TOP_SPACE_TO_TOASTVIEW;
        self.messageLabel.frame = CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH);
        
        if (_enableDismissBtn == YES) {
            CGFloat dismissBtnW = DISMISS_BTN_IMG_SIZE.width;
            CGFloat dismissBtnH = DISMISS_BTN_IMG_SIZE.height;
            CGFloat dismissBtnX = (_toastViewFrame.size.width - dismissBtnW)/2;
            CGFloat dismissBtnY = -dismissBtnH/2;
            self.dismissBtn.frame = CGRectMake(dismissBtnX, dismissBtnY, dismissBtnW, dismissBtnH);
        }
        
        [self loadViewData];
    }
    

    
}


/**
 加载各View数据
 */
-(void)loadViewData{
    self.iconImageView.image = self.iconImage;
    self.titleLabel.text = self.titleString;
    self.messageLabel.text = self.messageString;
    
    if (_dismissBtnImage != nil) {
        self.dismissBtn.imageView.image = _dismissBtnImage;
    }else{
        self.dismissBtn.imageView.image = [UIImage imageWithName:@"fftoast_dismiss"];
    }
    
    self.backgroundColor = _toastBackgroundColor;
}


































@end
