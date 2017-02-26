//
//  ViewController.m
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/14.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import "ViewController.h"
#import "FFToast.h"
#import "FFCentreToastView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextField *contentField;


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

    

    
}
- (IBAction)positionSCValueChanged:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
            
        default:
            break;
    }
    
    
}
- (IBAction)typeSCValueChanged:(UISegmentedControl *)sender {
    
}
- (IBAction)filletSCValueChanged:(UISegmentedControl *)sender {
}
- (IBAction)durationValueChanged:(UISegmentedControl *)sender {
}


- (IBAction)showBtn1Click:(id)sender {
}
- (IBAction)showBtn2Click:(id)sender {
}
- (IBAction)showBtn3Click:(id)sender {
}

- (IBAction)showBtn4Click:(id)sender {
}
@end
