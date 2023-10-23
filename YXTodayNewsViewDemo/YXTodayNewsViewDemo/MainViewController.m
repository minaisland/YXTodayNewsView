//
//  ViewController.m
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import "MainViewController.h"
#import <YXTodayNewsView/YXTodayNewsView.h>
#import <YXTodayNewsViewDemo-Swift.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YXTodayNewsView *v = [[YXTodayNewsView alloc] initWithPoint:CGPointMake(0, 200)];
    v.date = [NSDate date];
    v.coverUrl = [FakeryHelper shared].image;
    v.menuItems = [FakeryHelper shared].menuItemArray;
    [self.view addSubview:v];
    // Do any additional setup after loading the view.
}


@end
