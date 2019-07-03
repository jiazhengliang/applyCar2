//
//  NotifiedViewCell.h
//  ZhongTou
//
//  Created by Jone on 2017/10/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifiedViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detaiLabel;

@property (nonatomic, strong) UILabel *timeLabel;


@property (nonatomic, strong) UIView *redView;
@end
