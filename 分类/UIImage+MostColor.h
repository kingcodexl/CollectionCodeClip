//
//  UIImage+MostColor.h
//  weixinDemo
//
//  Created by kingcode on 15/10/7.
//  Copyright © 2015年 leadingwinner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MostColor)
/**
 *  获取Image中最多的颜色，可用于设置主题颜色等
 *
 *  @return 主要颜色
 */
-(UIColor*)mostColor;

@end
