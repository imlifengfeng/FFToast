//
//  ViewController.m
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/14.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import "ViewController.h"
#import "FFToast.h"
#import "NSString+FFToast.h"
#import "UIImage+FFToast.h"

@interface ViewController ()

@property(nonatomic,strong)FFToast *toast;

@property(nonatomic,strong)FFToast *customCentreToast;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;


@property (weak, nonatomic) IBOutlet UISegmentedControl *positionSC;

@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSC;

@property (weak, nonatomic) IBOutlet UISegmentedControl *filletSC;

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@property (weak, nonatomic) IBOutlet UISlider *durationSlider;

@property (weak, nonatomic) IBOutlet UIButton *showBtn;
- (IBAction)showBtn1Click:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *showBtn2;
- (IBAction)showBtn2Click:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *showBtn3;
- (IBAction)showBtn3Click:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *showBtn4;
- (IBAction)showBtn4Click:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FFToast Demo";
    
    self.toast = [[FFToast alloc]initToastWithTitle:_titleLabel.text message:_messageLabel.text iconImage:nil];
    self.toast.duration = 3.f;
    
    self.durationSlider.value = 3;
    self.durationSlider.maximumValue = 10;
    self.durationSlider.continuous = YES;

    
}
- (IBAction)positionSCValueChanged:(UISegmentedControl *)sender {
    
    [self initPosition];
    
}

- (IBAction)typeSCValueChanged:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            _toast.toastType = FFToastTypeDefault;
            break;
            
        case 1:
            _toast.toastType = FFToastTypeSuccess;
            break;
            
        case 2:
            _toast.toastType = FFToastTypeError;
            break;
            
        case 3:
            _toast.toastType = FFToastTypeWarning;
            break;
            
        case 4:
            _toast.toastType = FFToastTypeInfo;
            break;
            
        default:
            break;
    }
    
}

- (IBAction)filletSCValueChanged:(UISegmentedControl *)sender {
    
    [self initPosition];
}

-(void)initPosition{
    
    _durationSlider.enabled = YES;
    _durationLabel.text = [NSString stringWithFormat:@"%.fs",_durationSlider.value];
    _toast.duration = _durationSlider.value;
    
    _toast.toastBackgroundColor = nil;
    _toast.titleTextColor = nil;
    _toast.messageTextColor = nil;
    
    switch (_positionSC.selectedSegmentIndex) {
        case 0:
            _toast.toastPosition = FFToastPositionDefault;
            break;
            
        case 1:
            _toast.toastPosition = _filletSC.selectedSegmentIndex == 0 ? FFToastPositionBelowStatusBarWithFillet : FFToastPositionBelowStatusBar;
            break;
            
        case 2:
            _toast.toastPosition = _filletSC.selectedSegmentIndex == 0 ? FFToastPositionBottomWithFillet : FFToastPositionBottom;
            break;
            
        case 3:
            _durationSlider.enabled = NO;
            _durationLabel.text = @"0s";
            _toast.autoDismiss = NO;
            _toast.toastPosition = _filletSC.selectedSegmentIndex == 0 ? FFToastPositionCentreWithFillet : FFToastPositionCentre;
            break;
            
        default:
            break;
    }

}

- (IBAction)durationValueChanged:(UISlider *)sender {
    
    _durationLabel.text = [NSString stringWithFormat:@"%.fs",sender.value];
    _toast.duration = sender.value;
}



- (IBAction)showBtn1Click:(id)sender {
    [_toast show];
}

