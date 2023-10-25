//
//  YXTodayNewsParam.h
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/24.
//

#import <Foundation/Foundation.h>

#define YXTodayNewsPropStatementAndPropSetFuncStatement(propertyModifier,className, propertyPointerType, propertyName)           \
@property(nonatomic,propertyModifier)propertyPointerType  propertyName;                                                 \
- (className * (^) (propertyPointerType propertyName)) propertyName##Set;


#define YXTodayNewsPagePropSetFuncImplementation(className, propertyPointerType, propertyName)                                       \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{                                                \
return ^(propertyPointerType propertyName) {                                                                            \
self->_##propertyName = propertyName;                                                                                   \
return self;                                                                                                            \
};                                                                                                                      \
}

NS_ASSUME_NONNULL_BEGIN

@interface YXTodayNewsParam : NSObject

/// 大标题字体 default [UIFont 18]
YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIFont*,               yxSideLeftTitleFont)
/// 大标题字体颜色 default [whiteColor]
YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIColor*,               yxSideLeftTitleColor)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIFont*,               yxSideLeftSubTitleFont)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIColor*,               yxSideLeftSubTitleColor)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIFont*,               yxSideLeftNameFont)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIColor*,               yxSideLeftNameColor)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIFont*,               yxSideLeftYearFont)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIFont*,               yxSideLeftMonthdayFont)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIFont*,               yxSideLeftDateSlashFont)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIColor*,               yxSideLeftDateColor)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIColor*,               yxSideRightStartColor)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, UIColor*,               yxSideRightEndColor)

YXTodayNewsPropStatementAndPropSetFuncStatement(strong, YXTodayNewsParam, NSShadow*,               yxTextShadow)

YXTodayNewsPropStatementAndPropSetFuncStatement(assign, YXTodayNewsParam, CGFloat,               yxSideLeftMonthdaybaselineOffset)

YXTodayNewsPropStatementAndPropSetFuncStatement(assign, YXTodayNewsParam, CGFloat,               yxSideLeftSubTitleBottomMargin)

/// 头像底部边距
YXTodayNewsPropStatementAndPropSetFuncStatement(assign, YXTodayNewsParam, CGFloat,               yxSideLeftAvatarBottomMargin)

// 头像大小
YXTodayNewsPropStatementAndPropSetFuncStatement(assign, YXTodayNewsParam, CGFloat,               yxSideLeftAvatarWidth)

+ (instancetype)defaultParam;

@end



NS_ASSUME_NONNULL_END
