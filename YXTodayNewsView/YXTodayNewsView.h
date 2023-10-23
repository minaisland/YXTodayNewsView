//
//  YXTodayNewsView.h
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YXMenuItem <NSObject>

@property (nonatomic, copy) NSString *imageUrl;

@end

@interface YXTodayNewsView : UIView

@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) UIColor *sideViewStartColor;
@property (nonatomic, strong) UIColor *sideViewEndColor;
@property (nonatomic, strong) NSDate *date;

- (id)initWithPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
