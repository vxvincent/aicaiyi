//
//  CategoryController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/23.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CategoryBlock)(NSString *couclassid,NSString *firstname,NSString *thirdname);

@interface CategoryController : UIViewController
{
    CategoryBlock _categoryBlock;
}

@property(strong,nonatomic) UITableView *firstTable;
@property(strong,nonatomic) UITableView *secondTable;
@property(strong,nonatomic) UITableView *thirdTable;
@property(strong,nonatomic) NSMutableArray *firstArray;
@property(strong,nonatomic) NSMutableArray *secondArray;
@property(strong,nonatomic) NSMutableArray *thirdArray;

-(void)addCategoryBlock:(CategoryBlock) block;
@end
