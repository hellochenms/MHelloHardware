//
//  XOR.m
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "XOR.h"
#import "NOT.h"
#import "AND.h"
#import "OR.h"

@implementation XOR
- (void)inputA:(BOOL)inputA inputB:(BOOL)inputB outputCallback:(void(^)(BOOL))outputCallback {
    if (!outputCallback) {
        return;
    }
    
    NOT *notA = [NOT new];
    NOT *notB = [NOT new];
    
    AND *aAndNotB = [AND new];
    AND *bAndNotA = [AND new];

    __block NSInteger orReadyCount = 0;
    
    __block BOOL notAValue = NO;
    __block BOOL bAndNotAValue = NO;
    __block BOOL notBValue = NO;
    __block BOOL aAndNotBValue = NO;
    
    [notA input:inputA outputCallback:^(BOOL theNotAValue) {
        notAValue = theNotAValue;
        [bAndNotA inputA:inputB inputB:notAValue outputCallback:^(BOOL theBAndNotAValue) {
            bAndNotAValue = theBAndNotAValue;
            @synchronized (self) {
                orReadyCount += 1;
                if (orReadyCount == 2) {
                    [self orWithInputA:bAndNotAValue inputB:aAndNotBValue outputCallback:outputCallback];
                }
            }
        }];
    }];
    
    [notB input:inputB outputCallback:^(BOOL theNotBValue) {
        notBValue = theNotBValue;
        [aAndNotB inputA:inputA inputB:notBValue outputCallback:^(BOOL theAAndNotBValue) {
            aAndNotBValue = theAAndNotBValue;
            @synchronized (self) {
                orReadyCount += 1;
                if (orReadyCount == 2) {
                    [self orWithInputA:bAndNotAValue inputB:aAndNotBValue outputCallback:outputCallback];
                }
            }
        }];
    }];
}

- (void)orWithInputA:(BOOL)inputA inputB:(BOOL)inputB outputCallback:(void(^)(BOOL))outputCallback {
    OR *aANBOrbANA = [OR new];
    [aANBOrbANA inputA:inputA inputB:inputB outputCallback:outputCallback];
}

@end
