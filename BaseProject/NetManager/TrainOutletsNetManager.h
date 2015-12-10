//
//  TrainOutletsNetManager.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TrainOutletsModel.h"
@interface TrainOutletsNetManager : BaseNetManager

+(id)getTrainOutletsWithProvice:(NSString *)provice city:(NSString *)city county:(NSString *)county completionHandle:(void(^)(TrainOutletsModel *model,NSError *error))completionHandle;

@end
