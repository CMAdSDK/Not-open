//
//  CMARewardVideoAd.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/26.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CMAPosIDConfig.h>
#import <CMARewardVideoAdDelegate.h>

@interface CMARewardVideoAd : NSObject

@property (nonatomic, readonly, getter=isReady) BOOL ready;
@property (nonatomic, weak) id <CMARewardVideoAdDelegate> delegate;

+ (CMARewardVideoAd *)sharedInstance;

- (void)loadAdWithPosIDConfig:(CMAPosIDConfig *)posIDConfig;
- (void)presentFromRootViewController:(UIViewController *)rootViewController;

@end
