//
//  ImageLoad.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"
@interface ImageLoad : NSObject

+(void)imageLoadWithImage:(UIImageView *)imageV withUrl:(NSString *) url;

@end
