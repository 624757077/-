//
//  TrainQueryViewModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryViewModel.h"
#import "TrainQueryNetMannager.h"
#import "TrainQueryModel.h"

@interface TrainQueryViewModel ()

@property (nonatomic,strong)TrainQueryResultTrainInfoModel *trainInfoModel;

@end

@implementation TrainQueryViewModel

-(NSString *)reason
{
    if (!_reason) {
        _reason = [[NSString alloc]init];
    }
    return _reason;
}

//从网络上获取数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
self.dataTask = [TrainQueryNetMannager getTrainQueryWithName:_name date:_date completionHandle:^(TrainQueryModel *model, NSError *error) {
    
    if (_start == 0) {
        [self.dataArr removeAllObjects];
    }
    
    
    [self.dataArr addObjectsFromArray:model.result.station_list];
    self.trainInfoModel = model.result.train_info;
    self.reason = model.reason;
    completionHandle(error);
    
}];

}

-(TrainQueryResultTrainInfoModel *)trainInfoModel
{
    if (!_trainInfoModel) {
        _trainInfoModel = [[TrainQueryResultTrainInfoModel alloc]init];
    }
    return _trainInfoModel;
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}

-(TrainQueryResultStationListModel *)modelForRow:(NSInteger)row;
{
    return self.dataArr[row];
}

/**站序*/
-(NSString *)trainIdForRow:(NSInteger)row
{
    return [self modelForRow:row].train_id;
}
/**站名*/
-(NSString *)stationNameForRow:(NSInteger)row
{
    return [self modelForRow:row].station_name;
}
/**到时*/
-(NSString *)arrivedTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].arrived_time;
}
/**发时*/
-(NSString *)leaveTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].leave_time;
}
/**停留*/
-(NSString *)stayForRow:(NSInteger)row
{
    return [self modelForRow:row].stay;
}



/**起始站*/
-(NSString *)startStation
{
    return self.trainInfoModel.start;
}
/**列车号*/
-(NSString *)name
{
    return self.trainInfoModel.name;
}
/**里程*/
-(NSString *)mileage
{
    return self.trainInfoModel.mileage;
}
/**终点站*/
-(NSString *)endStation
{
    return self.trainInfoModel.end;
}
/**开车时间*/
-(NSString *)startTime
{
    return self.trainInfoModel.starttime;
}
/**结束时间*/
-(NSString *)endTime
{
    return self.trainInfoModel.endtime;
}


@end
