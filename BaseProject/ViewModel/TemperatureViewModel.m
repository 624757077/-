//
//  TemperatureViewModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TemperatureViewModel.h"
#import "TemperatureNetManager.h"
#import "TemperatureModel.h"

@interface TemperatureViewModel ()

@property (nonatomic,strong)TemperatureResultSkModel *tempSK;
@property (nonatomic,strong)TemperatureResultTodayModel *tempToday;

@end


@implementation TemperatureViewModel

-(TemperatureResultSkModel *)tempSK
{
    if (!_tempSK) {
        _tempSK = [[TemperatureResultSkModel alloc]init];
    }
    return _tempSK;
}

-(TemperatureResultTodayModel *)tempToday
{
    if (!_tempToday) {
        _tempToday = [[TemperatureResultTodayModel alloc]init];
    }
    return _tempToday;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
 self.dataTask = [TemperatureNetManager getTemperatureWithCityName:_cityname completionHandle:^(TemperatureModel *model, NSError *error) {
     if (_start == 0) {
         [self.dataArr removeAllObjects];
     }
     
     [self.dataArr addObjectsFromArray:model.result.future];
     _rowNumber = self.dataArr.count;
     self.reason = model.reason;
     self.tempSK = model.result.sk;
     self.tempToday = model.result.today;
     completionHandle(error);
     
 }];

}



-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}


-(TemperatureResultFutureModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
    
}


-(NSString *)weekForRow:(NSInteger)row
{
    return [self modelForRow:row].week;
}
//温度
-(NSString *)temperatureForRow:(NSInteger)row
{
    return [self modelForRow:row].temperature;
}
//天气情况
-(NSString *)weatherForRow:(NSInteger)row
{
    return [self modelForRow:row].weather;
}

-(NSString *)dateForRow:(NSInteger)row
{
    NSString *dateStr = [self modelForRow:row].date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *date = [[NSDate alloc]init];
    date = [formatter dateFromString:dateStr];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    [formatter2 setDateFormat:@"yyyy.MM.dd"];
    
    NSString *str = [formatter2 stringFromDate:date];
     
    
    
    return str;
    
}


//当前天气情况
-(NSString *)temp
{
    return self.tempSK.temp;
}
-(NSString *)windDirection
{
    return self.tempSK.wind_direction;
}
-(NSString *)windStrength
{
    return self.tempSK.wind_strength;
}
-(NSString *)humidity
{
    return self.tempSK.humidity;
}
-(NSString *)time
{
    return self.tempSK.time;
}
-(NSString *)city
{
    return self.tempToday.city;
}



//获取当日温度的信息
-(NSString *)temperature
{
    return self.tempToday.temperature;
}
-(NSString *)weather
{
    return self.tempToday.weather;
}
-(NSString *)travelIndex
{
    return self.tempToday.travel_index;
}
-(NSString *)uvIndex
{
    return self.tempToday.uv_index;
}
-(NSString *)dressing
{
    return self.tempToday.dressing_index;
}
-(NSString *)dressingAdvice
{
    return self.tempToday.dressing_advice;
}




@end
