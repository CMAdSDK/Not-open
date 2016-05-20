//
//  CMAPosIDConfig.h
//  CheetahMobileAds
//
//  Created by 李 柯良 on 16/4/14.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMAPosIDConfig : NSObject<NSCopying>

@property (nonatomic, readonly, copy) NSString *posID;
@property (nonatomic, readonly, copy) NSString *chinaPosID;

- (instancetype)initWithPosID:(NSString *)posID;
- (instancetype)intiWithChinaPosID:(NSString *)chinaPosID;
- (instancetype)initWithPosID:(NSString *)posID chinaPosID:(NSString *)chinaPosID NS_DESIGNATED_INITIALIZER;

- (NSString *)currentPosID;

@end
