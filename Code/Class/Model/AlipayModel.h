//
//  AlipayModel.h
//  Pay
//
//  Created by maoziyue on 2017/9/19.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AliData : NSObject

@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy) NSString *notify_url;
@property (nonatomic,copy) NSString *out_trade_no;
@property (nonatomic,copy) NSString *partner;
@property (nonatomic,copy) NSString *payment_type;
@property (nonatomic,copy) NSString *seller_id;
@property (nonatomic,copy) NSString *service;
@property (nonatomic,copy) NSString *sign;
@property (nonatomic,copy) NSString *sign_type;
@property (nonatomic,copy) NSString *subject;
@property (nonatomic,copy) NSString *total_fee;


@end


@interface AliStatus : NSObject

@property (nonatomic,copy)NSString *code;
@property (nonatomic,copy)NSString *msg;

@end

@interface AlipayModel : NSObject

@property (nonatomic,copy)NSString *sid;
@property (nonatomic,strong)AliStatus *status;
@property (nonatomic,strong)AliData *data;

@end
