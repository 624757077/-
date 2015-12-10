//
//  StationToStationCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StationToStationCell.h"

@implementation StationToStationCell

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

-(UILabel *)trainTypeLb
{
    if (!_trainTypeLb) {
        _trainTypeLb = [UILabel new];
        _trainTypeLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_trainTypeLb];
        [_trainTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.startTimeLb.mas_bottom).mas_equalTo(10);
            make.leftMargin.mas_equalTo(self.trainNOLb);
            
        }];
    }
    
    return _trainTypeLb;

}

-(UILabel *)priceType0Lb
{
    if (!_priceType0Lb) {
        _priceType0Lb = [UILabel new];
        _priceType0Lb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_priceType0Lb];
        [_priceType0Lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.trainTypeLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.trainTypeLb.mas_topMargin);
        }];
    }
    return _priceType0Lb;
}

-(UILabel *)price0Lb
{
    if (!_price0Lb) {
        _price0Lb = [UILabel new];
        _price0Lb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_price0Lb];
        [_price0Lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.priceType0Lb.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.priceType0Lb.mas_topMargin);
        }];
    }
    return _price0Lb;
}

-(UILabel *)priceType1Lb
{
    if (!_priceType1Lb) {
        _priceType1Lb = [UILabel new];
        _priceType1Lb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_priceType1Lb];
        [_priceType1Lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.price0Lb.mas_right).mas_equalTo(20);
            make.topMargin.mas_equalTo(self.price0Lb.mas_topMargin);
        }];
    }
    return _priceType1Lb;

}


-(UILabel *)price1Lb
{
    if (!_price1Lb) {
        _price1Lb = [UILabel new];
        _price1Lb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_price1Lb];
        [_price1Lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.priceType1Lb.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.priceType1Lb.mas_topMargin);
        }];
    }
    return _price1Lb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
