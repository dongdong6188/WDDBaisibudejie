//
//  XMGFastLoginButton.m
//  BuDeJie
//
//  Created by xiaomage on 16/4/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "WDDFastLoginButton.h"
#import "UIView+Frame.h"

@implementation WDDFastLoginButton
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.wdd_centerX = self.wdd_width * 0.5;
    self.imageView.wdd_y = 0;
    
    // 根据文字内容计算下label,设置好label尺寸
    [self.titleLabel sizeToFit];
    self.titleLabel.wdd_centerX = self.wdd_width * 0.5;
    self.titleLabel.wdd_y = self.wdd_height - self.titleLabel.wdd_height;
    
    // 文字显示不出来:label尺寸不够 -> label跟文字一样
    // label宽度 => 计算文字宽度
}
@end
