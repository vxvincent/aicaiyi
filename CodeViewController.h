//
//  CodeViewController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/17.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BinRegisterButton.h"

@interface CodeViewController : UIViewController
@property (weak, nonatomic) IBOutlet BinRegisterButton *codeButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end
