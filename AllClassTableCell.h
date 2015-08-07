//
//  AllClassTableCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/15.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AllClassTabelDelegate <NSObject>

-(void)setSelectedAllClass:(NSIndexPath *)indexPath result:(NSString *)result;

@end

@interface AllClassTableCell : UITableViewCell

+(CGFloat) getHeight;

@property(nonatomic,strong)id<AllClassTabelDelegate> allClassTabelDelegate;
-(void)setIsGroup:(Boolean) isGroup;
@end
