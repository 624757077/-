//
//  StationToStationViewModel.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StationToStationViewModel.h"
#import "StationStationNetMannager.h"
@implementation StationToStationViewModel

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
  self.dataTask = [StationStationNetMannager getStationToStationWithStart:_startStation end:_endStation traintType:_type date:_date completionHandle:^(StationToStationModel *model, NSError *error) {
      if (_start == 0) {
          [self.dataArr removeAllObjects];
      }
      
      [self.dataArr addObjectsFromArray:model.result.list];
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

-(StationToStationResultListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}


/**两地的距离*/
-(NSString *)runDisdanceForRow:(NSInteger)row
{
    return [self modelForRow:row].run_distance;
}
/**起始站*/
-(NSString *)startStationForRow:(NSInteger)row
{
    return [self modelForRow:row].start_station;
}
/**到达站*/
-(NSString *)endStationForRow:(NSInteger)row
{
    return [self modelForRow:row].end_station;
}
/**到达站的样式*/
-(NSString *)endStationTypeForRow:(NSInteger)row
{
    return [self modelForRow:row].end_station_type;
}
/**发车时间*/
-(NSString *)startTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].start_time;
}
/**跑动时间*/
-(NSString *)runTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].run_time;
}
/**到达时间*/
-(NSString *)endTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].end_time;
}
/**火车的样式*/
-(NSString *)trainTypeForRow:(NSInteger)row
{
    return [self modelForRow:row].train_type;
}
/**起始站的样式*/
-(NSString *)startStationTypeForRow:(NSInteger)row
{
    return [self modelForRow:row].start_station_type;
}
/**火车编号*/
-(NSString *)trainNOForRow:(NSInteger)row
{
    return [self modelForRow:row].train_no;
}


//因为price数组中有两个元素，要根据元素下标来取
-(StationToStationResultListPriceListModel *)price0ModelForRow:(NSInteger)row
{
    return [self modelForRow:row].price_list[0];
}

-(StationToStationResultListPriceListModel *)price1ModelForRow:(NSInteger)row
{
    return [self modelForRow:row].price_list[1];
}



/**价格*/

-(NSString *)price0ForRow:(NSInteger)row
{
    return [self price0ModelForRow:row].price;
}

-(NSString *)price1ForRow:(NSInteger)row
{
    return [self price1ModelForRow:row].price;
}

/**价格的类型*/
-(NSString *)priceType0ForRow:(NSInteger)row
{
    return [self price0ModelForRow:row].price_type;
}
-(NSString *)priceType1ForRow:(NSInteger)row
{
    return [self price1ModelForRow:row].price_type;
}



@end
