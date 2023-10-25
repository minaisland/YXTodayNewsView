//
//  YXTodayNewsView.h
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import <UIKit/UIKit.h>
#import "YXMenuItem.h"
#import "YXSideLeftView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXTodayNewsView : UIView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) YXTodayNewsParam *param;

- (id)initWithPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
