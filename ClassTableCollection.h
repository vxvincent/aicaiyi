//
//  ClassTableCollection.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/15.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassTabelDelegate <NSObject>

-(void)setSelectedClass:(NSIndexPath *)indexPath result:(NSString *) result;

@end

@interface ClassTableCollection : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(assign,nonatomic) CGFloat width;
@property(assign,nonatomic) CGFloat height;
@property(assign,nonatomic) CGFloat top;
@property(assign,nonatomic) CGFloat bottom;
@property(assign,nonatomic) CGFloat left;
@property(assign,nonatomic) CGFloat right;
@property(strong,nonatomic) NSMutableArray *data;
@property(assign,nonatomic) Boolean isGroup;
-(CGFloat)getHeight;
@property(nonatomic,strong)id<ClassTabelDelegate> classTabelDelegate;
-(void)initDataWithArray:(NSMutableArray *)data;
@end
