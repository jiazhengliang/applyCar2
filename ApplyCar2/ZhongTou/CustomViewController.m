//
//  CustomViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomNavigationController.h"
@interface CustomViewController ()

@end

@implementation CustomViewController

-(void)loadView
{
    [super loadView];
    _barView = [[CustomNavigationBarView alloc] initWithFrame:CGRectMake(0, 0, NavigationBarWidth, NavigationBarHeight)];
    [self.view addSubview:_barView];
    
    _barView.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setTitle:(NSString *)title
{
    [_barView setTitle:title];
    
}

-(void)setTitleWithAttributedString:(NSAttributedString *)title
{
    [_barView setTitleWithAttributedString:title];
    
}

-(void)setNavigationBarTitleView:(UIView *)view{
    [_barView setTitleView:view];
}

-(UIView *)getNavigationBarTitleView
{
    return [_barView getTitleView];
}

-(void)setNavigationBarLeftButton:(UIButton *)button
{
    [_barView setLeftButton:button];
    
}

-(void)setNavigationBarRightButton:(UIButton *)button
{
    [_barView setRightButton:button];
    
}

-(UIButton *)getNavigationBarRightButton
{
   return   [_barView getRightButton];
    
}

-(void)setNavigationBarLeftView:(UIView *)view
{
    [_barView setLeftView:view];
    
}

-(void)setNavigationBarRightView:(UIView *)view
{
    [_barView setRightView:view];
}

-(void)hideNavigationBar:(BOOL)hide
{
    _barView.hidden = hide;
}

-(void)hideNavigationBar:(BOOL)hide animation:(BOOL)animation
{
    if (animation) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:1];
        if (hide) {
            [_barView setAlpha:0.0f];
        } else
        {
            [_barView setAlpha:1];
        
        }
        [UIView commitAnimations];
    } else
    {
        _barView.hidden = hide;
        [_barView setAlpha:1];
    }
}

-(void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (self.navigationController) {
        [(CustomNavigationController *)(self.navigationController) navigationCanDragBack:bCanDragBack];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setNavigationBarBackgroundColor:(UIColor*)color
{
    _barView.backgroundColor = color;
}

- (void)bringBarViewToFront
{
    [self.view bringSubviewToFront:_barView];
}

-(void)setNavigationBarAlph:(CGFloat)alph
{
    [_barView setAlpha:alph];
}

-(void)initWithNOData
{
    if (self.dataView ==nil)
    {
        self.dataView = [[UIView alloc]initWithFrame:CGRectMake(0, Content_Y, screen_width, Content_Height-Content_Y )];
        self.dataView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        [self.view addSubview:self.dataView];
        
        int height = self.dataView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [self.dataView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [self.dataView addSubview:title];
        
//        UIButton  *leftLabel=[[UIButton alloc] init];
//        
//        leftLabel.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 200*KWIDTH, 32*KWIDTH);
//        
//        [leftLabel setTitle:@"返回上一页" forState:UIControlStateNormal];
//        leftLabel.backgroundColor = BackGroundBlueColor;
//        [leftLabel addTarget:self action:@selector(backClickBtn) forControlEvents:UIControlEventTouchUpInside];
//        [self.dataView addSubview:leftLabel];
        
        [self.dataView updateConstraints];
        
        [self.view addSubview:self.dataView];
    }
}

-(void)backClickBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)removeNoDataView
{
    self.dataView = nil;
if ([self.dataView superview]) {
    [self.dataView removeFromSuperview];
}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
