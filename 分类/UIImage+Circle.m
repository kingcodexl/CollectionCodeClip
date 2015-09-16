//
//  UIImage+Circle.m
//  MapLearn
//
//  Created by kingcodexl on 15/9/9.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)

+ (instancetype)circleImageWithName:(NSString *)name{
    
    return [self circleImageWithImage:name borderWidth:0.0 borderColor:[UIColor clearColor]];
}

+(instancetype)circleImageWithImage:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)imageWithColor:(UIColor *)color frame:(CGRect)frame{
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0);
    
    //获得当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置颜色
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGRect fillRect = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height);
    //渲染
    CGContextFillRect(ctx, fillRect);
    
    //从上下文中取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
@end

