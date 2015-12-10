//
//  TemperatureViewModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface TemperatureViewModel : BaseViewModel

@property (nonatomic)NSInteger rowNumber;
@property (nonatomic,strong)NSString *cityname;
@property (nonatomic)NSInteger start;
@property (nonatomic,strong)NSString *reason;


//获取当前温度的信息
/**当前温度*/
-(NSString *)temp;
/**当前风向*/
-(NSString *)windDirection;
/**当前风力*/
-(NSString *)windStrength;
/**当前湿度*/
-(NSString *)humidity;
/**更新时间*/
-(NSString *)time;
/**获取当前城市*/
-(NSString *)city;

//获取当日温度的信息
/**温度范围*/
-(NSString *)temperature;
-(NSString *)weather;
-(NSString *)travelIndex;
-(NSString *)uvIndex;
-(NSString *)dressing;
-(NSString *)dressingAdvice;

//获取未来几天的天气情况
//星期几
-(NSString *)weekForRow:(NSInteger)row;
//温度
-(NSString *)temperatureForRow:(NSInteger)row;
//天气情况
-(NSString *)weatherForRow:(NSInteger)row;
//日期
-(NSString *)dateForRow:(NSInteger)row;


@end
