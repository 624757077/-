//
//  BackgroundView.m
//  BaseProject
//
//  Created by apple-jd32 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        view.alpha = 0.3;
        view.backgroundColor = [UIColor blackColor];
        [self addSubview:view];
        
    }
    return self;
}


@end
