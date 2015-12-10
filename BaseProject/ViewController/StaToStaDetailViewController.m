//
//  StaToStaDetailViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StaToStaDetailViewController.h"
#import "StationToStationCell.h"

#import "Factory.h"

@interface StaToStaDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;

@end




@implementation StaToStaDetailViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[StationToStationCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.left.right.bottom.mas_equalTo(0);
        }];
        
        //头部刷新
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.staToStaVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    
                    if ([self.staToStaVM.reason isEqualToString:@"查询不到火车始发站相关信息"]) {
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
        self.staToStaVM.date = yesterdayStr;
        //重新刷新数据
        [self.tableView.header beginRefreshing];
        
        [self.staToStaVM refreshDataCompletionHandle:^(NSError *error)
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
        
        //加上一天
        NSDate *yesterday = [NSDate dateWithTimeInterval:60*60*24 sinceDate:date];
        
        NSString *tomorrowStr = [formatter stringFromDate:yesterday];
        
        NSLog(@"%@",tomorrowStr);
        
        self.showStr = tomorrowStr;
        
        //self.showStr已经成功改变
        
        //重新修改date的指向
        self.staToStaVM.date = tomorrowStr;
        
        
        //重新刷新数据
        [self.tableView.header beginRefreshing];
        
       
        
        [self.staToStaVM refreshDataCompletionHandle:^(NSError *error)
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
    self.staToStaVM = nil;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.staToStaVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StationToStationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.endStationLb.text = [self.staToStaVM endStationForRow:indexPath.row];
    cell.endStationTypeLb.text = [self.staToStaVM endStationTypeForRow:indexPath.row];
    cell.endTimeLb.text = [self.staToStaVM endTimeForRow:indexPath.row];
    cell.startStationLb.text = [self.staToStaVM startStationForRow:indexPath.row];
    cell.startStationTypeLb.text = [self.staToStaVM startStationTypeForRow:indexPath.row];
    cell.startTimeLb.text = [self.staToStaVM startTimeForRow:indexPath.row];
    cell.runDistanceLb.text = [self.staToStaVM runDisdanceForRow:indexPath.row];
    cell.runTimeLb.text = [self.staToStaVM runTimeForRow:indexPath.row];
    
    cell.trainNOLb.text = [self.staToStaVM trainNOForRow:indexPath.row];
    cell.trainTypeLb.text = [self.staToStaVM trainTypeForRow:indexPath.row];
    
    cell.priceType0Lb.text = [self.staToStaVM priceType0ForRow:indexPath.row];
    cell.price0Lb.text = [self.staToStaVM price0ForRow:indexPath.row];
    
    cell.priceType1Lb.text = [self.staToStaVM priceType1ForRow:indexPath.row];
    cell.price1Lb.text = [self.staToStaVM price1ForRow:indexPath.row];
    
    
    
    
    return cell;
    
}

kRemoveCellSeparator
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
