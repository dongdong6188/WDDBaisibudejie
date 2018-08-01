//
//  XMGLoginRegisterView.h
//  BuDeJie
//
//  Created by xiaomage on 16/4/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDDLoginRegisterView : UIView

@property (nonatomic, assign) BOOL isLogin;
+ (instancetype)loginView;
+ (instancetype)registerView;

@end
