//
//  CMAInterstitialVideoAd.h
//  CheetahMobileAds
//
//  Created by Vincent｀Sun on 16/6/6.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMAInterstitialVideoAdDelegate.h"
#import "CMAPosIDConfig.h"

@interface CMAInterstitialVideoAd : NSObject

@property (nonatomic, readonly, getter=isReady) BOOL ready;
@property (nonatomic, weak) id <CMAInterstitialVideoAdDelegate> delegate;

- (instancetype)initWithPosIDConfig:(CMAPosIDConfig *)posIDConfig NS_DESIGNATED_INITIALIZER;
- (void)loadAd;
- (void)presentFromRootViewController:(UIViewController *)rootViewController;

@end
