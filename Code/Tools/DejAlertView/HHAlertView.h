//
//  HHAlertView.h
//  HH_自定义Alert
//
//  Created by maoziyue on 17/5/5.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^alertResult)(NSInteger index);
typedef void (^actionHandle)(NSInteger index);

@interface HHAlertView : UIView

@property (nonatomic,copy)alertResult resultIndex;
@property (nonatomic,copy)void (^clickIndex)(NSInteger index);


/**
 * sureBtn   tag = 2
 * cancleBtn tag = 1;
 */

//
//- (instancetype)initWithTitle:(NSString *)title
//                      message:(NSString *)message
//                      sureBtn:(NSString *)sureTitle
//                    cancleBtn:(NSString *)cancleTitle;
//
//- (void)showAlertView;



+ (HHAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel sure:(NSString *)sure handle:(actionHandle)handle;

@end
