//
//  Not.h
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOT : NSObject
- (void)input:(BOOL)input outputCallback:(void(^)(BOOL))outputCallback;
@end
