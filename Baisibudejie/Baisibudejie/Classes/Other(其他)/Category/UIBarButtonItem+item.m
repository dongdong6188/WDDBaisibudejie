//
//  UIBarButtonItem+item.m
//  baisibudejie
//


#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)
+(instancetype)itemWithImage:(UIImage *) image highImage:(UIImage *)highImage addTaget:(id)taget action:(SEL)action{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image  forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    //现在修复了以前不用UIview包装按钮点击扩大的bug 在这可用也可以不用
    //    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    //    [containView addSubview:btn];
    [btn addTarget:taget action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
