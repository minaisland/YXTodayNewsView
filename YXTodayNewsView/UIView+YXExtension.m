//
//  UIView+YXExtension.m
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/23.
//

#import "UIView+YXExtension.h"

@implementation UIView (YXExtension)

- (CGFloat)yx_height
{
    return self.frame.size.height;
}

- (void)setYx_height:(CGFloat)yx_height
{
    CGRect temp = self.frame;
    temp.size.height = yx_height;
    self.frame = temp;
}

- (CGFloat)yx_width
{
    return self.frame.size.width;
}

- (void)setYx_width:(CGFloat)yx_width
{
    CGRect temp = self.frame;
    temp.size.width = yx_width;
    self.frame = temp;
}

- (CGFloat)yx_y
{
    return self.frame.origin.y;
}

- (void)setYx_y:(CGFloat)yx_y
{
    CGRect temp = self.frame;
    temp.origin.y = yx_y;
    self.frame = temp;
}

- (CGFloat)yx_x
{
    return self.frame.origin.x;
}

- (void)setYx_x:(CGFloat)yx_x
{
    CGRect temp = self.frame;
    temp.origin.x = yx_x;
    self.frame = temp;
}

- (void)setYx_cornerRadius:(CGFloat)yx_cornerRadius
{
    self.layer.cornerRadius = yx_cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)yx_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)yx_setRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *maskPath = [UIBezierPath
        bezierPathWithRoundedRect:self.bounds
        byRoundingCorners:corners
        cornerRadii:CGSizeMake(cornerRadius, cornerRadius)
    ];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
