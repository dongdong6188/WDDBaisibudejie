//
//  WDDAdController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/28.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDAdController.h"
#import "WDDAdMode.h"
@interface WDDAdController ()
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpClick;
@property (nonatomic, weak) UIImageView *adView;
@property (nonatomic, strong) WDDAdMode *item;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation WDDAdController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
