//
//  TemperatureViewContronller.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TemperatureViewContronller.h"
#import "Factory.h"
#import "TempHeadCell.h"
#import "TempCell.h"
@interface TemperatureViewContronller ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) TemperatureViewModel *temperatureVM;

@end



@implementation TemperatureViewContronller

-(TemperatureViewModel *)temperatureVM
{
    if (!_temperatureVM) {
        _temperatureVM = [[TemperatureViewModel alloc]init];
    }
    _temperatureVM.cityname = self.cityName;
    return _temperatureVM;
}



-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[TempHeadCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[TempCell class] forCellReuseIdentifier:@"TempCell"];
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [self.temperatureVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                       [self showErrorMsg:error.localizedDescription];
                }else{
                    
                    if ([self.temperatureVM.reason isEqualToString:@"查询不到该城市的信息"]) {
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeText;
                        hud.labelText = @"输入的城市名错误";
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
   
    
    [Factory addBackItemToVC:self];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.temperatureVM.rowNumber+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
    TempHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.temp.text = [self.temperatureVM temp];
    cell.wind.text = [NSString stringWithFormat:@"%@风力%@",[self.temperatureVM windDirection],[self.temperatureVM windStrength]];
    cell.humidity.text = [NSString stringWithFormat:@"湿度：%@",[self.temperatureVM humidity]];
    cell.time.text = [NSString stringWithFormat:@"%@ 发布",[self.temperatureVM time]];
    
    
    cell.todayTemp.text = [NSString stringWithFormat:@"今日温度：%@",[self.temperatureVM temperature]];
    cell.weather.text = [self.temperatureVM weather];
    cell.traveIndex.text = [NSString stringWithFormat:@"旅游指数：%@",[self.temperatureVM travelIndex]];
    cell.uvIndex.text = [NSString stringWithFormat:@"紫外线强度：%@",[self.temperatureVM uvIndex]];
    cell.dressing.text = [NSString stringWithFormat:@"天气情况:%@",[self.temperatureVM dressing]];
    cell.dressingAdvice.text = [NSString stringWithFormat:@"穿衣建议：%@",[self.temperatureVM dressingAdvice]];
    
    return cell;
    }else{
        TempCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TempCell"];
        cell.week.text = [self.temperatureVM weekForRow:indexPath.row-1];
        cell.temperature.text = [self.temperatureVM temperatureForRow:indexPath.row-1];
        cell.weather.text = [self.temperatureVM weatherForRow:indexPath.row-1];
        cell.date.text = [self.temperatureVM dateForRow:indexPath.row-1];
        return cell;
        
    }
 
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 400;
    }else{
        return 40;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return self.temperatureVM.cityname;
}


@end
