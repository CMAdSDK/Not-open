//
//  SplashAdViewController.m
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/5/8.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import "SplashAdViewController.h"
#import "CMASplashAd.h"

@interface SplashAdViewController ()<CMASplashAdDelegate>

@property (weak, nonatomic) IBOutlet UILabel *adStatusLabel;

@end

@implementation SplashAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didClickedShowSplashBtn:(id)sender
{
    self.adStatusLabel.text = @"Requesting ad...";
    
    CMAPosIDConfig *config = [[CMAPosIDConfig alloc] initWithPosID:@"1345106" chinaPosID:@"1346106"];
    
    CMASplashAd *splashAd = [[CMASplashAd alloc] initWithPosIDConfig:config];
    splashAd.delegate = self;
    splashAd.dismissAnimation = kCMASplashAnimationGrowFade;
    splashAd.backgroundView = [self splashBackgroundView];
    
    [splashAd show];
}

- (UIView *)splashBackgroundView
{
    NSArray *views = [[UINib nibWithNibName:@"SplashBackgroundView" bundle:nil] instantiateWithOwner:nil options:nil];
    for (UIView *view in views) {
        if ([view isMemberOfClass:[UIView class]]) {
            return view;
        }
    }
    return nil;
}

#pragma mark - 

- (void)splashAdDidLoadAd:(CMASplashAd *)splashAd;
{
    self.adStatusLabel.text = @"Ad was loaded.";
}

- (void)splashAd:(CMASplashAd *)splashAd didFailToLoadAdWithError:(CMARequestError *)error;
{
    self.adStatusLabel.text = @"Ad failed to load. Check console for details.";
    NSLog(@"didFailToLoadAdWithError %@", error);
}

- (void)splashAdWillSkip:(CMASplashAd *)splashAd
{
    NSLog(@"SplashAd skipped...");
}

- (void)splashAdWillPresentScreen:(CMASplashAd *)splashAd;
{

}

- (void)splashAdDidDismissScreen:(CMASplashAd *)splashAd;
{

}

- (void)splashAdWillLeaveApplication:(CMASplashAd *)splashAd;
{
    
}

@end
