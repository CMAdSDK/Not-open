//
//  CMABannerAdTypes.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/5/13.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <CheetahMobileAdsDefines.h>

typedef struct CMABannerAdType {
    NSUInteger type;
    CGSize size;
} CMABannerAdType;


CMA_EXTERN CMABannerAdType const kCMABannerAdTypeBanner;
CMA_EXTERN CMABannerAdType const kCMABannerAdTypeMediumRectangle;

CMA_EXTERN BOOL CMABannerAdTypeEqualToType(CMABannerAdType type1, CMABannerAdType type2);