//
//  CMAGoogleAdsInterstitialCustomEvent.m
//  InterstitialExample
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "CMAGoogleAdsInterstitialCustomEvent.h"
#import "CMARequestError.h"

@implementation CMAGoogleAdsInterstitialCustomEvent

#pragma mark - GADCustomEventInterstitial

- (void)requestInterstitialAdWithParameter:(NSString *)serverParameter
                                     label:(NSString *)serverLabel
                                   request:(GADCustomEventRequest *)customEventRequest
{
    NSArray *serverParameters = [serverParameter componentsSeparatedByString:@","];
    
    __block NSString *wwPosID = @"";
    __block NSString *cnPosID = @"";
    
    [serverParameters enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj hasPrefix:@"cn_"]) {
            cnPosID = [obj substringFromIndex:3];
        }
        else if ([obj hasPrefix:@"ww_"]) {
            wwPosID = [obj substringFromIndex:3];
        }
    }];
    
    CMAPosIDConfig *posIDConfig = [[CMAPosIDConfig alloc] initWithOrionPosID:cnPosID liehuPosID:wwPosID];
    
    if (self.interstitial && [wwPosID isEqualToString:self.interstitial.posIDConfig.orionPosID] && [cnPosID isEqualToString:self.interstitial.posIDConfig.liehuPosID]) {
        [self.interstitial loadAd];
    }
    else {
        self.interstitial = [[CMAInterstitial alloc] initWithPosIDConfig:posIDConfig];
        self.interstitial.delegate = self;
        [self.interstitial loadAd];
    }
}

- (void)presentFromRootViewController:(UIViewController *)rootViewController
{
    [self.interstitial presentFromRootViewController:rootViewController];
}

#pragma mark - CMAInterstitialDelegate

- (void)interstitialDidLoadAd:(CMAInterstitial *)ad;
{
    [self.delegate customEventInterstitialDidReceiveAd:self];
}

- (void)interstitial:(CMAInterstitial *)ad didFailToLoadAdWithError:(CMARequestError *)error;
{
    [self.delegate customEventInterstitial:self didFailAd:error];
}

- (void)interstitialWillPresentScreen:(CMAInterstitial *)ad;
{
    [self.delegate customEventInterstitialWasClicked:self];
    [self.delegate customEventInterstitialWillPresent:self];
}

- (void)interstitialWillDismissScreen:(CMAInterstitial *)ad;
{
    [self.delegate customEventInterstitialWillDismiss:self];
    [self.delegate customEventInterstitialWillDismiss:self];
}

- (void)interstitialWillLeaveApplication:(CMAInterstitial *)ad;
{
    [self.delegate customEventInterstitialWasClicked:self];
    [self.delegate customEventInterstitialWillLeaveApplication:self];
}

@end
