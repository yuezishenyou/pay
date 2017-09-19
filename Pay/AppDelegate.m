//
//  AppDelegate.m
//  Pay
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//  http://www.jianshu.com/p/1c1c834b6d52

#import "AppDelegate.h"
#import "HHMainController.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self myCode];
    
    [WXApi registerApp:WXAPP_KEY withDescription:@"悦道用车"];
    
    
    
    return YES;
    
}







// -------------------------------------------------------------
// MARK- 微信
// -------------------------------------------------------------

//前面的两个方法被iOS9弃用了，如果是Xcode7.2网上的话会出现无法进入进入微信的onResp回调方法，就是这个原因。
//ios9弃用了
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL b = [WXApi handleOpenURL:url delegate:self];
    return b;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
//    if ([url.host isEqualToString:@"safepay"])
//    {
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
//            NSLog(@"result = %@",resultDic);
//        }];
//    }
    
    return [WXApi handleOpenURL:url delegate:self];
}


//9.0后的方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    //这里判断是否发起的请求为微信支付，
    //如果是的话，用WXApi的方法调起微信客户端的支付页面（://pay 之前的那串字符串就是你的APPID，）
    return [WXApi handleOpenURL:url delegate:self];
}


//微信SDK自带的方法，处理从微信客户端完成操作后返回程序之后的回调方法,显示支付结果的
- (void)onResp:(BaseResp *)resp
{
    //启动微信支付的response
    NSString *payResoult = [NSString stringWithFormat:@"error:%d",resp.errCode];
    
    if ([resp isKindOfClass:[PayResp class]])
    {
        switch (resp.errCode)
        {
            case 0:
            {
                payResoult = @"支付结果:成功!";
                NSLog(@"-------payResoult:%@------",payResoult);
            }
                break;
            case -1:
            {
                payResoult = @"支付结果:失败!";
                NSLog(@"-------payResoult:%@------",payResoult);
            }
                break;
            case -2:
            {
                payResoult = @"用户已经退出支付!";
                NSLog(@"-------payResoult:%@------",payResoult);
            }
                break;
                
            default:
            {
                payResoult = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                NSLog(@"-------payResoult:%@------",payResoult);
            }
                break;
        }
    }
}


















- (void)applicationWillResignActive:(UIApplication *)application {
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}












- (void)myCode
{
    self.window.frame = [[UIScreen mainScreen]bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
//    HHMainController *vc = [[HHMainController alloc]init];
//    
//    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
//    
//    self.window.rootViewController = navc;
    [self gomainvc];
    
    [self.window makeKeyAndVisible];
}




- (void)gomainvc
{
    [self checkLogin:^(BOOL completion) {
        
    }];
}

- (void)checkLogin:(void(^)(BOOL completion))completion
{
    [self checkToken:^(BOOL completetion) {
        
        completion(completetion);
        
        if (completetion)
        {
            [self resetRootControllerWithVCName:@"HHMainController"];
        }
        else
        {
            [self resetRootControllerWithVCName:@"YDLoginController"];
        }
        
        self.window.rootViewController = self.navController;
    }];
}

- (void)checkToken:(void(^)(BOOL completion))completion
{
    //从本地获取token
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud objectForKey:@"token"];
    
    if (token.length > 0)
    {
        completion(YES);
    }
    else
    {
        completion(NO);
    }
}

- (void)resetRootControllerWithVCName:(NSString *)vcName
{
    YDBaseVCInfo *info = [YDBaseVCInfo infoWithVcName:vcName withXib:NO];
    
    YDBaseController *basevc = [YDBaseController vcWithVcinfo:info];
    
    if (self.navController == nil)
    {
        self.navController = [[UINavigationController alloc] initWithRootViewController:basevc];
        [self.navController setNavigationBarHidden:NO];
    }
    else
    {
        for (UIViewController *vc in self.navController.viewControllers)
        {
            [vc removeFromParentViewController];
        }
        
        [self.navController setViewControllers:@[basevc] animated:YES];
    }
}


















@end








