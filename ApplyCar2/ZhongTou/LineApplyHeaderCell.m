//
//  LineApplyHeaderCell.m
//  ZhongTou
//
//  Created by Jone on 2017/10/27.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "LineApplyHeaderCell.h"

@interface LineApplyHeaderCell()

{
    BOOL didSetupConstraints;
    
}

/**
 上面背景
 */
@property (nonatomic, strong) UIView *lineView;

/**
 下面的背景
 */
@property (nonatomic, strong) UIView *lineView2;

@end

@implementation LineApplyHeaderCell

-(UIImageView *)upDownView
{
    if (!_upDownView) {
        _upDownView = [UIImageView newAutoLayoutView];
        
    }
    return  _upDownView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = titleBuyHeader;
        _titleLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _titleLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = tableCellLineColor;
    }
    return _lineView;
}

-(UIView *)lineView2
{
    if (!_lineView2) {
        _lineView2 = [UIView newAutoLayoutView];
        _lineView2.backgroundColor = tableCellLineColor;
    }
    return _lineView2;
}

-(UIImageView *)imagView
{
    if (!_imagView) {
        _imagView = [UIImageView newAutoLayoutView];
        //        _imagView.backgroundColor = [UIColor grayColor];
    }
    return _imagView;
}



//-(UIButton *)arrView
//{
//    if (!_arrView) {
//        _arrView = [UIButton newAutoLayoutView];
//        [_arrView setTitle:@"查看" forState:UIControlStateNormal];
//        _arrView.titleLabel.textAlignment = NSTextAlignmentRight;
//        [_arrView addTarget:self action:@selector(arrViewClick) forControlEvents:UIControlEventTouchUpInside];
//        [_arrView setTitleColor:titleBuyHeaderDetail forState:UIControlStateNormal];
//        _arrView.titleLabel.font = [UIFont systemFontOfSize:11];
//        _arrView.hidden = NO;
//        
//    }
//    return _arrView;
//}

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
        [self.contentView addSubview:self.lineView2];
        [self.contentView addSubview:self.upDownView];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {
        [self.lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        
        [self.lineView autoSetDimensionsToSize:CGSizeMake(screen_width, 10)];
        [self.imagView autoSetDimensionsToSize:CGSizeMake(20*KWIDTH, 20*KWIDTH)];
        [self.imagView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView withOffset:8*KWIDTH];
        [self.imagView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0];
        
        [self.upDownView autoSetDimensionsToSize:CGSizeMake(20*KWIDTH, 20*KWIDTH)];
        [self.upDownView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView withOffset:8*KWIDTH];
        [self.upDownView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0];

        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imagView withOffset:5*KWIDTH];
        [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.imagView];
        [self.titleLabel autoSetDimensionsToSize:CGSizeMake(230*KWIDTH, 34*KWIDTH)];
        
//        [self.arrView autoSetDimensionsToSize:CGSizeMake(80*KWIDTH, 20*KWIDTH)];
//        [self.arrView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:1*KWIDTH];
//        [self.arrView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.imagView];
        [self.lineView2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        [self.lineView2 autoSetDimensionsToSize:CGSizeMake(screen_width, 7.5)];
        
        didSetupConstraints=YES;
    }
}

-(void)arrViewClick
{
    NSLog(@"还款明细");
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
