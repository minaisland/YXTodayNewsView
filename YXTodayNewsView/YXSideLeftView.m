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

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UILabel *monthdayLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *likeBtn;

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
    [self addSubview:self.coverView];
    self.yearLabel = [self createLabel];
    self.monthdayLabel = [self createLabel];
    self.titleLabel = [self createLabel];
    self.subTitleLabel = [self createLabel];
    self.nameLabel = [self createLabel];
}

- (void)setMenuItem:(id<YXMenuItem>)menuItem {
    _menuItem = menuItem;
    [self setCoverUrl:menuItem.imageUrl];
    [self setDate:menuItem.date];
    [self setTitle:menuItem.title];
    [self setSubTitle:menuItem.subTitle];
    [self setAvatarUrl:menuItem.avatarUrl];
    [self setName:menuItem.name];
}

- (void)setDate:(NSDate *)date {
    self.yearLabel.attributedText = [self createAttributedString:[self dateStringFromFormat:@"yyyy"] font:self.param.yxSideLeftYearFont textColor:self.param.yxSideLeftDateColor];
    self.yearLabel.transform = CGAffineTransformMakeRotation(M_PI*90.0f/180.0);
    self.yearLabel.frame = CGRectMake(14, 15, 10, 22);
    self.yearLabel.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:[self dateStringFromFormat:@"MM/dd"]];
    NSDictionary *attrs = @{NSFontAttributeName: self.param.yxSideLeftMonthdayFont,NSForegroundColorAttributeName: self.param.yxSideLeftDateColor, NSShadowAttributeName: self.param.yxTextShadow, NSBaselineOffsetAttributeName: @(self.param.yxSideLeftMonthdayBaselineOffset)};
    [mutStr addAttributes:attrs range:NSMakeRange(0, 2)];
    [mutStr addAttributes:@{NSFontAttributeName: self.param.yxSideLeftDateSlashFont,NSForegroundColorAttributeName: self.param.yxSideLeftDateColor, NSShadowAttributeName: self.param.yxTextShadow, NSBaselineOffsetAttributeName: @(self.param.yxSideLeftMonthdayBaselineOffset)} range:NSMakeRange(2, 1)];
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

- (void)setCoverUrl:(NSString *)coverUrl {
    if (coverUrl && coverUrl.length > 0) {
        [self.coverView sd_setImageWithURL:[NSURL URLWithString:coverUrl]];
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
    self.avatarView.frame = CGRectMake(14, self.yx_height-self.param.yxSideLeftAvatarWidth-self.param.yxSideLeftAvatarBottomMargin, self.param.yxSideLeftAvatarWidth, self.param.yxSideLeftAvatarWidth);
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:url]];
    self.avatarBtn.frame = CGRectMake(0, 0, 44, 44);
    self.avatarBtn.center = self.avatarView.center;
}

- (void)setName:(NSString *)name {
    self.nameLabel.attributedText = [self createAttributedString:name font:self.param.yxSideLeftNameFont textColor:self.param.yxSideLeftNameColor];
    CGSize size = [self.nameLabel sizeThatFits:CGSizeMake(200, 18)];
    self.nameLabel.frame = CGRectMake(self.avatarView.yx_x + self.avatarView.yx_width + 8, (self.avatarView.yx_y*2 + self.avatarView.yx_height - size.height)/2, size.width, size.height);
}

- (UIImageView *)coverView {
    if (!_coverView) {
        _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(kGeneralPadding, 0, self.yx_width, self.yx_height)];
        _coverView.contentMode = UIViewContentModeScaleAspectFill;
        _coverView.clipsToBounds = YES;
    }
    return _coverView;
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
        _avatarView.yx_cornerRadius = self.param.yxSideLeftAvatarWidth / 2;
        [self addSubview:_avatarView];
    }
    return _avatarView;
}

- (UIButton *)avatarBtn {
    if (!_avatarBtn) {
        _avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_avatarBtn];
    }
    return _avatarBtn;
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
