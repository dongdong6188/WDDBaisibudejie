//
//  WDDTabBarViewController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/15.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDTabBarViewController.h"
#import "WDDEssenceViewController.h"
#import "WDDMeViewController.h"
#import "WDDNewViewController.h"
#import "WDDPublishViewController.h"
#import "WDDFriendTrendViewController.h"

@interface WDDTabBarViewController ()

@end

@implementation WDDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController];
}
-(void)addChildViewController
{
    //创建导航控制器
    //精华
    WDDEssenceViewController *vc1=[[WDDEssenceViewController alloc]init];
    vc1.view.backgroundColor=[UIColor redColor];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    //关注
    WDDFriendTrendViewController *vc2=[[WDDFriendTrendViewController alloc]init];
    vc2.view.backgroundColor=[UIColor blueColor];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:vc2];
    [self addChildViewController:nav2];

    //新帖
    WDDNewViewController *vc4=[[WDDNewViewController alloc]init];
    vc4.view.backgroundColor=[UIColor grayColor];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:vc4];
    [self addChildViewController:nav4];
    
    //发布
    WDDPublishViewController *vc5=[[WDDPublishViewController alloc]init];
    vc5.view.backgroundColor=[UIColor yellowColor];
    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:vc5];
    [self addChildViewController:nav5];
    
    //我
    WDDMeViewController *vc3=[[WDDMeViewController alloc]init];
    vc3.view.backgroundColor=[UIColor orangeColor];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:vc3];
    [self addChildViewController:nav3];

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
