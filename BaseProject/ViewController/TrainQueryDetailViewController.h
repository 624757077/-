//
//  TrainQueryDetailViewController.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrainQueryViewModel.h"
@interface TrainQueryDetailViewController : UIViewController

@property (nonatomic,strong) TrainQueryViewModel *trainQueryVM;
@property (nonatomic,strong) NSString *showStr;

@end
