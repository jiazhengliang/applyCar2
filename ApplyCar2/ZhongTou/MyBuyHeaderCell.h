//
//  MyBuyHeaderCell.h
//  ZhongTou
//
//  Created by Jone on 2017/10/20.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 点击图片协议
 */
@protocol MyBuyHeaderCellDelete <NSObject>

/**
 点击图片协议
 
 @param indexPath indexPath
 @param num 那个按钮
 */
-(void)payTimeLog:(NSIndexPath *)indexPath;

@end
@interface MyBuyHeaderCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imagView;
@property (nonatomic, strong) UIButton *arrView;
@property(strong,nonatomic)NSIndexPath *index;

@property (nonatomic,weak) id<MyBuyHeaderCellDelete> delegate;


@end
