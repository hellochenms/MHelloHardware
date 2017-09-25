//
//  RS.m
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "RS.h"
#import "NOT.h"
#import "OR.h"

@interface RS ()
@property (nonatomic) BOOL isPowerOn;
@property (nonatomic) OR *orR;
@property (nonatomic) NOT *notR;
@property (nonatomic) OR *orS;
@property (nonatomic) NOT *notS;
@property (nonatomic) BOOL rValue;
@property (nonatomic) BOOL sValue;
@end

@implementation RS

- (void)start {
    self.isPowerOn = YES;
    self.orR = [OR new];
    self.notR = [NOT new];
    self.orS = [OR new];
    self.notS = [NOT new];
    
    [self oscillateNotR:NO];
    [self oscillateNotS:NO];
}

- (void)oscillateNotR:(BOOL)input {
    [self.notR input:input outputCallback:^(BOOL notROutput) {
        NSLog(@"【MH】notR-Q:%d  %s", notROutput, __func__);
//        NSLog(@"【MH】notR-notROutput:%d  %s", notROutput, __func__);
        if (!self.isPowerOn) {
            return;
        }
        [self.orS inputA:notROutput inputB:self.sValue outputCallback:^(BOOL orSOutput) {
//            NSLog(@"【MH】notR-orSOutput:%d  %s", orSOutput, __func__);
            if (!self.isPowerOn) {
                return;
            }
            [self.notS input:orSOutput outputCallback:^(BOOL notSOutput) {
//                NSLog(@"【MH】notR-notSOutput:%d  %s", notSOutput, __func__);
                if (!self.isPowerOn) {
                    return;
                }
                [self.orR inputA:notSOutput inputB:self.rValue outputCallback:^(BOOL orROutput) {
//                    NSLog(@"【MH】notR-orROutput:%d  %s", orROutput, __func__);
                    if (!self.isPowerOn) {
                        return;
                    }
                    [self oscillateNotR:orROutput];
                }];
            }];
        }];
    }];
}

- (void)oscillateNotS:(BOOL)input {
    [self.notS input:input outputCallback:^(BOOL notSOutput) {
//        NSLog(@"【MH】notS-notSOutput:%d  %s", notSOutput, __func__);
        if (!self.isPowerOn) {
            return;
        }
        [self.orR inputA:notSOutput inputB:self.rValue outputCallback:^(BOOL orROutput) {
//            NSLog(@"【MH】notS-orROutput:%d  %s", orROutput, __func__);
            if (!self.isPowerOn) {
                return;
            }
            [self.notR input:orROutput outputCallback:^(BOOL notROutput) {
//                NSLog(@"【MH】notS-notROutput:%d  %s", notROutput, __func__);
                NSLog(@"【MH】notS-Q:%d  %s", notROutput, __func__);
                if (!self.isPowerOn) {
                    return;
                }
                [self.orS inputA:notROutput inputB:self.sValue outputCallback:^(BOOL orSOutput) {
//                    NSLog(@"【MH】notS-orSOutput:%d  %s", orSOutput, __func__);
                    if (!self.isPowerOn) {
                        return;
                    }
                    [self oscillateNotS:orSOutput];
                }];
            }];
        }];
    }];
}

- (void)r {
    self.rValue = YES;
    self.sValue = NO;
    NSLog(@"【MH】RRRRR  %s", __func__);
}

- (void)s:(BOOL)value {
    self.sValue = value;
    self.rValue = !value;
    NSLog(@"【MH】SSSSS:%d  %s", value, __func__);
}

- (void)shutdown {
    self.isPowerOn = NO;
}



@end
