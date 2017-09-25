//
//  LogDurationHelper.m
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "LogDurationHelper.h"

@interface LogDurationHelper ()
@property (nonatomic) NSTimeInterval beginTime;
@end

@implementation LogDurationHelper

+ (instancetype)sharedInstance {
    static LogDurationHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

- (void)beginTimeLog {
    self.beginTime = [[NSDate date] timeIntervalSince1970];
}

- (void)endTimeLog {
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    
    NSTimeInterval duration = endTime - self.beginTime;
    self.beginTime = 0;
    
    NSLog(@"【MH】duration:%.2f  %s", duration, __func__);
}

@end
