//
//  LogDurationHelper.h
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogDurationHelper : NSObject
+ (instancetype)sharedInstance;
- (void)beginTimeLog;
- (void)endTimeLog;
@end
