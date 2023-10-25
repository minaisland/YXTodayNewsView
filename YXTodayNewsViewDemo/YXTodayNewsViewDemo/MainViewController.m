//
//  ViewController.m
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import "MainViewController.h"
#import <YXTodayNewsView/YXTodayNewsView.h>
#import <YXTodayNewsViewDemo-Swift.h>

@interface MainViewController ()<YXTodayNewsViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YXTodayNewsView *v = [[YXTodayNewsView alloc] initWithPoint:CGPointMake(0, 200)];
    v.param
        .yxSideLeftYearFontSet([UIFont fontWithName:@"Oswald-Medium" size:8.5])
        .yxSideLeftMonthdayFontSet([UIFont fontWithName:@"Oswald-Medium" size:20])
        .yxSideLeftDateSlashFontSet([UIFont fontWithName:@"Oswald-Medium" size:12])
        .yxSideLeftMonthdaybaselineOffsetSet(1.0f);
    v.dataArray = [FakeryHelper shared].menuItemArray;
    v.delegate = self;
    [self.view addSubview:v];
    // Do any additional setup after loading the view.
}

- (void)todayNewsView:(YXTodayNewsView *)todayNewsView avatarViewOnPressWithItem:(id<YXMenuItem>)item {
    NSLog(@"%@", item);
}


@end
