//
//  YXTodayNewsParam.m
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/24.
//

#import "YXTodayNewsParam.h"
#import "UIView+YXExtension.h"

@implementation YXTodayNewsParam

YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,                yxSideLeftTitleFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,                yxSideLeftTitleColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,                yxSideLeftSubTitleFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,                yxSideLeftSubTitleColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,                yxSideLeftNameFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,                yxSideLeftNameColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,                yxSideLeftYearFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,                yxSideLeftDateSlashFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,                yxSideLeftMonthdayFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,                yxSideLeftDateColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,                yxSideRightStartColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,                yxSideRightEndColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, NSShadow*,                yxTextShadow)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, CGFloat,                yxSideLeftMonthdayBaselineOffset)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, CGFloat,                yxSideLeftSubTitleBottomMargin)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, CGFloat,               yxSideLeftAvatarBottomMargin)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, CGFloat,               yxSideLeftAvatarWidth)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIFont*,               yxSideLeftLikeTitleFont)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIColor*,               yxSideLeftLikeTitleColor)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, UIEdgeInsets,               yxSideLeftLikeTitleInsets)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, NSString *,               yxSideRightBottomTitle)
YXTodayNewsPagePropSetFuncImplementation(YXTodayNewsParam, CGFloat,               yxLeftRightPadding)

+ (YXTodayNewsParam *)defaultParam {
    return [YXTodayNewsParam new];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _yxSideLeftTitleFont = kBoldFont(18);
        _yxSideRightStartColor = [UIColor colorWithRed:248/255.0 green:220/255.0 blue:35/255.0 alpha:1.0];
        _yxSideRightEndColor = [UIColor colorWithRed:255/255.0 green:127/255.0 blue:4/255.0 alpha:1.0];
        
        _yxSideLeftSubTitleFont = kBoldFont(15);
        _yxSideLeftNameFont = kMediumFont(12);
        _yxSideLeftYearFont = kMediumFont(8.5);
        _yxSideLeftMonthdayFont = kMediumFont(20);
        _yxSideLeftDateSlashFont = kMediumFont(12);
        
        _yxSideLeftMonthdayBaselineOffset = 0;
        _yxSideLeftSubTitleBottomMargin = 44.0f;
        
        _yxSideLeftAvatarBottomMargin = 15.0f;
        _yxSideLeftAvatarWidth = 24.0f;
        
        _yxSideLeftLikeTitleFont = kMediumFont(12);
        _yxSideLeftLikeTitleInsets = UIEdgeInsetsZero;
        /// 统一白色
        _yxSideLeftLikeTitleColor = _yxSideLeftTitleColor = _yxSideLeftSubTitleColor = _yxSideLeftNameColor = _yxSideLeftDateColor = [UIColor whiteColor];
        
        _yxSideRightBottomTitle = @"回顾";
        
        _yxLeftRightPadding = 5.0f;
        
        _yxTextShadow = [self defaultTextShadow];
    }
    return self;
}

- (NSShadow *)defaultTextShadow {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowBlurRadius = 4;
    shadow.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    shadow.shadowOffset = CGSizeMake(0,2);
    return shadow;
}

@end
