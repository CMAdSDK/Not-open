//
//  CMANativeAdLoaderDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CMANativeAdLoader, CMARequestError;

@protocol CMANativeAdLoaderDelegate <NSObject>

- (void)nativeAdLoaderLoaded:(CMANativeAdLoader *)nativeAdLoader;
- (void)nativeAdLoader:(CMANativeAdLoader *)nativeAdLoader didFailToReceiveAdWithError:(CMARequestError *)error;

@end
