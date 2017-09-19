//
//  DejAlert.m
//  Bulletin
//
//  Created by maoziyue on 2017/9/14.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "DejAlert.h"

@interface DejAlert ()

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *message;

@property (nonatomic,copy) NSString *cancel;

@property (nonatomic,copy) NSString *sure;

@property (nonatomic,copy) actionHandler handle;


@end

@implementation DejAlert

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel sure:(NSString *)sure handle:(actionHandler)handle
{
    if (self = [super init])
    {
        _title = title;
        _message = message;
        _cancel = cancel;
        _sure = sure;
        _handle = handle;
        [self setup];
    }
    return self;
}

+ (DejAlert *)alertWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel sure:(NSString *)sure handle:(actionHandler)handle
{
    return [[self alloc]initWithTitle:title message:message cancel:cancel sure:sure handle:handle];
}


- (void)setup
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];
    
    if (_cancel.length > 0)
    {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:self.cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (_handle) {
                _handle(0);
            }
        }];
        [alertController addAction:cancelAction];
    }

    if (_sure.length > 0)
    {
        UIAlertAction *suerAction = [UIAlertAction actionWithTitle:self.sure style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (_handle) {
                _handle(1);
            }
        }];
        [alertController addAction:suerAction];
    }
    
    
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
   

}



- (void)dealloc
{
    //NSLog(@"---a;-----");
}


@end










