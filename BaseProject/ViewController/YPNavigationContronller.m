//
//  YPNavigationContronller.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YPNavigationContronller.h"

@implementation YPNavigationContronller

//第一次使用这个类或者这个子类时，自动执行
+(void)initialize
{
    if (self == [YPNavigationContronller class]) {
        UINavigationBar *bar = [UINavigationBar appearance];
        [bar setBackgroundImage:[UIImage imageNamed:@"1"] forBarMetrics:UIBarMetricsDefault];
    }
    
    

}

@end
