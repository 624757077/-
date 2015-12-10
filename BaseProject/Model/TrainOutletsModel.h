//
//  TrainOutletsModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TrainOutletsResultModel;
@interface TrainOutletsModel : BaseModel

@property (nonatomic, strong) NSArray<TrainOutletsResultModel *> *result;

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, copy) NSString *reason;

@end
@interface TrainOutletsResultModel : NSObject

@property (nonatomic, copy) NSString *county;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *start_time_am;

@property (nonatomic, copy) NSString *stop_time_am;

@property (nonatomic, copy) NSString *stop_time_pm;

@property (nonatomic, copy) NSString *start_time_pm;

@property (nonatomic, copy) NSString *agency_name;

@property (nonatomic, copy) NSString *phone_no;

@property (nonatomic, copy) NSString *province;

@end

