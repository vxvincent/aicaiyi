//
//  ImageLoad.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "ImageLoad.h"


@implementation ImageLoad

+(void)imageLoadWithImage:(UIImageView *)imageV withUrl:(NSString *) url
{
    [imageV sd_setImageWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@",PIC_URL,url]]];
}
@end
