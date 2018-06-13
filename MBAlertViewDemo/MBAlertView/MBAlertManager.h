//
//  MBAlertManager.h
//  MBAlertViewDemo
//
//  Created by Bovin on 2018/6/13.
//  Copyright © 2018年 Bovin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MBAlertActionType) {
    MBAlertActionTypeDefault = 0,
    MBAlertActionTypeCancel,
    MBAlertActionTypeDestructive,
};

/************************ Attributes ************************/

// the MBAlertActionName is must set by user
UIKIT_EXTERN NSString *const MBAlertActionName;
// the MBAlertActionStyle default is UIAlertActionStyleDefault,but user can set by self
UIKIT_EXTERN NSString *const MBAlertActionStyle;

//actionIndex general cancel is 0,other is ascending in the actions
typedef void(^MBAlertActionHandler)(NSInteger actionIndex);

@interface MBAlertManager : NSObject

#pragma mark--iOS 系统弹窗,目前仅支持iOS 8.0以上---------

/**
 系统alert弹窗

 @param title 弹窗的标题
 @param message 弹窗提示内容
 @param actions actions 的标题与样式数组
 @param handler action 点击时回调处理响应事件
 */
+ (void)mb_showSystemAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                            actionArray:(NSArray<NSDictionary *>*)actions
                          actionHandler:(MBAlertActionHandler)handler;

/**
 系统底部弹窗

 @param title 底部弹窗的标题
 @param message 弹窗提示内容
 @param actions actions 的标题与样式数组
 @param handler action 点击时回调处理响应事件
 */
+ (void)mb_showSystemActionSheetWithTitle:(NSString *)title
                                  message:(NSString *)message
                              actionArray:(NSArray<NSDictionary *>*)actions
                            actionHandler:(MBAlertActionHandler)handler;

@end
