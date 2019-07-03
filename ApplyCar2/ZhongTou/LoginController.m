//
//  LoginController.m
//  ZhongTou
//
//  Created by Jone on 2017/10/11.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "LoginController.h"
#import "MBProgressHUD.h"
#import "DisplayUtils.h"
#import "adderess.h"
#import "InformationController.h"
#import "LoginManager.h"
#import "SvUDIDTools.h"
#import "SVProgressHUD.h"
#import "LoginManager.h"
#import "CommonTools.h"
#import "webViewController.h"
@interface LoginController ()<UITextFieldDelegate,CLLocationManagerDelegate>
//手机号
@property(strong,nonatomic)UITextField *phoneText;
//登录
@property(strong,nonatomic)UIButton *loginButton;
//验证码按钮
@property (strong, nonatomic)UIButton *veriBtn;
//定时器
@property (nonatomic,strong)NSTimer *timer;

@property (nonatomic,assign)int seconds;

@property (nonatomic,assign) BOOL  isAgree;

@property (copy, nonatomic)NSString *latitude;

@property (copy, nonatomic)NSString *longitude;

@property (strong, nonatomic)UITextField *veriText;

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (strong, nonatomic)NSMutableArray *phoneAddr;

@end

@implementation LoginController

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
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    self.edgesForExtendedLayout = UIRectEdgeNone;
#endif
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    [self hideKeyBored];
    BOOL isAgreeLocation=[[SavaInfoTools sharedInstance]getBooleaValueFromKey:User_IsAgreeLocation];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    self.barView.backgroundColor =[UIColor clearColor];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -隐藏键盘
-(void)hideKeyBored
{
    __weak typeof(self) weakSelf = self;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view removeGestureRecognizer:singleTapGR];
                }];
    
    
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}


-(void)createUI
{
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    bgImgView.image = [UIImage imageNamed:@"loginBg"];
    [self.view addSubview:bgImgView];
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 20)];
    navView.backgroundColor = buttonBgColor;
    [self.view addSubview:navView];
    
    UIView *backgroudView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, screen_width, screen_height)];
    backgroudView.alpha = 0.5;
    backgroudView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backgroudView];
    UIImageView *logoImg = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-195/2, 106*KWIDTH, 170*KWIDTH, 130*KWIDTH)];
    logoImg.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoImg];
    
    UIView *phoneView = [[UIView alloc] initWithFrame:CGRectMake(screen_width/2-220/2, 314*KWIDTH, 180, 34*KWIDTH)];
    phoneView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:phoneView];
    
    
    //    UIImageView *phoneImg = [[UIImageView alloc] init];
    //    phoneImg.frame = CGRectMake(0, 5, 19*KWIDTH, 20*KWIDTH);
    //    phoneImg.image = [UIImage imageNamed:@"mobile"];
    //    [phoneView addSubview:phoneImg];
    
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; // 创建属性字典
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14*KWIDTH]; // 设置font
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor]; // 设置颜色
    NSAttributedString *phoneAttr = [[NSAttributedString alloc] initWithString:@"输入手机号码" attributes:attrs]; // 初始化富文本占位字符串
    NSAttributedString *verAttr = [[NSAttributedString alloc] initWithString:@"输入验证码" attributes:attrs]; // 初始化富文本占位字符串
    
    
    UITextField *phoneText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 34*KWIDTH)];
    phoneText.keyboardType = UIKeyboardTypeNumberPad;
    phoneText.attributedPlaceholder = phoneAttr;
    phoneText.textAlignment = NSTextAlignmentLeft;
    phoneText.textColor = [UIColor whiteColor];
    phoneText.backgroundColor = [UIColor clearColor];
    phoneText.delegate = self;
