//
//  YPCalendarView.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义一个block变量，参数是数组类型
typedef void(^DaysSelectedBlock)(NSArray *result);

@interface YPCalendarView : UIView

@property (nonatomic,strong)NSArray *defaultDays;
@property (nonatomic,copy)DaysSelectedBlock complete;


-(instancetype)initWithFrame:(CGRect)frame;
-(void)show;
-(void)hide;

@end
