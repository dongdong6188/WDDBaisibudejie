//
//  WDDSubTagCell.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/23.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDSubTagCell.h"
#import "WDDSubTagItem.h"
#import "UIImage+image.h"
#import <UIImageView+WebCache.h>
@interface WDDSubTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *ditelLable;

@end
@implementation WDDSubTagCell

- (void)setItem:(WDDSubTagItem *)item
{
    _item = item;
    
    // 头像
    UIImage *placeholder = [UIImage WDD_circleImageNamed:@"defaultUserIcon"];
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        if (image == nil) return ;

        self.iconImage.image =  [image circleImage];
    }];
    // 姓名
    _nameLable.text = item.theme_name;
    
    // 订阅数量
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅",item.sub_number];
    
    // intValue:只转换数字字符串
    NSInteger num = numStr.intValue;
    
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅",numF];
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    
    _ditelLable.text = numStr;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
