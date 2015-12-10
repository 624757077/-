//
//  TrainQueryModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryModel.h"

@implementation TrainQueryModel

@end
@implementation TrainQueryResultModel

+ (NSDictionary *)objectClassInArray{
    return @{@"station_list" : [TrainQueryResultStationListModel class]};
}

@end


@implementation TrainQueryResultTrainInfoModel

@end


@implementation TrainQueryResultStationListModel

@end


