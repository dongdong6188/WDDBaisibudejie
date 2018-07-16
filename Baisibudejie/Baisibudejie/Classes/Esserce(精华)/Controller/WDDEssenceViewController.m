//
//  WDDEssenceViewController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/15.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDEssenceViewController.h"
#import "UIBarButtonItem+item.h"

@interface WDDEssenceViewController ()

@end

@implementation WDDEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarTittleAndButton];
    
}
-(void)setNavBarTittleAndButton
{
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed: @"nav_item_game_click_icon"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed: @"nav_item_game_click_iconN"] forState:UIControlStateHighlighted];
//    [btn sizeToFit];
//    //现在修复了不用UIview包装按钮点击扩大的bug
////    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
////    [containView addSubview:btn];
//    [btn addTarget:self action:@selector(gameClick) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    //对设置图片进行一个方法抽取
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_click_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_iconN"]  addTaget:self action:@selector(gameClick)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandomClick"] highImage:[UIImage imageNamed:@"RandomAcross"] addTaget:self action:@selector(rightButtonClick)];
}
-(void)rightButtonClick
{
    
}
-(void)gameClick
{
    NSLog(@"按钮被点击");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
