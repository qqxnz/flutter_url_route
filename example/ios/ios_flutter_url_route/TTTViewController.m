//
//  TTTViewController.m
//  FlutterDemo
//
//  Created by lv on 2019/10/17.
//  Copyright © 2019 lvfumei. All rights reserved.
//

#import "TTTViewController.h"

@interface TTTViewController ()

@end

@implementation TTTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NativeTest";
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    lab.text = @"NativeTest";
    [lab setTextColor:[UIColor orangeColor]];
    
    [self.view addSubview:lab];;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    
}


-(void)btnClicked{
    [self.navigationController popViewControllerAnimated:YES];
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
