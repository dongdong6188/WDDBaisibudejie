//
//  WDDNavigationController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/16.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDNavigationController.h"

@interface WDDNavigationController ()

@end

@implementation WDDNavigationController
//使用appearance设置全局的字体
/*
 appearance是获取整个应用程序下的所有东西
 appearanceWhenContainedIn:是获取哪个类下面的东西
 */
+(void)load{
    
    UINavigationBar *bar=[UINavigationBar appearance];
    //设置导航条标题字体
    NSMutableDictionary *arr=[NSMutableDictionary dictionary];
    arr[NSFontAttributeName]=[UIFont boldSystemFontOfSize:20];
    bar.titleTextAttributes=arr;
    //设置导航条背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 滑动功能
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    
    // 控制器手势什么时候触发
    pan.delegate = self;
    
    // 清空手势代理,恢复滑动返回功能
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

#pragma mark - UIGestureRecognizerDelegate
// 是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 在根控制器下 不要 触发手势
    return self.childViewControllers.count > 1;
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
