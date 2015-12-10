//
//  StationStationNetMannager.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StationStationNetMannager.h"

@implementation StationStationNetMannager

+(id)getStationToStationWithStart:(NSString *)startStation end:(NSString *)endStation traintType:(NSString *)type date:(NSString *)date  completionHandle:(void(^)(StationToStationModel *model,NSError *error))completionHandle
{
    
    NSString *path = [NSString stringWithFormat:@"http://apis.juhe.cn/train/s2swithprice?start=%@&end=%@&traintype=%@&date=%@&key=%@",startStation,endStation,type,date,kKey];
    path = [self percentPathWithPath:path params:nil];
    
    //将网络请求下来的数据发送出去
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([StationToStationModel objectWithKeyValues:responseObj],error);
    }];
    
}

@end
