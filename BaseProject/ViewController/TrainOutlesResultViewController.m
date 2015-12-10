//
//  TrainOutlesResultViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutlesResultViewController.h"
#import "TrainOutletsResultCell.h"
#import "TrainOutlesDetailViewController.h"

#import "Factory.h"
@interface TrainOutlesResultViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@end


@implementation TrainOutlesResultViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TrainOutletsResultCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //头部刷新
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.trainOutletsVM refreshDataCompletionHandle:^(NSError *error) {
                
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    
                     if([self.trainOutletsVM.reason isEqualToString:@"代售点查询参数错误"])
                    {
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeText;//只显示label
                        hud.labelText = @"输入的地址有误,请正确填入地址";
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
       self.navigationController.navigationBar.translucent = NO;
}


#pragma mark - UITableViewDataSourse

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trainOutletsVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrainOutletsResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.xuHao.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.daiShouDian.text = [self.trainOutletsVM agencyNameForRow:indexPath.row];
    cell.diZhi.text = [self.trainOutletsVM addressForRow:indexPath.row];
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
    
}

//去掉没到顶端的分割线
kRemoveCellSeparator

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TrainOutlesDetailViewController *vc = [[TrainOutlesDetailViewController alloc]init];
    
    vc.agencyName = [self.trainOutletsVM agencyNameForRow:indexPath.row];
    vc.address = [self.trainOutletsVM addressForRow:indexPath.row];
    vc.phoneNO = [self.trainOutletsVM phoneNOForRow:indexPath.row];
    vc.startAM = [self.trainOutletsVM startTimeAmForRow:indexPath.row];
    vc.stopAM = [self.trainOutletsVM stopTimeAmForRow:indexPath.row];
    vc.startPM = [self.trainOutletsVM startTimeAmForRow:indexPath.row];
    vc.stopPM = [self.trainOutletsVM stopTimePmForRow:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@%@%@共有%ld个代售点",self.trainOutletsVM.province,self.trainOutletsVM.city,self.trainOutletsVM.county,self.trainOutletsVM.rowNumber ];
    
    return str;
}

@end
