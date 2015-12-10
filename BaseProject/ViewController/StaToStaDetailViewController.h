//
//  StaToStaDetailViewController.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StationToStationViewModel.h"
@interface StaToStaDetailViewController : UIViewController

@property (nonatomic,strong)StationToStationViewModel *staToStaVM;
@property (nonatomic,strong)NSString *showStr;

@end
