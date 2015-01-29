//
//  JsAndNativeViewController.m
//  PODSDemo
//
//  Created by ouok on 12/25/14.
//  Copyright (c) 2014 ouok. All rights reserved.
//

#import "JsAndNativeViewController.h"

@interface JsAndNativeViewController ()

@end

@implementation JsAndNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *warningLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30)];
    warningLabel.text = @"这里是Js call Native后跳转出来的页面";
    warningLabel.textColor = [UIColor blackColor];
    warningLabel.numberOfLines = 0;
    warningLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:warningLabel];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 20)];
    [backButton addTarget:self action:@selector(backButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - buttonEvents
- (void)backButtonPress:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
