//
//  UIImage+image.m
//  baisibudejie
//
//  Created by targetcloud on 2017/3/5.
//  Copyright © 2017年 targetcloud. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
+ (UIImage *)imageOriginalWithName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
// 生成一个圆角图片
- (UIImage *)circleImage
{
    // 裁剪图片: 图形上下文
    // 1.开启图形上下文
    // scale:比例因素 点:像素比例 0:自动识别比例因素
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    // 2.描述圆形裁剪路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 3.设置为裁剪区域
    [clipPath addClip];
    // 4.画图片
    [self drawAtPoint:CGPointZero];
    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)WDD_circleImageNamed:(NSString *)name
{
    return [[UIImage imageNamed:name] circleImage];
}
@end
