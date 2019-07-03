//
//  PickUpCarViewCell.m
//  ZhongTou
//
//  Created by Jone on 2017/12/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "PickUpCarViewCell.h"

#import "UIImageView+WebCache.h"
#define margon 5

@implementation PickUpCarViewCell
-(UIImageView *)leftImagView
{
    if (!_leftImagView) {
        _leftImagView = [[UIImageView alloc] initWithFrame:CGRectMake(margon, 0, screen_width/3-2*margon, 100)];
        _leftImagView.backgroundColor = [UIColor whiteColor];
    }
    return _leftImagView;
}

-(UIImageView *)rightImagView
{
    if (!_rightImagView) {
        _rightImagView =  [[UIImageView alloc] initWithFrame:CGRectMake(2*screen_width/3+margon, 0, screen_width/3-2*margon, 100)];
        _rightImagView.backgroundColor = [UIColor whiteColor];
    }
    return _rightImagView;
}
-(UIImageView *)centerImagView
{
    if (!_centerImagView) {
        _centerImagView = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/3+margon, 0, screen_width/3-2*margon, 100)];
        _centerImagView.backgroundColor = [UIColor whiteColor];
    }
    return _centerImagView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.centerImagView];
        [self.contentView addSubview:self.leftImagView];
        [self.contentView addSubview:self.rightImagView];

    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)fillCellWithModel:(NSArray *)imageArray
{

    NSString *urL1 = [imageArray objectAtIndexWithCheck:0];
//    NSString *urlString = [NSString stringWithFormat:@"%@%@",ImageFillPath,urL1];
    NSString *urL2 = [imageArray objectAtIndexWithCheck:1];
//    NSString *urlString2 = [NSString stringWithFormat:@"%@%@",ImageFillPath,urL2];

    NSString *urL3 = [imageArray objectAtIndexWithCheck:2];
//    NSString *urlString3 = [NSString stringWithFormat:@"%@%@",ImageFillPath,urL3];

    [self.leftImagView sd_setImageWithURL:[NSURL URLWithString:urL1] placeholderImage:nil];
    [self.centerImagView sd_setImageWithURL:[NSURL URLWithString:urL2]  placeholderImage:nil];
    [self.rightImagView sd_setImageWithURL:[NSURL URLWithString:urL3] placeholderImage:nil];

}

@end
