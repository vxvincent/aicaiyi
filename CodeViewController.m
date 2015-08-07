//
//  CodeViewController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/17.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CodeViewController.h"
#import <SMS_SDK/SMS_SDK.h>
#import <SMS_SDK/CountryAndAreaCode.h>
#import "HUDUtils.h"
#import "RegisterController.h"

@interface CodeViewController ()

@property(strong,nonatomic)  NSTimer *currentTime;
@property(assign,nonatomic)  NSInteger time;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
   
}


-(void)sendVerify
{
    [SMS_SDK getVerificationCodeBySMSWithPhone:@"18516603807"
                                          zone:@"86"
                                        result:^(SMS_SDKError *error)
     {
         if (!error)
         {
             [HUDUtils showHUDWithTitle:@"验证码发送成功" withView:self.navigationController.view];
         }
         else
         {
             UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                           message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                          delegate:self
                                                 cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                 otherButtonTitles:nil, nil];
             [alert show];
         }
         
     }];

}


- (IBAction)showRegister:(id)sender {
//    [self submit];
    [self.navigationController pushViewController:[RegisterController new] animated:YES];
}

///校验验证码
-(void)submit
{
    if(_codeField.text.length!=4)
    {
        
        [HUDUtils showHUDWithTitle:NSLocalizedString(@"codeError", nil) withView:self.navigationController.view];
    }
    else
    {
   
        [SMS_SDK commitVerifyCode:_codeField.text result:^(enum SMS_ResponseState state) {
            if (1==state)
            {
                RegisterController *rc = [RegisterController new];
                rc.phoneField.text = _phoneField.text;
                [self.navigationController pushViewController:[RegisterController new] animated:YES];
                
            }
            else if(0==state)
            {
               [HUDUtils showHUDWithTitle:NSLocalizedString(@"codeError", nil) withView:self.navigationController.view];
            }
        }];
    }
}



- (IBAction)sendVerify:(id)sender {
    BinRegisterButton *button = (BinRegisterButton *)sender;
    if (_phoneField.text.length == 11) {
        button.enabled = NO;
        [sender startWithSecond:60];
        
        [sender didChange:^NSString *(BinRegisterButton *countDownButton,NSInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%ld秒",second];
            return title;
        }];
        [sender didFinished:^NSString *(BinRegisterButton *countDownButton, NSInteger second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
            
        }];
        [self sendVerify];
    } else {
        [HUDUtils showHUDWithTitle:@"请输入手机号码" withView:self.view];
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_codeField resignFirstResponder];
    [_phoneField resignFirstResponder];
}


@end
