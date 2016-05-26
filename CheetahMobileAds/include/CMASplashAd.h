//
//  CMASplashAd.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/14.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMAPosIDConfig.h"
#import "CMASplashAdDelegate.h"
#import "CMARequestError.h"

typedef NS_ENUM(NSUInteger, CMASplashAnimation) {
    kCMASplashAnimationNone = 0,
    kCMASplashAnimationFade,
    kCMASplashAnimationGrowFade
};

@interface CMASplashAd : NSObject

- (instancetype)initWithPosIDConfig:(CMAPosIDConfig *)posIDConfig NS_DESIGNATED_INITIALIZER;
- (void)show;
- (void)showInWindow:(UIWindow *)window;

@property (nonatomic,   copy, readonly) CMAPosIDConfig *posIDConfig;
@property (nonatomic,   weak) id<CMASplashAdDelegate> delegate;

@property (nonatomic,   weak) UIViewController *rootViewController;

@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, assign) CMASplashAnimation dismissAnimation;
@property (nonatomic, assign) CGFloat customBottomSpace;
@property (nonatomic, assign) BOOL prefersStatusBarHidden;

@end
