//
//  CourseAddressController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseAddressController.h"
#import "HUDUtils.h"

@interface CourseAddressController ()

@end

@implementation CourseAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"上课地址";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)addCourseAddressBlock:(CourseAddressBlock)block
{
    _block = block;
}

- (IBAction)doneAction:(id)sender {
    if (_addressField.text.length == 0) {
        [HUDUtils showHUDWithTitle:@"请输入上课地址" withView:self.navigationController.view];
        return ;
    }
    _block(_addressField.text);
    [self.navigationController popViewControllerAnimated:YES];
}


@end
