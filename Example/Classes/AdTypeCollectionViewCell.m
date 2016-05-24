//
//  AdTypeCollectionViewCell.m
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import "AdTypeCollectionViewCell.h"
#import "AdTypeModel.h"

@implementation AdTypeCollectionViewCell

- (void)configureWithAdType:(AdTypeModel *)model;
{
    if (![model isKindOfClass:[AdTypeModel class]]) {
        return;
    }
    
    self.typeLabel.text = model.adTypeName;
    self.coverView.image = [UIImage imageNamed:model.imageName];
    
}

+ (CGFloat)cellHeightForWidth:(CGFloat)width;
{
    return ceilf(width / 28 * 25) + 48;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 2.f;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
}

@end
