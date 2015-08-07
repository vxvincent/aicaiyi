//
//  LoginController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUDUtils.h"
#import "MBProgressHUD.h"
#import "AFNetWorkTool.h"
@protocol LoginDelegate <NSObject>

@required

@optional
///是否登录
-(void)loginWithIslogin:(BOOL)isLogin;

@end

@interface LoginController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property(nonatomic,strong)id<LoginDelegate> delegate;

@end
