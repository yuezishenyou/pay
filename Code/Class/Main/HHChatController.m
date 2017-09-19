//
//  HHChatController.m
//  Pay
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHChatController.h"
#import "WXApi.h"
#import <CommonCrypto/CommonDigest.h>
#import "YDNetworking.h"
#import "DejActivityView.h"
#import "YDNetWork.h"





#define WXAPP_KEY  @"wx263ec5e1bf81b161"

@interface HHChatController ()

@end

@implementation HHChatController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.title = @"微信";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //http://www.jianshu.com/p/1c1c834b6d52
    //http://www.jianshu.com/p/94dcc220b2aa
    
    [self initSubViews];
    
    
    
}

- (void)initSubViews
{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(100, 100, 100, 40);
    
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(wxpaybybackground) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"微信后台" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn2.frame = CGRectMake(100, 260, 100, 40);
    
    btn2.backgroundColor = [UIColor redColor];
    
    [btn2 addTarget:self action:@selector(wxpaybyforeground) forControlEvents:UIControlEventTouchUpInside];
    
    [btn2 setTitle:@"微信前台" forState:UIControlStateNormal];
    
    [self.view addSubview:btn2];
    
}


//微信支付，通过后台
- (void)wxpaybybackground
{
    [self WXPay];
}


- (void)wxpaybyforeground
{
    //    appid = wx263ec5e1bf81b161;
    //    noncestr = a58337d1b8c98bf3225186673be3407b;
    //    package = "Sign=WXPay";
    //    partnerid = 1346511701;
    //    prepayid = wx20170919131839ba90ee99050348635981;
    //    sign = 4D15215BECED01B90424D729987C9909;
    //    timestamp = 1505798319;
    
    [self WXPay_Fore];
    

}












#pragma mark ----微信支付方法
- (void)WXPay_Fore
{
    //在前台
    NSString *appid,*mch_id,*nonce_str,*sign,*body,*out_trade_no,*total_fee,*spbill_create_ip,*notify_url,*trade_type,*partner;
    
    appid = WXAPP_KEY;
    
    //微信支付商号
    mch_id = @"";
    
    //随机字符串
    nonce_str = @"";
    
    body = @"微信支付的时候看到的支付信息";
    
    //订单号
    out_trade_no = @"1001";
    
    //交易价格1表示0.01元  10表示0.1元
    total_fee = @"1";
    
    spbill_create_ip = @"114.125.4.8";
    
    notify_url =@"www.yuedao.com";
    
    trade_type = @"APP";
    
    //商户秘钥
    partner = @"";
    
    //sigin签名
    sign = @"";
    
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:appid forKey:@"appid"];
    [dict setValue:mch_id forKey:@"mch_id"];
    [dict setValue:nonce_str forKey:@"nonce_str"];
    [dict setValue:sign forKey:@"sign"];
    [dict setValue:body forKey:@"body"];
    [dict setValue:out_trade_no forKey:@"out_trade_no"];
    [dict setValue:total_fee forKey:@"total_fee"];
    [dict setValue:spbill_create_ip forKey:@"spbill_create_ip"];
    [dict setValue:notify_url forKey:@"notify_url"];
    [dict setValue:trade_type forKey:@"trade_type"];

    
    
    
    [YDNetWork POST:@"https://api.mch.weixin.qq.com/pay/unifiedorder" parameters:dict success:^(id responseBody) {
        
        NSLog(@"-----res:%@-----",responseBody);
//        if (@"success")
//        {
//            PayReq *request = [[PayReq alloc] init];
//            request.openID = [dic objectForKey:@"appid"];
//            request.partnerId = [dic objectForKey:@"mch_id"];
//            request.prepayId= [dic objectForKey:@"prepay_id"];
//            request.package = @"Sign=WXPay";
//            request.nonceStr= [dic objectForKey:@"nonce_str"];
//            //将当前事件转化成时间戳
//            NSDate *datenow = [NSDate date];
//            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
//            UInt32 timeStamp =[timeSp intValue];
//            request.timeStamp= timeStamp;
//            // 签名加密
//            
//            //DataMD5 *md5 = [[DataMD5 alloc] init];
//            
//            //request.sign= [md5 createMD5SingForPay:request.openID partnerid:request.partnerId prepayid:request.prepayId package:request.package noncestr:request.nonceStr timestamp:request.timeStamp];
//            // 调用微信
//            [WXApi sendReq:request];
//            
//        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"-----error:%@-----",error);
        
    }];
    
    
}



- (void)WXPay
{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud objectForKey:@"mtoken"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         @"3014",@"sid",
                         token,@"token",
                         @"84985",@"orderId",
                         @"utf-8",@"encode", nil];
    
    
    [DejActivityView activityViewForView:self.view];
    [YDNetworking postGetWeixAgrumentsWithDictionary:dic completion:^(WXPayModel *model, NSError *error) {
        [DejActivityView removeViewAnimated:YES];
        
        if (!error)
        {
            if ([model.status.code isEqualToString:@"0"])
            {
                PayReq *request = [[PayReq alloc] init];
                request.nonceStr= model.data.noncestr;
                request.package = model.data.package;
                request.prepayId= model.data.prepayid;
                request.partnerId = model.data.partnerid;
                request.timeStamp = [model.data.timestamp intValue];
                request.sign= model.data.sign;
                
                [WXApi sendReq:request];
            }
        }
        else
        {
            
        }
    }];
}











@end



//    //需要创建这个支付对象
//    PayReq *req = [[PayReq alloc]init];
//
//    //由用户微信号和AppID组成的唯一标识，用于校验微信用户
//    req.openID = WXAPP_KEY;
//
//    // 商家id，在注册的时候给的
//    req.partnerId = @"10000100";
//
//    // 预支付订单这个是后台跟微信服务器交互后，微信服务器传给你们服务器的，你们服务器再传给你
//    req.prepayId = @"wx20160218122935e3753eda1f0066087993";
//
//    // 根据财付通文档填写的数据和签名
//    //这个比较特殊，是固定的，只能是即req.package = Sign=WXPay
//    req.package   = @"Sign=WXPay";
//
//    // 随机编码，为了防止重复的，在后台生成
//    req.nonceStr  = @"d1e6ecd5993ad2d06a9f50da607c971c";
//
//    // 这个是时间戳，也是在后台生成的，为了验证支付的
//    NSString * stamp = @"1455769775";
//    req.timeStamp = stamp.intValue;
//
//    // 这个签名也是后台做的
//    req.sign = @"F6DEE4ADD82217782919A1696500AF06";
//
//    //发送请求到微信，等待微信返回onResp
//    [WXApi sendReq:req];










