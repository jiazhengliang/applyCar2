//
//  MyBuyHeaderCell.m
//  ZhongTou
//
//  Created by Jone on 2017/10/20.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "MyBuyHeaderCell.h"
@interface MyBuyHeaderCell()

{
    BOOL didSetupConstraints;
    
}
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lineView2;


@end
@implementation MyBuyHeaderCell
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



-(UIButton *)arrView
{
    if (!_arrView) {
        _arrView = [UIButton newAutoLayoutView];
        
        [_arrView setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        [_arrView setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
        [_arrView setTitle:@"还款明细" forState:UIControlStateNormal];
        [_arrView setTitle:@"还款明细" forState:UIControlStateSelected];
        [_arrView setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [_arrView setImageEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 0)];
        _arrView.titleLabel.font = [UIFont systemFontOfSize:11];
        [_arrView addTarget:self action:@selector(payTimeBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        _arrView.hidden = YES;
        
    }
    return _arrView;
}

-(void)payTimeBtnClick
{
    NSLog(@"还款明细");
    if ([_delegate respondsToSelector:@selector(payTimeLog:)]) {
        [_delegate payTimeLog:self.index];
    }

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
        [self.contentView addSubview:self.arrView];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.lineView2];

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
        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imagView withOffset:5*KWIDTH];
        [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.imagView];
        [self.titleLabel autoSetDimensionsToSize:CGSizeMake(150*KWIDTH, 34)];
        
        [self.arrView autoSetDimensionsToSize:CGSizeMake(80*KWIDTH, 20*KWIDTH)];
        [self.arrView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:1*KWIDTH];
        [self.arrView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.imagView];
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
