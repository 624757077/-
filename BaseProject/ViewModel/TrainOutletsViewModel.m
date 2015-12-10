//
//  TrainOutletsViewModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutletsViewModel.h"

@implementation TrainOutletsViewModel

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
    self.dataTask = [TrainOutletsNetManager getTrainOutletsWithProvice:_province city:_city county:_county completionHandle:^(TrainOutletsModel *model, NSError *error) {
        
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        
        [self.dataArr addObjectsFromArray:model.result];
        self.reason = model.reason;
        completionHandle(error);
    }];
    
}


//刷新数据
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}


-(NSInteger)rowNumber
{
    return self.dataArr.count;
}


-(TrainOutletsResultModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}


/**上午营业时间*/
-(NSString *)startTimeAmForRow:(NSInteger)row
{
    return [self modelForRow:row].start_time_am;
}
/**上午停止营业时间*/
-(NSString *)stopTimeAmForRow:(NSInteger)row
{
    return [self modelForRow:row].stop_time_am;
}
/**下午营业时间*/
-(NSString *)startTimePmForRow:(NSInteger)row
{
    return [self modelForRow:row].start_time_pm;
}
/**下午停止营业时间*/
-(NSString *)stopTimePmForRow:(NSInteger)row
{
    return [self modelForRow:row].stop_time_pm;
}



/**代理名称*/
-(NSString *)agencyNameForRow:(NSInteger)row
{
    return  [self modelForRow:row].agency_name;
}
/**地址*/
-(NSString *)addressForRow:(NSInteger)row
{
    return  [self modelForRow:row].address;
}
/**电话号码*/
-(NSString *)phoneNOForRow:(NSInteger)row
{
    return [self modelForRow:row].phone_no;
}

@end
