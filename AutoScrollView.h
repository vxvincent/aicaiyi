//
//  AutoScrollView.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollView : UIView

///图片数组
@property (nonatomic, strong) NSMutableArray *pics;

///创建view
+(instancetype)createView;

@end
