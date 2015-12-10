//
//  QueryTripsCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "QueryTripsCell.h"

@implementation QueryTripsCell


-(UILabel *)trainNOLb
{
    if (!_trainNOLb) {
        _trainNOLb = [[UILabel alloc]init];
        _trainNOLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_trainNOLb];
        [_trainNOLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            
            
        }];
    }
    return _trainNOLb;
}

-(UILabel *)startStationTypeLb
{
    if (!_startStationTypeLb) {
        _startStationTypeLb = [UILabel new];
        _startStationTypeLb.font = [UIFont systemFontOfSize:12];
        _startStationTypeLb.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_startStationTypeLb];
        [_startStationTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.trainNOLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.trainNOLb.mas_topMargin);
            
        }];
    }
    return _startStationTypeLb;
}

-(UILabel *)startStationLb
{
    if (!_startStationLb) {
        _startStationLb = [UILabel new];
        _startStationLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_startStationLb];
        [_startStationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.startStationTypeLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.trainNOLb.mas_topMargin);
            
        }];
    }
    return _startStationLb;
}

-(UILabel *)runTimeLb
{
    if (!_runTimeLb) {
        _runTimeLb = [UILabel new];
        _runTimeLb.font = [UIFont systemFontOfSize:10];
        _runTimeLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_runTimeLb];
        [_runTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.startStationLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.startStationLb.mas_bottomMargin);
            
        }];
    }
    return _runTimeLb;
}


-(UILabel *)endStationTypeLb
{
    if (!_endStationTypeLb) {
        _endStationTypeLb = [UILabel new];
        _endStationTypeLb.font = [UIFont systemFontOfSize:14];
        _endStationTypeLb.textColor = [UIColor greenColor];
        [self.contentView addSubview:_endStationTypeLb];
        [_endStationTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.runTimeLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.trainNOLb.mas_topMargin);
            
        }];
    }
    return _endStationTypeLb;
}

-(UILabel *)endStationLb
{
    if (!_endStationLb) {
        _endStationLb = [UILabel new];
        _endStationLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_endStationLb];
        [_endStationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.endStationTypeLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.trainNOLb.mas_topMargin);
            
        }];
    }
    return _endStationLb;
}


//-(UILabel *)runDistanceLb
//{
//    if (!_runDistanceLb) {
//        _runDistanceLb = [[UILabel alloc]init];
//        _runDistanceLb.font = [UIFont systemFontOfSize:12];
//        [self.contentView addSubview:_runDistanceLb];
//        [_runDistanceLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.leftMargin.mas_equalTo(self.runTimeLb.mas_leftMargin);
//            make.bottomMargin.mas_equalTo(self.runTimeLb.mas_topMargin).mas_equalTo(3);
//
//        }];
//    }
//    return _runDistanceLb;
//}


-(UILabel *)startTimeLb
{
    if (!_startTimeLb) {
        _startTimeLb = [UILabel new];
        _startTimeLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_startTimeLb];
        [_startTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.startStationTypeLb.mas_leftMargin);
            make.topMargin.mas_equalTo(self.startStationTypeLb.mas_bottom).mas_equalTo(10);
            
        }];
    }
    
    return _startTimeLb;
}

-(UILabel *)endTimeLb
{
    if (!_endTimeLb) {
        _endTimeLb = [UILabel new];
        _endTimeLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_endTimeLb];
        [_endTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.endStationTypeLb.mas_leftMargin);
            make.topMargin.mas_equalTo(self.endStationTypeLb.mas_bottom).mas_equalTo(10);
            
        }];
    }
    
    return _endTimeLb;
}

//-(UILabel *)trainTypeLb
//{
//    if (!_trainTypeLb) {
//        _trainTypeLb = [UILabel new];
//        _trainTypeLb.font = [UIFont systemFontOfSize:14];
//        [self.contentView addSubview:_trainTypeLb];
//        [_trainTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.topMargin.mas_equalTo(self.startTimeLb.mas_bottom).mas_equalTo(10);
//            make.leftMargin.mas_equalTo(self.trainNOLb);
//            
//        }];
//    }
//    
//    return _trainTypeLb;
//    
//}



-(UILabel *)xiBie0
{
    if (!_xiBie0) {
        _xiBie0 = [UILabel new];
        _xiBie0.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie0];
        [_xiBie0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.topMargin.mas_equalTo(self.startTimeLb.mas_bottom).mas_equalTo(10);
        }];
    }
    return _xiBie0;
}

-(UILabel *)xiBie1
{
    if (!_xiBie1) {
        _xiBie1 = [UILabel new];
        _xiBie1.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie1];
        [_xiBie1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xiBie0.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.xiBie0.mas_topMargin);
        }];
    }
    return _xiBie1;
}

-(UILabel *)xiBie2
{
    if (!_xiBie2) {
        _xiBie2 = [UILabel new];
        _xiBie2.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie2];
        [_xiBie2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xiBie1.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.xiBie1.mas_topMargin);
        }];
    }
    return _xiBie2;
    
}


-(UILabel *)xiBie3
{
    if (!_xiBie3) {
        _xiBie3 = [UILabel new];
        _xiBie3.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie3];
        [_xiBie3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xiBie2.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.xiBie2.mas_topMargin);
        }];
    }
    return _xiBie3;
}


-(UILabel *)xiBie4
{
    if (!_xiBie4) {
        _xiBie4 = [UILabel new];
        _xiBie4.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie4];
        [_xiBie4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xiBie3.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.xiBie3.mas_topMargin);
        }];
    }
    return _xiBie4;
}

-(UILabel *)xiBie5
{
    if (!_xiBie5) {
        _xiBie5 = [UILabel new];
        _xiBie5.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie5];
        [_xiBie5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xiBie4.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.xiBie4.mas_topMargin);
        }];
    }
    return _xiBie5;
}

-(UILabel *)xiBie6
{
    if (!_xiBie6) {
        _xiBie6 = [UILabel new];
        _xiBie6.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_xiBie6];
        [_xiBie6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xiBie5.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.xiBie5.mas_topMargin);
        }];
    }
    return _xiBie6;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
