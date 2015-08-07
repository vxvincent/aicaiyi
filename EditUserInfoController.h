//
//  EditUserInfoController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/19.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseNameController.h"
#import "CourseCategory.h"

@interface EditUserInfoController : UITableViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(strong,nonatomic)UIImage *photoImage;
@property(strong,nonatomic)NSMutableDictionary *filepaths;
@property(strong,nonatomic)NSMutableDictionary *paramtes;

@end
