//
//  ViewController.m
//  YJViewInheritDemo
//
//  Created by Alex on 2016/10/11.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import "ViewController.h"
#import "ChildView.h"
#import "UIView+YJInheritAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChildView *cView = [[ChildView alloc] initWithSuperView];
    cView.lblText.text = @"test";
    [self.view addSubview:cView];
    [cView customMethod];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
