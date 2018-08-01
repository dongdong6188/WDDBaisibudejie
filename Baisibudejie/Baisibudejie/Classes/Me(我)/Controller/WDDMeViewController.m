//
//  WDDMeViewController.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/15.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDMeViewController.h"
#import "UIBarButtonItem+item.h"
#import "WDDSettingController.h"
#import "WDDCollectionCell.h"
#import <MJExtension/MJExtension.h>
#import "WDDSquareItem.h"
#import <AFNetworking.h>
#import "UIView+Frame.h"

static NSString *const ID=@"cell";
static NSInteger const cols = 4;
static CGFloat const margin = 1;
CGFloat const WDDMargin = 10;
NSString * const WDDRequestURL = @"http://api.budejie.com/api/api_open.php";
#define WDDScreenH [UIScreen mainScreen].bounds.size.height
#define WDDScreenW [UIScreen mainScreen].bounds.size.width
#define itemWH (WDDScreenW - ((cols - 1) * margin)) / cols


@interface WDDMeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic ,strong) NSMutableArray *squareItems;
@end

@implementation WDDMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarTittleAndButton];
     [self setUpFooterView];
    // 加载数据
    [self loadData];
    
    // 设置tableView组间距
    // 如果是分组样式,默认每一组都会有头部和尾部间距
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = WDDMargin;
    
    // 设置顶部额外滚动区域-25
    self.tableView.contentInset = UIEdgeInsetsMake(WDDMargin - 35, 0, 0, 0);
    
}
-(void)setNavBarTittleAndButton
{
    self.navigationItem.title=@"我";
//    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon-click"] highImage:
//    [UIImage imageNamed:@"mine-setting-icon"]  addTaget:self action:@selector(settingBtnClick)];
    UIBarButtonItem *settingItem =  [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon-click"] highImage:[UIImage imageNamed:@"mine-setting-icon"] addTaget:self action:@selector(settingBtnClick)];
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] highImage:[UIImage imageNamed:@"mine-moon-icon-click"]  addTaget:self action:@selector(moonClick)];
    //要想右侧添加两个或者以上按钮必须使用数组挨个添加不然会覆盖
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
   

}
-(void)setUpFooterView
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    // 创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    _collectionView = collectionView;
    collectionView.scrollsToTop = NO;
    collectionView.backgroundColor = [UIColor grayColor];
    
    self.tableView.tableFooterView = collectionView;
    
    // 设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerNib:[UINib nibWithNibName:@"WDDCollectionCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
}

#pragma mark -加载数据
- (void)loadData
{
    // 发送请求 -> 查看接口文档 -> AFN
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    
    [mgr GET:WDDRequestURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 字典数组
        NSArray *dictArr = responseObject[@"square_list"];
        
        // 字典数组转换层模型数组
        _squareItems = [WDDSquareItem mj_objectArrayWithKeyValuesArray:dictArr];
        
        // 处理数据
        [self resolveData];
        
        // 刷新表格
        [self.collectionView reloadData];
        
        // 4 5 9
        // 设置collectionView高度 => 跟行数 => 总个数 行数:(count - 1) / cols + 1
        NSInteger count = _squareItems.count;
        
        NSInteger rows = (count - 1) / cols + 1;
        
        CGFloat collectionH = rows * itemWH + (rows - 1) * margin;
        
        self.collectionView.wdd_height = collectionH;
        
        // 设置tableView滚动范围 => tableView滚动范围是系统会自动根据内容去计算
        self.tableView.tableFooterView = self.collectionView;
        
        // 重新计算contentSize
        [self.tableView reloadData];
        
        //[responseObject writeToFile:@"/Users/xiaomage/Desktop/课堂共享/07-OC项目/0406/代码/07-我的界面/square.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

// 处理数据
- (void)resolveData
{
    // 判断缺几个
    // 3 % 4 = 3 4 - 1 0
    NSInteger count = self.squareItems.count;
    
    NSInteger extre = count % cols;
    if (extre) { // 补模型
        extre = cols - extre;
        
        for (int i = 0; i < extre; i++) {
            
            WDDSquareItem *item = [[WDDSquareItem alloc] init];
            [self.squareItems addObject:item];
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WDDCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.item = self.squareItems[indexPath.row];
    
    return cell;
}

-(void)moonClick
{
    
}
-(void)settingBtnClick
{
    WDDSettingController *setVc=[[WDDSettingController alloc]init];
    //在push之前隐藏tabbar
    setVc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:setVc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
