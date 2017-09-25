//
//  Not.m
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NOT.h"
#import "BaseConstants.h"

@implementation NOT
- (void)input:(BOOL)input outputCallback:(void(^)(BOOL))outputCallback {
    if (!outputCallback) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BOOL output = !input;
//        NSLog(@"【MH】非:%d  %s", output, __func__);
        outputCallback(output);
    });
}

@end
