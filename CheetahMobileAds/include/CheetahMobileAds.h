//
//  CheetahMobileAds.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/3/28.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMAPosIDConfig.h"
#import "CMARequestError.h"


@interface CMAMIDConfig : NSObject

- (instancetype)initWithMID:(NSString *)MID chinaMID:(NSString *)chinaMID NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithMID:(NSString *)MID;
- (instancetype)initWithChinaMID:(NSString *)chinaMID;

- (NSString *)currentMID;

@property (nonatomic, readonly, copy) NSString *MID;
@property (nonatomic, readonly, copy) NSString *chinaMID;

@property (nonatomic, copy) NSArray *testDevices;

@end

@interface CheetahMobileAds : NSObject

+ (void)startWithMIDConfig:(CMAMIDConfig *)MIDconfig;
+ (void)clearCache;
+ (NSString *)version;

@end