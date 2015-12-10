//
//  TemperatureNetManager.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TemperatureModel.h"
@interface TemperatureNetManager : BaseNetManager

+(id)getTemperatureWithCityName:(NSString *)cityName completionHandle:(void(^)(TemperatureModel *model,NSError *error))completionHandle;


@end
