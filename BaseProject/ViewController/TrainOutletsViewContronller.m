//
//  TrainOutletsViewContronller.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TrainOutletsViewContronller.h"
#import "TrainOutletsViewModel.h"
#import "TrainOutlesResultViewController.h"
@interface  TrainOutletsViewContronller()<UITextFieldDelegate>

@property (nonatomic,strong)TrainOutletsViewModel *trainOueryVM;
@property (weak, nonatomic) IBOutlet UITextField *proviceTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *countTF;

@end


@implementation TrainOutletsViewContronller

- (IBAction)tiaoZhuanDaoXiangQing:(id)sender {
    
    if (self.proviceTF.text.length == 0 || self.cityTF.text.length == 0 ) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //只显示Label
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"请填写完整的省，市";
        [hud hide:YES afterDelay:2];
    }else{
    
    TrainOutlesResultViewController *vc = [[TrainOutlesResultViewController alloc]init];
    
    self.trainOueryVM = [TrainOutletsViewModel new];
    self.trainOueryVM.province = self.proviceTF.text;
    self.trainOueryVM.city = self.cityTF.text;
    self.trainOueryVM.county = self.countTF.text;
    
    vc.trainOutletsVM  = self.trainOueryVM;
    [self.navigationController pushViewController:vc animated:YES];
    }
}
-(void)viewDidLoad
{
    
    self.title = @"代售点查询";
       self.navigationController.navigationBar.translucent = NO;
}


#pragma mark - TextFileDelegate

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.proviceTF resignFirstResponder];
    [self.cityTF resignFirstResponder];
    [self.countTF resignFirstResponder];
}

@end
