//
//  CMANativeVideoView.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/18.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CMAPosIDConfig.h>
#import "CMANativeVideoViewDelegate.h"
#import "CMANativeVideoView.h"


CMA_EXTERN CGSize CMAVideoViewAutoSizeWithWidth(CGFloat width);
CMA_EXTERN CGSize CMAVideoViewAutoSizeWithHeight(CGFloat height);

CMA_EXTERN const CGSize kCMAVideoDefaultSize;

@interface CMANativeVideoView : UIView

- (instancetype)initWithVideoSize:(CGSize)size;
- (instancetype)initWithVideoSize:(CGSize)size origin:(CGPoint)origin;

- (void)loadAd;
- (void)playNext;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *body;
@property (nonatomic, readonly) NSURL *icon;

@property (nonatomic, copy) CMAPosIDConfig *posIDConfig;

@property (nonatomic, assign) BOOL muteAtStart;

@property (nonatomic, assign, readonly) BOOL isReady;
@property (nonatomic, weak) IBOutlet id<CMANativeVideoViewDelegate> delegate;
@property (nonatomic, weak) IBOutlet UIViewController *rootViewController;

@end
