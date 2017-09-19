//
//  DejAlert.h
//  Bulletin
//
//  Created by maoziyue on 2017/9/14.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void ((^actionHandler)(NSInteger index));

@interface DejAlert : NSObject


+ (DejAlert *)alertWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel sure:(NSString *)sure handle:(actionHandler)handle;




@end
