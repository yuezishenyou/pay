//
//  YDLoginController.m
//  Bulletin
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "YDLoginController.h"
#import "UIViewController+DismissKeyboard.h"
#import "KeyboardManager.h"
#import "AppDelegate.h"
#import "HHAlertView.h"
#import "YDNetworking.h"
#import "DejActivityView.h"



@interface YDLoginController ()<KeyboardManagerDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *telTextField;

@property (weak, nonatomic) IBOutlet UITextField *passTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (nonatomic, assign) CGFloat bottomStance;
@property (nonatomic, assign) CGFloat keyboardHeight;





@end

@implementation YDLoginController


-(void)loadView
{
    [super loadView];
    self.view.frame = [[UIScreen mainScreen]bounds];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    [self keyboard];
   
    
    
   [self initSubViews];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"忘记" style:UIBarButtonItemStyleDone target:self action:@selector(forgetAction)];
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [HHAlertView alertWithTitle:@"标题" message:@"这是个弹框" cancel:@"取消" sure:@"确定" handle:^(NSInteger index) {
//        
//        NSLog(@"---abc----");
//        
//    }];
//}










//************************ delegate *****************************/
- (void)keyboardManager:(KeyboardManager *)keyboardManager bottomStance:(CGFloat)bottomStance keyboardHeight:(CGFloat)keyboardHeight
{
    self.bottomStance = bottomStance;
    self.keyboardHeight = keyboardHeight;
    [UIView animateWithDuration:0.0 animations:^{
        [self viewDidLayoutSubviews];
    }];
}




















//************************ methods *****************************/

- (void)keyboard
{
    KeyboardManager *manager = [KeyboardManager manager];
    manager.bgView = self.bgView;
    manager.distance = 100;
    manager.delegate = self;
    [manager start];
}

- (void)forgetAction
{
//    YDBaseVCInfo *info = [YDBaseVCInfo infoWithVcName:@"YDForgetController" withXib:NO];
//    YDBaseController *basevc = [YDBaseController vcWithVcinfo:info];
//    YDForgetController *vc = (YDForgetController *)basevc;
//    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)loginBtnAction:(id)sender
{
    NSString *user = @"17502118161";
    NSString *pass = @"111111";
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         @"2004",@"sid",
                         user,@"mno",
                         pass,@"pwd",
                         @"2",@"userType",
                         @"FFFFFFFFFF",@"imei",
                         @"utf-8",@"encode", nil];
    

    
    [DejActivityView activityViewForView:self.view withError:@"数据加载"];
    
    [YDNetworking postGetUserLoginInfoWithDictionary:dic completion:^(LoginModel *model, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [DejActivityView removeView];
        });
        
        if (error == nil)
        {
            NSString *token = model.data.token;
            
            NSLog(@"-----token:%@------",token);
            
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            [ud setObject:token forKey:@"mtoken"];
            [ud synchronize];
            AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [app resetRootControllerWithVCName:@"HHMainController"];
            
        }
        else
        {
            //NSLog(@"-----error:%@------",error);
        }
    }];
}























//************************ UI *****************************/

- (void)initSubViews
{
    self.telTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passTextField.secureTextEntry = YES;
    
    self.loginBtn.layer.cornerRadius = 3;
    self.loginBtn.layer.masksToBounds = YES;
    

}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    if (self.bottomStance <  self.keyboardHeight)
    {
        CGFloat offset  = ABS(self.keyboardHeight - self.bottomStance);
        CGRect rect = self.bgView.frame;
        rect.origin.y = -offset;
        self.bgView.frame = rect;
    }
    else
    {
        self.bgView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    }
}










@end














