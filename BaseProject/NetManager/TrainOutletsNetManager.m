//
//  TrainOutletsNetManager.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutletsNetManager.h"

@implementation TrainOutletsNetManager

+(id)getTrainOutletsWithProvice:(NSString *)provice city:(NSString *)city county:(NSString *)county completionHandle:(void(^)(TrainOutletsModel *model,NSError *error))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://apis.juhe.cn/train/dsd?key=%@&dtype=json&province=%@&city=%@&county=%@",kKey,provice,city,county];
    
    
    
    path = [self percentPathWithPath:path params:nil];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TrainOutletsModel objectWithKeyValues:responseObj],error);
    }];
    
}


@end
