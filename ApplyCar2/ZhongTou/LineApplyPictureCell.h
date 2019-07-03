//
//  LineApplyPictureCell.h
//  ZhongTou
//
//  Created by Jone on 2017/10/27.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol addPictureDelegate;


@interface LineApplyPictureCell : UITableViewCell

/**
 右边图片
 */
@property (nonatomic, strong) UIImageView *rightImagView;

/**
 左边图片
 */
@property (nonatomic, strong) UIImageView *leftImagView;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIButton *leftBtn;

@property(strong,nonatomic)NSIndexPath *index;

@property (nonatomic,weak) id<addPictureDelegate> delegate;

@property(strong,nonatomic)UILabel *rightLabel;

@property(strong,nonatomic)UILabel *leftLabel;


@property (nonatomic, strong) UIButton *rightDeleBtn;

@property (nonatomic, strong) UIButton *leftDeletBtn;

/**
 cell

 @param num 图片num
 */
-(void)fillCellWithModel:(NSInteger)num;


@end

/**
 点击图片协议
 */
@protocol addPictureDelegate <NSObject>

/**
 点击图片协议

 @param indexPath indexPath
 @param num 那个按钮
 */
-(void)didSelectedAddPicture:(NSIndexPath *)indexPath number:(NSInteger)num;

@end
