//
//  UIColor+Extend.m
//  LDCalendarView
//
//  Created by lidi on 15/9/22.
//  Copyright © 2015年 lidi. All rights reserved.
//

#import "UIColor+Extend.h"

@implementation UIColor (Extend)
+ (UIColor *)hexColorWithString:(NSString *)string
{
    return [UIColor hexColorWithString:string alpha:1.0];
}

+ (UIColor *)hexColorWithString:(NSString *)string alpha:(float) alpha
{
    //检查字符串是不是以#开头
    if ([string hasPrefix:@"#"]) {
        //substringToIndex表示从第一个字符串开始截取，到指定长度位置，但是不包括该指定位置位置字符串
        string = [string substringFromIndex:1];
    }
    
    //去除特殊字符串  NSCharacterSet  去掉两端的空格
    NSString *pureHexString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];//返回转换成大写字符串
    
    if ([pureHexString length] != 6) {
        return [UIColor whiteColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    //截取字符串
    NSString *rString = [pureHexString substringWithRange:range];
    
    range.location += range.length ;
    NSString *gString = [pureHexString substringWithRange:range];
    
    range.location += range.length ;
    NSString *bString = [pureHexString substringWithRange:range];
    
    unsigned int r, g, b;
    
    //把你指定的range的子串取出来（应该是16进制格式的），转成10进制整数存到red变量里。 
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0)
                           green:((float) g / 255.0)
                            blue:((float) b / 255.0)
                           alpha:alpha];
}
@end
