//
//  TrainOutletsResultCell.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutletsResultCell.h"

@implementation TrainOutletsResultCell

-(UILabel *)xuHao
{
    if (!_xuHao) {
        _xuHao = [[UILabel alloc]init];
        _xuHao.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_xuHao];
        [_xuHao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(25, 20));
            
        }];
    }
    return _xuHao;
}


-(UILabel *)daiShouDian
{
    if (!_daiShouDian) {
        _daiShouDian = [[UILabel alloc]init];
        _daiShouDian.font = [UIFont systemFontOfSize:14];
        _daiShouDian.tintColor = [UIColor blackColor];
        [self.contentView addSubview:_daiShouDian];
        [_daiShouDian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.xuHao.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.xuHao.mas_topMargin).mas_equalTo(0);
        }];
    }
    return _daiShouDian;
}



-(UILabel *)diZhi
{
    if (!_diZhi) {
        _diZhi = [[UILabel alloc]init];
        _diZhi.font = [UIFont systemFontOfSize:12];
        _diZhi.tintColor = [UIColor grayColor];
        [self.contentView addSubview:_diZhi];
        [_diZhi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.daiShouDian.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.daiShouDian.mas_leftMargin).mas_equalTo(0);
        }];
        
    }
    return _diZhi;
}


@end
