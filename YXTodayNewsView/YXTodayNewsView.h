//
//  YXTodayNewsView.h
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import <UIKit/UIKit.h>
#import "YXMenuItem.h"
#import "YXSideLeftView.h"

@class YXTodayNewsView;

NS_ASSUME_NONNULL_BEGIN

@protocol YXTodayNewsViewDelegate <NSObject>

@optional
- (void)todayNewsView:(YXTodayNewsView *)todayNewsView avatarViewOnPressWithItem:(id<YXMenuItem>)item;
- (void)todayNewsView:(YXTodayNewsView *)todayNewsView likeBtnOnPress:(UIButton*)btn item:(id<YXMenuItem>)item;
- (void)todayNewsView:(YXTodayNewsView *)todayNewsView sideLeftViewOnTapWithItem:(id<YXMenuItem>)item;
- (void)todayNewsView:(YXTodayNewsView *)todayNewsView sideRightBottomBtnOnPress:(UIButton *)btn;

@end

@interface YXTodayNewsView : UIView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) YXTodayNewsParam *param;
@property (nonatomic, weak) id<YXTodayNewsViewDelegate> delegate;

- (id)initWithPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
