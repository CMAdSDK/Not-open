//
//  CMABannerViewDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMABannerView, CMARequestError;

@protocol CMABannerViewDelegate <NSObject>

@optional

#pragma mark - Request Lifecycle Notifications

- (void)bannerViewDidLoadAd:(CMABannerView *)banner;

- (void)bannerView:(CMABannerView *)banner didFailToLoadAdWithError:(CMARequestError *)error;

#pragma mark - Display Lifecycle Notifications

- (void)bannerViewWillPresentScreen:(CMABannerView *)banner;

- (void)bannerViewWillDismissScreen:(CMABannerView *)banner;

- (void)bannerViewWillLeaveApplication:(CMABannerView *)banner;

@end
