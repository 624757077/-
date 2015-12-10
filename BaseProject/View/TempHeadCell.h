//
//  TempHeadCell.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempHeadCell : UITableViewCell

@property (nonatomic,strong)UILabel *temp;
@property (nonatomic,strong)UILabel *wind;
@property (nonatomic,strong)UILabel *humidity;
@property (nonatomic,strong)UILabel *time;
@property (nonatomic,strong)UILabel *city;

@property (nonatomic,strong)UILabel *todayTemp;
@property (nonatomic,strong)UILabel *weather;
@property (nonatomic,strong)UILabel *traveIndex;
@property (nonatomic,strong)UILabel *uvIndex;
@property (nonatomic,strong)UILabel *dressing;
@property (nonatomic,strong)UILabel *dressingAdvice;

@end
