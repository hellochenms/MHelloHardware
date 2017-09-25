//
//  Oscillator.m
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Oscillator.h"
#import "NOT.h"

@interface Oscillator ()
@property (nonatomic) BOOL isPowerOn;
@property (nonatomic) NOT *not;
@end

@implementation Oscillator
- (void)start {
    self.isPowerOn = YES;
    self.not = [NOT new];
    [self oscillate:YES];
}

- (void)oscillate:(BOOL)input {
    [self.not input:input outputCallback:^(BOOL output) {
        NSLog(@"【MH】震荡:%d  %s", output, __func__);
        if (self.isPowerOn) {
            [self oscillate:output];
        }
    }];
}

- (void)shutdown {
    self.isPowerOn = NO;
}

@end
