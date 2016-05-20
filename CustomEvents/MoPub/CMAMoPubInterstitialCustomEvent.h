//
//  CMAMoPubInterstitialCustomEvent.h
//  MoPubSampleApp
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 MoPub. All rights reserved.
//

#import "MPInterstitialCustomEvent.h"
#import "CMAInterstitial.h"

@interface CMAMoPubInterstitialCustomEvent : MPInterstitialCustomEvent<CMAInterstitialDelegate>

@property (nonatomic, strong) CMAInterstitial *interstitial;

@end
