//
//  XMGLoginRegisterView.m
//  BuDeJie
//
//  Created by xiaomage on 16/4/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "WDDLoginRegisterView.h"

@interface WDDLoginRegisterView ()

@property (weak, nonatomic) IBOutlet UIButton *loginRegisterBtn;

@end

@implementation WDDLoginRegisterView
+ (instancetype)registerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WDDLoginRegisterView" owner:nil options:nil] lastObject];
}

+ (instancetype)loginView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WDDLoginRegisterView" owner:nil options:nil] firstObject];
}

// 从xib加载就会调用,就会把xib所有的属性全部设置
- (void)awakeFromNib
{
    UIImage *image = self.loginRegisterBtn.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [self.loginRegisterBtn setBackgroundImage:image forState:UIControlStateNormal];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
