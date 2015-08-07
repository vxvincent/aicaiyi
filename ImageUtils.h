//
//  ImageUtils.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/6.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtils : NSObject
///保存图片，并返回路径
+(NSString *)saveImage:(UIImage *)image withName:(NSString *)name;

@end
