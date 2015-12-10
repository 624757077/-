//
//  TrainQueryViewController.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainQueryViewController.h"

#import "YPCalendarView.h"
#import "NSDate+Extend.h"


#import "TrainQueryDetailViewController.h"
#import "TrainQueryViewModel.h"
@interface TrainQueryViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) YPCalendarView *calendarView;
@property (nonatomic,strong)NSMutableArray *seletedDays;
@property (nonatomic,copy) NSString *showStr;
@property (weak, nonatomic) IBOutlet UIButton *btn;


@property (weak, nonatomic) IBOutlet UITextField *nameTextFile;

@property (nonatomic,strong) TrainQueryViewModel *trainQueryVM;

@end


@implementation TrainQueryViewController
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

- (IBAction)tiaoDaoXiangQingYe:(id)sender {
    
    if (self.nameTextFile.text.length == 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"请填写车次";
        [hud hide:YES afterDelay:2];
    }else{
    
    
    TrainQueryDetailViewController *vc = [[TrainQueryDetailViewController alloc]init];
    
    self.trainQueryVM = [[TrainQueryViewModel alloc]init];
    self.trainQueryVM.name = self.nameTextFile.text;
    self.trainQueryVM.date = self.showStr;
    
    vc.trainQueryVM = self.trainQueryVM;
    vc.showStr = self.showStr;
    
    [self.navigationController pushViewController:vc animated:YES];
    }
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //第一次进来时显示
    if (!_seletedDays) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        self.showStr =[formatter stringFromDate:[NSDate date]];
    }
    

    
    [self.btn setTitle:self.showStr forState:(UIControlStateNormal)];
    
    self.navigationController.navigationBar.translucent = NO;
}


#pragma mark - TextFileDelegate

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.nameTextFile resignFirstResponder];
}

@end
