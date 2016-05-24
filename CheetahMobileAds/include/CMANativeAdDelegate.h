//
//  CMANativeAdDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/5.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMANativeAd;
@protocol CMANativeAdDelegate <NSObject>

@optional
- (void)nativeAdWillPresentScreen:(CMANativeAd *)nativeAd;
- (void)nativeAdWillDismissScreen:(CMANativeAd *)nativeAd;
- (void)nativeAdWillLeaveApplication:(CMANativeAd *)nativeAd;

@end
