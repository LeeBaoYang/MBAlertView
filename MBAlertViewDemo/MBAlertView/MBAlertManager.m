//
//  MBAlertManager.m
//  MBAlertViewDemo
//
//  Created by Bovin on 2018/6/13.
//  Copyright © 2018年 Bovin. All rights reserved.
//

#import "MBAlertManager.h"

NSString *const MBAlertActionName = @"MBAlertActionName";
NSString *const MBAlertActionStyle = @"MBAlertActionStyle";
@implementation MBAlertManager



#pragma mark--iOS 系统弹窗,目前仅支持iOS 8.0以上---------
+ (void)mb_showSystemAlertViewWithTitle:(NSString *)title message:(NSString *)message actionArray:(NSArray<NSDictionary *> *)actions actionHandler:(MBAlertActionHandler)handler {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (actions && actions.count) {
        for (NSInteger index = 0; index<actions.count; index++) {
            id obiect = actions[index];
            if ([obiect isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dic = (NSDictionary *)obiect;
                NSString *actionName = dic[MBAlertActionName];
                NSInteger type = [dic[MBAlertActionStyle] integerValue];
                UIAlertActionStyle style = 0;
                switch (type) {
                    case MBAlertActionTypeDefault:
                        style = UIAlertActionStyleDefault;
                        break;
                    case MBAlertActionTypeCancel:
                        style = UIAlertActionStyleCancel;
                        break;
                    case MBAlertActionTypeDestructive:
                        style = UIAlertActionStyleDestructive;
                        break;
                    default:
                        break;
                }
                UIAlertAction *action = [UIAlertAction actionWithTitle:actionName style:style handler:^(UIAlertAction * _Nonnull action) {
                    handler(index);
                }];
                [alertVC addAction:action];
            }
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *presentVC = [self getCurrentViewController];
        if (presentVC) {
            [presentVC presentViewController:alertVC animated:YES completion:nil];
        }
    });
}

+ (void)mb_showSystemActionSheetWithTitle:(NSString *)title message:(NSString *)message actionArray:(NSArray<NSDictionary *> *)actions actionHandler:(MBAlertActionHandler)handler {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    if (actions && actions.count) {
        for (NSInteger index = 0; index<actions.count; index++) {
            id obiect = actions[index];
            if ([obiect isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dic = (NSDictionary *)obiect;
                NSString *actionName = dic[MBAlertActionName];
                NSInteger type = [dic[MBAlertActionStyle] integerValue];
                UIAlertActionStyle style = 0;
                switch (type) {
                    case MBAlertActionTypeDefault:
                        style = UIAlertActionStyleDefault;
                        break;
                    case MBAlertActionTypeCancel:
                        style = UIAlertActionStyleCancel;
                        break;
                    case MBAlertActionTypeDestructive:
                        style = UIAlertActionStyleDestructive;
                        break;
                    default:
                        break;
                }
                UIAlertAction *action = [UIAlertAction actionWithTitle:actionName style:style handler:^(UIAlertAction * _Nonnull action) {
                    handler(index);
                }];
                [alertVC addAction:action];
            }
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *presentVC = [self getCurrentViewController];
        if (presentVC) {
            [presentVC presentViewController:alertVC animated:YES completion:nil];
        }
    });
}


#pragma mark--获取当前窗口的vc
+ (UIViewController *)getCurrentViewController {
    UIViewController *currentVC = nil;
    UIViewController *rootVC = [[UIApplication sharedApplication]keyWindow].rootViewController;;
    if (rootVC.presentedViewController) {
        if ([rootVC.presentedViewController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController *currentNav = (UINavigationController *)rootVC.presentedViewController;
            currentVC = currentNav.visibleViewController;
        }else if ([rootVC.presentedViewController isKindOfClass:[UITabBarController class]]){
            
            UITabBarController *tabVC = (UITabBarController *)rootVC.presentedViewController;
            if ([tabVC.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *currentNav = (UINavigationController *)tabVC.selectedViewController;
                currentVC = currentNav.visibleViewController;
            }else{
                currentVC = tabVC.selectedViewController;
            }
        }else{
            currentVC = rootVC.presentedViewController;
        }
        
    }else{
        
        if ([rootVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabVC = (UITabBarController *)rootVC;
            
            if ([tabVC.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *currentNav = (UINavigationController *)tabVC.selectedViewController;
                currentVC = currentNav.visibleViewController;
            }else{
                currentVC = tabVC.selectedViewController;
            }
        }else if ([rootVC isKindOfClass:[UINavigationController class]]){
            
            UINavigationController *currentNav = (UINavigationController *)rootVC;
            currentVC = currentNav.visibleViewController;
        }else{
            currentVC = rootVC;
        }
    }
    return currentVC;
}


@end
