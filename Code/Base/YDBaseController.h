//
//  YDBaseController.h
//  Bulletin
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDBaseVCInfo : NSObject
@property (nonatomic, strong) NSString *vcName; //vc的名称
@property (nonatomic, strong) id contentObj;    //初始化内容定义视图
@property (nonatomic, assign) BOOL withXib;
@property (nonatomic, strong) id statusObj;
+ (id)infoWithVCName:(NSString *)name contentObj:(id)cObj hasXib:(BOOL)show;
+ (id)infoWithVCName:(NSString *)name contentObj:(id)cObj statusObj:(id)sObj hasXib:(BOOL)show;
+ (id)infoWithVcName:(NSString *)name withXib:(BOOL)show;
@property (nonatomic, assign) BOOL doNotTrack;

@end







//****************** YDBaseController *************************/
@interface YDBaseController : UIViewController






//***************************  *******************************/
@property (nonatomic, strong) YDBaseVCInfo *info;
+ (id)vcWithVcinfo:(YDBaseVCInfo *)vcInfo;












@end
















