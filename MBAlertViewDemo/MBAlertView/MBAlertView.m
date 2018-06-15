//
//  MBAlertView.m
//  MBAlertViewDemo
//
//  Created by Bovin on 2018/6/15.
//  Copyright © 2018年 Bovin. All rights reserved.
//

#import "MBAlertView.h"

@interface MBAlertView ()

@property (nonatomic, strong) UIVisualEffectView *effectView;

@end

@implementation MBAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = MBAlertViewStyleBlur;
        self.mode = MBAlertViewModeDefault;
        self.cornerRadius = 5.0f;
        self.messageFont = [UIFont systemFontOfSize:16];
        self.duration = 2.0;
        [self updateAlertBackgroundStyleConfig];
    }
    return self;
}
- (void)setStyle:(MBAlertViewStyle)style {
    if (_style != style) {
        _style = style;
    }
    [self updateAlertBackgroundStyleConfig];
}
- (void)updateAlertBackgroundStyleConfig {
    if (self.style == MBAlertViewStyleBlur) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *visualView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
        visualView.frame = self.bounds;
        visualView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:visualView];
        self.effectView = visualView;
        self.layer.allowsGroupOpacity = NO;
        self.backgroundColor = self.alertColor;
    }else {
        [self.effectView removeFromSuperview];
        self.effectView = nil;
        self.backgroundColor = self.alertColor;
    }
}

- (void)setMode:(MBAlertViewMode)mode {
    if (_mode != mode) {
        _mode = mode;
    }
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
    }
    self.layer.cornerRadius = _cornerRadius;
    self.layer.masksToBounds = YES;
}





@end


