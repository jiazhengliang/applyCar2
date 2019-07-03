//
//  CustomViewController.h
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomNavigationBarView.h"

@interface CustomViewController : BaseViewController

@property(nonatomic,strong)CustomNavigationBarView *barView;

@property (strong,nonatomic) UIView *dataView;


-(void)setTitle:(NSString *)title;

- (void)setTitleWithAttributedString:(NSAttributedString*)title;

-(void)setNavigationBarLeftButton:(UIButton *)button;

-(UIButton *)getNavigationBarRightButton;

-(void)setNavigationBarRightButton:(UIButton *)button;

-(void)setNavigationBarLeftView:(UIView *)view;

-(void)setNavigationBarRightView:(UIView *)view;

-(void)setNavigationBarTitleView:(UIView *)view;

-(UIView *)getNavigationBarTitleView;

-(void)hideNavigationBar:(BOOL)hide;

-(void)setNavigationBarBackgroundColor:(UIColor*)color;

-(void)hideNavigationBar:(BOOL)hide animation:(BOOL)animation;

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack;

- (void)bringBarViewToFront;

-(void)setNavigationBarAlph:(CGFloat)alph;

-(void)initWithNOData;

-(void)removeNoDataView;

@end
