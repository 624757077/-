//
//  TemperatureNetManager.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TemperatureNetManager.h"

@implementation TemperatureNetManager

+(id)getTemperatureWithCityName:(NSString *)cityName completionHandle:(void (^)(TemperatureModel *, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://v.juhe.cn/weather/index?format=2&cityname=%@&key=%@",cityName,kTempKey];
    
    path = [self percentPathWithPath:path params:nil];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
      completionHandle([TemperatureModel objectWithKeyValues:responseObj],error);
        
    }];
    
}

@end
