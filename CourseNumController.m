
//
//  CourseNumController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseNumController.h"

@interface CourseNumController ()

@end

@implementation CourseNumController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _data = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",
              @"11",@"12",@"13",@"14",@"15",@"16",@"17",
              @"18",@"19",@"20",@"21",@"22"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneAction:(id)sender {
    _block(_num);
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)addCourseNumBlcok:(CourseNumBlock)blcok
{
       _block = blcok;
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
        return @"人";
    } else {
        return _data[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _num = _data[row];
}



@end
