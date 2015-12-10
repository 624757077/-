//
//  StationToStationModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StationToStationModel.h"

@implementation StationToStationModel

@end
@implementation StationToStationResultModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [StationToStationResultListModel class]};
}

@end


@implementation StationToStationResultListModel




+ (NSDictionary *)objectClassInArray{
    return @{@"price_list" : [StationToStationResultListPriceListModel class]};
}

@end


@implementation StationToStationResultListPriceListModel

@end


