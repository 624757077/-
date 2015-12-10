//
//  TempCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TempCell.h"

@implementation TempCell


-(UILabel *)date
{
    if (!_date) {
        _date = [[UILabel alloc]init];
        _date.textColor = [UIColor lightGrayColor];
        _date.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_date];
        
        [_date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        
    }
    
    return _date;

}



-(UILabel *)week
{
    if (!_week) {
        _week = [[UILabel alloc]init];
        _week.textColor = [UIColor lightGrayColor];
        _week.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_week];
        
        [_week mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.date.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(10);
        }];
    }
    return _week;
    
}


-(UILabel *)weather
{
    if (!_weather) {
        _weather = [[UILabel alloc]init];
        _weather.textColor = [UIColor lightGrayColor];
        _weather.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        [self.contentView addSubview:_weather];
        [_weather mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(self.temperature.mas_left).mas_equalTo(-10);
            make.top.mas_equalTo(10);
            
        }];
        
    }
    return _weather;
}


-(UILabel *)temperature
{
    if (!_temperature) {
        _temperature = [[UILabel alloc]init];
        _temperature.textColor = [UIColor lightGrayColor];
        _temperature.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        [self.contentView addSubview:_temperature];
        
        [_temperature mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(10);
        }];
    }
    return _temperature;
}

@end
