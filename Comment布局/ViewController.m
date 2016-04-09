//
//  ViewController.m
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import "ViewController.h"
#import "CommentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 50);
    [button setTitle:@"进入评论界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(enterComment) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)enterComment {
    CommentViewController *commentVC = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:commentVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
