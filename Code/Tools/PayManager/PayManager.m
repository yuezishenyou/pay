//
//  PayManager.m
//  Pay
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "PayManager.h"


@interface PayManager ()

@end

@implementation PayManager

+ (instancetype)manager
{
    static PayManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [[PayManager alloc]init];
        }
    });
    return _manager;
}





//------------------------------------------------------------------
// - mark
//------------------------------------------------------------------













@end











