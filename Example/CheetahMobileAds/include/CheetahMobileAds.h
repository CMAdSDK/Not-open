//
//  CheetahMobileAds.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/3/28.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMAMIDConfig : NSObject

@property (nonatomic, readonly, copy) NSString *MID;
@property (nonatomic, readonly, copy) NSString *chinaMID;

- (instancetype)initWithMID:(NSString *)MID chinaMID:(NSString *)chinaMID NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithMID:(NSString *)MID;

- (instancetype)initWithChinaMID:(NSString *)chinaMID;

- (NSString *)currentMID;

@end

@interface CheetahMobileAds : NSObject

+ (void)startWithMIDConfig:(CMAMIDConfig *)MIDconfig;

+ (NSString *)version;

@end