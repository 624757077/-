//
//  StationToStationViewModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface StationToStationViewModel : BaseViewModel

@property (nonatomic)NSInteger rowNumber;
@property (nonatomic,strong)NSString *startStation;
@property (nonatomic,strong)NSString *endStation;
@property (nonatomic,strong)NSString *type;
@property (nonatomic,strong)NSString *date;

@property (nonatomic)NSInteger start;

//请求是否成功
@property (nonatomic,strong)NSString *reason;

/**两地的距离*/
-(NSString *)runDisdanceForRow:(NSInteger)row;
/**起始站*/
-(NSString *)startStationForRow:(NSInteger)row;
/**到达站*/
-(NSString *)endStationForRow:(NSInteger)row;
/**到达站的样式*/
-(NSString *)endStationTypeForRow:(NSInteger)row;
/**发车时间*/
-(NSString *)startTimeForRow:(NSInteger)row;
/**跑动时间*/
-(NSString *)runTimeForRow:(NSInteger)row;
/**到达时间*/
-(NSString *)endTimeForRow:(NSInteger)row;
/**火车的样式*/
-(NSString *)trainTypeForRow:(NSInteger)row;
/**起始站的样式*/
-(NSString *)startStationTypeForRow:(NSInteger)row;
/**火车编号*/
-(NSString *)trainNOForRow:(NSInteger)row;

//price数组里有两个元素
/**价格*/
-(NSString *)price0ForRow:(NSInteger)row;
-(NSString *)price1ForRow:(NSInteger)row;
/**价格的类型*/
-(NSString *)priceType0ForRow:(NSInteger)row;
-(NSString *)priceType1ForRow:(NSInteger)row;





@end
