//
//  QueryTripsDetailViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "QueryTripsDetailViewController.h"
#import "QueryTripsCell.h"
#import "Factory.h"

@interface  QueryTripsDetailViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@end


@implementation QueryTripsDetailViewController


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[QueryTripsCell class] forCellReuseIdentifier:@"QueryCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.left.right.bottom.mas_equalTo(0);
        }];
        
        //头部刷新
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.queryTripsVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    if ([self.queryTripsVM.reason isEqualToString:@"错误的出发站名称"] || [self.queryTripsVM.reason isEqualToString:@"错误的到达站名称"]) {
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeText;//只显示label
                        hud.labelText = @"输入的地址有误";
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



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //调用tableview的懒加载
    [self.tableView.header beginRefreshing];
    
    self.title= @"详情";
    
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
        self.queryTripsVM.date = yesterdayStr;
        //重新刷新数据
        [self.tableView.header beginRefreshing];
        
        [self.queryTripsVM refreshDataCompletionHandle:^(NSError *error)
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
        self.queryTripsVM.date = tomorrowStr;
        //重新刷新数据
        [self.tableView.header beginRefreshing];
        
        [self.queryTripsVM refreshDataCompletionHandle:^(NSError *error)
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
    self.queryTripsVM = nil;
}




#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.queryTripsVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QueryTripsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QueryCell"];
    

    cell.trainNOLb.text = [self.queryTripsVM trainNOForRow:indexPath.row];
    cell.startStationTypeLb.text = @"始";
    cell.startStationLb.text = [self.queryTripsVM startStationForRow:indexPath.row];
    
    cell.runTimeLb.text = [self.queryTripsVM runTimeForRow:indexPath.row];
    
    cell.endStationTypeLb.text = @"终";
    cell.endStationLb.text = [self.queryTripsVM endStationForRow:indexPath.row];
    
    cell.startTimeLb.text = [self.queryTripsVM startTimeForRow:indexPath.row];
    cell.endTimeLb.text = [self.queryTripsVM endTimeForRow:indexPath.row];
    
//    cell.trainTypeLb.text = [self.queryTripsVM trainTypeForRow:indexPath.row];
  
    //判断是不是有这种席别
    NSMutableArray *xiBie = [[NSMutableArray alloc]init];
    if (![[self.queryTripsVM gaoJiRuanWoForRow:indexPath.row] isEqualToString:@"--" ]) {
        NSString *gr = [NSString stringWithFormat:@"高级软卧：%@",[self.queryTripsVM gaoJiRuanWoForRow:indexPath.row]];
        [xiBie addObject:gr];
    }
    
    if (![[self.queryTripsVM qiTaForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *qt = [NSString stringWithFormat:@"其他:%@",[self.queryTripsVM qiTaForRow:indexPath.row]];
        [xiBie addObject:qt];
    }
    
    if (![[self.queryTripsVM ruanWoForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *rw = [NSString stringWithFormat:@"软卧:%@",[self.queryTripsVM ruanWoForRow:indexPath.row]];
        [xiBie addObject:rw];
    }
    
    if (![[self.queryTripsVM ruanZuoForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *rz = [NSString stringWithFormat:@"软座%@",[self.queryTripsVM ruanZuoForRow:indexPath.row]];
        [xiBie addObject:rz];
    }
    
    if (![[self.queryTripsVM teDengZuoForRow:indexPath.row]isEqualToString:@"--"]) {
        NSString *tz = [NSString stringWithFormat:@"特等座:%@",[self.queryTripsVM teDengZuoForRow:indexPath.row]];
        [xiBie addObject:tz];
    }
    
    if (![[self.queryTripsVM wuZuoForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *wz = [NSString stringWithFormat:@"无座:%@",[self.queryTripsVM wuZuoForRow:indexPath.row]];
        [xiBie addObject:wz];
    }
    if (![[self.queryTripsVM yingWoForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *yz = [NSString stringWithFormat:@"硬卧:%@",[self.queryTripsVM yingWoForRow:indexPath.row]];
        [xiBie addObject:yz];
    }
    
    if (![[self.queryTripsVM erDengZuoForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *ze = [NSString stringWithFormat:@"二等座:%@",[self.queryTripsVM erDengZuoForRow:indexPath.row]];
        [xiBie addObject:ze];
    }
    
    if (![[self.queryTripsVM yiDengZuoForRow:indexPath.row] isEqualToString:@"--"]) {
        NSString *zy = [NSString stringWithFormat:@"一等座:%@",[self.queryTripsVM yiDengZuoForRow:indexPath.row]];
        [xiBie addObject:zy];
    }
    
    if (![[self.queryTripsVM shangWuZuoForRow:indexPath.row]isEqualToString:@"--"]) {
        NSString *swz = [NSString stringWithFormat:@"商务座:%@",[self.queryTripsVM shangWuZuoForRow:indexPath.row]];
        [xiBie addObject:swz];
    }
    


   //怎么将数组里面的字符串取出？
    
    if (xiBie.count) {
        cell.xiBie0.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    
    if (xiBie.count) {
        cell.xiBie1.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    
    if (xiBie.count) {
        cell.xiBie2.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    
    if (xiBie.count) {
        cell.xiBie3.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    
    if (xiBie.count) {
        cell.xiBie4.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    
    if (xiBie.count) {
        cell.xiBie5.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    
    if (xiBie.count) {
        cell.xiBie6.text = xiBie[0];
        [xiBie removeObjectAtIndex:0];
    }
    

    return cell;

}


kRemoveCellSeparator
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}





@end
