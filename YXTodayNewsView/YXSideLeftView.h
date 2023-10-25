//
//  YXSideLeftView.h
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/23.
//

#import <UIKit/UIKit.h>
#import "YXMenuItem.h"
#import "YXTodayNewsParam.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXSideLeftView : UIView

@property (nonatomic, strong) id<YXMenuItem> menuItem;
@property (nonatomic, strong) YXTodayNewsParam *param;


@end

NS_ASSUME_NONNULL_END
