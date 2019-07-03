//
//  AuthSuccessController.m
//  ZhongTou
//
//  Created by Jone on 2017/10/17.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "AuthSuccessController.h"

@interface AuthSuccessController ()

@property (strong, nonatomic) UILabel *numLabel;

@property (nonatomic,assign)int seconds;

@property (nonatomic,strong)NSTimer *timer;

@end

@implementation AuthSuccessController

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
    [self creatUI];
    // Do any additional setup after loading the view.
}

-(void)initNavigtionBar
{
    self.title = @"认证成功";
    self.barView.backgroundColor =navigationBarColor;
    // 消息AuthenticationOk
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self setNavigationBarLeftButton:buttonBack];
    
}

-(void)creatUI{
    
    UIImageView *ImgeView = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-373*KWIDTH/2, 160*KWIDTH, 373*KWIDTH, 165*KWIDTH)];
    ImgeView.image = [UIImage imageNamed:@"AuthenticationOk"];
    [self.view addSubview:ImgeView];
    
    UILabel *successLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 390*KWIDTH, screen_width, 30*KWIDTH)];
    successLabel.text = @"恭喜您,认证成功";
    [successLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18*KWIDTH]];
    successLabel.textColor = labelBlackColor;
    successLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:successLabel];
    
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-250*KWIDTH/2+20, 430*KWIDTH, 30, 30*KWIDTH)];
    numLabel.text = @"3";
    [numLabel setFont:[UIFont systemFontOfSize:17*KWIDTH]];
    numLabel.textColor = numberColor;
    numLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:numLabel];
    
    self.numLabel = numLabel;
    UILabel *nextLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-250*KWIDTH/2+50, 430*KWIDTH, 250*KWIDTH, 30*KWIDTH)];
    
    nextLabel.text = @"秒后自动返回在线申请界面";
    [nextLabel setFont:[UIFont systemFontOfSize:16*KWIDTH]];
    nextLabel.textColor = labelBlackColor;
    nextLabel.backgroundColor = [UIColor whiteColor];
    nextLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:nextLabel];
    
    
}

#pragma mark定时器
-(void)setTime
{  /**
    定时器
    */
    
    self.seconds= 3;
    
    self.timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeShow) userInfo:nil repeats:YES];
    
}

-(void)timeShow
{
    
    self.seconds--;
    
     self.numLabel.text = [NSString stringWithFormat:@"%d",_seconds];
    if (_seconds==0) {
        [_timer invalidate];
        [self performSelector:@selector(pushAppleController) withObject:nil afterDelay:1];

    }
    
}

-(void)pushAppleController
{
    NSLog(@"跳转界面");
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
