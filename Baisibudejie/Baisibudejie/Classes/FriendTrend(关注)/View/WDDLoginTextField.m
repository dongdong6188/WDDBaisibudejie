//
//  XMGLoginTextField.m
//  BuDeJie
//
//  Created by xiaomage on 16/4/6.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "WDDLoginTextField.h"
#import "UITextField+Placeholder.h"

/*
 1.文本框的光标变成白色: 设置一次
 2.当文本框开始编辑的时候,让占位文字颜色变成白色
 */


@implementation WDDLoginTextField

- (void)awakeFromNib
{
    // 1.文本框的光标变成白色
    // 设置光标的颜色
    self.tintColor = [UIColor whiteColor];

    // 2.监听文本框开始编辑 1.代理 2.target 3.通知
    // 自己不要成为自己代理
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    
    // 监听结束编辑
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
    // 快速去设置占位文字颜色 -> 拿到占位文字控件(UILabel) -> 查看下类里面有没有提供这样一个属性 给我们获取占位文字label
    // 如何以后想要知道一个类里面有哪些私有属性,可以采取断点方式
    // 获取占位文字label
    
    // 设置占位文字颜色
    self.placeholderColor = [UIColor lightGrayColor];
    
}

- (void)textEnd
{
    self.placeholderColor = [UIColor lightGrayColor];

}
// 文本框开始编辑的时候调用
- (void)textBegin
{
    self.placeholderColor = [UIColor whiteColor];
}


@end
