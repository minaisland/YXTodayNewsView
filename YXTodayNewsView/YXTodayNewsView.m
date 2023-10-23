//
//  YXTodayNewsView.m
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//



#import "YXTodayNewsView.h"
#import "YXTodayNewsSideImageCell.h"
#import "UIView+YXExtension.h"
#import "YXSideLeftView.h"
#import <SDWebImage/SDWebImage.h>

static CGFloat _viewWidth;
static CGFloat _viewHeight;
static CGFloat _sideMenuWidth;
static CGFloat _sideMenuHeight;
static CGFloat _coverWidth;
static CGFloat _sideBtnMaxHeight;

@interface YXTodayNewsView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) YXSideLeftView *sideLeftView;
@property (nonatomic, strong) UIView *sideRightView;
@property (nonatomic, strong) UITableView *sideMenuView;

@end

@implementation YXTodayNewsView

+ (void)calculateSize:(CGSize)size {
    //界面整体宽度
    _viewWidth = size.width;
    //侧边栏菜单按钮宽度
    _sideMenuWidth = _viewWidth*(79.0/375);
    //侧边栏菜单按钮高度
    _sideMenuHeight = _viewWidth*0.12;
    //侧边菜单底部按钮最大高度
    _sideBtnMaxHeight = _viewWidth*(29.0/375);
    //界面整体高度
    _viewHeight = (kGeneralPadding+_sideMenuHeight)*4+_sideBtnMaxHeight;
    
    _coverWidth = _viewWidth - kGeneralPadding*3 - _sideMenuWidth;
}

- (id)init {
    return [self initWithPoint:CGPointZero];
}

- (id)initWithPoint:(CGPoint)point {
    return [self initWithFrame:CGRectMake(point.x, point.y, kScreenWidth, 0)];
}

- (id)initWithFrame:(CGRect)frame {
    [YXTodayNewsView calculateSize:frame.size];
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, _viewWidth, _viewHeight)];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.coverView];
    [self addSubview:self.sideLeftView];
    [self addSubview:self.sideRightView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXTodayNewsSideImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXTodayNewsSideImageCell"];
    if (!cell) {
        cell = [[YXTodayNewsSideImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YXTodayNewsSideImageCell"];
    }
    if (indexPath.row < self.menuItems.count) {
        id<YXMenuItem> item = self.menuItems[indexPath.row];
        cell.imageUrl = item.imageUrl;
    }
    return cell;
}

- (void)setDate:(NSDate *)date {
    self.sideLeftView.date = date;
}

- (void)setCoverUrl:(NSString *)coverUrl {
    _coverUrl = coverUrl;
    if (coverUrl && coverUrl.length > 0) {
        [self.coverView sd_setImageWithURL:[NSURL URLWithString:coverUrl]];
    }
}

- (UIColor *)sideViewStartColor {
    if (!_sideViewStartColor) {
        _sideViewStartColor = kSideViewStartColor;
    }
    return _sideViewStartColor;
}

- (UIColor *)sideViewEndColor {
    if (!_sideViewEndColor) {
        _sideViewEndColor = kSideViewEndColor;
    }
    return _sideViewEndColor;
}

- (UIImageView *)coverView {
    if (!_coverView) {
        _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(kGeneralPadding, 0, _coverWidth, _viewHeight)];
        _coverView.contentMode = UIViewContentModeScaleAspectFill;
        _coverView.clipsToBounds = YES;
    }
    return _coverView;
}

- (YXSideLeftView *)sideLeftView {
    if (!_sideLeftView) {
        _sideLeftView = [[YXSideLeftView alloc] initWithFrame:self.coverView.frame];
    }
    return _sideLeftView;
}

- (UIView *)sideRightView {
    if (!_sideRightView) {
        _sideRightView = [[UIView alloc] initWithFrame:CGRectMake(kGeneralPadding + _coverWidth, 0, _sideMenuWidth + kGeneralPadding, _viewHeight)];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _sideRightView.bounds;
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
        gradientLayer.colors = @[(__bridge id)self.sideViewStartColor.CGColor,
                                     (__bridge id)self.sideViewEndColor.CGColor];
        gradientLayer.locations = @[@(0.5f), @(1.0f)];

        [_sideRightView.layer addSublayer:gradientLayer];
        [_sideRightView addSubview:self.sideMenuView];
    }
    return _sideRightView;
}

- (UITableView *)sideMenuView {
    if (!_sideMenuView) {
        _sideMenuView = [[UITableView alloc] initWithFrame:CGRectMake(kGeneralPadding, kGeneralPadding, _sideMenuWidth, _viewHeight-_sideBtnMaxHeight-kGeneralPadding) style:UITableViewStylePlain];
        [_sideMenuView registerClass:[YXTodayNewsSideImageCell class] forCellReuseIdentifier:@"YXTodayNewsSideImageCell"];
        _sideMenuView.rowHeight = _sideMenuHeight + kGeneralPadding;
        _sideMenuView.delegate = self;
        _sideMenuView.dataSource = self;
        _sideMenuView.backgroundColor = [UIColor clearColor];
        _sideMenuView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _sideMenuView.showsVerticalScrollIndicator = NO;
    }
    return _sideMenuView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
