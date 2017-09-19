//
//  YDNetworking.m
//  HH_Entity
//
//  Created by maoziyue on 17/6/2.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "YDNetworking.h"
#import "MJExtension.h"
#import "YDNetWork.h"
#import "AFNetworking.h"


@implementation YDNetworking


+ (void)postGetUserLoginInfoWithDictionary:(NSDictionary *)dic completion:(void(^)(LoginModel *model ,NSError *error))completion
{
    [YDNetWork POST:GATEWAY parameters:dic success:^(id responseBody) {
        
        //NSLog(@"------responseBody:%@------",responseBody);
        LoginModel *model = [LoginModel mj_objectWithKeyValues:responseBody];
        
        completion(model,nil);
        
        
    } failure:^(NSError *error) {
        
        //NSLog(@"------error:%@------",error);
        completion(nil,error);
        
    }];
}

+ (void)postGetWeixAgrumentsWithDictionary:(NSDictionary *)dic completion:(void(^)(WXPayModel *model,NSError *error))completion
{
    [YDNetWork POST:GATEWAY parameters:dic success:^(id responseBody) {
        
        //NSLog(@"------responseBody:%@------",responseBody);
        WXPayModel *model = [WXPayModel mj_objectWithKeyValues:responseBody];
        completion(model,nil);
        
        
    } failure:^(NSError *error) {
        
        //NSLog(@"------error:%@------",error);
        completion(nil,error);
    }];
}


//支付宝pay
+ (void)postGetSellerSinginWithDictionary:(NSDictionary *)dic completino:(void(^)(AlipayModel *model,NSError *error))completion
{
    [YDNetWork POST:GATEWAY parameters:dic success:^(id responseBody) {
        
        NSLog(@"------responseBody:%@------",responseBody);
        AlipayModel *model = [AlipayModel mj_objectWithKeyValues:responseBody];
        completion(model,nil);
        
    } failure:^(NSError *error) {
        //NSLog(@"------error:%@------",error);
        completion(nil,error);
    }];
}

























//
//+ (void)postGetDetailWithDictionary:(NSDictionary *)dic resultBlock:(void(^)(YDDetailModel *model,NSError *error))block
//{
//    [[YDNetWork manager]POST:GATEWAY parameters:dic success:^(id responseBody) {
//        
//        DLogInfo(@"-----res:%@-----",responseBody);
//        
//        YDDetailModel *enti = [YDDetailModel mj_objectWithKeyValues:responseBody];
//        if (block)
//        {
//            block(enti,nil);
//        }
//    } failure:^(NSError *error) {
//        if (block) {
//            block(nil,error);
//        }
//    }];
//}

















///**
// * 2008
// * 修改头像
// */
//+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dic resltBlock:(void (^)(YDUpLoadModel *model, NSError *error))block
//{
//    
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//                                                         
//                                                         @"text/html",
//                                                         
//                                                         @"image/jpeg",
//                                                         
//                                                         @"image/png",
//                                                         
//                                                         @"application/octet-stream",
//                                                         
//                                                         @"text/json",
//                                                         
//                                                         nil];
//    
//    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
//    
//    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
//    
//    NSString *url = [NSString stringWithFormat:@"%@?sid=2008&token=%@", GATEWAY, dic[@"token"]];
//    
//    
//    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        NSData *picture = UIImageJPEGRepresentation(image, 0.5);
//        [formData appendPartWithFileData:picture name:@"photoPath" fileName:@"photo.jpg" mimeType:@"photo/jpg"];
//        
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        
//        NSLog(@"----%@----%@------",json[@"sid"],json);
//        
//        YDUpLoadModel *enti = [YDUpLoadModel mj_objectWithKeyValues:responseObject];
//        
//        if (block) {
//            block(enti,nil);
//        }
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        if (block) {
//            block(nil,error);
//        }
//        
//    }];
//    
//}




///**
// * 2004
// * 登录
// */
//+ (void)postGetLoginDataWithDictionary:(NSDictionary *)dic resultBlock:(void (^)(YDLoginModel *model,NSError *error))block
//{
//    
//    [YDNetWork POST:GATEWAY parameters:dic success:^(id responseBody) {
//        
//        
//        YDLoginModel *enti = [YDLoginModel mj_objectWithKeyValues:responseBody];
//        if (block) {
//            block(enti,nil);
//        }
//        
//    } failure:^(NSError *error) {
//        
//        if (block) {
//            block(nil,error);
//        }
//        
//    }];
//}








@end
