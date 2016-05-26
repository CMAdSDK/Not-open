//
//  CMANativeAdLoader.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/4/15.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CMAPosIDConfig.h>
#import <CMANativeAd.h>
#import <CMANativeAdLoaderDelegate.h>
#import <CMANativeAdTypes.h>

@interface CMANativeAdLoader : NSObject

@property (nonatomic, weak) id<CMANativeAdLoaderDelegate> delegate;

- (instancetype)initWithPosIDConfig:(CMAPosIDConfig *)posIDConfig
                            adTypes:(NSArray *)adTypes NS_DESIGNATED_INITIALIZER;

- (void)loadAd;
- (CMANativeAd *)nextNativeAd;

@property (nonatomic, readonly) CMAPosIDConfig *posIDConfig;
@property (nonatomic, weak) UIViewController *rootViewController;

@end
