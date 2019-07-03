//
//  ZYHGuideViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/11/24.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "ZYHGuideViewController.h"
#import "LoginController.h"

@interface ZYHGuideViewController ()

@end

@implementation ZYHGuideViewController

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
    self.view.backgroundColor = BackGroundColor;
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    
    scrollview.pagingEnabled = YES;
    
    scrollview.showsHorizontalScrollIndicator = NO;
    
    scrollview.showsVerticalScrollIndicator = NO;
    
    scrollview.contentSize = CGSizeMake(4*screen_width,screen_height);
    
    for (int i = 0; i<4; i++) {
        
        UIImageView *item = [[UIImageView alloc]initWithFrame:CGRectMake(i*screen_width, 0,screen_width,screen_height)];
        
        NSString *imageStr = [NSString stringWithFormat:@"startPage%d",(i+1)];
        
        item.image = [UIImage imageNamed:imageStr];
        
        if ( i == 3) {
            
            item.userInteractionEnabled=YES;
            
            UIButton *resiBtn=[[UIButton alloc] initWithFrame:CGRectMake(screen_width/2-70*KWIDTH, 530*KWIDTH, 140*KWIDTH, 50*KWIDTH)];
            resiBtn.backgroundColor=[UIColor clearColor];
            [item addSubview:resiBtn];
            [resiBtn setImage:[UIImage imageNamed:@"welComeBtn"] forState:UIControlStateNormal];

            [resiBtn setTitleColor:titleBuyDetail forState:UIControlStateNormal];
            resiBtn.tag=100;
            [resiBtn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
            [item addSubview:resiBtn];
        }
        
        [scrollview addSubview:item];
    }
    
    [self.view addSubview:scrollview];

    // Do any additional setup after loading the view.
}


- (void)enter
{
    [self.navigationController pushViewController:[LoginController new] animated:YES];
    [[SavaInfoTools sharedInstance] saveBooleanValue:YES withKey:User_IsFirstLogin];
}


-(void)dealloc
{
    NSLog(@"指导页dealloc");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
