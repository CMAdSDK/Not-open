//
//  CMAInterstitialVideoAdDelegate.h
//  CheetahMobileAds
//
//  Created by Vincent｀Sun on 16/6/6.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMAInterstitialVideoAd, CMARequestError;

@protocol CMAInterstitialVideoAdDelegate <NSObject>

@optional

- (void)interstitialVideoAdDidReceiveAd:(CMAInterstitialVideoAd *)interstitialVideoAd;

- (void)interstitialVideoAdDidOpen:(CMAInterstitialVideoAd *)interstitialVideoAd;

- (void)interstitialVideoAdDidStartPlaying:(CMAInterstitialVideoAd *)interstitialVideoAd;

- (void)interstitialVideoAdWillClose:(CMAInterstitialVideoAd *)interstitialVideoAd;

- (void)interstitialVideoAdWillLeaveApplication:(CMAInterstitialVideoAd *)interstitialVideoAd;

- (void)interstitialVideoAd:(CMAInterstitialVideoAd *)interstitialVideoAd didFailToLoadWithError:(CMARequestError *)error;

@end
