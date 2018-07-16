//
//  WDDFriendTrendViewController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/15.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDFriendTrendViewController.h"
#import "UIBarButtonItem+item.h"
@interface WDDFriendTrendViewController ()

@end

@implementation WDDFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarTittleAndButton];
}
-(void)setNavBarTittleAndButton
{
    self.navigationItem.title=@"我的关注";
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] highImage:[UIImage imageNamed:@"friendsRecommentIcon"]  addTaget:self action:@selector(contentBtnClick)];
}
-(void)contentBtnClick
{
    
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
