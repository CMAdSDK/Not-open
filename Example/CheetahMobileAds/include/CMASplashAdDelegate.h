//
//  CMASplashAdDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/14.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CMASplashAd, CMARequestError;

@protocol CMASplashAdDelegate <NSObject>

@optional

#pragma mark - Request Lifecycle Notifications

- (void)splashAdDidLoadAd:(CMASplashAd *)splashAd;

- (void)splashAd:(CMASplashAd *)splashAd didFailToLoadAdWithError:(CMARequestError *)error;

#pragma mark - Display Lifecycle Notifications

- (void)splashAdWillPresentScreen:(CMASplashAd *)splashAd;

- (void)splashAdDidDismissScreen:(CMASplashAd *)splashAd;

- (void)splashAdWillLeaveApplication:(CMASplashAd *)splashAd;

- (void)splashAdWillSkip:(CMASplashAd *)splashAd;

@end
