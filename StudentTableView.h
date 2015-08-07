//
//  StudentTableView.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StudentTableDelegate <NSObject>

@required

@optional

-(void)showStudentClass;
-(void)showStudentOrder;
-(void)showEditStudentInfo;
@end


@interface StudentTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) id<StudentTableDelegate> studentdelegate;

@end
