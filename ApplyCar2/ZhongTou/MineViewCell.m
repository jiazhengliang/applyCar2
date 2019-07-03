//
//  MineViewCell.m
//  ZhongTou
//
//  Created by Jone on 2017/10/13.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "MineViewCell.h"

@interface MineViewCell()
{
    BOOL didSetupConstraints;
}
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *arrView;

@end

@implementation MineViewCell

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = titleMeColor;
        _titleLabel.font =[UIFont fontWithName:fontPingFang size:15*KWIDTH];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.backgroundColor = [UIColor whiteColor];

    }
    return _titleLabel;
}

-(UIImageView *)imagView
{
    if (!_imagView) {
        _imagView = [UIImageView newAutoLayoutView];
//        _imagView.backgroundColor = [UIColor grayColor];
    }
    return _imagView;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = tableCellLineColor;
    }
    return _lineView;
}

-(UIImageView *)arrView
{
    if (!_arrView) {
        _arrView = [UIImageView newAutoLayoutView];
        _arrView.image = [UIImage imageNamed:@""];
    }
    return _arrView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.imagView];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.arrView];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {
        [self.imagView autoSetDimensionsToSize:CGSizeMake(20*KWIDTH, 20*KWIDTH)];
        [self.imagView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:36*KWIDTH];
        [self.imagView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//        [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 10, 0, 0) excludingEdge:ALEdgeRight];
        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imagView withOffset:30*KWIDTH];
        [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.imagView];
        [self.titleLabel autoSetDimensionsToSize:CGSizeMake(100*KWIDTH, 40)];
        
        
        [self.arrView autoSetDimensionsToSize:CGSizeMake(20*KWIDTH, 20*KWIDTH)];
        [self.arrView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:36*KWIDTH];
        [self.arrView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];

        [self.lineView autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
        didSetupConstraints=YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
