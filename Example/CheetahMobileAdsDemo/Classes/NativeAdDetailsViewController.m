//
//  NativeAdDetailsViewController.m
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import "NativeAdDetailsViewController.h"
#import "AdTypeModel.h"
#import "CMANativeAdLoader.h"

@interface NativeAdDetailsViewController ()<CMANativeAdLoaderDelegate, UIPickerViewDataSource>

@property (nonatomic) CMANativeAdLoader *adLoader;
@property (nonatomic) CMANativeAd *nativeAd;
@property (weak, nonatomic) IBOutlet UIView *adContentView;
@property (weak, nonatomic) IBOutlet UIPickerView *adTypePickerView;
@property (weak, nonatomic) IBOutlet UILabel *adStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *commandLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *extraImagesScrollView;

@end

@implementation NativeAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)adTypeAdIndex:(NSInteger)index;
{
    switch (index) {
        case 0:
            return kCMANativeAdLoaderNewsFeed;
        case 1:
            return kCMANativeAdLoaderMiniFeed;
        case 2:
            return kCMANativeAdLoaderTripleImages;
        case 3:
            return kCMANativeAdLoaderSmallImage;
    }
    return nil;
}

#pragma mark -

- (void)reloadNativeAd
{
    self.titleLabel.text = self.nativeAd.title;
    self.descLabel.text = self.nativeAd.desc;
    self.commandLabel.text = self.nativeAd.command;
    self.iconImageView.image = self.nativeAd.icon;
    self.backgroundImageView.image = self.nativeAd.backgroundImage;
    
    [self.extraImagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i=0; i<self.nativeAd.extraImages.count; i++) {
        UIImage *image = self.nativeAd.extraImages[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){(95+5) * i, 0, 95, 50}];
        imageView.clipsToBounds = YES;
        imageView.image = image;
        [self.extraImagesScrollView addSubview:imageView];
    }
    
    self.extraImagesScrollView.contentSize = (CGSize){(95+5) * self.nativeAd.extraImages.count,0};
    
}

- (IBAction)didClickedLoadNativeAd:(id)sender
{
    self.adStatusLabel.text = @"Requesting ad...";
    
    NSInteger adTypeIndex = [self.adTypePickerView selectedRowInComponent:0];
    NSString *adTypeAtIndex = [self adTypeAdIndex:adTypeIndex];
    
    CMAPosIDConfig *config = [[CMAPosIDConfig alloc] initWithPosID:@"1345103" chinaPosID:@"1346103"];
    
    self.adLoader = [[CMANativeAdLoader alloc] initWithPosIDConfig:config adTypes:@[adTypeAtIndex]];
    self.adLoader.delegate = self;
    
    [self.adLoader loadAd];
}

#pragma mark - CMANativeAdLoaderDelegate

- (void)nativeAdLoaderLoaded:(CMANativeAdLoader *)nativeAdLoader;
{
    self.adStatusLabel.text = @"Ad was loaded.";
    self.nativeAd = [nativeAdLoader nextNativeAd];
    
    [self.nativeAd registerViewForInteraction:self.adContentView withViewController:self];
    
    [self reloadNativeAd];
}

- (void)nativeAdLoader:(CMANativeAdLoader *)nativeAdLoader didFailToReceiveAdWithError:(CMARequestError *)error;
{
    self.nativeAd = nil;
    self.adStatusLabel.text = @"Ad failed to load. Check console for details.";
    [self reloadNativeAd];
    
    NSLog(@"faild %@", error);
}

#pragma mark - 

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return 4;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self adTypeAdIndex:row];
}

@end
