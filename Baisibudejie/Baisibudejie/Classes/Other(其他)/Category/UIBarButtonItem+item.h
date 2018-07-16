//
//  UIBarButtonItem+item.h
//  baisibudejie
//
// 
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
+(instancetype)itemWithImage:(UIImage *) image highImage:(UIImage *)highImage addTaget:(id)taget action:(SEL)action;
@end
