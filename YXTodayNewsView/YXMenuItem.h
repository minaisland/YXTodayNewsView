//
//  YXMenuItem.h
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YXMenuItem <NSObject>

@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subTitle;
@property (nonatomic, readonly) NSString *avatarUrl;
@property (nonatomic, readonly) NSString *imageUrl;

- (NSString *)title;
- (NSString *)subTitle;
- (NSString *)avatarUrl;
- (NSString *)imageUrl;
- (NSDate *)date;

@end

NS_ASSUME_NONNULL_END
