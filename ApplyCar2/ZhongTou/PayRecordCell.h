//
//  PayRecordCell.h
//  ZhongTou
//
//  Created by Jone on 2017/11/3.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayRecordCell : UITableViewCell
//标题
@property (nonatomic, strong) UILabel *timeLabel;
//图片
@property (nonatomic, strong) UILabel *numLabel;

@property (nonatomic, strong) UILabel *moneyLabel;

//子标题
@property (nonatomic, strong) UILabel *stateLabel;

@end
