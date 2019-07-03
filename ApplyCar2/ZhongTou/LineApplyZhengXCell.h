//
//  LineApplyZhengXCell.h
//  ZhongTou
//
//  Created by Jone on 2017/10/30.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXPhotoView.h"

@protocol addZhengxingDelegate;

#define appvieww   100.0f*KWIDTH// 高
#define appviewh    116*KWIDTH     // 宽
#define Width_Space      35.0f*KWIDTH      // 2个按钮之间的横间距
#define Height_Space     30.0f*KWIDTH

//CGFloat appvieww=100;
//CGFloat appviewh=90;
static const CGFloat kPhotoViewMargin = 15.0;
static const CGFloat kPhotoViewSectionMargin = 20.0;
@interface LineApplyZhengXCell : UITableViewCell

@property (nonatomic, strong) UIImageView *rightImagView;

@property (nonatomic, strong) UIImageView *leftImagView;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIButton *leftBtn;

@property(strong,nonatomic)NSIndexPath *index;

@property (nonatomic,weak) id<addZhengxingDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *array;

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) HXPhotoView *onePhotoView;
@property (strong, nonatomic) HXPhotoManager *oneManager;

-(void)fillCellWithModel:(NSMutableArray *)array;

@end

@protocol addZhengxingDelegate <NSObject>

-(void)didSelectedZhengxingDelegate:(CGFloat )height number:(NSInteger)num array:(NSMutableArray *)array;
-(void)didSelectedZhengxingDelegateArray:(NSMutableArray *)array;

@end
