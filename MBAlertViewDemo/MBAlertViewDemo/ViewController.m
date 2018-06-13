//
//  ViewController.m
//  MBAlertViewDemo
//
//  Created by Bovin on 2018/6/13.
//  Copyright © 2018年 Bovin. All rights reserved.
//

#import "ViewController.h"
#import "MBAlertManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBAlertManager mb_showSystemAlertViewWithTitle:@"我是弹框" message:@"很高兴见到你" actionArray:@[@{MBAlertActionName:@"取消",MBAlertActionStyle:@(MBAlertActionTypeCancel)},@{MBAlertActionName:@"确定",MBAlertActionStyle:@(MBAlertActionTypeDefault)}] actionHandler:^(NSInteger actionIndex) {
            NSLog(@"%ld",actionIndex);
            [MBAlertManager mb_showSystemActionSheetWithTitle:@"付费提示" message:@"你当前还不是会员，开通会员才能看完整版的视频" actionArray:@[@{MBAlertActionName:@"取消",MBAlertActionStyle:@(MBAlertActionTypeCancel)},@{MBAlertActionName:@"暂不购买",MBAlertActionStyle:@(MBAlertActionTypeDefault)},@{MBAlertActionName:@"购买会员",MBAlertActionStyle:@(MBAlertActionTypeDefault)}] actionHandler:^(NSInteger actionIndex) {
                NSLog(@"%ld",actionIndex);
            }];
        }];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
