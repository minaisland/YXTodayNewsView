//
//  YXTodayNewsView.m
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//



#import "YXTodayNewsView.h"
#import "YXTodayNewsSideImageCell.h"
#import "UIView+YXExtension.h"
#import <SDWebImage/SDWebImage.h>

static CGFloat _viewWidth;
static CGFloat _viewHeight;
static CGFloat _sideMenuWidth;
static CGFloat _sideMenuHeight;
static CGFloat _sideLeftWidth;
static CGFloat _sideBtnMaxHeight;

@interface YXTodayNewsView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) YXSideLeftView *sideLeftView;
@property (nonatomic, strong) UIView *sideRightView;
@property (nonatomic, strong) UITableView *sideMenuView;
@property (nonatomic, strong) UITapGestureRecognizer *sideLeftViewTapGesture;

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
    //左侧边栏宽度
    _sideLeftWidth = _viewWidth - kGeneralPadding*3 - _sideMenuWidth;
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
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.sideLeftView.superview) {
        [self initUI];
    }
}

- (void)initUI {
    [self addSubview:self.sideLeftView];
    [self addSubview:self.sideRightView];
}

- (void)avatarViewOnPress:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(todayNewsView:avatarViewOnPressWithItem:)]) {
        [self.delegate todayNewsView:self avatarViewOnPressWithItem:self.sideLeftView.menuItem];
    }
}

- (void)sideLeftViewOnTap:(UITapGestureRecognizer *)gesture {
    if ([self.delegate respondsToSelector:@selector(todayNewsView:sideLeftViewOnTapWithItem:)]) {
        [self.delegate todayNewsView:self sideLeftViewOnTapWithItem:self.sideLeftView.menuItem];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataArray.count) {
        id<YXMenuItem> item = self.dataArray[indexPath.row];
        self.sideLeftView.menuItem = item;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXTodayNewsSideImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXTodayNewsSideImageCell"];
    if (!cell) {
        cell = [[YXTodayNewsSideImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YXTodayNewsSideImageCell"];
    }
    if (indexPath.row < self.dataArray.count) {
        id<YXMenuItem> item = self.dataArray[indexPath.row];
        cell.imageUrl = item.imageUrl;
    }
    return cell;
}

- (YXTodayNewsParam *)param {
    if (!_param) {
        _param = [YXTodayNewsParam defaultParam];
    }
    return _param;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.sideMenuView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self tableView:self.sideMenuView didSelectRowAtIndexPath:indexPath];
    [self.sideMenuView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (YXSideLeftView *)sideLeftView {
    if (!_sideLeftView) {
        _sideLeftView = [[YXSideLeftView alloc] initWithFrame:CGRectMake(kGeneralPadding, 0, _sideLeftWidth, _viewHeight)];
        _sideLeftView.param = self.param;
        [_sideLeftView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sideLeftViewOnTap:)]];
        [_sideLeftView.avatarBtn addTarget:self action:@selector(avatarViewOnPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sideLeftView;
}

- (UITapGestureRecognizer *)sideLeftViewTapGesture {
    if (!_sideLeftViewTapGesture) {
        _sideLeftViewTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sideLeftViewOnTap:)];
    }
    return _sideLeftViewTapGesture;
}

- (UIView *)sideRightView {
    if (!_sideRightView) {
        _sideRightView = [[UIView alloc] initWithFrame:CGRectMake(kGeneralPadding + _sideLeftWidth, 0, _sideMenuWidth + kGeneralPadding, _viewHeight)];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _sideRightView.bounds;
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
        gradientLayer.colors = @[(__bridge id)self.param.yxSideRightStartColor.CGColor,
                                     (__bridge id)self.param.yxSideRightEndColor.CGColor];
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
