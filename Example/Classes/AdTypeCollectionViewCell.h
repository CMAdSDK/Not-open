//
//  AdTypeCollectionViewCell.h
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdTypeModel;
@interface AdTypeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

- (void)configureWithAdType:(AdTypeModel *)model;
+ (CGFloat)cellHeightForWidth:(CGFloat)width;

@end
