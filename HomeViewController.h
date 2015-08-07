//
//  HomeViewController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Urls.h"
#import "JsonUtils.h"
#import "AutoScrollView.h"
#import "ConsultCell.h"
#import "HeadCell.h"
#import "AFNetWorkTool.h"
#import "HomeTeacherViewCell.h"

///首页代理
@protocol HomeDelagate <NSObject>

@required

@optional
///点击学习，音乐，体育
-(void)selectedWithItem:(NSString *)cId stringWithContent:(NSString *)content;

@end

@interface HomeViewController : UITableViewController

@property(nonatomic,strong)id<HomeDelagate> delegate;

@end
