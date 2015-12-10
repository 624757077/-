//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

#import "QueryTripsNetManager.h"
#import "StationStationNetMannager.h"
#import "TrainQueryNetMannager.h"
#import "TrainOutletsNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];


    
    //查询车次数据连接成功
//    [QueryTripsNetManager getQueryTripsWithStart:@"广州" end:@"南宁" traintType:@"G" date:@"2015-11-20" completionHandle:^(QueryTripsModel *model, NSError *error) {
//        NSLog(@"hehe");
//    }];
 
    //查询票价成功
//    [StationStationNetMannager getStationToStationWithStart:@"广州" end:@"南宁" traintType:@"" date:@"2015-11-25" completionHandle:^(StationToStationModel *model, NSError *error) {
//        NSLog(@"la");
//    }];
    
    //车次查询成功
//    [TrainQueryNetMannager getTrainQueryWithName:@"G4" date:@"2015-11-24" completionHandle:^(TrainQueryModel *model, NSError *error) {
//        NSLog(@"hehe");
//    }];
    
    
//    [TrainOutletsNetManager getTrainOutletsWithProvice:@"广东" city:@"广州" county:@"番禺区" completionHandle:^(TrainOutletsModel *model, NSError *error) {
//        NSLog(@"");
//    }];
    
   
    
    return YES;

}

@end
