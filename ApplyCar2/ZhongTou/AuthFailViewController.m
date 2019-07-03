//
//  AuthFailViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/10/17.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "AuthFailViewController.h"

@interface AuthFailViewController ()

@end

@implementation AuthFailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigtionBar];

    // Do any additional setup after loading the view.
}

-(void)initNavigtionBar
{
    self.title = @"认证失败";
    self.barView.backgroundColor =navigationBarColor;
    // 消息
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self setNavigationBarLeftButton:buttonBack];
    
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
