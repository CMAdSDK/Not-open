//
//  CMANativeVideoViewDelegate.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMANativeVideoView, CMARequestError;
@protocol CMANativeVideoViewDelegate <NSObject>

@optional

#pragma mark - Request Lifecycle Notifications

- (void)nativeVideoViewDidLoadAd:(CMANativeVideoView *)view;

- (void)nativeVideoView:(CMANativeVideoView *)view didFailToLoadAdWithError:(CMARequestError *)error;

#pragma mark - Display Lifecycle Notifications

- (void)nativeVideoViewWillEnterFullScreen:(CMANativeVideoView *)view;

- (void)nativeVideoViewWillExitFullScreen:(CMANativeVideoView *)view;

- (void)nativeVideoViewWillStartPlaying:(CMANativeVideoView *)view;

- (void)nativeVideoViewWillPresentScreen:(CMANativeVideoView *)view;

- (void)nativeVideoViewWillDismissScreen:(CMANativeVideoView *)view;

- (void)nativeVideoViewWillLeaveApplication:(CMANativeVideoView *)view;

@end
