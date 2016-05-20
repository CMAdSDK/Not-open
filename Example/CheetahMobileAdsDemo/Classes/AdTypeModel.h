//
//  AdTypeModel.h
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AdType) {
    kAdTypeNativeAd,
    kAdTypeInterstital,
    kAdTypeBanner,
    kAdTypeVideo,
    kAdTypeSplash
};

@interface AdTypeModel : NSObject

@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *adTypeName;
@property (nonatomic) AdType adType;

@end
