//
//  TrainQueryContentCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryContentCell.h"


@implementation TrainQueryContentCell

-(UILabel *)trainId
{
    if (!_trainId) {
        _trainId = [[UILabel alloc]init];
        _trainId.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_trainId];
        
        [_trainId mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(7);
           
        }];
        
    }
    return _trainId;
}

-(UILabel *)stationName
{
    if (!_stationName) {
        _stationName = [[UILabel alloc]init];
        _stationName.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_stationName];
        [_stationName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7);
            make.left.mas_equalTo(self.trainId.mas_right).mas_equalTo(40);
            
            
        }];
        
    }
    return _stationName;
}

-(UILabel *)arrivedTime
{
    if (!_arrivedTime) {
        _arrivedTime = [[UILabel alloc]init];
        _arrivedTime.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_arrivedTime];
        
        [_arrivedTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7);
            make.left.mas_equalTo(self.stationName.mas_right).mas_equalTo(40);
           
        }];
    }
    return _arrivedTime;
}

-(UILabel *)leaveTime
{
    if (!_leaveTime) {
        _leaveTime = [[UILabel alloc]init];
        _leaveTime.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_leaveTime];
        
        [_leaveTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7);
            make.left.mas_equalTo(self.arrivedTime.mas_right).mas_equalTo(40);
        
        }];
    }
    
    return _leaveTime;
}

-(UILabel *)stay
{
    if (!_stay) {
        _stay = [[UILabel alloc]init];
        _stay.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_stay];
        [_stay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7);
            make.left.mas_equalTo(self.leaveTime.mas_right).mas_equalTo(40);
            
        }];
    }
    return _stay;
}

@end
