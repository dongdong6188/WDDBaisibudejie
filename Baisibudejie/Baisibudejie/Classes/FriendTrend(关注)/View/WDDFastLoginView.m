//
//  XMGFastLoginView.m
//  BuDeJie
//
//  Created by xiaomage on 16/4/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "WDDFastLoginView.h"

@implementation WDDFastLoginView
+ (instancetype)fastLoginView
{
      return [[[NSBundle mainBundle] loadNibNamed:@"WDDFastLoginView" owner:nil options:nil] firstObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
