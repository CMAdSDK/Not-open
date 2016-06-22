//
//  BannerAdViewController.m
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/5/8.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import "BannerAdViewController.h"
#import "CMABannerView.h"

@interface BannerAdViewController ()<CMABannerViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet CMABannerView *mediumRectBanner;
@property (weak, nonatomic) IBOutlet CMABannerView *banner;
@property (weak, nonatomic) IBOutlet UILabel *adStatusLabel;

@end

@implementation BannerAdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupBanners];
    [self reloadBanners];
}

- (void)setupBanners
{
    CMAPosIDConfig *config = [[CMAPosIDConfig alloc] initWithOrionPosID:@"1345105" liehuPosID:@"1346105"];
    
    self.banner.delegate = self;
    self.banner.posIDConfig = config;
    self.banner.adType = kCMABannerAdTypeBanner;
    self.banner.rootViewController = self;
    
    self.mediumRectBanner.delegate = self;
    self.mediumRectBanner.posIDConfig = config;
    self.mediumRectBanner.adType = kCMABannerAdTypeMediumRectangle;
    self.mediumRectBanner.rootViewController = self;
}

- (void)reloadBanners
{
    self.adStatusLabel.text = @"";
    
    if (self.segmentControl.selectedSegmentIndex == 0) {
        self.mediumRectBanner.hidden = YES;
        self.banner.hidden = NO;
    }
    else {
        self.mediumRectBanner.hidden = NO;
        self.banner.hidden = YES;
    }
}

- (IBAction)didClickedLoadAdBtn:(id)sender
{
    if (self.segmentControl.selectedSegmentIndex == 0) {
        [self.banner loadAd];
    }
    else {
        [self.mediumRectBanner loadAd];
    }
    
    self.adStatusLabel.text = @"Requesting ad...";
}

- (IBAction)segmentcontrolValueDidChanged:(id)sender
{
    [self reloadBanners];
}

#pragma mark - CMABannerViewDelegate

- (void)bannerViewDidLoadAd:(CMABannerView *)banner;
{
    self.adStatusLabel.text = @"Ad was loaded.";
}

- (void)bannerView:(CMABannerView *)banner didFailToLoadAdWithError:(CMARequestError *)error;
{
    self.adStatusLabel.text = @"Ad failed to load. Check console for details.";
    NSLog(@"didFailToLoadAdWithError %@", error);
}

- (void)bannerViewWillPresentScreen:(CMABannerView *)banner;
{
    
}

- (void)bannerViewWillDismissScreen:(CMABannerView *)banner;
{

}

- (void)bannerViewWillLeaveApplication:(CMABannerView *)banner;
{

}

@end
