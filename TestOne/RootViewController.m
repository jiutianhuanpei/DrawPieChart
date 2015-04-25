//
//  RootViewController.m
//  TestOne
//
//  Created by 张国栋 on 15/4/25.
//  Copyright (c) 2015年 JiangXi University. All rights reserved.
//

#import "RootViewController.h"
#import "DrawView.h"

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.bounds];
    drawView.center = self.view.center;
    [self.view addSubview:drawView];
    
}

@end
