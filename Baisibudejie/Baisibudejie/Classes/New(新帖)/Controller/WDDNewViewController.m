//
//  WDDNewViewController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/15.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDNewViewController.h"
#import "UIBarButtonItem+item.h"
#import "WDDSubTagController.h"

@interface WDDNewViewController ()

@end

@implementation WDDNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarTittleAndButton];
}
-(void)setNavBarTittleAndButton
{
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIconClick"] highImage:[UIImage imageNamed:@"MainTagSubIcon"]  addTaget:self action:@selector(checkBtnClick)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"search-search-icon"] highImage:[UIImage imageNamed:@"search-search-icon"] addTaget:self action:@selector(searchBtnClick)];
}
-(void)checkBtnClick
{
    WDDSubTagController *subTagVc=[[WDDSubTagController alloc]init];
    subTagVc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:subTagVc animated:YES];
}
-(void)searchBtnClick
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
