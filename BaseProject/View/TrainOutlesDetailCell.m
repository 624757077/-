//
//  TrainOutlesDetailCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutlesDetailCell.h"

@implementation TrainOutlesDetailCell

-(UILabel *)address
{
    if (!_address) {
        _address = [[UILabel alloc]init];
        _address.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_address];
        [_address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
        }];
    }
    return _address;
}

-(UILabel *)phoneON
{
    if (!_phoneON) {
        _phoneON = [[UILabel alloc]init];
        _phoneON.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_phoneON];
        [_phoneON mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.address.mas_bottomMargin).mas_equalTo(15);
            
        }];
        
    }
    return _phoneON;
}

-(UILabel *)yingYeShiJian
{
    if (!_yingYeShiJian) {
        _yingYeShiJian = [[UILabel alloc]init];
        _yingYeShiJian.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_yingYeShiJian];
        [_yingYeShiJian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.phoneON.mas_bottomMargin).mas_equalTo(15);
        }];
    }
    return _yingYeShiJian;
}

-(UILabel *)shangWu
{
    if (!_shangWu) {
        _shangWu = [[UILabel alloc]init];
        _shangWu.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_shangWu];
        [_shangWu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.yingYeShiJian.mas_right).mas_equalTo(4);
            make.topMargin.mas_equalTo(self.yingYeShiJian.mas_topMargin).mas_equalTo(0);
        }];
    }
    return _shangWu;
}

-(UILabel *)xiaWu
{
    if (!_xiaWu) {
        _xiaWu = [[UILabel alloc]init];
        _xiaWu.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_xiaWu];
        [_xiaWu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.shangWu.mas_leftMargin).mas_equalTo(0);
            make.topMargin.mas_equalTo(self.shangWu.mas_bottomMargin).mas_equalTo(15);
        }];
    }
    return _xiaWu;
}

@end
