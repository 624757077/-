//
//  TemperatureModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TemperatureModel.h"

@implementation TemperatureModel

@end
@implementation TemperatureResultModel

+ (NSDictionary *)objectClassInArray{
    return @{@"future" : [TemperatureResultFutureModel class]};
}

@end


@implementation TemperatureResultSkModel

@end


@implementation TemperatureResultTodayModel

@end


@implementation TemperatureResultTodayWeatherIdModel

@end


@implementation TemperatureResultFutureModel

@end


@implementation TemperatureResultFutureWeatherIdModel

@end


