//
//  CMAGoogleAdsBannerCustomEvent.h
//  BannerExample
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "CMABannerView.h"


@interface CMAGoogleAdsBannerCustomEvent : NSObject<GADCustomEventBanner, CMABannerViewDelegate>

@property (nonatomic, strong) CMABannerView *bannerView;
@property(nonatomic, weak) id<GADCustomEventBannerDelegate> delegate;

@end
