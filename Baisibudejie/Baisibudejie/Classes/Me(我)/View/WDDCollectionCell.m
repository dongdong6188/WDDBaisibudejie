//
//  WDDCollectionCell.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/8/1.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDCollectionCell.h"
#import <UIImageView+WebCache.h>
#import "WDDSquareItem.h"
@interface WDDCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@end

@implementation WDDCollectionCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setItem:(WDDSquareItem *)item
{
    _item = item;
    
    // 给子控件赋值
    [_iconView sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    _nameView.text = item.name;
    
}
@end
