//
//  CMAMoPubBannerCustomEvent.m
//  MoPubSampleApp
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 MoPub. All rights reserved.
//

#import "CMAMoPubBannerCustomEvent.h"
#import "CMARequestError.h"

@implementation CMAMoPubBannerCustomEvent

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info;
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
    
    if (!self.bannerView) {
        self.bannerView = [[CMABannerView alloc] initWithBannerAdType:kCMABannerAdTypeBanner];
    }
    
    self.bannerView.posIDConfig = posIDConfig;
    self.bannerView.delegate = self;
    
    [self.bannerView loadAd];
}

- (BOOL)enableAutomaticImpressionAndClickTracking;
{
    return YES;
}

#pragma mark - CMABannerViewDelegate

- (void)bannerViewDidLoadAd:(CMABannerView *)banner;
{
    [self.delegate bannerCustomEvent:self didLoadAd:banner];
}

- (void)bannerView:(CMABannerView *)banner didFailToLoadAdWithError:(CMARequestError *)error;
{
    [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:error];
}

- (void)bannerViewWillPresentScreen:(CMABannerView *)banner;
{
    [self.delegate bannerCustomEventWillBeginAction:self];
}

- (void)bannerViewWillDismissScreen:(CMABannerView *)banner;
{
    [self.delegate bannerCustomEventDidFinishAction:self];
}

- (void)bannerViewWillLeaveApplication:(CMABannerView *)banner;
{
    [self.delegate bannerCustomEventWillBeginAction:self];
    [self.delegate bannerCustomEventDidFinishAction:self];
    
    [self.delegate bannerCustomEventWillLeaveApplication:self];
}

@end
