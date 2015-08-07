//
//  HUDUtils.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "HUDUtils.h"

@implementation HUDUtils

+(MBProgressHUD *)createHUD
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:window];
    HUD.detailsLabelFont = [UIFont boldSystemFontOfSize:16];
    [window addSubview:HUD];
    [HUD show:YES];

    return HUD;
}
+(void)showImageRHUD:(NSString *)title
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:window];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right"]];
    HUD.labelText = title;
    [HUD hide:YES afterDelay:1];
}

+(void)showImageWHUD:(NSString *)title
{
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:window];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
    HUD.labelText = title;
    [HUD hide:YES afterDelay:1];

}

+(void)showHUDWithTitle:(NSString *)title withView:(UIView *)view
{
   
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:1];

}
@end
