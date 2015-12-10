//
//  TrainOutletsViewModel.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TrainOutletsNetManager.h"
@interface TrainOutletsViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic,strong) NSString *province;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *county;


@property (nonatomic) NSInteger start;


@property (nonatomic,strong) NSString *reason;

/**上午营业时间*/
-(NSString *)startTimeAmForRow:(NSInteger)row;
/**上午停止营业时间*/
-(NSString *)stopTimeAmForRow:(NSInteger)row;
/**下午营业时间*/
-(NSString *)startTimePmForRow:(NSInteger)row;
/**下午停止营业时间*/
-(NSString *)stopTimePmForRow:(NSInteger)row;

/***/
//-(NSString *)provinceForRow:(NSInteger)row;
//-(NSString *)cityForRow:(NSInteger)row;
//-(NSString *)countyForRow:(NSInteger)row;

/**代理名称*/
-(NSString *)agencyNameForRow:(NSInteger)row;
/**地址*/
-(NSString *)addressForRow:(NSInteger)row;
/**电话号码*/
-(NSString *)phoneNOForRow:(NSInteger)row;

@end
