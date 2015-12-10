//
//  QueryTripsViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "QueryTripsViewController.h"
#import "YPCalendarView.h"
#import "NSDate+Extend.h"

#import "QueryTripsViewModel.h"
#import "QueryTripsDetailViewController.h"

#import "BackgroundView.h"
#import "TemperatureViewContronller.h"
@interface QueryTripsViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

//与日历有关的变量
@property (nonatomic,strong) YPCalendarView *calendarView;
@property (nonatomic, strong)NSMutableArray *seletedDays;//选择的日期
@property (nonatomic, copy)NSString *showStr;
@property (weak, nonatomic) IBOutlet UIButton *btn;

//@property (weak, nonatomic) IBOutlet UIButton *G;

//pickView有关的变量
@property (nonatomic,strong) BackgroundView *bgView;
@property (nonatomic,strong) NSArray *timeArr;
@property (nonatomic,strong) NSArray *xiBieArr;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIButton *xiBieBtn;
@property (nonatomic,strong) UIPickerView *timePickerView;
@property (nonatomic,strong) UIPickerView *xiBiePickerView;





//与查询有关的变量
@property (weak, nonatomic) IBOutlet UITextField *startStation;
@property (weak, nonatomic) IBOutlet UITextField *endStation;
@property (nonatomic,strong) QueryTripsViewModel *queryTripsVM;


//列车类型的参数
@property (weak, nonatomic) IBOutlet UIButton *all;
@property (weak, nonatomic) IBOutlet UIButton *G;
@property (weak, nonatomic) IBOutlet UIButton *D;
@property (weak, nonatomic) IBOutlet UIButton *T;
@property (weak, nonatomic) IBOutlet UIButton *Z;
@property (weak, nonatomic) IBOutlet UIButton *K;
@property (weak, nonatomic) IBOutlet UIButton *Q;

@property (nonatomic) BOOL gIsChang;
@property (nonatomic) BOOL dIsChang;
@property (nonatomic) BOOL tIsChang;
@property (nonatomic) BOOL zIsChang;
@property (nonatomic) BOOL kIsChang;
@property (nonatomic) BOOL qIsChang;
//用来存储类型
@property (nonatomic,strong) NSMutableString *typeStr;

@end

