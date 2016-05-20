//
//  CMABannerView.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/3/31.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMAPosIDConfig.h"
#import "CMABannerAdTypes.h"
#import "CMABannerViewDelegate.h"

@interface CMABannerView : UIView

- (instancetype)initWithBannerAdType:(CMABannerAdType)adType origin:(CGPoint)origin;
- (instancetype)initWithBannerAdType:(CMABannerAdType)adType;

- (void)loadAd;

@property (nonatomic, assign) CMABannerAdType adType;
@property (nonatomic, copy) CMAPosIDConfig *posIDConfig;

@property (nonatomic, weak) IBOutlet id<CMABannerViewDelegate> delegate;
@property (nonatomic, weak) IBOutlet UIViewController *rootViewController;

@end
