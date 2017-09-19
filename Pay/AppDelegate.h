//
//  AppDelegate.h
//  Pay
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>


#define WXAPP_KEY  @"wx263ec5e1bf81b161"


@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) UINavigationController *navController;

- (void)gomainvc;

- (void)resetRootControllerWithVCName:(NSString *)vcName;



@end

