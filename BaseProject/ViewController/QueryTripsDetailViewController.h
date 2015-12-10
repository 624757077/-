//
//  QueryTripsDetailViewController.h
//  BaseProject
//
//  Created by apple-jd32 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueryTripsViewModel.h"

@interface QueryTripsDetailViewController : UIViewController

@property (nonatomic,strong)QueryTripsViewModel *queryTripsVM;

@property (nonatomic, copy)NSString *showStr;

@end
