//
//  GroupViewController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"
#import "ShowCell.h"
#import "AFNetWorkTool.h"
#import "JsonUtils.h"
#import "SkillShow.h"

@interface GroupViewController : UIViewController<UIScrollViewDelegate,PSCollectionViewDataSource,PSCollectionViewDelegate>


@property(strong,nonatomic) NSMutableArray *shows;
@property(strong,nonatomic) PSCollectionView *collectionView;
@property(strong,nonatomic) UITableView *tableView;


@end
