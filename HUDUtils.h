//
//  HUDUtils.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUDUtils.h"
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface HUDUtils : NSObject

///创建HUD对象
+(MBProgressHUD *)createHUD;
///创建HUD-正确提示
+(void)showImageRHUD:(NSString *)title;
///创建HUD-错误提示
+(void)showImageWHUD:(NSString *)title;
///创建提示
+(void)showHUDWithTitle:(NSString *)title withView:(UIView *)view;
@end
