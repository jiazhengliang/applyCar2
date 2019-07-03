//
//  MyContractCell.m
//  ZhongTou
//
//  Created by Jone on 2017/10/23.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "MyContractCell.h"
@interface MyContractCell()
{
    BOOL didSetupConstraints;
    
}
@end

@implementation MyContractCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = titleBuyDetail;
        _titleLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _titleLabel;
}

-(UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel newAutoLayoutView];
        _detailLabel.textColor = BackGroundBlueColor;
        _detailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _detailLabel;
    
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
        _arrView.image = [UIImage imageNamed:@"arrow"];
    }
    return _arrView;
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
//        [self.contentView addSubview:self.imagView];
        [self.contentView addSubview:self.
         lineView];
        [self.contentView addSubview:self.arrView];
        [self.contentView addSubview:self.detailLabel];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {

        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15*KWIDTH];

        [self.titleLabel autoSetDimensionsToSize:CGSizeMake(230*KWIDTH, 33*KWIDTH)];
        [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*KWIDTH];
        [self.detailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
        [self.detailLabel autoSetDimensionsToSize:CGSizeMake(150*KWIDTH, 30*KWIDTH)];
        
        [self.lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        [self.lineView autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
        
        [self.arrView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.arrView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15*KWIDTH];
        
        [self.arrView autoSetDimensionsToSize:CGSizeMake(20*KWIDTH, 20*KWIDTH)];
        didSetupConstraints=YES;
    }
}


@end

