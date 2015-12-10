//
//  TrainQueryNetMannager.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TrainQueryModel.h"
@interface TrainQueryNetMannager : BaseNetManager

+(id)getTrainQueryWithName:(NSString *)name date:(NSString *)date completionHandle:(void(^)(TrainQueryModel *model,NSError *error))completionHandle;


@end
