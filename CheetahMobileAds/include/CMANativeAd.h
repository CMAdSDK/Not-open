//
//  CMANativeAd.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CMANativeAdDelegate;

@interface CMANativeAd : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSString *pkg;
@property (nonatomic) NSString *command;

@property (nonatomic, readonly) UIImage *icon;
@property (nonatomic, readonly) UIImage *backgroundImage;

@property (nonatomic) NSURL *iconURL;
@property (nonatomic) NSURL *bgImageURL;

@property (nonatomic) NSDecimalNumber *rating;
@property (nonatomic) NSDecimalNumber *price;

@property (nonatomic, readonly) NSArray <UIImage *> *extraImages;
@property (nonatomic) NSArray *extraImageURLs;

@property (nonatomic, weak) id<CMANativeAdDelegate> delegate;

- (void)registerViewForInteraction:(UIView *)view;

- (void)registerViewForInteraction:(UIView *)view
                withViewController:(UIViewController *)viewController;

- (void)unregisterView;

+ (void)unregisterViewForInteraction:(UIView *)view;

@end
