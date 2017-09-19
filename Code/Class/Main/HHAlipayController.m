//
//  HHAlipayController.m
//  Pay
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHAlipayController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"


#import "YDNetworking.h"


#define PARTNER    @"2088611922925773"
#define SELLER     @"esok@esok.cn"
#define URLSCHEME  @"alisdkpay"

#define PRIVATEKEY  @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANfEOGuHDyStqzetu37gO0Lxy9ucCVpT3t7oao/oYHyeQIhI4sxu7dnTbSdsR3DKglHg+9sNbIvubxxeLPvfjrF/Lvky0sYIGBRYyQXQb+kwOq0dwqHGvqN4FP1EwI69CfQP/a2J/z4D0stF/htv4B24dxag7mxZIKLJJvwstUbnAgMBAAECgYEAtVsDhTXPP6gNqs4HM3xrszgjfiIoJlkqkjfOIclTGEu3uBVzNBvlJdq0+5bicWZ1pTay2ors+qzdjX2G1+ovN2x9ZIZyVDL0P1CqgzwEu7hCIC5I/hlcMIux+h0U93stRxeimdCcbj2hCfzewE77hP4GQ6F4llzgDtvm9X41CYkCQQDy+63bcv7huWydUOuN7ObhOTAjoAe5SxJL89UkFkMGwJYqUm2cRNAkaJ3OPBBBXEeDpBjh323L6g0pUnM6q32lAkEA41NJY+GAXVUAWnAKNJHfXEi3XopnStsPRRL6gRCqTcceWEicq6CtyHEIxJuldiG0AP2u+Fh5faWx4phXKFEkmwJAFdGt2f/ojWJ2M2Y50MPOM7lL7lcHeocYPIPHxvbMzAVtNp2yRA8V1b8jNIrGNuhPb63DojzLAj2hMu25dTJDFQJAFi24CVCk73YtlKU9uadJvX0ytryWG02IDdsuKY1wsCnvIfnjnzMMAXRVwKjW2dGr+DTH717ia4nQ8ySdzEcuZQJAf1aGvpNuRP9Sf043ymPbhBVEb2bji6ltOr9R1VpCuaojP/EAYEAanzHLvcG+kc0QAk57+7hWp3smNQu+aYt1oQ=="






@interface HHAlipayController ()

@end

@implementation HHAlipayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付宝";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**
     * 
     商户ID：partner
     
     账号ID：seller 即支付宝账号
     
     私钥和密钥
     
     只要签约成功，这几个东西都有了
     */

    
    [self initSubViews];
    
}

- (void)initSubViews
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(100, 100, 100, 40);
    
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(alipaybybackground) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"支付宝后台" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
}

- (void)alipaybybackground
{
    
    [self alipay];
    
    
    
}




- (void)alipay
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud objectForKey:@"mtoken"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         @"3012",@"sid",
                         token,@"token",
                         @"84985",@"orderId",
                         @"utf-8",@"encode", nil];
    
    
    [YDNetworking postGetSellerSinginWithDictionary:dic completino:^(AlipayModel *model, NSError *error) {
        if (error == nil)
        {
            if ([model.status.code isEqualToString:@"0"])
            {
                [self alipay_];
            }
        }
        else
        {
            
        }
    }];
}


- (void)alipay_
{
    
    Order *order = [[Order alloc]init];
    order.partner = PARTNER;
    order.sellerID = SELLER;
    order.outTradeNO = @"201607181111";//订单Id
    order.subject = @"悦道用车";
    order.body = @"好评100%,实惠";//商品详情
    order.totalFee = @"0.01";
    order.notifyURL = @"www.baidu.com";//回调本服务器的
    order.service = @"mobile.securitypay.pay";//固定这些
    order.paymentType = @"1";//支付类型
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";//30分钟不购买订单取消
    
    NSString *appScheme = URLSCHEME ;//与info里一致
    NSString *orderSpec = [order description];
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(PRIVATEKEY);
    NSString *signedString = [signer signString:orderSpec];
    
    
    NSString *orderString = nil;
    if (signedString != nil)
    {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",orderSpec, signedString, @"RSA"];
    }
    
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        
        NSLog(@"%@",resultDic);
        
    }];
    
}












@end


















