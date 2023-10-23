//
//  YXTodayNewsSideImageCell.m
//  yuexin-test
//
//  Created by みなみ on 2023/10/22.
//

#import "YXTodayNewsSideImageCell.h"
#import "UIView+YXExtension.h"
#import <SDWebImage/SDWebImage.h>

@interface YXTodayNewsSideImageCell()

@property (nonatomic, strong) UIView *selectView;
@property (nonatomic, strong) UIImageView *coverView;

@end

@implementation YXTodayNewsSideImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = self.contentView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.coverView];
        [self addSubview:self.selectView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.coverView.frame = CGRectMake(0, 0, self.yx_width-kGeneralPadding, self.yx_height-kGeneralPadding);
    self.selectView.frame = CGRectMake(0, 0, self.yx_width-kGeneralPadding, self.yx_height-kGeneralPadding);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    [self.coverView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectView.hidden = !selected;
    // Configure the view for the selected state
}

- (UIView *)selectView {
    if (!_selectView) {
        _selectView = [UIView new];
        _selectView.backgroundColor = [UIColor clearColor];
        _selectView.hidden = YES;
        _selectView.yx_cornerRadius = 5.0f;
        _selectView.layer.borderColor = [UIColor whiteColor].CGColor;
        _selectView.layer.borderWidth = 2.0f;
    }
    return _selectView;
}

- (UIImageView *)coverView {
    if (!_coverView) {
        _coverView = [UIImageView new];
        _coverView.clipsToBounds = YES;
        _coverView.contentMode = UIViewContentModeScaleAspectFill;
        _coverView.yx_cornerRadius = 5.0f;
    }
    return _coverView;
}

@end
