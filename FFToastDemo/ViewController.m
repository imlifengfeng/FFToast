//
//  ViewController.m
//  FFToastDemo
//
//  Created by 李峰峰 on 2017/2/14.
//  Copyright © 2017年 李峰峰. All rights reserved.
//

#import "ViewController.h"
#import "FFToast.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

//Under the status bar?
@property (weak, nonatomic) IBOutlet UISwitch *positionSwitch;
//Include fillet（Top）?
@property (weak, nonatomic) IBOutlet UISwitch *filletSwitch;
//Include fillet（Bottom）?
@property (weak, nonatomic) IBOutlet UISwitch *filletSwitch2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FFToast Demo";
    
    [_positionSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    _positionSwitch.on = NO;
    _filletSwitch.on = NO;
    _filletSwitch.userInteractionEnabled = NO;
    

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    tapGesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tapGesture];
    
}


#pragma mark - UITableViewDelegate & UITableDataSource Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView* bgSelectionView = [UIView new];
    bgSelectionView.backgroundColor = [UIColor colorWithRed:240./255. green:240./255. blue:240./255. alpha:1.];
    cell.selectedBackgroundView = bgSelectionView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView endEditing:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
            
        //Show toast on the top
        case 1: {
            
            //Show Default toast
            if (indexPath.row == 2) {
                if ([_positionSwitch isOn]) {
                    
                     FFToast *toast = [[FFToast alloc]initToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:[UIImage imageNamed:@"test"]];
                    
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                    toast.toastBackgroundColor = [UIColor darkGrayColor];
                    [toast show];
                    
                }else{
                    
                    [FFToast showToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:[UIImage imageNamed:@"test"] duration:3 toastType:FFToastTypeDefault];
                    
                }
                

            }
            
            //Show Success toast
            if (indexPath.row == 3) {
                
                if ([_positionSwitch isOn]) {
                    
                    FFToast *toast = [[FFToast alloc]initToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:nil];
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                    toast.toastType = FFToastTypeSuccess;
                    [toast show];
                    
                }else{
                    
                    [FFToast showToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:nil duration:3 toastType:FFToastTypeSuccess];
                    
                }
                
            }
            
            //Show Error toast
            if (indexPath.row == 4) {
                
                if ([_positionSwitch isOn]) {
                    
                    FFToast *toast = [[FFToast alloc]initToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:[UIImage imageNamed:@"fftoast_error"]];
                    
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                    toast.toastBackgroundColor = [UIColor colorWithRed:255.f/255.f green:91.f/255.f blue:65.f/255.f alpha:1.f];
                    [toast show];

                }else{
                    
                    [FFToast showToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:nil duration:3 toastType:FFToastTypeError];
                    
                }

            }
            
            //Show Warning toast
            if (indexPath.row == 5) {
                
                if ([_positionSwitch isOn]) {
                    
                    FFToast *toast = [[FFToast alloc]initToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:[UIImage imageNamed:@"fftoast_warning"]];
                    
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                    toast.toastBackgroundColor = [UIColor colorWithRed:255.f/255.f green:134.f/255.f blue:0.f/255.f alpha:1.f];
                    [toast show];
                    
                }else{
                    
                    [FFToast showToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:nil duration:3 toastType:FFToastTypeWarning];
                }
                
            }
            
            //Show Info toast
            if (indexPath.row == 6) {
                
                if ([_positionSwitch isOn]) {
                    FFToast *toast = [[FFToast alloc]initToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:[UIImage imageNamed:@"fftoast_info"]];
                    
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                    toast.toastBackgroundColor = [UIColor colorWithRed:75.f/255.f green:107.f/255.f blue:122.f/255.f alpha:1.f];
                    [toast show];
                    
                }else{
                    
                    [FFToast showToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:nil duration:3 toastType:FFToastTypeInfo];
                    
                }
                
            }
                
            //Show custom toast
            if (indexPath.row == 7) {
                
                 FFToast *toast = [[FFToast alloc]initToastWithTitle:@"This is the custom title" message:@"This is the custom message content, you can set the display time, click event callback, background color, etc." iconImage:[UIImage imageNamed:@"test"]];
                
                if ([_positionSwitch isOn]) {
                    
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                 }
                
                toast.toastBackgroundColor = [UIColor colorWithRed:31.f/255.f green:177.f/255.f blue:138.f/255.f alpha:1.f];
                [toast show:^{
                    
                    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Hello！"
                                                                                             message:@"Welcome to use FFToast!"
                                                                                      preferredStyle:UIAlertControllerStyleAlert];
                    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                }];

                
            }
            
            //Show custom toast without title
            if (indexPath.row == 8) {
                
                FFToast *toast = [[FFToast alloc]initToastWithTitle:nil message:@"This is the custom message content, you can set the display time, click event callback, background color, etc." iconImage:[UIImage imageNamed:@"test"]];

                if ([_positionSwitch isOn]) {
                    
                    if ([_filletSwitch isOn]) {
                        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
                    }else{
                        toast.toastPosition = FFToastPositionBelowStatusBar;
                    }
                    
                }
                
                toast.toastBackgroundColor = [UIColor colorWithRed:31.f/255.f green:177.f/255.f blue:138.f/255.f alpha:1.f];
                [toast show:^{
                    
                    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Hello！"
                                                                                             message:@"Welcome to use FFToast!"
                                                                                      preferredStyle:UIAlertControllerStyleAlert];
                    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                }];

            }
            
            break;
        }
            
            
        //Show toast on the bottom
        case 2: {
            
            //Show custom toast
            if (indexPath.row == 1) {
                
                FFToast *toast = [[FFToast alloc]initToastWithTitle:_titleTextField.text message:_messageTextField.text iconImage:[UIImage imageNamed:@"test"]];
                
                if ([_filletSwitch2 isOn]) {
                    toast.toastPosition = FFToastPositionBottomWithFillet;
                }else{
                    toast.toastPosition = FFToastPositionBottom;
                }
                
                [toast show];
            }
            
            //Show custom toast only message
            if (indexPath.row == 2) {
                
                FFToast *toast = [[FFToast alloc]initToastWithTitle:nil message:_messageTextField.text iconImage:nil];
                
                if ([_filletSwitch2 isOn]) {
                    toast.toastPosition = FFToastPositionBottomWithFillet;
                }else{
                    toast.toastPosition = FFToastPositionBottom;
                }
                
                [toast show];
                
            }
            
            break;
        }
        default:
            break;
    }
    
}

-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        _filletSwitch.userInteractionEnabled = YES;
    }else {
        _filletSwitch.on = NO;
        _filletSwitch.userInteractionEnabled = NO;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - UITextFieldDelegate Methods

- (void)hideKeyboard:(UITapGestureRecognizer*)tapGesture {
    [self.tableView endEditing:YES];
}


@end
