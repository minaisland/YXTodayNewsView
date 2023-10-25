//
//  UIView+YXExtension.h
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/23.
//

#import <UIKit/UIKit.h>

//屏幕宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//通用边距
#define kGeneralPadding 5.0f

#define kFont(fontSize) [UIFont systemFontOfSize:fontSize]

#define kMediumFont(fontSize) [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize]

#define kBoldFont(fontSize) [UIFont boldSystemFontOfSize:fontSize]

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YXExtension)

/** 设置圆角 */
@property (nonatomic) CGFloat yx_cornerRadius;

@property (nonatomic, assign) CGFloat yx_height;
@property (nonatomic, assign) CGFloat yx_width;

@property (nonatomic, assign) CGFloat yx_y;
@property (nonatomic, assign) CGFloat yx_x;

@end

NS_ASSUME_NONNULL_END