//    phoneText.text =@"13788889999";
    self.phoneText = phoneText;
    
    [phoneView addSubview:phoneText];
    
    UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 34, 220, 1*KWIDTH)];
    lineView.backgroundColor = titleColor;
    
    [phoneView addSubview:lineView];
    
    //验证码模块
    UIView *VerifView = [[UIView alloc] initWithFrame:CGRectMake(screen_width/2-220/2, 370*KWIDTH, 220, 44*KWIDTH)];
    VerifView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:VerifView];
    
    
    
    UITextField *veriText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 80, 34*KWIDTH)];
    veriText.backgroundColor = [UIColor clearColor];
    veriText.attributedPlaceholder = verAttr;
    veriText.keyboardType = UIKeyboardTypeNumberPad;
    
    self.veriText = veriText;
    veriText.textColor = [UIColor whiteColor];
    veriText.textAlignment = NSTextAlignmentLeft;
    [VerifView addSubview:veriText];
    
    
    UIButton *veriBtn = [[UIButton alloc] initWithFrame:CGRectMake(140, 0,80, 34*KWIDTH)];
    veriBtn.backgroundColor = [UIColor clearColor];
    
    veriBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [veriBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [veriBtn setTitleColor:titleResignColor forState:UIControlStateNormal];
    self.veriBtn = veriBtn;
    [veriBtn addTarget:self action:@selector(veriBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [VerifView addSubview:veriBtn];
    
    
    UIView  *line2View = [[UIView alloc] initWithFrame:CGRectMake(0, 34, 220, 1*KWIDTH)];
    line2View.backgroundColor = titleColor;
    
    [VerifView addSubview:line2View];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(screen_width/2-220/2, 470*KWIDTH, 220, 35*KWIDTH)];
    
    [loginButton setTitle:@"登  录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
    loginButton.backgroundColor = buttonBgColor;
    loginButton.layer.cornerRadius = 17.5;
    
    self.loginButton = loginButton;
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    UIView *greeView = [[UIView alloc] initWithFrame:CGRectMake(screen_width/2-180/2, 420*KWIDTH, 180, 22*KWIDTH)];
    
//    [self.view addSubview:greeView];
    UIButton *seletBtn = [[UIButton alloc] initWithFrame:CGRectMake(-10, -5, 30*KWIDTH, 30*KWIDTH)];
    seletBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    [seletBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [seletBtn setImage:[UIImage imageNamed:@"dot"] forState:UIControlStateNormal];
    [seletBtn setImage:[UIImage imageNamed:@"dot_hight"] forState:UIControlStateSelected];
    seletBtn.backgroundColor = [UIColor clearColor];
    
    [greeView addSubview:seletBtn];
    
    
    UILabel *agreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20*KWIDTH, 0, 90*KWIDTH, 22*KWIDTH)];
    agreeLabel.text = @"我已阅读并同意";
    agreeLabel.textColor = [UIColor whiteColor];
    agreeLabel.font = [UIFont systemFontOfSize:12*KWIDTH];
    
    [greeView addSubview:agreeLabel];
    
    UIButton *agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(110*KWIDTH , 0, 80, 22*KWIDTH)];
    [agreeBtn addTarget:self action:@selector(agreeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [agreeBtn setTitle:@"《注册协议》" forState:UIControlStateNormal];
    agreeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [agreeBtn setTitleColor:titleResignColor forState:UIControlStateNormal];
    
    agreeBtn.backgroundColor = [UIColor clearColor];
    
    [greeView addSubview:agreeBtn];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-244/2, 535*KWIDTH, 244, 22*KWIDTH)];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"友情提示：注册手机号为银行预留手机号码";
    tipLabel.font = [UIFont systemFontOfSize:12];
    tipLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:tipLabel];
    
    
}


#pragma mark验证码
-(void)veriBtnClick
{
    BOOL isPhoneNum =[self checkTel:_phoneText.text];
    
    if (isPhoneNum) {
        NSLog(@"获取验证码");
        _veriBtn.enabled = NO;
        
        LoginManager *loginManager = [[LoginManager alloc] init];
        [loginManager getMessageCode:_phoneText.text block:^(NSDictionary *dictionary, NSError *error) {
            NSLog(@"dictionary==%@==",dictionary);
        }];
        
        
        [self setTime];
    }else
    {
        [DisplayUtils alert:@"手机号码输入错误" viewController:self ];
    }
    
}

#pragma mark登录按钮
-(void)loginButtonClick
{
    NSLog(@"loginButtonClick");
    LoginManager *loginManager = [[LoginManager alloc] init];
    NSString *code =_veriText.text;
    NSString *phoneNum = _phoneText.text;
    
    BOOL isPhoneNum =[self checkTel:phoneNum];
    
    if (!isPhoneNum) {
        
        [DisplayUtils alert:@"请输入正确手机号"];
        return;
        
    }
    if (code.length == 0) {
        [DisplayUtils alert:@"请输入验证码"];
        
        return;
        
    }
//    if (_isAgree == NO) {
//        [DisplayUtils alert:@"没有同意协议"];
//        return;
//    }
    __weak __typeof(self)weakSelf = self;
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    
    if ([code isEqualToString:@"8888"]&[phoneNum isEqualToString:@"13788889999"]) {
        [self performSelector:@selector(loginBtn) withObject:nil afterDelay:0.5];
        
    } else{
        [DisplayUtils alert:@"验证码和账号不匹配"];
        
    }
    
    
}
-(void)loginBtn
{
    [SVProgressHUD dismiss];
    __weak typeof(self) weakSelf = self;
    InformationController *inforVC = [[InformationController alloc] init];
    [weakSelf.navigationController pushViewController:inforVC animated:YES];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    [_timer invalidate];
}

#pragma mark同意协议
-(void)selectBtnClick:(UIButton *)btn
{
    NSLog(@"同意了协议");
    if (_isAgree == NO) {
        NSLog(@"同意了");
        btn.selected = YES;
        _isAgree = YES;
        
    } else
    {
        _isAgree = NO;
        btn.selected = NO;
        NSLog(@"不同意了");
    }
    NSLog(@"%d",_isAgree);
    
}

#pragma mark点击协议按钮
-(void)agreeBtnClick
{
    NSLog(@"点击了协议");
    
    webViewController *webVC = [webViewController new];
    webVC.headerTitle = @"注册协议";
    webVC.url = resignURL;
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark定时器
-(void)setTime
{  /**
    定时器
    */
    self.seconds= 30;
    self.timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeShow) userInfo:nil repeats:YES];
    
}


-(void)timeShow
{
    self.seconds--;
    
    [self.veriBtn setTitle:[NSString stringWithFormat:@"%ds",self.seconds] forState:UIControlStateNormal];
    
    if (_seconds==0) {
        [_timer invalidate];
        [self.veriBtn setTitle:[NSString stringWithFormat:@"重新获得"] forState:UIControlStateNormal];
        self.veriBtn.enabled= YES;
    }
    
}


#pragma mark判断号码是否到11位数
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@",string);
    if (range.location>=11) {
        return NO;
    }else{
        return YES;
    }
    
}


//判断电话号码是否正确
#pragma mark正则表达式
- (BOOL)checkTel:(NSString *)str

{
    
    NSString *regex = @"^((16[0-9])|(13[0-9])|(14[0-9])|(17[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        
        return NO;
        
    }
    return YES;
    
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
