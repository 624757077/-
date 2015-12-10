//
//  StationToStationCell.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationToStationCell : UITableViewCell

@property(nonatomic,strong) UILabel *runDistanceLb;
@property(nonatomic,strong) UILabel *startStationLb;
@property(nonatomic,strong) UILabel *endStationLb;
@property(nonatomic,strong) UILabel *endStationTypeLb;
@property(nonatomic,strong) UILabel *startTimeLb;
@property(nonatomic,strong) UILabel *runTimeLb;
@property(nonatomic,strong) UILabel *endTimeLb;
@property(nonatomic,strong) UILabel *trainTypeLb;
@property(nonatomic,strong) UILabel *startStationTypeLb;
@property(nonatomic,strong) UILabel *trainNOLb;

@property(nonatomic,strong) UILabel *price0Lb;
@property(nonatomic,strong) UILabel *priceType0Lb;
@property(nonatomic,strong) UILabel *price1Lb;
@property(nonatomic,strong) UILabel *priceType1Lb;


@end
