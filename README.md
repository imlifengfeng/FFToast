# FFToast
[![Version](https://img.shields.io/github/release/imlifengfeng/FFToast.svg)](https://github.com/imlifengfeng/FFToast/releases/latest/)
[![CocoaPods](https://img.shields.io/cocoapods/v/FFToast.svg)](https://cocoapods.org/pods/FFToast)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/imlifengfeng/FFToast/master/LICENSE)

A very powerful iOS message notifications and AlertView extensions. It can be easily realized from the top of the screen, the bottom of the screen and the middle of the screen pops up a notification. You can easily customize the pop-up View.

![gif](https://github.com/imlifengfeng/FFToast/blob/master/screenshots/demo.gif)
![screenshots](https://github.com/imlifengfeng/FFToast/blob/master/screenshots/screenshots.png)

# English instructions

## Requirements

- Requires iOS 8 or later
- Requires Automatic Reference Counting (ARC)

##Features

- Easy to use
- Can be easily customized

## Installation

### CocoaPods
To install FFToast using CocoaPods, please integrate it in your existing Podfile, or create a new Podfile:

```ruby
target 'MyApp' do
  pod 'FFToast'
end
```
Then run `pod install`.

### Manual

Add FFToast folder to your project


##Usage
```objective-c
#import <FFToast/FFToast.h>
```

You can create a message notification that shows the default effect at the top by calling the following method:

```objective-c
/**
 Create and display one Toast

 @param title Message title
 @param message Message content
 @param iconImage Message icon, when toastType is not FFToastTypeDefault iconImage is empty will still have the corresponding icon
 @param duration Show duration
 */
+ (void)showToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage duration:(NSTimeInterval)duration toastType:(FFToastType)toastType;
```

Where toastType:
```objective-c
typedef NS_ENUM(NSInteger, FFToastType) {
    //Gray background, no icon
    FFToastTypeDefault = 0,
    //Green background + success icon
    FFToastTypeSuccess = 1,
    //Red background + error icon
    FFToastTypeError = 2,
    //Orange background + warning icon
    FFToastTypeWarning = 3,
    //Gray blue background + info icon
    FFToastTypeInfo = 4,
};
```

for example:
```objective-c
[FFToast showToastWithTitle:@"This is the title" message:@"Message content......." iconImage:[UIImage imageNamed:@"test"] duration:3 toastType:FFToastTypeDefault];
```
Title (title), message (message), icon (iconImage) can be empty, FFToast will be based on specific content to adapt.

If you want to show the message below the status bar, the bottom of the screen or the middle of the screen, you can set some properties to achieve.
Set the display position:
```objective-c
typedef NS_ENUM(NSInteger, FFToastPosition) {

    //Displayed at the top of the screen
    FFToastPositionDefault = 0,
    //Is displayed below the status bar
    FFToastPositionBelowStatusBar = 1,
    //Displayed below the status bar + rounded corners + left and right margins
    FFToastPositionBelowStatusBarWithFillet = 2,
    //Displayed at the bottom of the screen
    FFToastPositionBottom = 3,
    //Displayed at the bottom of the screen + fillet
    FFToastPositionBottomWithFillet = 4,
    //Displayed in the middle of the screen
    FFToastPositionCentre = 5,
    //Displayed in the middle of the screen + fillet
    FFToastPositionCentreWithFillet = 6

};
```

Some other attributes:
```objective-c
//background color
@property (strong, nonatomic) UIColor* toastBackgroundColor;
//Toast title text color
@property (strong, nonatomic) UIColor* titleTextColor;
//Toast content text color
@property (strong, nonatomic) UIColor* messageTextColor;

//Toast title text font
@property (strong, nonatomic) UIFont* titleFont;
//Toast text font
@property (strong, nonatomic) UIFont* messageFont;

//Toast View fillet
@property(assign,nonatomic)CGFloat toastCornerRadius;
//Toast View Transparency
@property(assign,nonatomic)CGFloat toastAlpha;

//Toast shows the length of time
@property(assign,nonatomic)NSTimeInterval duration;
//Toast disappear animation is enabled
@property(assign,nonatomic)BOOL dismissToastAnimated;

//Toast display position
@property (assign, nonatomic) FFToastPosition toastPosition;
//Toast display type
@property (assign, nonatomic) FFToastType toastType;

//Whether it is automatically hidden. AutoDismiss, enableDismissBtn, dismissBtnImage The three properties are only valid for Toast that pops up from the center of the screen
@property(assign,nonatomic)BOOL autoDismiss;
//Whether the hidden button is displayed in the upper right corner
@property(assign,nonatomic)BOOL enableDismissBtn;
//Hide the button's icon
@property (strong, nonatomic) UIImage* dismissBtnImage;
```

After setting the properties, you can call the following method to display it:
```objective-c
/**
 Show a Toast
 */
- (void)show;
```
or：
```objective-c
/**
 Show a Toast

 @param handler Toast click callback
 */
- (void)show:(handler)handler;
```

E.g：
```objective-c
FFToast *toast = [[FFToast alloc]initToastWithTitle:@"title" message:@"Message content......." iconImage:[UIImage imageNamed:@"fftoast_info"]];
toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
toast.toastBackgroundColor = [UIColor colorWithRed:75.f/255.f green:107.f/255.f blue:122.f/255.f alpha:1.f];
[toast show:^{
    //Toast is called when clicked
}];//[toast show];
```

If you want to customize a Toast from the middle, you can call the following method：
```objective-c
/**
 Show a custom Toast in the middle

 @param customToastView Customized ToastView
 @param autoDismiss Whether it is automatically hidden
 @param duration Display duration (autoDismiss = NO this parameter will be invalid)
 @param enableDismissBtn Whether to show the hidden button
 @param dismissBtnImage Hide button image (enableDismissBtn = NO this parameter will be invalid)
 @return Toast
 */
- (instancetype)initCentreToastWithView:(UIView *)customToastView autoDismiss:(BOOL)autoDismiss duration:(NSTimeInterval)duration enableDismissBtn:(BOOL)enableDismissBtn dismissBtnImage:(UIImage*)dismissBtnImage;
```
When you customize Toast from the middle, you can set the above parameters autoDismiss and the parameter enableDismissBtn to NO. And then in your custom View in their own place in the appropriate place to add a close button.
To close the Toast from the middle, you can call the following method：
```objective-c
/**
 Hide a Toast
 */
- (void)dismissCentreToast;
```

Top, the bottom of the pop-up Toast can not customize View, but for iconImage, Title, message can be set according to need and can be nil, the final Toast will be based on specific content to adapt.

Hide message notifications：
The default 3 seconds after the automatic disappear, slide up the pop-up message to inform it will disappear

##About

Author：
[imlifengfeng](http://www.imlifengfeng.com/blog/)  
WeiBo：
[@imlifengfeng](http://www.weibo.com/devfeng)

## License

Usage is provided under the <a href="http://opensource.org/licenses/MIT" target="_blank">MIT</a> License. See <a href="https://github.com/imlifengfeng/FFToast/blob/master/LICENSE">LICENSE</a> for full details.


# 中文使用说明

FFToast是一个非常强大的iOS message notifications和AlertView扩展。它可以很容易实现从屏幕顶部、屏幕底部和屏幕中间弹出一个通知。你可以很容易的自定义弹出的View.

## 要求

- 支持iOS 8或更高版本
- 支持ARC

##特点

- 简单易用
- 可以很容易自定义

## 安装

### CocoaPods
要使用CocoaPods安装FFToast，请将其集成到您现有的Podfile中，或创建一个新的Podfile:

```ruby
target 'MyApp' do
  pod 'FFToast'
end
```
然后 `pod install`.

### 手动

将FFToast文件夹添加到项目中


##使用方法
```objective-c
#import <FFToast/FFToast.h>
```

你可以通过调用下面的方法创建一个显示在顶部的默认效果的消息通知:

```objective-c
/**
 创建并显示一个Toast

 @param title 标题
 @param message 消息内容
 @param iconImage 消息icon，toastType不为FFToastTypeDefault时iconImage为空仍然会有相应icon
 @param duration 显示时长
 */
+ (void)showToastWithTitle:(NSString *)title message:(NSString *)message iconImage:(UIImage*)iconImage duration:(NSTimeInterval)duration toastType:(FFToastType)toastType;
```

其中的toastType:
```objective-c
typedef NS_ENUM(NSInteger, FFToastType) {

    //灰色背景、无图标
    FFToastTypeDefault = 0,
    //绿色背景+成功图标
    FFToastTypeSuccess = 1,
    //红色背景+错误图标
    FFToastTypeError = 2,
    //橙色背景+警告图标
    FFToastTypeWarning = 3,
    //灰蓝色背景+信息图标
    FFToastTypeInfo = 4,

};
```

例如:
```objective-c
[FFToast showToastWithTitle:@"标题" message:@"消息内容......." iconImage:[UIImage imageNamed:@"test"] duration:3 toastType:FFToastTypeDefault];
```
标题（title）、消息内容（message）、图标（iconImage）均可以为nil，FFToast会根据具体的内容进行自适应。

如果想在状态栏下方、屏幕下方或者屏幕中间显示消息通知，可以通过设置一些属性实现。
设置显示位置:
```objective-c
typedef NS_ENUM(NSInteger, FFToastPosition) {

    //显示在屏幕顶部
    FFToastPositionDefault = 0,
    //显示在状态栏下方
    FFToastPositionBelowStatusBar = 1,
    //显示在状态栏下方+圆角+左右边距
    FFToastPositionBelowStatusBarWithFillet = 2,
    //显示在屏幕底部
    FFToastPositionBottom = 3,
    //显示在屏幕底部+圆角
    FFToastPositionBottomWithFillet = 4,
    //显示在屏幕中间
    FFToastPositionCentre = 5,
    //显示在屏幕中间+圆角
    FFToastPositionCentreWithFillet = 6

};
```

其他的一些属性:
```objective-c
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
//Toast显示类型
@property (assign, nonatomic) FFToastType toastType;

//是否自动隐藏，autoDismiss、enableDismissBtn、dismissBtnImage三个属性仅对从屏幕中间弹出的Toast有效
@property(assign,nonatomic)BOOL autoDismiss;
//是否在右上角显示隐藏按钮
@property(assign,nonatomic)BOOL enableDismissBtn;
//隐藏按钮的图标
@property (strong, nonatomic) UIImage* dismissBtnImage;
```

设置完属性后，就可以调用下面方法将其显示出来:
```objective-c
/**
 显示一个Toast
 */
- (void)show;
```
或者：
```objective-c
/**
 显示一个Toast

 @param handler Toast点击回调
 */
- (void)show:(handler)handler;
```

例如：
```objective-c
FFToast *toast = [[FFToast alloc]initToastWithTitle:@"标题" message:@"消息内容......." iconImage:[UIImage imageNamed:@"fftoast_info"]];
toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
toast.toastBackgroundColor = [UIColor colorWithRed:75.f/255.f green:107.f/255.f blue:122.f/255.f alpha:1.f];
[toast show:^{
    //点击消息通知时调用
}];//[toast show];
```

如果你想自定义一个从中间弹出的Toast,可以调用下面的方法：
```objective-c
/**
 在中间显示一个自定义Toast

 @param customToastView 自定义的ToastView
 @param autoDismiss 是否自动隐藏
 @param duration 显示时长（autoDismiss = NO时该参数将无效）
 @param enableDismissBtn 是否显示隐藏按钮
 @param dismissBtnImage 隐藏按钮图片（enableDismissBtn = NO时该参数将无效）
 @return Toast
 */
- (instancetype)initCentreToastWithView:(UIView *)customToastView autoDismiss:(BOOL)autoDismiss duration:(NSTimeInterval)duration enableDismissBtn:(BOOL)enableDismissBtn dismissBtnImage:(UIImage*)dismissBtnImage;
```
你在自定义从中间弹出的Toast时，你可以将上面的参数autoDismiss和参数enableDismissBtn设为NO。然后在你自定义的View中自己在合适的位置添加一个关闭按钮。
关闭从中间弹出的Toast，可以调用下面的方法：
```objective-c
/**
 隐藏一个Toast
 */
- (void)dismissCentreToast;
```

顶部、底部弹出的Toast不可自定义View，但是对于iconImage、Title、message均可以根据需要设置并且可以为nil，最终Toast会根据具体的内容进行自适应。

隐藏消息通知：
默认3秒后自动消失，向上滑动弹出的消息通知它也会消失。

##关于

作者：
[imlifengfeng](http://www.imlifengfeng.com/blog/)  
微博：
[@imlifengfeng](http://www.weibo.com/devfeng)

## 许可

该项目在 <a href="http://opensource.org/licenses/MIT" target="_blank">MIT</a> 许可协议下使用.  有关详细信息，请参阅 <a href="https://github.com/imlifengfeng/FFToast/blob/master/LICENSE">LICENSE</a>.
