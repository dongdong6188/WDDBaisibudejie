//
//  UIView+Frame.m
//  BuDeJie
//
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

+ (instancetype)wdd_viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (CGFloat)wdd_centerX
{
    return self.center.x;
}
- (void)setWdd_centerX:(CGFloat)wdd_centerX
{
    CGPoint center = self.center;
    center.x = wdd_centerX;
    self.center = center;
}

- (CGFloat)wdd_centerY
{
    return self.center.y;
}
- (void)setWdd_centerY:(CGFloat)wdd_centerY
{
    CGPoint center = self.center;
    center.y = wdd_centerY;
    self.center = center;
}

- (CGFloat)wdd_height
{
    return self.frame.size.height;
}

- (void)setWdd_height:(CGFloat)wdd_height
{
    CGRect rect = self.frame;
    rect.size.height = wdd_height;
    self.frame = rect;
}

- (CGFloat)wdd_width
{
    return self.frame.size.width;
}

- (void)setWdd_width:(CGFloat)wdd_width
{
    CGRect rect = self.frame;
    rect.size.width = wdd_width;
    self.frame = rect;

}

- (CGFloat)wdd_x
{
    return self.frame.origin.x;
}

- (void)setWdd_x:(CGFloat)wdd_x
{
    CGRect rect = self.frame;
    rect.origin.x = wdd_x;
    self.frame = rect;

}

- (CGFloat)wdd_y
{
    return self.frame.origin.y;
}
- (void)setWdd_y:(CGFloat)wdd_y
{
    CGRect rect = self.frame;
    rect.origin.y = wdd_y;
    self.frame = rect;

}
@end
