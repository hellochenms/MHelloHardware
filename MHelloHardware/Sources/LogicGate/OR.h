//
//  Or.h
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OR : NSObject
- (void)inputA:(BOOL)inputA inputB:(BOOL)inputB outputCallback:(void(^)(BOOL))outputCallback;
@end
