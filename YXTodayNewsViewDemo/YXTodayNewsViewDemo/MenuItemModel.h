//
//  MenuItemModel.h
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import <Foundation/Foundation.h>
#import <YXTodayNewsView/YXTodayNewsView.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuItemModel : NSObject<YXMenuItem>

@property (nonatomic, copy) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
