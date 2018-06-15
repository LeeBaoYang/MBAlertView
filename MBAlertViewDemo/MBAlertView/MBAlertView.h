//
//  MBAlertView.h
//  MBAlertViewDemo
//
//  Created by Bovin on 2018/6/15.
//  Copyright © 2018年 Bovin. All rights reserved.


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MBAlertViewStyle) {
    MBAlertViewStyleBlur,         //半透明
    MBAlertViewStyleSolidColor,  //纯色,不添加半透明
};

typedef NS_ENUM(NSUInteger, MBAlertViewMode) {
    MBAlertViewModeDefault,     //图片与提示语
    MBAlertViewModeLoading,     //加载中
    MBAlertViewModeText,        //纯文字提示
};


//自定义一些格式的弹窗
@interface MBAlertView : UIView

//设置半透明or纯色
@property (nonatomic, assign) MBAlertViewStyle style;
//弹框的样式
@property (nonatomic, assign) MBAlertViewMode mode;
//背景颜色
@property (nonatomic, strong) UIColor *alertColor;
//可以自定义提示消息的字体大小，默认16
@property (nonatomic, strong) UIFont *messageFont;
//可以自定义提示消息的颜色，默认根据样式自动选择
@property (nonatomic, strong) UIColor *messageColor;
//弹框圆角大小
@property (nonatomic, assign) CGFloat cornerRadius;
//弹框持续时间
@property (nonatomic, assign) NSTimeInterval duration;
//半透明蒙版
@property (nonatomic, assign) UIBlurEffectStyle blurEffectStyle;


@end


