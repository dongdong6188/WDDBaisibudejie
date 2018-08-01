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

static NSString *const ID=@"collectionCell";
static NSInteger const cols = 4;
static CGFloat const margin = 1;
#define WDDScreenH [UIScreen mainScreen].bounds.size.height
#define WDDScreenW [UIScreen mainScreen].bounds.size.width
#define itemWH (WDDScreenW - ((cols - 1) * margin)) / cols

@interface WDDMeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation WDDMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarTittleAndButton];
     [self setUpFooterView];
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
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    _collectionView=collectionView;
    self.tableView.tableFooterView=collectionView;
    collectionView.delegate=self;
    collectionView.dataSource=self;
    [collectionView registerNib:[UINib nibWithNibName:@"WDDCollectionCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
}
#pragma markcollectionView的代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    WDDCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    
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
