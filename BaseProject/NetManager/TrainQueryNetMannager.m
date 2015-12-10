//
//  TrainQueryNetMannager.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryNetMannager.h"

@implementation TrainQueryNetMannager

+(id)getTrainQueryWithName:(NSString *)name date:(NSString *)date completionHandle:(void(^)(TrainQueryModel *model,NSError *error))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://apis.juhe.cn/train/s?name=%@&date=%@&key=%@",name,date,kKey];
    
    
    //将网络上请求下来的数据发送出去
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TrainQueryModel objectWithKeyValues:responseObj],error);
    }];
    
    
}


@end
