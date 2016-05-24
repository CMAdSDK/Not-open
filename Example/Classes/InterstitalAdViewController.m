//
//  InterstitalAdViewController.m
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/4/17.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import "InterstitalAdViewController.h"
#import "CMAInterstitial.h"

@interface InterstitalAdViewController ()<CMAInterstitialDelegate>

@property (nonatomic) CMAInterstitial *interstitial;
@property (weak, nonatomic) IBOutlet UILabel *adStatusLabel;

@end

@implementation InterstitalAdViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CMAPosIDConfig *config = [[CMAPosIDConfig alloc] initWithPosID:@"1345104" chinaPosID:@"1346104"];
    
    self.interstitial = [[CMAInterstitial alloc] initWithPosIDConfig:config];
    self.interstitial.delegate = self;
}

- (IBAction)didClickedLoadAdBtn:(id)sender
{
    self.adStatusLabel.text = @"Requesting ad...";
    [self.interstitial loadAd];
}

#pragma mark - CMAInterstitialDelegate Implimentions

- (void)interstitialDidLoadAd:(CMAInterstitial *)ad;
{
    self.adStatusLabel.text = @"Ad was loaded.";
    [ad presentFromRootViewController:self];
}

- (void)interstitial:(CMAInterstitial *)ad didFailToLoadAdWithError:(CMARequestError *)error;
{
    self.adStatusLabel.text = @"Ad failed to load. Check console for details.";
    NSLog(@"didFailToLoadAdWithError %@", error);
}

- (void)interstitialWillPresentScreen:(CMAInterstitial *)ad;
{
    
}

- (void)interstitialWillDismissScreen:(CMAInterstitial *)ad;
{
    
}

- (void)interstitialWillLeaveApplication:(CMAInterstitial *)ad;
{
    
}

@end
