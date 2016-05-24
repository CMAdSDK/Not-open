//
//  CMAInterstitialDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/3/31.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CMAInterstitial, CMARequestError;

@protocol CMAInterstitialDelegate <NSObject>

@optional

#pragma mark - Request Lifecycle Notifications

- (void)interstitialDidLoadAd:(CMAInterstitial *)ad;

- (void)interstitial:(CMAInterstitial *)ad didFailToLoadAdWithError:(CMARequestError *)error;

#pragma mark - Display Lifecycle Notifications

- (void)interstitialWillPresentScreen:(CMAInterstitial *)ad;

- (void)interstitialWillDismissScreen:(CMAInterstitial *)ad;

- (void)interstitialWillLeaveApplication:(CMAInterstitial *)ad;

@end
