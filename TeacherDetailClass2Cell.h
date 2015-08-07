//
//  TeacherDetailClass2Cell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassTableCollection.h"



@protocol TeacherDetailClass2CellDelegate <NSObject>

-(void)setSelectedAllClass:(NSIndexPath *)indexPath result:(NSString *)result;

@end


@interface TeacherDetailClass2Cell : UITableViewCell<ClassTabelDelegate>
+(CGFloat) getHeight;
@property(strong,nonatomic)ClassTableCollection *collection;
@property(nonatomic,strong)id<TeacherDetailClass2CellDelegate> allClassTabelDelegate;
-(void)setIsGroup:(Boolean) isGroup;
@end
