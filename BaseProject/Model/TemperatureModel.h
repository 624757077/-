//
//  TemperatureModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TemperatureResultModel,TemperatureResultSkModel,TemperatureResultTodayModel,TemperatureResultTodayWeatherIdModel,TemperatureResultFutureModel,TemperatureResultFutureWeatherIdModel;
@interface TemperatureModel : BaseModel

@property (nonatomic, strong) TemperatureResultModel *result;
@property (nonatomic, copy) NSString *resultcode;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, assign) NSInteger error_code;
@end


@interface TemperatureResultModel : NSObject

@property (nonatomic, strong) TemperatureResultSkModel *sk;
@property (nonatomic, strong) TemperatureResultTodayModel *today;
@property (nonatomic, strong) NSArray<TemperatureResultFutureModel *> *future;
@end


@interface TemperatureResultSkModel : NSObject

@property (nonatomic, copy) NSString *humidity;
@property (nonatomic, copy) NSString *wind_direction;
@property (nonatomic, copy) NSString *temp;
@property (nonatomic, copy) NSString *wind_strength;
@property (nonatomic, copy) NSString *time;
@end

@interface TemperatureResultTodayModel : NSObject

@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *dressing_index;
@property (nonatomic, copy) NSString *dressing_advice;
@property (nonatomic, copy) NSString *uv_index;
@property (nonatomic, copy) NSString *comfort_index;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *date_y;
@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy) NSString *wash_index;
@property (nonatomic, strong) TemperatureResultTodayWeatherIdModel *weather_id;
@property (nonatomic, copy) NSString *travel_index;
@property (nonatomic, copy) NSString *exercise_index;
@property (nonatomic, copy) NSString *drying_index;

@end


@interface TemperatureResultTodayWeatherIdModel : NSObject

@property (nonatomic, copy) NSString *fa;
@property (nonatomic, copy) NSString *fb;
@end

@interface TemperatureResultFutureModel : NSObject
@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, strong) TemperatureResultFutureWeatherIdModel *weather_id;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *weather;

@end

@interface TemperatureResultFutureWeatherIdModel : NSObject

@property (nonatomic, copy) NSString *fa;
@property (nonatomic, copy) NSString *fb;
@end

