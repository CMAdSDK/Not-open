//
//  CMAMoPubBannerCustomEvent.h
//  MoPubSampleApp
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 MoPub. All rights reserved.
//

#import "MPBannerCustomEvent.h"
#import "CMABannerView.h"

@interface CMAMoPubBannerCustomEvent : MPBannerCustomEvent<CMABannerViewDelegate>

@property (nonatomic) CMABannerView *bannerView;

@end
