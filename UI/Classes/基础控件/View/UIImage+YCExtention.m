//
//  UIImage+YCExtention.m
//  UI
//
//  Created by release on 2020/7/29.
//  Copyright © 2020 Mr. release. All rights reserved.
//

/**
 图片拉伸问题
 */

#import "UIImage+YCExtention.h"

@implementation UIImage (YCExtention)

+ (instancetype)resizableImageWithLocalImageName:(NSString *)localImageName{
    UIImage *image = [UIImage imageNamed:localImageName];
    
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    return [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
}

@end
