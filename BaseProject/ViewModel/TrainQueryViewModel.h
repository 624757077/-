//
//  TrainQueryViewModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface TrainQueryViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *date;


@property (nonatomic)NSInteger start;


@property (nonatomic,strong)NSString *reason;

/**起始站*/
-(NSString *)startStation;
/**列车号*/
-(NSString *)name;
/**里程*/
-(NSString *)mileage;
/**终点站*/
-(NSString *)endStation;
/**开车时间*/
-(NSString *)startTime;
/**结束时间*/
-(NSString *)endTime;


/**站序*/
-(NSString *)trainIdForRow:(NSInteger)row;
/**站名*/
-(NSString *)stationNameForRow:(NSInteger)row;
/**到时*/
-(NSString *)arrivedTimeForRow:(NSInteger)row;
/**发时*/
-(NSString *)leaveTimeForRow:(NSInteger)row;
/**停留*/
-(NSString *)stayForRow:(NSInteger)row;


@end
