//
//  YDBaseController.m
//  Bulletin
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "YDBaseController.h"


@interface YDBaseVCInfo ()
@end

@implementation YDBaseVCInfo
@synthesize vcName = _vcName;
@synthesize contentObj = _contentObj;
@synthesize withXib = _withXib;
@synthesize doNotTrack = _doNotTrack;
@synthesize statusObj = _statusObj;

+ (id)infoWithVCName:(NSString *)name contentObj:(id)cObj hasXib:(BOOL)show
{
    return [self infoWithVCName:name contentObj:cObj statusObj:nil hasXib:show];
}
+ (id)infoWithVCName:(NSString *)name contentObj:(id)cObj statusObj:(id)sObj hasXib:(BOOL)show
{
    YDBaseVCInfo * info = [[self alloc] init];
    info.vcName = name;
    info.contentObj = cObj;
    info.withXib = show;
    info.statusObj = sObj;
    info.doNotTrack = NO;
    return info;
    
}
+ (id)infoWithVcName:(NSString *)name withXib:(BOOL)show
{
    return [self infoWithVCName:name contentObj:nil hasXib:show];
}
@end


//*******************************/
@interface YDBaseController ()

@end

@implementation YDBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"------内存xxx---------");
}



//******************  **************************/

+ (id)vcWithVcinfo:(YDBaseVCInfo *)vcInfo
{
    Class vc = NSClassFromString(vcInfo.vcName);
    return [[vc alloc] initWithVcinfo:vcInfo];
}

- (id)initWithVcinfo:(YDBaseVCInfo *)vcInfo
{
    NSString *xib_name = nil;
    NSString *strLastName = nil;
    
    //    if (IS_IPHONE5) {
    //        strLastName = @"_iPhone5";
    //    }else {
    //        strLastName = @"_Normal";
    //    }
    //strLastName = @"_iPad";
    
    if (vcInfo.withXib && strLastName.length > 0)
    {
        xib_name = [vcInfo.vcName stringByAppendingString:strLastName];
    }
    else
    {
        xib_name = vcInfo.vcName;
    }
    
    //self = [super init];
    self = [super initWithNibName:xib_name bundle:nil];
    
    if (self)
    {
        self.info = vcInfo;
    }
    return self;
}











- (void)dealloc
{
    NSLog(@"----释放-----");
}



@end





















