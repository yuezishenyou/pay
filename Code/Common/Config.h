//
//  Config.h
//  Bulletin
//
//  Created by maoziyue on 2017/9/13.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//主色
extern NSString * textColor;



@interface Config : NSObject

//将16为颜色值转换为 UIColor
UIColor *getColor(NSString * hexColor);

@end
