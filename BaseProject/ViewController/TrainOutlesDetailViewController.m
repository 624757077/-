//
//  TrainOutlesDetailViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutlesDetailViewController.h"
#import "TrainOutlesDetailCell.h"

#import "Factory.h"

@interface TrainOutlesDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation TrainOutlesDetailViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FristCell"];
        [_tableView registerClass:[TrainOutlesDetailCell class] forCellReuseIdentifier:@"TwoCell"];
    }
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    return _tableView;
}


-(void)viewDidLoad
{
    self.tableView.hidden = NO;
    [Factory addBackItemToVC:self];
    self.navigationController.navigationBar.translucent = NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FristCell"];
        cell.textLabel.text = self.agencyName;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.userInteractionEnabled = NO;
        return cell;
        
    }else{
        TrainOutlesDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwoCell"];
        cell.address.text = [NSString stringWithFormat:@"地址：%@",self.address];
        cell.phoneON.text = [NSString stringWithFormat:@"电话：%@",self.phoneNO];
        cell.yingYeShiJian.text = @"营业时间：";
        cell.shangWu.text = [NSString stringWithFormat:@"上午 %@--%@",self.startAM,self.stopAM];
        cell.xiaWu.text = [NSString stringWithFormat:@"下午 %@--%@",self.startPM,self.stopPM];
        cell.userInteractionEnabled = NO;
        return cell;
    }
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }else{
        return 80;
    }
}


@end
