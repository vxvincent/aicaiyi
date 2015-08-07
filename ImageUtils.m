//
//  ImageUtils.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/6.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "ImageUtils.h"

@implementation ImageUtils

+(NSString *)saveImage:(UIImage *)image withName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(image);
    NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* totalPath = [documentPath stringByAppendingPathComponent:imageName];
    
    //保存到 document
    [imageData writeToFile:totalPath atomically:NO];
    return totalPath;
}
@end
