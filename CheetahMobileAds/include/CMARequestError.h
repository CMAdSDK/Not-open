//
//  CMARequestError.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//
#import <CheetahMobileAdsDefines.h>

CMA_EXTERN NSString * const kCMAErrorDomain;

typedef NS_ENUM(NSInteger, CMAErrorCode) {
    kCMAErrorInternalError = -1001,
    kCMAErrorTimeout = -1002,
    kCMAErrorNetworkError = -1003,
    kCMAErrorNoFill = -1004,
    kCMAErrorJSONTransform = -1005,
    kCMAErrorServerError = -1006,
    kCMAErrorInvalidArgument = -1007,
    kCMAErrorResourceLoadError = -1008,
    kCMAErrorVASTResolveError = -1009
};

@interface CMARequestError : NSError

@end