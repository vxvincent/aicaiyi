//
//  CourseTimeController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseTimeController.h"

@interface CourseTimeController ()

@end

@implementation CourseTimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _data = @[@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",
              @"11",@"12",@"13",@"14",@"15",@"16",@"17",
              @"18",@"19",@"20",@"21",@"22"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)addCourseTimeBlcok:(CourseTimeBlock)blcok
{
    _block = blcok;
}

- (IBAction)doneAction:(id)sender {
    _block(_time);
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - pickView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 1) {
        return 1;
    } else {
        return _data.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 1) {
        return @"时";
    } else {
        return _data[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _time = _data[row];
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