- (IBAction)showBtn2Click:(id)sender {
    
    CGFloat horizontalSpaceToScreen = 90;
    CGFloat topSpaceViewToView = 20;
    CGFloat horizontalSpaceToContentView = 10;
    CGFloat bottomSpaceToContentView = 10;
    CGSize topImgSize = CGSizeMake(50, 50);
    
    //顶部图片
    CGFloat topImgViewX = (SCREEN_WIDTH - 2*horizontalSpaceToScreen)/2 - topImgSize.width/2;
    CGFloat topImgViewY = 0;
    UIImageView *topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(topImgViewX, topImgViewY, topImgSize.width, topImgSize.height)];
    topImgView.image = [UIImage imageWithName:@"test_ok"];
    
    NSString *title = @"Customized Toast View";
    NSString *message = @"You can customize the View you need, just create it as a parameter to Toast.";
    
    //设置字体
    UIFont *titleFont = [UIFont systemFontOfSize:15.f weight:UIFontWeightMedium];
    UIFont *messageFont = [UIFont systemFontOfSize:15.f];
    
    CGFloat maxTextWidth = SCREEN_WIDTH - 2*(horizontalSpaceToScreen) - 2 * horizontalSpaceToContentView;
    CGSize titleSize = [NSString sizeForString:title font:titleFont maxWidth:maxTextWidth];
    CGSize messageSize = [NSString sizeForString:message font:messageFont maxWidth:maxTextWidth];
    
    //内容和标题
    CGFloat titleLabelX = (SCREEN_WIDTH - 2*horizontalSpaceToScreen - titleSize.width)/2;
    CGFloat titleLabelY = topImgSize.height/2 + topSpaceViewToView;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(titleLabelX, titleLabelY, titleSize.width, titleSize.height)];
    titleLabel.text = title;
    titleLabel.font = titleFont;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    
    CGFloat messageLabelX = (SCREEN_WIDTH - 2*horizontalSpaceToScreen - messageSize.width)/2;
    CGFloat messageLabelY = titleLabelY + titleSize.height + topSpaceViewToView;
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(messageLabelX, messageLabelY, messageSize.width, messageSize.height)];
    messageLabel.text = message;
    messageLabel.font = messageFont;
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    
    //OK按钮
    CGFloat okBtnX = 5;
    CGFloat okBtnY = messageLabelY + messageSize.height + topSpaceViewToView;
    CGFloat okBtnW = SCREEN_WIDTH - 2*horizontalSpaceToScreen - 10;
    CGFloat okBtnH = 35;
    UIButton *okBtn = [[UIButton alloc]initWithFrame:CGRectMake(okBtnX, okBtnY, okBtnW, okBtnH)];
    okBtn.backgroundColor = [UIColor colorWithRed:0.17 green:0.69 blue:0.55 alpha:1.00];
    [okBtn setTitle:@"ok" forState:UIControlStateNormal];
    okBtn.layer.cornerRadius = 2.f;
    okBtn.layer.masksToBounds = YES;
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];

    
    CGFloat customToastViewX = 0;
    CGFloat customToastViewY = topImgSize.height/2;
    CGFloat customToastViewW = SCREEN_WIDTH - 2 * horizontalSpaceToScreen;
    CGFloat customToastViewH = okBtnY + okBtnH + bottomSpaceToContentView;
    UIView *customToastView = [[UIView alloc]initWithFrame:CGRectMake(customToastViewX, customToastViewY, customToastViewW, customToastViewH)];
    customToastView.backgroundColor = [UIColor whiteColor];
    
    
    [customToastView addSubview: titleLabel];
    [customToastView addSubview: messageLabel];
    [customToastView addSubview: okBtn];
    
    
    CGFloat customToastParentViewW = SCREEN_WIDTH - 2*horizontalSpaceToScreen;
    CGFloat customToastParentViewH = topImgSize.height/2 + customToastViewH;
    CGFloat customToastParentViewX = (SCREEN_WIDTH - customToastParentViewW)/2;
    CGFloat customToastParentViewY = (SCREEN_HEIGHT - customToastParentViewH)/2;
    UIView *customToastParentView = [[UIView alloc]initWithFrame:CGRectMake(customToastParentViewX, customToastParentViewY, customToastParentViewW, customToastParentViewH)];
    
    [customToastParentView addSubview:customToastView];
    [customToastParentView addSubview: topImgView];
    customToastView.layer.cornerRadius = 5.f;
    customToastView.layer.masksToBounds = YES;
    
    
    _customCentreToast = [[FFToast alloc]initCentreToastWithView:customToastParentView autoDismiss:NO duration:0 enableDismissBtn:NO dismissBtnImage:nil];
    
    [_customCentreToast show];
    

    
    
}

-(void)okBtnClick{
    [_customCentreToast dismissCentreToast];
}

- (IBAction)showBtn3Click:(id)sender {
    
    FFToast *toast = [[FFToast alloc]initToastWithTitle:nil message:@"This is a Toast View that can be clicked. You can customize the effect you need as needed." iconImage:[UIImage imageWithName:@"test"]];
    toast.toastType = FFToastTypeSuccess;
    toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
    [toast show:^{
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Hello！"
                                                                                 message:@"Welcome to use FFToast!"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    
}

- (IBAction)showBtn4Click:(id)sender {
    
    FFToast *toast = [[FFToast alloc]initToastWithTitle:nil message:@"This is a custom Toast View" iconImage:nil];
    toast.toastType = FFToastTypeDefault;
    toast.toastPosition = FFToastPositionBottomWithFillet;
    [toast show];
    
}
@end
