//
//  YXSideLeftView.m
//  YXTodayNewsView
//
//  Created by みなみ on 2023/10/23.
//

#import "YXSideLeftView.h"
#import "UIView+YXExtension.h"
#import "TextDirection/NSString+Extension.h"

static UIFont *titleFont;
static UIColor *titleColor;
static UIFont *subTitleFont;
static UIColor *subTitleColor;
static UIFont *nameFont;
static UIColor *nameColor;
static UIColor *dateColor;

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

+ (void)load {
    titleFont = kBoldFont(18);
    subTitleFont = kBoldFont(15);
    nameFont = kMediumFont(12);
    
    dateColor = titleColor = subTitleColor = nameColor = [UIColor whiteColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.yearLabel.font = kFont(12);
    self.yearLabel.textColor = [UIColor blackColor];
    [self addSubview:self.yearLabel];
}

- (void)setDate:(NSDate *)date {
    _date = date;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy";
    self.yearLabel.text = [df stringFromDate:date];
    [self.yearLabel sizeToFit];
    CGFloat deg = 90.0f;
    self.yearLabel.transform = CGAffineTransformMakeRotation(M_PI*deg/180.0);
//    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:_date];
}

- (NSAttributedString *)createAttributedString:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    return [[NSAttributedString alloc] initWithString:@"今日鑫首"attributes: @{NSFontAttributeName: font,NSForegroundColorAttributeName: textColor, NSShadowAttributeName: [self createTextShadow]}];
}

- (NSShadow *)createTextShadow {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowBlurRadius = 4;
    shadow.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    shadow.shadowOffset = CGSizeMake(0,2);
    return shadow;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