@implementation QueryTripsViewController
- (IBAction)gotoCalendarView:(id)sender {
    
    if (!_calendarView) {
        self.calendarView = [[YPCalendarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
        [self.view addSubview:self.calendarView];
        
        //返回传值
        __weak typeof(self) weakSelf = self;
        self.calendarView.complete = ^(NSArray *result) {
            if (result) {
                weakSelf.seletedDays = result.mutableCopy;
                
                //修改showStr的值
                NSNumber *inter = weakSelf.seletedDays.firstObject;
                weakSelf.showStr = [NSDate stringWithTimestamp:inter.doubleValue/1000.0     format:@"yyyy-MM-dd"];
                [weakSelf.btn setTitle:weakSelf.showStr forState:(UIControlStateNormal)];
            }
        };
    }
    
    [self.calendarView show];
    self.calendarView.frame = self.view.bounds;
    self.calendarView.defaultDays = _seletedDays;
    
}

-(NSArray *)timeArr
{
    return @[@"00:00-24:00",@"00:00-06:00",@"06:00-12:00",@"12:00-18:00",@"18:00-24:00"];
}

-(NSArray *)xiBieArr
{
    return @[@"不限",@"商务座",@"特等座",@"一等座",@"二等座",@"高级软卧",@"软卧",@"硬卧",@"硬座"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //第一次进来时显示
    if (!_seletedDays) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        self.showStr =[formatter stringFromDate:[NSDate date]];
        self.navigationController.navigationBar.translucent = NO;
    }
    
    
    
    
    [self.btn setTitle:self.showStr forState:(UIControlStateNormal)];
    
    [self type];
    

}

- (IBAction)tiaoDaoXiangQingYe:(id)sender {
    
    if (_startStation.text.length == 0 || _endStation.text.length == 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;//只显示label
        hud.labelText = @"请填写完起始站和终止站";
        [hud hide:YES afterDelay:2];
    }else{
    
    QueryTripsDetailViewController *vc = [[QueryTripsDetailViewController alloc]init];
    
    self.queryTripsVM = [QueryTripsViewModel new];
    self.queryTripsVM.startStation = self.startStation.text;
    self.queryTripsVM.endStation = self.endStation.text;
    self.queryTripsVM.date = self.showStr;
    self.queryTripsVM.type = self.typeStr;
    
    vc.queryTripsVM = self.queryTripsVM;
    vc.showStr = self.showStr;
    [self.navigationController pushViewController:vc animated:YES];
    }
}


//显示出发时间pickerView
- (IBAction)gotoTimeView:(id)sender {
    self.bgView.hidden = NO;
    if (!_bgView) {
        self.bgView = [[BackgroundView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:self.bgView];
    }
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(280);
    }];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
   
    [contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.right.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    
    
    
    self.timePickerView = [[UIPickerView alloc]init];
    self.timePickerView.delegate = self;
    self.timePickerView.dataSource = self;
    [contentView addSubview:self.timePickerView];
    [self.timePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(35);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
  
    
    
    [btn bk_addEventHandler:^(id sender) {
        self.bgView.hidden = YES;
        //怎么将选中的值传给btn
        NSInteger row = [self.timePickerView selectedRowInComponent:0];
        NSString *str = [self.timeArr objectAtIndex:row];
        self.timeBtn.titleLabel.text = str;
        
    } forControlEvents:UIControlEventTouchUpInside];
    
}


//跳转到席别
- (IBAction)gotoXiBie:(id)sender {
    
    self.bgView.hidden = NO;
    if (!_bgView) {
        self.bgView = [[BackgroundView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:self.bgView];
    }
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(280);
    }];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    
    [contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.right.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    
    
    
    self.xiBiePickerView = [[UIPickerView alloc]init];
    self.xiBiePickerView.delegate = self;
    self.xiBiePickerView.dataSource = self;
    [contentView addSubview:self.xiBiePickerView];
    [self.xiBiePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(35);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    
    [btn bk_addEventHandler:^(id sender) {
        self.bgView.hidden = YES;
        //怎么将选中的值传给btn
        NSInteger row = [self.xiBiePickerView selectedRowInComponent:0];
        NSString *str = [self.xiBieArr objectAtIndex:row];
        self.xiBieBtn.titleLabel.text = str;
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    

}


//判断能不能跳转
//-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    if (_startStation.text.length == 0 || _endStation.text.length == 0) {
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.mode = MBProgressHUDModeText;//只显示label
//        hud.labelText = @"请填写完起始站和终止站";
//        [hud hide:YES afterDelay:2];
//        return NO;
//    }
//    return YES;
//
//}



-(void)type
{
    //初始化
    self.gIsChang = NO;
    self.dIsChang = NO;
    self.tIsChang = NO;
    self.zIsChang = NO;
    self.kIsChang = NO;
    self.qIsChang = NO;
    
    [self.all setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
    [self.G setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
    [self.D setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
    [self.T  setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
    [self.Z setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
    [self.K setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
    [self.Q setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
    
    //判断all
    [self.all bk_addEventHandler:^(id sender) {
        self.typeStr = nil;
        
        self.gIsChang = NO;
        self.dIsChang = NO;
        self.tIsChang = NO;
        self.zIsChang = NO;
        self.kIsChang = NO;
        self.qIsChang = NO;
        
        [self.all setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
        [self.G setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
        [self.D setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
        [self.T  setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
        [self.Z setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
        [self.K setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
        [self.Q setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
        
        NSLog(@"%@",self.typeStr);
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    //判断G
    [self.G bk_addEventHandler:^(id sender) {
        
        self.gIsChang = !self.gIsChang;
        if (self.gIsChang) {
            
            [self.G setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
            self.typeStr = [[self.typeStr stringByAppendingString:@"G"] copy];
            [self.all setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            NSLog(@"%@",self.typeStr);
        }else{
            [self.G setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            //删除掉某个字符串中的某个字符
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"G"];
            self.typeStr = [[self.typeStr stringByTrimmingCharactersInSet:set]copy];
            NSLog(@"%@",self.typeStr);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    //判断D
    [self.D bk_addEventHandler:^(id sender) {
        self.dIsChang = !self.dIsChang;
        if (self.dIsChang) {
            [self.D setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
            [self.all setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            self.typeStr = [[self.typeStr stringByAppendingString:@"D"] copy];
            NSLog(@"%@",self.typeStr);
        }else{
            [self.D setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            
            //删除掉某个字符串中的某个字符
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"D"];
            self.typeStr = [[self.typeStr stringByTrimmingCharactersInSet:set]copy];
            NSLog(@"%@",self.typeStr);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    //判断T
    [self.T bk_addEventHandler:^(id sender) {
        self.tIsChang = !self.tIsChang;
        if (self.tIsChang) {
            [self.T setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
            self.typeStr = [[self.typeStr stringByAppendingString:@"T"] copy];
            [self.all setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            NSLog(@"%@",self.typeStr);
        }else{
            [self.T setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            
            //删除掉某个字符串中的某个字符
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"T"];
            self.typeStr = [[self.typeStr stringByTrimmingCharactersInSet:set]copy];
            NSLog(@"%@",self.typeStr);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    //删除某个字符串
    [self.Z bk_addEventHandler:^(id sender) {
        self.zIsChang = !self.zIsChang;
        if (self.zIsChang) {
            [self.Z setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
            self.typeStr = [[self.typeStr stringByAppendingString:@"Z"] copy];
            [self.all setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            NSLog(@"%@",self.typeStr);
        }else{
            [self.Z setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            
            //删除掉某个字符串中的某个字符
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"Z"];
            self.typeStr = [[self.typeStr stringByTrimmingCharactersInSet:set]copy];
            NSLog(@"%@",self.typeStr);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.K bk_addEventHandler:^(id sender) {
        self.kIsChang = !self.kIsChang;
        if (self.kIsChang) {
            [self.K setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
            self.typeStr = [[self.typeStr stringByAppendingString:@"K"] copy];
            [self.all setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            NSLog(@"%@",self.typeStr);
        }else{
            [self.K setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            
            //删除掉某个字符串中的某个字符
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"K"];
            self.typeStr = [[self.typeStr stringByTrimmingCharactersInSet:set]copy];
            NSLog(@"%@",self.typeStr);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.Q bk_addEventHandler:^(id sender) {
        self.qIsChang = !self.qIsChang;
        if (self.qIsChang) {
            [self.Q setBackgroundImage:[UIImage imageNamed:@"btn2"] forState:UIControlStateNormal];
            self.typeStr = [[self.typeStr stringByAppendingString:@"Q"] copy];
            [self.all setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            NSLog(@"%@",self.typeStr);
        }else{
            [self.Q setBackgroundImage:[UIImage imageNamed:@"btn1"] forState:UIControlStateNormal];
            
            //删除掉某个字符串中的某个字符
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"Q"];
            self.typeStr = [[self.typeStr stringByTrimmingCharactersInSet:set]copy];
            NSLog(@"%@",self.typeStr);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
}

-(NSMutableString *)typeStr
{
    if (!_typeStr) {
        _typeStr = [[NSMutableString alloc]init];
    }
    return _typeStr;
}


#pragma  mark - pickerViewDataSourse

//有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  
    return 1;
}

//有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerView == self.timePickerView) {
       return self.timeArr.count;
    }
    else
        return self.xiBieArr.count;
    
}

//每行的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (pickerView == self.timePickerView) {
        return self.timeArr[row];
    }
    return self.xiBieArr[row];
}

- (IBAction)chaXunQiShiZhanTianQi:(id)sender {
    
    if (self.startStation.text.length == 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;//只显示label
        hud.labelText = @"请填入城市名";
        [hud hide:YES afterDelay:2];
    }else{
        
        TemperatureViewContronller *vc = [[TemperatureViewContronller alloc]init];
        vc.cityName = self.startStation.text;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)ChaXunZhongDianZhanTianQi:(id)sender {
    
    if (self.endStation.text.length == 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;//只显示label
        hud.labelText = @"请填入城市名";
        [hud hide:YES afterDelay:2];
    }else{
        
        TemperatureViewContronller *vc = [[TemperatureViewContronller alloc]init];
        vc.cityName = self.endStation.text;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - TextFileDelegate

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.startStation resignFirstResponder];
    [self.endStation resignFirstResponder];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
