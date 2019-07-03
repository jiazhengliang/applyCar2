//
//  PayRecordCell.m
//  ZhongTou
//
//  Created by Jone on 2017/11/3.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "PayRecordCell.h"
@interface PayRecordCell()
{
    BOOL didSetupConstraints;
}
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *arrView;

@end
@implementation PayRecordCell
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.textColor = titleMeColor;
        _timeLabel.font =[UIFont fontWithName:fontPingFang size:11*KWIDTH];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _timeLabel;
}

-(UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [UILabel newAutoLayoutView];
        _numLabel.textColor = titleMeColor;
        _numLabel.font =[UIFont fontWithName:fontPingFang size:11*KWIDTH];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _numLabel;
}

-(UILabel *)moneyLabel
{ if (!_moneyLabel) {
    _moneyLabel = [UILabel newAutoLayoutView];
    _moneyLabel.textColor = titleMeColor;
    _moneyLabel.font =[UIFont fontWithName:fontPingFang size:11*KWIDTH];
    _moneyLabel.textAlignment = NSTextAlignmentCenter;
    _moneyLabel.backgroundColor = [UIColor whiteColor];
    
}
    return _moneyLabel;
    
    
}

-(UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel newAutoLayoutView];
        _stateLabel.textColor = titleMeColor;
        _stateLabel.font =[UIFont fontWithName:fontPingFang size:11*KWIDTH];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _stateLabel;
    
}



-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = tableCellLineColor;
    }
    return _lineView;
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
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.numLabel];
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.stateLabel];
        
        [self.contentView addSubview:self.
         lineView];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {
        [self.timeLabel autoSetDimensionsToSize:CGSizeMake(118*KWIDTH, 33*KWIDTH)];
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0*KWIDTH];
        [self.timeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.numLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.timeLabel withOffset:0*KWIDTH];
        [self.numLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.timeLabel];
        [self.numLabel autoSetDimensionsToSize:CGSizeMake(88*KWIDTH, 33*KWIDTH)];
        
        [self.moneyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.numLabel withOffset:0*KWIDTH];
        [self.moneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.numLabel];
        [self.moneyLabel autoSetDimensionsToSize:CGSizeMake(80*KWIDTH, 33*KWIDTH)];
        
        [self.stateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.moneyLabel withOffset:0*KWIDTH];
        [self.stateLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyLabel];
        [self.stateLabel autoSetDimensionsToSize:CGSizeMake(88*KWIDTH, 33*KWIDTH)];
        
        
        
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