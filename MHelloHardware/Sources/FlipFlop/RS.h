//
//  RS.h
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RS : NSObject
- (void)start;
- (void)r;
- (void)s:(BOOL)value;
- (void)shutdown;
@end
