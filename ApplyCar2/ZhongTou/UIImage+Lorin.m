//
//  UIImage+Lorin.m
//  PicWithText
//
//  Created by Lorin on 14/11/9.
//  Copyright (c) 2014年 Lighting-Vista. All rights reserved.
//

#import "UIImage+Lorin.h"

@implementation UIImage (Lorin)

#pragma mark - 图片加文字
/*
 注释：在调用完该方法后会返回一张新的图片，这张图片就已经和将文字合成在上面了，而非是在图片上添加label
 */

#pragma mark - 图片加上文字
+ (UIImage *)imageWithStringWaterMark:(NSString *)markString time:(NSString *)time atImage:(UIImage *)image
{
        
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width , image.size.height * 1), NO, 0.0);
    
    // 原图
    [image drawInRect: CGRectMake(0, 0, image.size.width, image.size.height)];
    // 文字颜色
    [[UIColor redColor] set];
    // 文字字体
    UIFont *font;

    font = [UIFont boldSystemFontOfSize: 14];

    // 文字位置
    CGPoint point = CGPointMake(image.size.width * 0.7, image.size.height * 0.75);
    // 水印文字
    [time drawAtPoint: point withAttributes: @{NSFontAttributeName:font,NSUnderlineColorAttributeName:[UIColor redColor],NSStrokeColorAttributeName:[UIColor redColor],NSForegroundColorAttributeName:[UIColor redColor]}
     ];
    
    CGPoint point2 = CGPointMake(image.size.width * 0.55, image.size.height * 0.8);
    // 水印文字
    [markString drawAtPoint: point2 withAttributes: @{NSFontAttributeName:font,NSUnderlineColorAttributeName:[UIColor redColor],NSStrokeColorAttributeName:[UIColor redColor],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSLog(@"%@",newImage);
    
    return newImage;
}

#pragma mark - 图片上加图片logo
+ (UIImage *)imageWithTransImage:(UIImage *)useImage addtransparentImage:(UIImage *)transparentimg alpha:(CGFloat)alpha
{
    if(useImage.size.width > 1440 || useImage.size.width > 1440) {
        UIGraphicsBeginImageContext(CGSizeMake(useImage.size.width * 0.5, useImage.size.height * 0.5));
        
        [useImage drawInRect: CGRectMake(0, 0, useImage.size.width * 0.5, useImage.size.height * 0.5)];
        [transparentimg drawInRect: CGRectMake(useImage.size.width * 0.6 * 0.5, useImage.size.height * 0.95 * 0.5, useImage.size.width * 0.4 * 0.5, useImage.size.height * 0.05 * 0.5) blendMode: kCGBlendModeDestinationAtop alpha: alpha];
    } else {
        UIGraphicsBeginImageContext(CGSizeMake(useImage.size.width * 0.7, useImage.size.height * 0.7));
        
        [useImage drawInRect: CGRectMake(0, 0, useImage.size.width * 0.7, useImage.size.height * 0.7)];
        [transparentimg drawInRect: CGRectMake(useImage.size.width * 0.6 * 0.7, useImage.size.height * 0.9 * 0.7, useImage.size.width * 0.4 * 0.7, useImage.size.height * 0.1 * 0.7) blendMode: kCGBlendModeOverlay alpha: alpha];
    }
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

#pragma mark - 封装成一个方法，在添加文字时自动加上logo
+ (UIImage *)imageWithLogo:(UIImage *)currentImage time:(NSString *)time Adress:(NSString *)Adress
{
    UIImage *textImage = [UIImage imageWithStringWaterMark: Adress time:time atImage: currentImage];
//    UIImage *resultImage = [UIImage imageWithTransImage: textImage addtransparentImage: logoImage alpha: alpha];
    return textImage;
}



@end
