//
//  UIImage+Circle.h
//  MapLearn
//
//  Created by kingcodexl on 15/9/9.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Circle)


+ (instancetype)circleImageWithName:(NSString *)name;

/**
 *  处理图片圆角,高效画圆，比用layer的属性更为高效
 *
 *  @param image       需要圆角化的图片
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *
 *  @return 圆角图片
 */
+ (instancetype)circleImageWithImage:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  将颜色转换为对应的图片，并制定转换后图片的frame
 *
 *  @param color 图片颜色
 *  @param frame frame
 *
 *  @return 颜色图片
 */
+ (instancetype)imageWithColor:(UIColor *)color frame:(CGRect)frame;
@end
