//
//  TrainQueryHeadCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryHeadCell.h"

@implementation TrainQueryHeadCell

-(UILabel *)start
{
    if (!_start) {
        _start = [[UILabel alloc]init];
        //设置粗体
        _start.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        [self.contentView addSubview:_start];
        [_start mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(20);
        }];
    }
    return _start;
}

-(UILabel *)name
{
    if (!_name) {
        _name = [[UILabel alloc]init];
        _name.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _name.textColor = [UIColor blueColor];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.centerX.mas_equalTo(0);
        }];
    }
    return _name;
}

-(UILabel *)end
{
    if (!_end) {
        _end = [[UILabel alloc]init];
        _end.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        [self.contentView addSubview:_end];
        [_end mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-20);
        }];
    }
    
    return _end;
}

-(UILabel *)startTime
{
    if (!_startTime) {
        _startTime = [[UILabel alloc]init];
        _startTime.font = [UIFont systemFontOfSize:12];
        _startTime.textColor = [UIColor blueColor];
        [self.contentView addSubview:_startTime];
        [_startTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.start.mas_leftMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.start.mas_bottom).mas_equalTo(10);
        }];
    }
    return _startTime;
}

-(UILabel *)mileage
{
    if (!_mileage) {
        _mileage = [[UILabel alloc]init];
        _mileage.font = [UIFont systemFontOfSize:12];
       
        [self.contentView addSubview: _mileage];
        [_mileage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.startTime.mas_topMargin).mas_equalTo(3);
            make.centerX.mas_equalTo(0);
        }];
    }
    return _mileage;
}

-(UILabel *)endTime
{
    if (!_endTime) {
        _endTime = [[UILabel alloc]init];
        _endTime.font = [UIFont systemFontOfSize:12];
        _endTime.textColor = [UIColor blueColor];
        [self.contentView addSubview:_endTime];
        [_endTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.end.mas_leftMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.end.mas_bottom).mas_equalTo(10);
        }];
    }
    return _endTime;
}

@end
