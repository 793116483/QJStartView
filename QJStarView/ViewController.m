//
//  ViewController.m
//  QJStarView
//
//  Created by 瞿杰 on 2017/4/20.
//  Copyright © 2017年 yiniu. All rights reserved.
//

#import "ViewController.h"

#import "QJStartView.h"

@interface ViewController ()

@property (nonatomic , strong) QJStartView * startView ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.startView = [[QJStartView alloc] init];
    self.startView.frame = CGRectMake(100, 100, 40, 40);
    
    self.startView.starImageNameNormal = @"icon_StarNo_22";
    self.startView.starImageNameSelection = @"icon_Star_22";
    self.startView.selectionProgress = 0.4 ;
    
    [self.view addSubview:self.startView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
