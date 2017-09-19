//
//  HHMainController.m
//  Pay
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHMainController.h"
#import "HHChatController.h"
#import "HHAlipayController.h"

@interface HHMainController ()

@end

@implementation HHMainController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initSubViews];
    
    
}


- (void)initSubViews
{
    
    
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(10, 100, 100, 40);
    
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"微信" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    //
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn2.frame = CGRectMake(10, 240, 100, 40);
    
    btn2.backgroundColor = [UIColor redColor];
    
    [btn2 addTarget:self action:@selector(btnAction2) forControlEvents:UIControlEventTouchUpInside];
    
    [btn2 setTitle:@"支付宝" forState:UIControlStateNormal];
    
    [self.view addSubview:btn2];
    
    
}


- (void)btnAction
{
    HHChatController *vc = [[HHChatController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)btnAction2
{
    HHAlipayController *vc = [[HHAlipayController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}





@end







