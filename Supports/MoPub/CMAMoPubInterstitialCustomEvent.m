//
//  CMAMoPubInterstitialCustomEvent.m
//  MoPubSampleApp
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 MoPub. All rights reserved.
//

#import "CMAMoPubInterstitialCustomEvent.h"
#import "CMARequestError.h"

@implementation CMAMoPubInterstitialCustomEvent

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info;
{
    NSString *serverParameter = info[@"pos_id"];
    
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
    
    CMAPosIDConfig *posIDConfig = [[CMAPosIDConfig alloc] initWithPosID:cnPosID chinaPosID:wwPosID];
    
    if (self.interstitial && [wwPosID isEqualToString:self.interstitial.posIDConfig.posID] && [cnPosID isEqualToString:self.interstitial.posIDConfig.chinaPosID]) {
        [self.interstitial loadAd];
    }
    else {
        self.interstitial = [[CMAInterstitial alloc] initWithPosIDConfig:posIDConfig];
        self.interstitial.delegate = self;
        [self.interstitial loadAd];
    }
    
}

- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController;
{
    [self.interstitial presentFromRootViewController:rootViewController];
}

#pragma mark - CMAInterstitialDelegate


- (void)interstitialDidLoadAd:(CMAInterstitial *)ad;
{
    [self.delegate interstitialCustomEvent:self didLoadAd:ad];
}

- (void)interstitial:(CMAInterstitial *)ad didFailToLoadAdWithError:(CMARequestError *)error;
{
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
}

- (void)interstitialWillPresentScreen:(CMAInterstitial *)ad;
{
    [self.delegate interstitialCustomEventWillAppear:self];
    [self.delegate interstitialCustomEventDidAppear:self];
}

- (void)interstitialWillDismissScreen:(CMAInterstitial *)ad;
{
    [self.delegate interstitialCustomEventWillDisappear:self];
    [self.delegate interstitialCustomEventDidDisappear:self];
}

- (void)interstitialWillLeaveApplication:(CMAInterstitial *)ad;
{
    [self.delegate interstitialCustomEventWillLeaveApplication:self];
}

@end
