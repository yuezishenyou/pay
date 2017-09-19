//
//  YDNetworking.h
//  HH_Entity
//
//  Created by maoziyue on 17/6/2.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "LoginModel.h"
#import "WXPayModel.h"
#import "AlipayModel.h"





@interface YDNetworking : NSObject



+ (void)postGetUserLoginInfoWithDictionary:(NSDictionary *)dic completion:(void(^)(LoginModel *model ,NSError *error))completion;


//微信pay
+ (void)postGetWeixAgrumentsWithDictionary:(NSDictionary *)dic completion:(void(^)(WXPayModel *model,NSError *error))completion;

//支付宝pay
+ (void)postGetSellerSinginWithDictionary:(NSDictionary *)dic completino:(void(^)(AlipayModel *model,NSError *error))completion;







/**
 * 2008
 * 修改头像
 */
//+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dic resltBlock:(void (^)(YDUpLoadModel *model, NSError *error))block;












@end
