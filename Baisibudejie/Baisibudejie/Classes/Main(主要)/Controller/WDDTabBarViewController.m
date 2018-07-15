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
#import "UIImage+image.h"

@interface WDDTabBarViewController ()

@end

@implementation WDDTabBarViewController
//设置tabbar字体大小和颜色
+ (void)load{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attrsSelected = [NSMutableDictionary dictionary];
    attrsSelected[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrsSelected forState:UIControlStateSelected];
    
    NSMutableDictionary *attrsNormal = [NSMutableDictionary dictionary];
    attrsNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [item setTitleTextAttributes:attrsNormal forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用这种方法一样可以设置字体的颜色
    //self.tabBar.tintColor=[UIColor blackColor];
    //[self setupAllTabbarButtonItem];
    [self addAllChildViewController];
}
//设置子控制器按钮内容
//-(void)setupAllTabbarButtonItem
//{
//    UINavigationController *nav1=self.childViewControllers[0];
//    nav1.tabBarItem.title=@"精华";
//    nav1.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_click_icon"];
//
//}
// 添加所有子控制器
-(void)addAllChildViewController
{
    //创建导航控制器
    //精华
    WDDEssenceViewController *vc1=[[WDDEssenceViewController alloc]init];
    vc1.view.backgroundColor=[UIColor redColor];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    //设置控制器内容
    nav1.tabBarItem.title=@"精华";
    nav1.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    nav1.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    //新帖
    WDDNewViewController *vc2=[[WDDNewViewController alloc]init];
    vc2.view.backgroundColor=[UIColor grayColor];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:vc2];
    [self addChildViewController:nav2];
    
    nav2.tabBarItem.title=@"新帖";
    nav2.tabBarItem.image=[UIImage imageNamed:@"tabBar_new_icon"];
    nav2.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
    //发布
    WDDPublishViewController *vc3=[[WDDPublishViewController alloc]init];
    vc3.view.backgroundColor=[UIColor yellowColor];
    [self addChildViewController:vc3];
    vc3.tabBarItem.image=[UIImage imageOriginalWithName:@"tabBar_publish_icon"];
    vc3.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];

    
    //关注
    WDDFriendTrendViewController *vc4=[[WDDFriendTrendViewController alloc]init];
    vc4.view.backgroundColor=[UIColor blueColor];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:vc4];
    [self addChildViewController:nav4];
    
    nav4.tabBarItem.title=@"关注";
    nav4.tabBarItem.image=[UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav4.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    //我
    WDDMeViewController *vc5=[[WDDMeViewController alloc]init];
    vc5.view.backgroundColor=[UIColor orangeColor];
    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:vc5];
    [self addChildViewController:nav5];
    
    nav5.tabBarItem.title=@"我";
    nav5.tabBarItem.image=[UIImage imageNamed:@"tabBar_me_icon"];
    nav5.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
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
