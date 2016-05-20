//
//  CMAGoogleAdsBannerCustomEvent.m
//  BannerExample
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "CMAGoogleAdsBannerCustomEvent.h"
#import "CMARequestError.h"

@implementation CMAGoogleAdsBannerCustomEvent

#pragma mark - GADCustomEventBanner

- (void)requestBannerAd:(GADAdSize)adSize
              parameter:(NSString *)serverParameter
                  label:(NSString *)serverLabel
                request:(GADCustomEventRequest *)request;
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
    
    CMAPosIDConfig *posIDConfig = [[CMAPosIDConfig alloc] initWithPosID:cnPosID chinaPosID:wwPosID];
    
    CMABannerAdType adType = kCMABannerAdTypeBanner;
    if (GADAdSizeEqualToSize(adSize, kGADAdSizeBanner)) {
        adType = kCMABannerAdTypeBanner;
    }
    else if (GADAdSizeEqualToSize(adSize, kGADAdSizeBanner)) {
        adType = kCMABannerAdTypeMediumRectangle;
    }
    
    if (!self.bannerView || !CMABannerAdTypeEqualToType(self.bannerView.adType, adType)) {
        self.bannerView = [[CMABannerView alloc] initWithBannerAdType:adType];
    }
    
    self.bannerView.posIDConfig = posIDConfig;
    self.bannerView.delegate = self;
    
    [self.bannerView loadAd];
}

#pragma mark - CMABannerViewDelegate

- (void)bannerViewDidLoadAd:(CMABannerView *)banner;
{
    [self.delegate customEventBanner:self didReceiveAd:banner];
}

- (void)bannerView:(CMABannerView *)banner didFailToLoadAdWithError:(CMARequestError *)error;
{
    [self.delegate customEventBanner:self didFailAd:error];
}

- (void)bannerViewWillPresentScreen:(CMABannerView *)banner;
{
    [self.delegate customEventBannerWasClicked:self];
    [self.delegate customEventBannerWillPresentModal:self];
}

- (void)bannerViewWillDismissScreen:(CMABannerView *)banner;
{
    [self.delegate customEventBannerWillDismissModal:self];
    [self.delegate customEventBannerDidDismissModal:self];
}

- (void)bannerViewWillLeaveApplication:(CMABannerView *)banner;
{
    [self.delegate customEventBannerWasClicked:self];
    [self.delegate customEventBannerWillLeaveApplication:self];
}

@end
