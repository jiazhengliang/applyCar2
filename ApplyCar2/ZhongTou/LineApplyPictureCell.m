//
//  LineApplyPictureCell.m
//  ZhongTou
//
//  Created by Jone on 2017/10/27.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "LineApplyPictureCell.h"

@interface LineApplyPictureCell ()
{
    BOOL didSetupConstraints;
}

@end

@implementation LineApplyPictureCell

-(UIImageView *)leftImagView
{
    if (!_leftImagView) {
        _leftImagView = [UIImageView newAutoLayoutView];
        _leftImagView.backgroundColor = [UIColor whiteColor];
    }
    return _leftImagView;
}

-(UIImageView *)rightImagView
{
    if (!_rightImagView) {
        _rightImagView = [UIImageView newAutoLayoutView];
        _rightImagView.backgroundColor = [UIColor whiteColor];
    }
    return _rightImagView;
}

-(UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIButton newAutoLayoutView];
        _rightBtn.tag = 100;
        [_rightBtn addTarget:self action:@selector(pictureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

-(UIButton *)rightDeleBtn
{
    if (!_rightDeleBtn) {
        _rightDeleBtn = [UIButton newAutoLayoutView];
        _rightDeleBtn.tag = 400;
        [_rightDeleBtn setImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];

        [_rightDeleBtn addTarget:self action:@selector(pictureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightDeleBtn.hidden = YES;
    }
    return _rightDeleBtn;

}

-(UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [UIButton newAutoLayoutView];
        _leftBtn.tag = 200;
        
        [_leftBtn addTarget:self action:@selector(pictureBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _leftBtn;
}


-(UIButton *)leftDeletBtn
{
    if (!_leftDeletBtn) {
        _leftDeletBtn = [UIButton newAutoLayoutView];
        _leftDeletBtn.tag = 300;
        [_leftDeletBtn setImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
        [_leftDeletBtn addTarget:self action:@selector(pictureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _leftDeletBtn.hidden = YES;
    }
    return _leftDeletBtn;
    
}
-(UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel newAutoLayoutView];
        _leftLabel.font = [UIFont fontWithName:fontPingFang size:12];
        _leftLabel.text = @"正面";
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.textColor = titleBuyDetail;
        
    }
    return _leftLabel;

}

-(UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [UILabel newAutoLayoutView];
        _rightLabel.font = [UIFont fontWithName:fontPingFang size:12];
        _rightLabel.text = @"反面";
        _rightLabel.textAlignment = NSTextAlignmentCenter;

        _rightLabel.textColor = titleBuyDetail;

        
    }
    return _rightLabel;

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
        [self.contentView addSubview:self.leftImagView];
        [self.contentView addSubview:self.rightImagView];
        [self.contentView addSubview:self.leftBtn];
        [self.contentView addSubview:self.rightBtn];
        [self.contentView addSubview:self.rightLabel];
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.leftDeletBtn];
        [self.contentView addSubview:self.rightDeleBtn];

        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {
        [self.leftImagView autoSetDimensionsToSize:CGSizeMake(screen_width/2-20*KWIDTH, 115*KWIDTH)];
        [self.leftImagView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10*KWIDTH];
        [self.leftImagView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15*KWIDTH];
        
//        [self.leftBtn autoSetDimensionsToSize:CGSizeMake(screen_width/2-110*KWIDTH, 115*KWIDTH)];
//        [self.leftBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10*KWIDTH];
//        [self.leftBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15*KWIDTH];

        [self.leftBtn autoSetDimensionsToSize:CGSizeMake(screen_width/2-110*KWIDTH, 115*KWIDTH)];
        [self.leftBtn autoAlignAxis:ALAxisVertical toSameAxisOfView:self.leftImagView];
        [self.leftBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.leftImagView];

        [self.leftLabel autoSetDimensionsToSize:CGSizeMake(screen_width/2-20*KWIDTH, 20*KWIDTH)];
        
        
        [self.leftLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.leftImagView withOffset:10*KWIDTH];
        [self.leftLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.leftImagView];
        
        [self.rightImagView autoSetDimensionsToSize:CGSizeMake(screen_width/2-20*KWIDTH, 115*KWIDTH)];
        [self.rightImagView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10*KWIDTH];
        [self.rightImagView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15*KWIDTH];
        
        [self.rightDeleBtn autoSetDimensionsToSize:CGSizeMake(30*KWIDTH, 30*KWIDTH)];
        [self.rightDeleBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.rightImagView];
        [self.rightDeleBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.rightImagView];
        
        [self.leftDeletBtn autoSetDimensionsToSize:CGSizeMake(30*KWIDTH, 30*KWIDTH)];
        [self.leftDeletBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.leftImagView];
        [self.leftDeletBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.leftImagView];
        
        
        [self.rightLabel autoSetDimensionsToSize:CGSizeMake(screen_width/2-20*KWIDTH, 20*KWIDTH)];
        [self.rightLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.rightImagView withOffset:10*KWIDTH];
        [self.rightLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.rightImagView];

        
        [self.rightBtn autoSetDimensionsToSize:CGSizeMake(screen_width/2-20*KWIDTH, 115*KWIDTH)];
//        [self.rightBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10*KWIDTH];
//        [self.rightBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15*KWIDTH];
        [self.rightBtn autoAlignAxis:ALAxisVertical toSameAxisOfView:self.rightImagView];
        [self.rightBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.rightImagView];
        
    }
}

-(void)fillCellWithModel:(NSInteger)num
{
//    if (num == 1) {
//        
//    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)pictureBtnClick:(UIButton*)btn
{
    if ([_delegate respondsToSelector:@selector(didSelectedAddPicture:number:)]) {
        switch (btn.tag) {
            case 200:
            {
               [_delegate didSelectedAddPicture:self.index number:1];
               NSLog(@"点击了左键");
            }
                break;
            case 300:
            {
                [_delegate didSelectedAddPicture:self.index number:3];
                NSLog(@"点击了左键删除");
            }
                break;
                
            case 400:
            {
                [_delegate didSelectedAddPicture:self.index number:4];
                NSLog(@"点击了右键删除");
            }
                break;
                

            default:
            {
                [_delegate didSelectedAddPicture:self.index number:2];
                NSLog(@"点击了右键");
            }
            break;
        }
    }
   
}

@end
