//
//  UIView+Frame.h
//  BuDeJie
//
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property CGFloat wdd_width;
@property CGFloat wdd_height;
@property CGFloat wdd_x;
@property CGFloat wdd_y;
@property CGFloat wdd_centerY;
@property CGFloat wdd_centerX;

+ (instancetype)wdd_viewFromXib;
@end
