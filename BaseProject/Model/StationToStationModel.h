
//
//  StationToStationModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

//站到站
@class StationToStationResultModel,StationToStationResultListModel,StationToStationResultListPriceListModel;
@interface StationToStationModel : BaseModel

@property (nonatomic, strong) StationToStationResultModel *result;
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, copy) NSString *reason;

@end


@interface StationToStationResultModel : NSObject
@property (nonatomic, strong) NSArray<StationToStationResultListModel *> *list;
@end


@interface StationToStationResultListModel : NSObject

@property (nonatomic, copy) NSString *run_distance;

@property (nonatomic, copy) NSString *m_train_url;

@property (nonatomic, copy) NSString *start_station;

@property (nonatomic, copy) NSString *end_station;

@property (nonatomic, copy) NSString *end_station_type;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *m_chaxun_url;

@property (nonatomic, copy) NSString *run_time;

@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, strong) NSArray<StationToStationResultListPriceListModel *> *price_list;

@property (nonatomic, copy) NSString *train_type;

@property (nonatomic, copy) NSString *start_station_type;

@property (nonatomic, copy) NSString *train_no;

@end


@interface StationToStationResultListPriceListModel : NSObject

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *price_type;

@end

