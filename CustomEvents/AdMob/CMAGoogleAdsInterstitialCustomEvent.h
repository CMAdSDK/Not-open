//
//  CMAGoogleAdsInterstitialCustomEvent.h
//  InterstitialExample
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "CMAInterstitial.h"

@interface CMAGoogleAdsInterstitialCustomEvent : NSObject<GADCustomEventInterstitial, CMAInterstitialDelegate>

@property (nonatomic, weak) id<GADCustomEventInterstitialDelegate> delegate;
@property (nonatomic, strong) CMAInterstitial *interstitial;

@end
