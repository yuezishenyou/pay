//
//  KeyboardManager.h
//  mj_keyboard
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//


//*********************** 监听键盘 防止遮挡 ****************************/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KeyboardManager;
@protocol KeyboardManagerDelegate <NSObject>

- (void)keyboardManager:(KeyboardManager *)keyboardManager bottomStance:(CGFloat)bottomStance keyboardHeight:(CGFloat)keyboardHeight;

@end

@interface KeyboardManager : NSObject

//父视图  必填
@property (nonatomic,strong)UIView *bgView;
//距离键盘的高度默认100
@property (nonatomic,assign)CGFloat distance;
//代理
@property (nonatomic,weak) id <KeyboardManagerDelegate>delegate;



+ (instancetype)manager;

- (void)start;

- (void)stop;

@end
