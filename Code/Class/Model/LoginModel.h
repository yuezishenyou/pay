//
//  LoginModel.h
//  Pay
//
//  Created by maoziyue on 2017/9/19.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LData : NSObject


@property (nonatomic,copy) NSString *parentId;
@property (nonatomic,copy) NSString *plateNumber;
@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *mno;
@property (nonatomic,copy) NSString *drivingLicence;
@property (nonatomic,copy) NSString *photoPath;
@property (nonatomic,copy) NSString *regTime;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *uType;
@property (nonatomic,copy) NSString *unionPay;
@property (nonatomic,copy) NSString *drivingAge;
@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *photoSign;
@property (nonatomic,copy) NSString *shareNo;
@property (nonatomic,copy) NSString *driverStarLevel;


@end


@interface LStatus : NSObject

@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *msg;

@end



@interface LoginModel : NSObject

@property (nonatomic,copy) NSString *sid;
@property (nonatomic,strong) LStatus *status;
@property (nonatomic,strong) LData *data;
@property (nonatomic,copy) NSString *name;

@end
