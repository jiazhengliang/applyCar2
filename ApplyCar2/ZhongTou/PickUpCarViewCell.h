//
//  PickUpCarViewCell.h
//  ZhongTou
//
//  Created by Jone on 2017/12/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickUpCarViewCellDelegate;


@interface PickUpCarViewCell : UITableViewCell

/**
 右边图片
 */
@property (nonatomic, strong) UIImageView *rightImagView;

/**
 左边图片
 */
@property (nonatomic, strong) UIImageView *leftImagView;

/**
 左边图片
 */
@property (nonatomic, strong) UIImageView *centerImagView;

@property (nonatomic,weak) id<PickUpCarViewCellDelegate> delegate;



/**
 cell
 
 @param num 图片num
 */
-(void)fillCellWithModel:(NSArray *)imageArray;


@end

/**
 点击图片协议
 */
@protocol PickUpCarViewCellDelegate <NSObject>

/**
 点击图片协议
 
 @param indexPath indexPath
 @param num 那个按钮
 */
-(void)didSelectedPickUpCarViewCellDelegate:(NSIndexPath *)indexPath number:(NSInteger)num;

@end
