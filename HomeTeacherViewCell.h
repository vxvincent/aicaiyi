//
//  HomeTeacherViewCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/8/4.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTeacherViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)UICollectionView *collectionView;
+(CGFloat)getHeight;
@end
