//
//  YPTabBarController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YPTabBarController.h"



@implementation YPTabBarController

//第一次使用这个或者这个的子类时，自动执行
+(void)initialize
{
    if (self == [YPTabBarController class]) {
        UITabBar *tabBar = [UITabBar appearance];
        [tabBar setBackgroundImage:[UIImage imageNamed:@"navibg"]];
        
        //获取UITabBarItem的风格
        UITabBarItem *barItem = [UITabBarItem appearance];
        //设置item中文字的位置
        [barItem setTitlePositionAdjustment:UIOffsetMake(0, -15)];
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = [UIColor colorWithRed:128 green:128 blue:128 alpha:1.0];
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        [barItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
        
        //设置Item中文字被选中是的样式
        NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
        selectedAttrbiutes[NSForegroundColorAttributeName] = [UIColor colorWithRed:200 green:150 blue:0                                  alpha:1.0];
        selectedAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        [barItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
        
    }
 
}

@end
