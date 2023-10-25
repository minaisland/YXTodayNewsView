//
//  MenuItemModel.h
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

#import <Foundation/Foundation.h>
#import <YXTodayNewsView/YXMenuItem.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuItemModel : NSObject<YXMenuItem>

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *avatarUrl;

@end

NS_ASSUME_NONNULL_END
