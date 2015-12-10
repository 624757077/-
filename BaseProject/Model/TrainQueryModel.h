//
//  TrainQueryModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TrainQueryResultModel,TrainQueryResultTrainInfoModel,TrainQueryResultStationListModel;
@interface TrainQueryModel : BaseModel

@property (nonatomic, strong) TrainQueryResultModel *result;
@property (nonatomic, copy) NSString *resultcode;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, assign) NSInteger error_code;

@end


@interface TrainQueryResultModel : NSObject

@property (nonatomic, strong) TrainQueryResultTrainInfoModel *train_info;
@property (nonatomic, strong) NSArray<TrainQueryResultStationListModel *> *station_list;

@end


@interface TrainQueryResultTrainInfoModel : NSObject
@property (nonatomic, copy) NSString *starttime;
@property (nonatomic, copy) NSString *end;
@property (nonatomic, copy) NSString *mileage;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *endtime;
@property (nonatomic, copy) NSString *start;

@end


@interface TrainQueryResultStationListModel : NSObject

@property (nonatomic, copy) NSString *wuzuo;

@property (nonatomic, copy) NSString *ssoftSeat;

@property (nonatomic, copy) NSString *swz;

@property (nonatomic, copy) NSString *arrived_time;

@property (nonatomic, copy) NSString *mileage;

@property (nonatomic, copy) NSString *gjrw;

@property (nonatomic, copy) NSString *hardSead;

@property (nonatomic, copy) NSString *leave_time;

@property (nonatomic, copy) NSString *stay;

@property (nonatomic, copy) NSString *train_id;

@property (nonatomic, copy) NSString *fsoftSeat;

@property (nonatomic, copy) NSString *station_name;

@property (nonatomic, copy) NSString *hardSleep;

@property (nonatomic, copy) NSString *softSeat;

@property (nonatomic, copy) NSString *tdz;

@property (nonatomic, copy) NSString *softSleep;

@end

