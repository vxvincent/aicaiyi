//
//  CourseNameController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseNameController.h"
#import "HUDUtils.h"

@interface CourseNameController ()

@end

@implementation CourseNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addCourseNameBlock:(CourseNameBlock)block
{
    _courseNameBlock = block;
}

- (IBAction)okAction:(id)sender {
    if (_nameField.text.length == 0) {
        [HUDUtils showHUDWithTitle:@"请输入课程名" withView:self.navigationController.view];
        return ;
    }
     _courseNameBlock(_nameField.text);
    [self.navigationController popViewControllerAnimated:YES];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
