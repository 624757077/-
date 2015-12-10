//
//  TempHeadCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TempHeadCell.h"

@implementation TempHeadCell

-(UILabel *)temp
{
    if (!_temp) {
        _temp = [[UILabel alloc]init];
        _temp.font = [UIFont systemFontOfSize:35];
        _temp.textColor = [UIColor blackColor];
        [self.contentView addSubview:_temp];
        [_temp mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(20);
        }];
    }
    return _temp;
}

-(UILabel *)wind
{
    if (!_wind) {
        _wind = [[UILabel alloc]init];
        _wind.font = [UIFont systemFontOfSize:15];
        _wind.textColor = [UIColor blackColor];
        [self.contentView addSubview:_wind];
        
        [_wind mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.temp.mas_bottom).mas_equalTo(10);
        }];
        
    }
    return _wind;
}

-(UILabel *)humidity
{
    if (!_humidity) {
        _humidity = [[UILabel alloc]init];
        _humidity.font = [UIFont systemFontOfSize:15];
        _humidity.textColor = [UIColor blackColor];
        [self.contentView addSubview:_humidity];
        
        [_humidity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.wind.mas_bottom).mas_equalTo(10);
        }];
    }
    return _humidity;
    
}

-(UILabel *)time
{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.font = [UIFont systemFontOfSize:15];
        _time.textColor = [UIColor blackColor];
        [self.contentView addSubview:_time];
        
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.humidity.mas_bottom).mas_equalTo(10);
        }];
    }
    return _time;

}

-(UILabel *)todayTemp
{
    if (!_todayTemp) {
        _todayTemp = [[UILabel alloc]init];
        _todayTemp.font = [UIFont systemFontOfSize:15];
        _todayTemp.textColor = [UIColor blackColor];
        [self.contentView addSubview:_todayTemp];
        
        [self.contentView addSubview:_todayTemp];
        [_todayTemp mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.time.mas_bottom).mas_equalTo(25);
        }];
    }
    return _todayTemp;

}

-(UILabel *)weather
{
    if (!_weather) {
        _weather = [[UILabel alloc]init];
        _weather.font = [UIFont systemFontOfSize:15];
        _weather.textColor = [UIColor blackColor];
        [self.contentView addSubview:_weather];
    
        [_weather mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.todayTemp.mas_bottom).mas_equalTo(10);
        }];
    }
    return _weather;
}

-(UILabel *)traveIndex
{
    if (!_traveIndex) {
        _traveIndex = [[UILabel alloc]init];
        _traveIndex.font = [UIFont systemFontOfSize:15];
        _traveIndex.textColor = [UIColor blackColor];
        [self.contentView addSubview:_traveIndex];
        
        [_traveIndex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.weather.mas_bottom).mas_equalTo(10);
        }];
    }
    return _traveIndex;
 
}

-(UILabel *)uvIndex
{
    if (!_uvIndex) {
        _uvIndex = [[UILabel alloc]init];
        _uvIndex.font = [UIFont systemFontOfSize:15];
        _uvIndex.textColor = [UIColor blackColor];
        [self.contentView addSubview:_uvIndex];
        
        [_uvIndex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.traveIndex.mas_bottom).mas_equalTo(10);
        }];
    }
    return _uvIndex;
}

-(UILabel *)dressing
{
    if (!_dressing) {
        _dressing = [[UILabel alloc]init];
        _dressing.font = [UIFont systemFontOfSize:15];
        _dressing.textColor = [UIColor blackColor];
        [self.contentView addSubview:_dressing];
        
        [_dressing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.uvIndex.mas_bottom).mas_equalTo(10);
        }];
    }
    return _dressing;
}

-(UILabel *)dressingAdvice
{
    if (!_dressingAdvice) {
        _dressingAdvice = [[UILabel alloc]initWithFrame:CGRectZero];
        _dressingAdvice.font = [UIFont systemFontOfSize:15];
        _dressingAdvice.textColor = [UIColor blackColor];
        _dressingAdvice.numberOfLines = 0;
        
        [self.contentView addSubview:_dressingAdvice];
        
        [_dressingAdvice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.dressing.mas_bottom).mas_equalTo(10);
            make.width.mas_equalTo(kWindowW);
        }];
    }
    return _dressingAdvice;
}


@end
