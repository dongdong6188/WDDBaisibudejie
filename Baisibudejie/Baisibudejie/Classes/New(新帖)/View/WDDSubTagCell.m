//
//  WDDSubTagCell.m
//  Baisibudejie
//
//  Created by 仵懂懂 on 2018/7/23.
//  Copyright © 2018年 仵懂懂. All rights reserved.
//

#import "WDDSubTagCell.h"
@interface WDDSubTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIButton *subTagBtn;
@property (weak, nonatomic) IBOutlet UILabel *ditelLable;

@end
@implementation WDDSubTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
