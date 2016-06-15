//
//  CMARewardVideoAdDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/26.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CMARewardVideoAd, CMARequestError;

@protocol CMARewardVideoAdDelegate <NSObject>

@optional

- (void)rewardVideoAdDidReceiveAd:(CMARewardVideoAd *)rewardVideoAd;

- (void)rewardVideoAdDidOpen:(CMARewardVideoAd *)rewardVideoAd;

- (void)rewardVideoAdDidStartPlaying:(CMARewardVideoAd *)rewardVideoAd;

- (void)rewardVideoAdWillClose:(CMARewardVideoAd *)rewardVideoAd;

- (void)rewardVideoAdWillLeaveApplication:(CMARewardVideoAd *)rewardVideoAd;

- (void)rewardVideoAdDidRewardUser:(CMARewardVideoAd *)rewardVideoAd;

- (void)rewardVideoAd:(CMARewardVideoAd *)rewardVideoAd
    didFailToLoadWithError:(CMARequestError *)error;

@end
