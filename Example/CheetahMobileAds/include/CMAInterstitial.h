//
//  CMAInterstitial.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/3/31.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CMAPosIDConfig.h"
#import "CMAInterstitialDelegate.h"

@interface CMAInterstitial : NSObject

- (instancetype)initWithPosIDConfig:(CMAPosIDConfig *)posIDConfig NS_DESIGNATED_INITIALIZER;

- (void)loadAd;
- (void)presentFromRootViewController:(UIViewController *)rootViewController;

@property (nonatomic, readonly, copy) CMAPosIDConfig *posIDConfig;

@property (nonatomic, readonly, assign) BOOL isReady;
@property (nonatomic, readonly, assign) BOOL hasBeenUsed;

@property (nonatomic, weak) id<CMAInterstitialDelegate> delegate;

@end
