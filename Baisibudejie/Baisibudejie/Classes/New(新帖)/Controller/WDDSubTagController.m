//
//  WDDSubTagController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/23.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDSubTagController.h"
#import "UIBarButtonItem+item.h"
#import <MJExtension/MJExtension.h>
#import <AFNetworking.h>
#import "WDDSubTagItem.h"
#import "WDDSubTagCell.h"
#import <SVProgressHUD.h>
static NSString * const ID = @"cell";
@interface WDDSubTagController ()
@property(nonatomic,strong)NSArray *subTags;
@property(nonatomic,strong)NSURLSessionTask *task;
@end

@implementation WDDSubTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self loadData];
    //通过注册加载NIB
    [self.tableView registerNib:[UINib nibWithNibName:@"WDDSubTagCell" bundle:nil] forCellReuseIdentifier:ID];
    [self setUpNavBar];
    self.title=@"推荐标签";
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
    [_task cancel];
}
-(void)loadData
{   //用户提示
    [SVProgressHUD showWithStatus:@"正在加载"];
    //请求数据
    AFHTTPSessionManager *mgr=[AFHTTPSessionManager manager];
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"c"] = @"topic";
    parameters[@"action"] = @"sub";
    
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",responseObject);
        //[responseObject writeToFile:@"/Users/wudongdong/Desktop/Work/subTag.plist" atomically:YES];
        self->_subTags=[WDDSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        //取到数据就加载并赋值
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}

-(void)setUpNavBar
{
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backBtn setImage:[UIImage imageNamed:@"capture_nav_back_normal"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"capture_nav_back_highlight"] forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
// 有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.subTags.count;
}

// 返回每个cell长什么样子
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WDDSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.item = self.subTags[indexPath.row];
    return cell;
    
}

// 返回每个cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
