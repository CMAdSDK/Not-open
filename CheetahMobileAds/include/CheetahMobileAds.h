//
//  CheetahMobileAds.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/3/28.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMAMIDConfig : NSObject

- (instancetype)initWithOrionMID:(NSString *)orionMID liehuMID:(NSString *)liehuMID NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithOrionMID:(NSString *)orionMID;
- (instancetype)initWithLiehuMID:(NSString *)liehuMID;

- (NSString *)currentMID;

@property (nonatomic, readonly, copy) NSString *orionMID;
@property (nonatomic, readonly, copy) NSString *liehuMID;

@property (nonatomic, copy) NSArray *testDevices;

@end

@interface CheetahMobileAds : NSObject

+ (void)startWithMIDConfig:(CMAMIDConfig *)MIDconfig;
+ (void)clearCache;
+ (NSString *)version;

@end