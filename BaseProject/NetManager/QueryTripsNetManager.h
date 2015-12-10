//
//  QueryTripsNetManager.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "QueryTripsModel.h"
@interface QueryTripsNetManager : BaseNetManager



+(id)getQueryTripsWithStart:(NSString *)startStation end:(NSString *)endStation traintType:(NSString *)type date:(NSString *)date completionHandle:(void(^)(QueryTripsModel *model,NSError *error))completionHandle;

@end
