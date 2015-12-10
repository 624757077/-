//
//  QueryTripsViewModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "QueryTripsViewModel.h"
#import "QueryTripsNetManager.h"



@implementation QueryTripsViewModel

-(NSString *)reason
{
    if (!_reason) {
        _reason = [[NSString alloc]init];
    }
    return _reason;
}

/**请求数据*/
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
 self.dataTask = [QueryTripsNetManager getQueryTripsWithStart:_startStation end:_endStation traintType:_type date:_date completionHandle:^(QueryTripsModel *model, NSError *error) {
     
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

-(QueryTripsResultModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}




/**起始站*/
-(NSString *)startStationForRow:(NSInteger)row
{
    return  [self modelForRow:row].queryLeftNewDTO.from_station_name;
}
/**到达站*/
-(NSString *)endStationForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.to_station_name;
}

/**发车时间*/
-(NSString *)startTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.start_time;
}
/**跑动时间*/
-(NSString *)runTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.lishi;
}
/**到达时间*/
-(NSString *)endTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.arrive_time;
}
/**火车的样式*/
-(NSString *)trainTypeForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.train_class_name;
}
/**火车编号*/
-(NSString *)trainNOForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.station_train_code;
}



//席别
/**高级软卧*/
-(NSString *)gaoJiRuanWoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.gr_num;
}
/**其他*/
-(NSString *)qiTaForRow:(NSInteger)row
{
    return  [self modelForRow:row].queryLeftNewDTO.qt_num;
}
/**软卧*/
-(NSString *)ruanWoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.rw_num;
}
/**软座*/
-(NSString *)ruanZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.rz_num;
}
/**特等座*/
-(NSString *)teDengZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.tz_num;
}
/**无座*/
-(NSString *)wuZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.wz_num;
}
/**硬卧*/
-(NSString *)yingWoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.yw_num;
}
/**硬座*/
-(NSString *)yingZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.yz_num;
}
/**二等座*/
-(NSString *)erDengZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.ze_num;
}
/**一等座*/
-(NSString *)yiDengZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.zy_num;
}
/**商务座*/
-(NSString *)shangWuZuoForRow:(NSInteger)row
{
    return [self modelForRow:row].queryLeftNewDTO.swz_num;
}




@end
