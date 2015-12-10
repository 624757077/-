//
//  TrainQueryDetailViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryDetailViewController.h"

#import "TrainQueryViewModel.h"

#import "TrainQueryHeadCell.h"
#import "TrainQueryContentCell.h"
#import "Factory.h"

@interface TrainQueryDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;


@end


@implementation TrainQueryDetailViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TrainQueryHeadCell class] forCellReuseIdentifier:@"HeadCell"];
        [_tableView registerClass:[TrainQueryContentCell class] forCellReuseIdentifier:@"ContentCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.left.right.bottom.mas_equalTo(0);
        }];
        
        //头部刷新
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.trainQueryVM refreshDataCompletionHandle:^(NSError *error) {
                
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    
                    if ([self.trainQueryVM.reason isEqualToString:@"Train Empty!"]) {
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeText;//只显示label
                        hud.labelText = @"输入的车次有误";
                        [hud hide:YES afterDelay:2];
                    }
                    [_tableView reloadData];
                    
                }
                [_tableView.header endRefreshing];
            }];
            
        }];
    
    }
  return _tableView;

}

-(void)viewDidLoad
{
    [self.tableView.header beginRefreshing];
    self.title = @"详情";
    [self ButtonDay];
    
    [Factory addBackItemToVC:self];
       self.navigationController.navigationBar.translucent = NO;
}


//导航控制下的按钮
-(void)ButtonDay
{
    
    UIButton  *yesterdayBtn = [[UIButton alloc]init];
    yesterdayBtn.backgroundColor = [UIColor redColor];
    [yesterdayBtn setTitle:@"前一天" forState:(UIControlStateNormal)];
    [self.view addSubview:yesterdayBtn];
    [yesterdayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(70);
    }];
    
    
    UIButton *tomorrowBtn = [[UIButton alloc]init];
    tomorrowBtn.backgroundColor = [UIColor redColor];
    [tomorrowBtn setTitle:@"后一天" forState:(UIControlStateNormal)];
    [self.view addSubview:tomorrowBtn];
    [tomorrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(70);
    }];
    
    UILabel *titleLb = [UILabel new];
    titleLb.text = self.showStr;
    titleLb.backgroundColor = [UIColor blueColor];
    titleLb.font = [UIFont systemFontOfSize:17];
    titleLb.textColor = [UIColor whiteColor];
    titleLb.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:titleLb];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(yesterdayBtn.mas_right).mas_equalTo(0);
        make.right.mas_equalTo(tomorrowBtn.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
        
        
    }];
    
    
    
    
    
    //点击前一天
    [yesterdayBtn bk_addEventHandler:^(id sender) {
        
        //先将string转换成date，在根据date转换成string
        NSString *dateStr = self.showStr;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [[NSDate alloc]init];
        date = [formatter dateFromString:dateStr];
        
        NSDate *yesterday = [NSDate dateWithTimeInterval:-60*60*24 sinceDate:date];
        
        NSString *yesterdayStr = [formatter stringFromDate:yesterday];
        self.showStr = yesterdayStr;
        //self.showStr已经成功改变
        //重新修改date的指向
        self.trainQueryVM.date = yesterdayStr;
        //重新刷新数据
        [self.tableView.header beginRefreshing];
        
        [self.trainQueryVM refreshDataCompletionHandle:^(NSError *error)
         {
             if (error) {
                 [self showErrorMsg:error.localizedDescription];
             }else{
                 
                 [_tableView reloadData];
                 titleLb.text = self.showStr; //修改titleLb的值
             }
         }];
        
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    //点击后一天
    [tomorrowBtn bk_addEventHandler:^(id sender) {
        //在这里修改时间
        NSString *dateStr = self.showStr;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [[NSDate alloc]init];
        date = [formatter dateFromString:dateStr];
        
        NSDate *yesterday = [NSDate dateWithTimeInterval:60*60*24 sinceDate:date];
        
        NSString *tomorrowStr = [formatter stringFromDate:yesterday];
        
        NSLog(@"%@",tomorrowStr);
        
        self.showStr = tomorrowStr;
        
        //self.showStr已经成功改变
        
        //重新修改date的指向
        self.trainQueryVM.date = tomorrowStr;
        //重新刷新数据
        [self.tableView.header beginRefreshing];
        
        [self.trainQueryVM refreshDataCompletionHandle:^(NSError *error)
         {
             if (error) {
                 [self showErrorMsg:error.localizedDescription];
             }else{
                 
                 [_tableView reloadData];
                 titleLb.text = self.showStr;
             }
         }];
        
        
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
}


//当界面消失的时候，重新赋值
-(void)viewWillDisappear:(BOOL)animated
{
    self.trainQueryVM = nil;
}

kRemoveCellSeparator
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return [self.trainQueryVM rowNumber]+2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TrainQueryHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadCell"];
        cell.start.text = [self.trainQueryVM startStation];
        cell.name.text = [self.trainQueryVM name];
        cell.end.text = [self.trainQueryVM endStation];
        cell.startTime.text = [self.trainQueryVM startTime];
        cell.mileage.text = [self.trainQueryVM mileage];
        cell.endTime.text = [self.trainQueryVM endTime];
        
        return cell;
    }else if(indexPath.row == 1){
        TrainQueryContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        cell.trainId.text = @"站序";
        cell.stationName.text = @"站名";
        cell.arrivedTime.text = @"到时";
        cell.leaveTime.text = @"发时";
        cell.stay.text = @"停留";
        cell.backgroundColor = [UIColor lightGrayColor];
        
        return cell;
    }else{
     
        TrainQueryContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        cell.trainId.text = [self.trainQueryVM trainIdForRow:indexPath.row-2];
        cell.stationName.text = [self.trainQueryVM stationNameForRow:indexPath.row-2];
        cell.arrivedTime.text = [self.trainQueryVM arrivedTimeForRow:indexPath.row-2];
        cell.leaveTime.text = [self.trainQueryVM leaveTimeForRow:indexPath.row-2];
        cell.stay.text = [self.trainQueryVM stayForRow:indexPath.row-2];
        
        return cell;
    }
 
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 70;
    }else{
    
        return 35;
    }
 
}



@end
