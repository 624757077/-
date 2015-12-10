//
//  QueryTripsViewModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface QueryTripsViewModel : BaseViewModel


@property (nonatomic)NSInteger rowNumber;
@property (nonatomic,strong)NSString *startStation;
@property (nonatomic,strong)NSString *endStation;
@property (nonatomic,strong)NSString *type;
@property (nonatomic,strong)NSString *date;

@property (nonatomic)NSInteger start;


@property (nonatomic,strong)NSString *reason;

/**起始站*/
-(NSString *)startStationForRow:(NSInteger)row;
/**到达站*/
-(NSString *)endStationForRow:(NSInteger)row;
/**发车时间*/
-(NSString *)startTimeForRow:(NSInteger)row;
/**跑动时间*/
-(NSString *)runTimeForRow:(NSInteger)row;
/**到达时间*/
-(NSString *)endTimeForRow:(NSInteger)row;
/**火车的样式*/
-(NSString *)trainTypeForRow:(NSInteger)row;
/**火车编号*/
-(NSString *)trainNOForRow:(NSInteger)row;


//席别
/**高级软卧*/
-(NSString *)gaoJiRuanWoForRow:(NSInteger)row;
/**其他*/
-(NSString *)qiTaForRow:(NSInteger)row;
/**软卧*/
-(NSString *)ruanWoForRow:(NSInteger)row;
/**软座*/
-(NSString *)ruanZuoForRow:(NSInteger)row;
/**特等座*/
-(NSString *)teDengZuoForRow:(NSInteger)row;
/**无座*/
-(NSString *)wuZuoForRow:(NSInteger)row;
/**硬卧*/
-(NSString *)yingWoForRow:(NSInteger)row;
/**硬座*/
-(NSString *)yingZuoForRow:(NSInteger)row;
/**二等座*/
-(NSString *)erDengZuoForRow:(NSInteger)row;
/**一等座*/
-(NSString *)yiDengZuoForRow:(NSInteger)row;
/**商务座*/
-(NSString *)shangWuZuoForRow:(NSInteger)row;



@end
