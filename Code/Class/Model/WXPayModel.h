//
//  WXPayModel.h
//  Pay
//
//  Created by maoziyue on 2017/9/19.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXData : NSObject

@property (nonatomic,copy)NSString *appid;
@property (nonatomic,copy)NSString *noncestr;
@property (nonatomic,copy)NSString *package;
@property (nonatomic,copy)NSString *partnerid;
@property (nonatomic,copy)NSString *prepayid;
@property (nonatomic,copy)NSString *sign;
@property (nonatomic,copy)NSString *timestamp;

@end


@interface WXStatus : NSObject

@property (nonatomic,copy)NSString *code;
@property (nonatomic,copy)NSString *msg;

@end


@interface WXPayModel : NSObject

@property (nonatomic,copy) NSString *sid;
@property (nonatomic,strong) WXStatus *status;
@property (nonatomic,strong) WXData *data;

@end
