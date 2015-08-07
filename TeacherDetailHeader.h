//
//  TeacherDetailHeader.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherDetailHeader.h"
#import "ARSegmentPageControllerHeaderProtocol.h"

@interface TeacherDetailHeader : UIView<ARSegmentPageControllerHeaderProtocol>


@property (assign,nonatomic) CGFloat height;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *photoImage;
@property (nonatomic, strong) UILabel *starLabel;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *vipImage;
@property (nonatomic, strong) UILabel *identifiLabel;
@property (nonatomic, strong) UILabel *acceptLabel;
@end
