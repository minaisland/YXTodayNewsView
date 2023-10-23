//
//  ViewController.m
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import "MainViewController.h"
#import <YXTodayNewsView/YXTodayNewsView.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YXTodayNewsView *v = [[YXTodayNewsView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:v];
    // Do any additional setup after loading the view.
}


@end
