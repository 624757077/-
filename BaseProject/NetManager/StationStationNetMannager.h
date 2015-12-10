//
//  StationStationNetMannager.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "StationToStationModel.h"
@interface StationStationNetMannager : BaseNetManager

+(id)getStationToStationWithStart:(NSString *)startStation end:(NSString *)endStation traintType:(NSString *)type date:(NSString *)date completionHandle:(void(^)(StationToStationModel *model,NSError *error))completionHandle;

@end
