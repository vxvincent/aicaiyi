//
//  RegisterController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "RegisterController.h"
#import "HUDUtils.h"
#import "AFNetWorkTool.h"
#import "Urls.h"
#import "StringUtils.h"
#import "JsonUtils.h"
#import "MainTabBar.h"
#import "Config.h"

@interface RegisterController ()
@property(nonatomic,strong) MBProgressHUD *HUD;
@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registAction:(id)sender {
    if (_phoneField.text.length == 0) {
        [HUDUtils showHUDWithTitle:@"请填写手机号码" withView:self.navigationController.view];
        return ;
    }
    if (_passwordField.text.length == 0 || _rePassordField.text.length == 0) {
        [HUDUtils showHUDWithTitle:@"请填写密码" withView:self.navigationController.view];
        return ;
    }
    if(![_passwordField.text isEqualToString:_rePassordField.text]){
        [HUDUtils showHUDWithTitle:@"两次输入密码不一致" withView:self.navigationController.view];
        return ;
    }
    [self registHttp:[NSString stringWithFormat:@"%@%@&phone=%@&password=%@",BASE_URL,REGISTER,_phoneField.text,[StringUtils md5:_passwordField.text]]];
}

///注册
-(void)registHttp:(NSString *)url
{
    _HUD = [HUDUtils createHUD];
    _HUD.labelText = @"正在注册";
    [AFNetWorkTool HtmlWithGetUrl:url success:^(NSDictionary *dic) {
        _HUD.labelText = @"登录中";
        [self loginHttp:[NSString stringWithFormat:@"%@%@&login_name=%@&login_password=%@",BASE_URL,LOGIN,_phoneField.text,[StringUtils md5:_passwordField.text]]];
    } fail:^(NSString *message) {
        [_HUD hide:YES];
        [HUDUtils showHUDWithTitle:message withView:self.navigationController.view];
    } error:^(NSError *e) {
        [HUDUtils showHUDWithTitle:@"请检查网络设置是否正常" withView:self.navigationController.view];
    }];
}

-(void)loginHttp:(NSString *)url
{
    [AFNetWorkTool HtmlWithGetUrl:url success:^(NSDictionary *dic) {
        [_HUD hide:YES afterDelay:1];
        [Config getInstance].isLogin = YES;
        self.view.window.rootViewController = [MainTabBar new];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } fail:^(NSString *message) {
        [_HUD hide:YES];
        [HUDUtils showHUDWithTitle:message withView:self.navigationController.view];
    } error:^(NSError *e) {
        [_HUD hide:YES];
        [HUDUtils showHUDWithTitle:@"请检查网络设置是否正常" withView:self.navigationController.view];
    }];
}

@end
