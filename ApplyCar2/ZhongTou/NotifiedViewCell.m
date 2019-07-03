//
//  NotifiedViewCell.m
//  ZhongTou
//
//  Created by Jone on 2017/10/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "NotifiedViewCell.h"
@interface NotifiedViewCell()
{
    BOOL didSetupConstraints;
}
@property (nonatomic, strong) UIView *headerLineView;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *arrView;


@end

@implementation NotifiedViewCell

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



-(UILabel *)detaiLabel{
    if (!_detaiLabel) {
        _detaiLabel = [UILabel newAutoLayoutView];
        _detaiLabel.textColor = titleMeColor;
        _detaiLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _detaiLabel.numberOfLines = 0;
        _detaiLabel.textAlignment = NSTextAlignmentLeft;
        _detaiLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _detaiLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.textColor = titleMeColor;
        _timeLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _timeLabel;
}

-(UIView *)redView
{
    if (!_redView) {
        _redView = [UIView newAutoLayoutView];
        _redView.backgroundColor = [UIColor redColor];
        _redView.layer.cornerRadius = 5*KWIDTH;
    }
    return _redView;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = tableCellLineColor;
    }
    return _lineView;
}

-(UIView *)headerLineView
{
    if (!_headerLineView) {
        _headerLineView = [UIView newAutoLayoutView];
        _headerLineView.backgroundColor = buyDetailBackColor;
    }
    return _headerLineView;
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
        [self.contentView addSubview:self.headerLineView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.redView];
        [self.contentView addSubview:self.detaiLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.lineView];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {

        
        [self.headerLineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0,0, 0, 0) excludingEdge:ALEdgeBottom];
        [self.headerLineView autoSetDimensionsToSize:CGSizeMake(screen_width, 15*KWIDTH)];
        
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:50*KWIDTH];
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:16*KWIDTH];
        
        [self.titleLabel autoSetDimensionsToSize:CGSizeMake(100*KWIDTH, 37*KWIDTH)];
        
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:50*KWIDTH];
        
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:16*KWIDTH];
        
        [self.timeLabel autoSetDimensionsToSize:CGSizeMake(100*KWIDTH, 37*KWIDTH)];
        [self.redView autoSetDimensionsToSize:CGSizeMake(10*KWIDTH, 10*KWIDTH)];
        [self.redView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
        [self.redView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.titleLabel withOffset:-10*KWIDTH];
        [self.lineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:0];
        [self.lineView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.redView];
        
        [self.lineView autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
        [self.detaiLabel autoSetDimensionsToSize:CGSizeMake(225*KWIDTH, 40*KWIDTH)];

        [self.detaiLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:10*KWIDTH];
        
        [self.detaiLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel withOffset:0];

//        [self.arrView autoSetDimensionsToSize:CGSizeMake(10*KWIDTH, 20*KWIDTH)];
//        [self.arrView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:36*KWIDTH];
//        [self.arrView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        

        didSetupConstraints=YES;
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
