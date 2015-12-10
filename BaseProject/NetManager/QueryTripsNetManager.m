//
//  QueryTripsNetManager.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "QueryTripsNetManager.h"

@implementation QueryTripsNetManager

+(id)getQueryTripsWithStart:(NSString *)startStation end:(NSString *)endStation traintType:(NSString *)type date:(NSString *)date  completionHandle:(void(^)(QueryTripsModel *model,NSError *error))completionHandle
{
    
    NSString *path = [NSString stringWithFormat:@"http://apis.juhe.cn/train/ticket.cc.php?key=%@ &from=%@&to=%@&date=%@&tt=%@",kKey,startStation,endStation,date,type];
    path = [self percentPathWithPath:path params:nil];
    
    //将网络请求下来的数据发送出去
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([QueryTripsModel objectWithKeyValues:responseObj],error);
    }];

}

@end
