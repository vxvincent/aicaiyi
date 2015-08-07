//
//  LoginController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "LoginController.h"
#import "CodeViewController.h"
#import "Config.h"
#import "User.h"
#import "Urls.h"
#import "StringUtils.h"

@interface LoginController ()
@property(strong,nonatomic) MBProgressHUD *HUD;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showRegister:(id)sender {
//    RegisterController *registC = [[RegisterController alloc]init];
//    [self.navigationController pushViewController:registC animated:YES];
    CodeViewController *code = [[CodeViewController alloc] init];
    [self.navigationController pushViewController:code animated:YES];
    
}

-(void)setNavigation{
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = back;
}

//back
-(void)back:(id)sender
{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate loginWithIslogin:NO];
}

- (IBAction)loginAction:(id)sender {
    
    if (_phoneField.text.length == 0) {
        [HUDUtils showHUDWithTitle:@"请输入手机号" withView:self.navigationController.view];
        return ;
    }
    if (_passwordField.text.length == 0) {
        [HUDUtils showHUDWithTitle:@"请输入密码" withView:self.navigationController.view];
        return ;
    }
    [self loginHttp:[NSString stringWithFormat:@"%@%@&login_name=%@&login_password=%@",BASE_URL,LOGIN,_phoneField.text,[StringUtils md5:_passwordField.text]]];
  
}

#pragma mark - 登录线程
-(void)loginHttp:(NSString *)url
{
     _HUD = [HUDUtils createHUD];
    _HUD.labelText = @"登录中";
    [AFNetWorkTool LoginHttp:url success:^(NSDictionary *dic) {
        [_HUD hide:YES afterDelay:1];
        [Config getInstance].isLogin = YES;
        User *user = [[User alloc] initWithDictionary:dic
    withPassword:_passwordField.text];
        [Config saveLoginUserInfo:user];
        [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
    } fail:^(NSString *message) {
        [_HUD hide:YES];
        [HUDUtils showHUDWithTitle:message withView:self.navigationController.view];
    } error:^(NSError *e) {
        [_HUD hide:YES];
        [HUDUtils showHUDWithTitle:@"请检查网络设置是否正常" withView:self.navigationController.view];
    }];
}


@end
