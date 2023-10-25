//
//  YXSideLeftView.m
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/23.
//

#import "YXSideLeftView.h"
#import "UIView+YXExtension.h"
#import <SDWebImage/SDWebImage.h>

@interface YXSideLeftView()

@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UILabel *monthdayLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation YXSideLeftView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.yearLabel = [self createLabel];
    self.monthdayLabel = [self createLabel];
    self.titleLabel = [self createLabel];
    self.subTitleLabel = [self createLabel];
}

- (void)setMenuItem:(id<YXMenuItem>)menuItem {
    _menuItem = menuItem;
    [self setDate:menuItem.date];
    [self setTitle:menuItem.title];
    [self setSubTitle:menuItem.subTitle];
    [self setAvatarUrl:menuItem.avatarUrl];
}

- (void)setDate:(NSDate *)date {
    self.yearLabel.attributedText = [self createAttributedString:[self dateStringFromFormat:@"yyyy"] font:self.param.yxSideLeftYearFont textColor:self.param.yxSideLeftDateColor];
    self.yearLabel.transform = CGAffineTransformMakeRotation(M_PI*90.0f/180.0);
    self.yearLabel.frame = CGRectMake(14, 15, 15, 22);
    self.yearLabel.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:[self dateStringFromFormat:@"MM/dd"]];
    NSDictionary *attrs = @{NSFontAttributeName: self.param.yxSideLeftMonthdayFont,NSForegroundColorAttributeName: self.param.yxSideLeftDateColor, NSShadowAttributeName: self.param.yxTextShadow, NSBaselineOffsetAttributeName: @(self.param.yxSideLeftMonthdaybaselineOffset)};
    [mutStr addAttributes:attrs range:NSMakeRange(0, 2)];
    [mutStr addAttributes:@{NSFontAttributeName: self.param.yxSideLeftDateSlashFont,NSForegroundColorAttributeName: self.param.yxSideLeftDateColor, NSShadowAttributeName: self.param.yxTextShadow, NSBaselineOffsetAttributeName: @(self.param.yxSideLeftMonthdaybaselineOffset)} range:NSMakeRange(2, 1)];
    [mutStr addAttributes:attrs range:NSMakeRange(3, 2)];
    
    self.monthdayLabel.attributedText = mutStr;
    [self.monthdayLabel sizeToFit];
    self.monthdayLabel.yx_x = self.yearLabel.yx_x + self.yearLabel.yx_width;
    self.monthdayLabel.yx_y = (self.yearLabel.yx_y*2 + self.yearLabel.yx_height - self.monthdayLabel.yx_height)/2;
    
    if (!self.lineView.superview) {
        self.lineView.yx_y = (self.yearLabel.yx_y*2 + self.yearLabel.yx_height - self.lineView.yx_height)/2;
        [self addSubview:self.lineView];
    }
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.attributedText = [self createAttributedString:title font:self.param.yxSideLeftTitleFont textColor:self.param.yxSideLeftTitleColor];
    [self.titleLabel sizeToFit];
    self.titleLabel.yx_y = (self.yearLabel.yx_y*2 + self.yearLabel.yx_height - self.titleLabel.yx_height)/2;
    self.titleLabel.yx_x = 85.f/375*kScreenWidth;
}

- (void)setSubTitle:(NSString *)subTitle {
    self.subTitleLabel.attributedText = [self createAttributedString:subTitle font:self.param.yxSideLeftSubTitleFont textColor:self.param.yxSideLeftSubTitleColor];
    CGSize size = [self.subTitleLabel sizeThatFits:CGSizeMake(210, 20)];
    self.subTitleLabel.frame = CGRectMake(14, self.yx_height-self.param.yxSideLeftSubTitleBottomMargin-size.height, size.width, size.height);
}

- (void)setAvatarUrl:(NSString *)url {
    self.avatarView.frame = CGRectMake(14, self.yx_height-30, 24, 24);
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(75.f/375*kScreenWidth, 18, 2, 14)];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _lineView.bounds;
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
        gradientLayer.colors = @[(__bridge id)self.param.yxSideRightStartColor.CGColor,
                                     (__bridge id)self.param.yxSideRightEndColor.CGColor];
        gradientLayer.locations = @[@(0.5f), @(1.0f)];

        [_lineView.layer addSublayer:gradientLayer];
    }
    return _lineView;
}

- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.yx_cornerRadius = 12.0f;
        [self addSubview:_avatarView];
    }
    return _avatarView;
}

- (NSString *)dateStringFromFormat:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = format;
    return [df stringFromDate:self.menuItem.date];
}

- (UILabel *)createLabel {
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    return label;
}

- (NSMutableAttributedString *)createAttributedString:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    return [[NSMutableAttributedString alloc] initWithString:text attributes: @{NSFontAttributeName: font,NSForegroundColorAttributeName: textColor, NSShadowAttributeName: self.param.yxTextShadow}];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
