//
//  GARLViewController.m
//  GARespondableLableDemo
//
//  Created by GikkiAres on 2016/11/17.
//  Copyright © 2016年 Explorer. All rights reserved.
//

#import "GARLViewController.h"
#import "GARespondableLabel.h"


@interface GARLViewController ()<
GARespondableLabelDelegate
>
@property (weak, nonatomic) IBOutlet GARespondableLabel *lb;

@end

@implementation GARLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lb.delegate = self;
    _lb.inputView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _lb.inputView.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gaRespondableLabelClicked:(GARespondableLabel *)label {
    _lb.text = @"你点击了哦";
}

@end
