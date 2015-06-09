//
//  ShopsViewController.m
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/14/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import "ShopsViewController.h"

@interface ShopsViewController ()

@end

@implementation ShopsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 624)];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
