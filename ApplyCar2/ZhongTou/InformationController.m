//
//  InformationController.m
//  ZhongTou
//
//  Created by Jone on 2017/10/17.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "InformationController.h"
#import "AuthSuccessController.h"
#import "AuthFailViewController.h"
#import "AFAppDotNetAPIClient.h"
#import "LoginManager.h"
#import "LineApplyDCVController.h"

#define tipText   @"友情提示：请提供本人身份证、银行卡、驾驶证信息，非本人信息会导致后续校验无法通过."

@interface InformationController ()
@property (nonatomic,retain)UIScrollView *bottomScrollView;

@property (nonatomic,strong)UIImageView *lineImg;
//姓名
@property(strong,nonatomic) UITextField *nameText;
//身份证
@property(strong,nonatomic)UITextField *IdLabel;
//银行卡号
@property(strong,nonatomic)UITextField *BankCardText;
//驾驶证
@property(strong,nonatomic)UITextField *liceText;
@end

@implementation InformationController

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
   
    [self initNavigtionBar];
    [self creatUI];
    [self hideKeyBored];
    
   NSString *longgi =[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_longitude];
    
    NSLog(@"longgi===%@",longgi);

    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNavigtionBar
{
    self.title = @"信息认证";
    self.barView.backgroundColor =navigationBarColor;
    // 消息
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self setNavigationBarLeftButton:buttonBack];

    UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    rightBtn.exclusiveTouch = YES;
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [rightBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [rightBtn setTitle:@"跳过" forState:UIControlStateNormal];
    [self setNavigationBarRightButton:rightBtn];
}

-(void)rightBtn{
    LineApplyDCVController *lineApplyVC = [[LineApplyDCVController alloc] init];
    lineApplyVC.fromType = @"申请";
    [self.navigationController pushViewController:lineApplyVC animated:YES];
    
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)creatUI
{

    if (_bottomScrollView == nil)
    {
        _bottomScrollView = [[UIScrollView alloc]init];
        _bottomScrollView.scrollsToTop = NO;
        _bottomScrollView.frame = CGRectMake(0, 64, screen_width, screen_height-64);
        _bottomScrollView.backgroundColor = buyDetailBackColor;
        _bottomScrollView.contentSize = CGSizeMake(screen_width * 2, 0);
        _bottomScrollView.pagingEnabled = YES;
        _bottomScrollView.delegate = self;
        _bottomScrollView.bounces = NO;
        _bottomScrollView.scrollEnabled=NO;
        _bottomScrollView.showsHorizontalScrollIndicator = NO;
        _bottomScrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:self.bottomScrollView];
    }

//    [self photoInit];
    [self infomationInit];

    
    
}

-(void)infomationInit
{
    UIView *manualPhotoView = [[UIView alloc] initWithFrame:CGRectMake(0, 15*KWIDTH, screen_width, 44*4*KWIDTH)];
    manualPhotoView.backgroundColor = [UIColor whiteColor];
    
    [self.bottomScrollView addSubview:manualPhotoView];
    
    UILabel *manualnameLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 0,35 , 44*KWIDTH)];
    manualnameLabel.text = @"姓名:";
    manualnameLabel.textColor = labelInformationColor;
    manualnameLabel.font = [UIFont fontWithName:fontPingFang size:13*KWIDTH];
    
  
    

    UITextField *nameText = [[UITextField alloc] initWithFrame:CGRectMake(100*KWIDTH, 0,screen_width-100 , 44*KWIDTH)];
    nameText.placeholder = @"请输入姓名";
    nameText.textColor = labelInformationLightColor;
    nameText.font = [UIFont systemFontOfSize:13];
    self.nameText = nameText;
    
    [manualPhotoView addSubview:nameText];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44*KWIDTH, screen_width, 0.5)];
    lineView.backgroundColor = tableCellLineColor;
    
    [manualPhotoView addSubview:lineView];
    
    [manualPhotoView addSubview:manualnameLabel];
    
    
    UILabel *manualIDNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 44*KWIDTH,75 , 44*KWIDTH)];
    manualIDNumLabel.text = @"身份证号:";
    manualIDNumLabel.textColor = labelInformationColor;
    manualIDNumLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:manualIDNumLabel];
    

    UITextField *IdLabel = [[UITextField alloc] initWithFrame:CGRectMake(100*KWIDTH, 44*KWIDTH, screen_width-45, 44*KWIDTH)];
    
    IdLabel.backgroundColor = [UIColor clearColor];
    IdLabel.placeholder = @"请输入身份证号码";
    IdLabel.textColor = labelBlackColor;
    IdLabel.font = [UIFont systemFontOfSize:13];
    self.IdLabel = IdLabel;
    [manualPhotoView addSubview:IdLabel];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 88*KWIDTH, screen_width, 0.5)];
    lineView2.backgroundColor = tableCellLineColor;
    
    [manualPhotoView addSubview:lineView2];
    
    [manualPhotoView addSubview:manualnameLabel];
    
    
    UILabel *BankCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 44*2*KWIDTH,65 , 44*KWIDTH)];
    BankCardLabel.text = @"银行卡号:";
    BankCardLabel.textColor = labelInformationColor;
    BankCardLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:BankCardLabel];
    
    UITextField *BankCardText = [[UITextField alloc] initWithFrame:CGRectMake(100*KWIDTH, 44*2*KWIDTH, screen_width-45, 44*KWIDTH)];
    
    BankCardText.backgroundColor = [UIColor clearColor];
    BankCardText.placeholder = @"请输入银行卡号";
    BankCardText.textColor = labelBlackColor;
    BankCardText.keyboardType = UIKeyboardTypeNumberPad;
    BankCardText.font = [UIFont systemFontOfSize:13];
    self.BankCardText = BankCardText;
    [manualPhotoView addSubview:BankCardText];

    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 132*KWIDTH, screen_width, 0.5)];
    lineView3.backgroundColor = tableCellLineColor;
    
    [manualPhotoView addSubview:lineView3];

    
    UILabel *licenseLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 44*3*KWIDTH,75 , 44*KWIDTH)];
    licenseLabel.text = @"驾驶证号:";
    licenseLabel.textColor = labelInformationColor;
    licenseLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:licenseLabel];
    UITextField *liceText = [[UITextField alloc] initWithFrame:CGRectMake(100*KWIDTH, 44*3*KWIDTH, screen_width-45, 44*KWIDTH)];
    
    liceText.backgroundColor = [UIColor clearColor];
    liceText.placeholder = @"请输入驾驶证号码";
    liceText.textColor = labelBlackColor;
    liceText.keyboardType = UIKeyboardTypeNumberPad;
    liceText.font = [UIFont systemFontOfSize:13];
    self.liceText = liceText;
    
    [manualPhotoView addSubview:liceText];

    
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 44*4*KWIDTH, screen_width, 0.5)];
    lineView4.backgroundColor = tableCellLineColor;
    
    [manualPhotoView addSubview:lineView4];

    
    
    UIButton *postBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 215*KWIDTH, screen_width-30, 45*KWIDTH)];
    postBtn.backgroundColor = buttonBgColor;
    [postBtn setTitle:@"提  交" forState:UIControlStateNormal];
    postBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    postBtn.tag = 104;
    [postBtn addTarget:self action:@selector(postBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_bottomScrollView addSubview:postBtn];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 285*KWIDTH, screen_width-60, 50*KWIDTH)];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = labelBlackColor;
    tipLabel.numberOfLines = 0;
    tipLabel.font = [UIFont fontWithName:fontPingFang size:11*KWIDTH];
    tipLabel.text = tipText;
    [_bottomScrollView addSubview:tipLabel];
 
}

-(void)photoInit
{
  
    UIView *photoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height-130*KWIDTH)];
    photoView.backgroundColor = [UIColor whiteColor];
    
    [self.bottomScrollView addSubview:photoView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 20*KWIDTH,35 , 22)];
    nameLabel.text = @"姓名:";
    nameLabel.textColor = labelLightBlackColor;
    nameLabel.font = [UIFont systemFontOfSize:14];
    
    [photoView addSubview:nameLabel];
    
    UIView *IDView = [[UIView alloc] initWithFrame:CGRectMake(15, 48*KWIDTH, screen_width-30, 55*KWIDTH)];
    IDView.layer.borderColor = broderLineColor.CGColor;
    IDView.layer.borderWidth = 1;
    
    [photoView addSubview:IDView];
    
    UIButton *IdViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 2, screen_width-45, 50*KWIDTH)];
    
    [IdViewBtn setTitle:@"点击拍摄身份证(个人照片面)" forState:UIControlStateNormal];
    
    IdViewBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    IdViewBtn.backgroundColor = [UIColor clearColor];
    
    [IdViewBtn setTitleColor:labelBlackColor forState:UIControlStateNormal];
    
    IdViewBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [IdViewBtn addTarget:self action:@selector(IdViewBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [IDView addSubview:IdViewBtn];
    
    UILabel *IDNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 100*KWIDTH,75 , 22*KWIDTH)];
    IDNumLabel.text = @"身份证号:";
    IDNumLabel.textColor = labelLightBlackColor;
    IDNumLabel.font = [UIFont systemFontOfSize:14];
    
    [photoView addSubview:IDNumLabel];
    
    UIView *IDNumView = [[UIView alloc] initWithFrame:CGRectMake(15, 135*KWIDTH, screen_width-30, 55*KWIDTH)];
    IDNumView.layer.borderColor = broderLineColor.CGColor;
    IDNumView.layer.borderWidth = 1;
    
    [photoView addSubview:IDNumView];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; // 创建属性字典
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14]; // 设置font
    attrs[NSForegroundColorAttributeName] = labelBlackColor; // 设置颜色
    NSAttributedString *phoneAttr = [[NSAttributedString alloc] initWithString:@"输入身份证号" attributes:attrs];

    
    UITextField *IdLabel = [[UITextField alloc] initWithFrame:CGRectMake(12, 2, screen_width-45, 50*KWIDTH)];

    IdLabel.backgroundColor = [UIColor clearColor];
    IdLabel.textColor = labelBlackColor;
    IdLabel.attributedPlaceholder = phoneAttr;
    IdLabel.font = [UIFont systemFontOfSize:15];
    
    [IDNumView addSubview:IdLabel];
    
    
    
    UILabel *BankCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 200*KWIDTH,65 , 22*KWIDTH)];
    BankCardLabel.text = @"银行卡号:";
    BankCardLabel.textColor = labelLightBlackColor;
    BankCardLabel.font = [UIFont systemFontOfSize:14];
    
    [photoView addSubview:BankCardLabel];
    
    UIView *BankCardView = [[UIView alloc] initWithFrame:CGRectMake(15, 235*KWIDTH, screen_width-30, 55*KWIDTH)];
    BankCardView.layer.borderColor = broderLineColor.CGColor;
    BankCardView.layer.borderWidth = 1;
    
    [photoView addSubview:BankCardView];
    
    UIButton *BankCardBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 2, screen_width-45, 50*KWIDTH)];
    
    [BankCardBtn setTitle:@"点击拍摄银行卡正面" forState:UIControlStateNormal];
    
    BankCardBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    BankCardBtn.backgroundColor = [UIColor clearColor];
    
    [BankCardBtn setTitleColor:labelBlackColor forState:UIControlStateNormal];
    
    BankCardBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [BankCardBtn addTarget:self action:@selector(BankCardBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [BankCardView addSubview:BankCardBtn];

    

    UILabel *licenseLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 300*KWIDTH,65 , 22*KWIDTH)];
    licenseLabel.text = @"银行卡号:";
    licenseLabel.textColor = labelLightBlackColor;
    licenseLabel.font = [UIFont systemFontOfSize:14];
    
    [photoView addSubview:licenseLabel];
    
    UIView *licenseView = [[UIView alloc] initWithFrame:CGRectMake(15, 335*KWIDTH, screen_width-30, 55*KWIDTH)];
    licenseView.layer.borderColor = broderLineColor.CGColor;
    licenseView.layer.borderWidth = 1;
    
    [photoView addSubview:licenseView];
    
    UIButton *licenseBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 2, screen_width-45, 50*KWIDTH)];
    
    [licenseBtn setTitle:@"点击拍摄银行卡" forState:UIControlStateNormal];
    
    licenseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    licenseBtn.backgroundColor = [UIColor clearColor];
    
    [licenseBtn setTitleColor:labelBlackColor forState:UIControlStateNormal];
    
    licenseBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [licenseBtn addTarget:self action:@selector(licenseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [licenseView addSubview:licenseBtn];
    
    
    UIButton *postBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 412*KWIDTH, screen_width-30, 46*KWIDTH)];
    postBtn.backgroundColor = buttonBgColor;
    [postBtn setTitle:@"提  交" forState:UIControlStateNormal];
    postBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    postBtn.tag = 103;
    [postBtn addTarget:self action:@selector(postBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [photoView addSubview:postBtn];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 470*KWIDTH, screen_width-60, 50*KWIDTH)];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = labelBlackColor;
    tipLabel.numberOfLines = 0;
    tipLabel.font = [UIFont systemFontOfSize:14*KWIDTH];
    tipLabel.text = tipText;
    [photoView addSubview:tipLabel];
    
    
    
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

#pragma mark 手动输入
-(void)manualInput
{
    
    UIView *manualPhotoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height-130*KWIDTH)];
    manualPhotoView.backgroundColor = [UIColor whiteColor];
    
    [self.bottomScrollView addSubview:manualPhotoView];
    
    UILabel *manualnameLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 20*KWIDTH,35 , 22*KWIDTH)];
    manualnameLabel.text = @"姓名:";
    manualnameLabel.textColor = labelLightBlackColor;
    manualnameLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:manualnameLabel];
    
    UIView *manualIDView = [[UIView alloc] initWithFrame:CGRectMake(15, 48*KWIDTH, screen_width-30, 55*KWIDTH)];
    manualIDView.layer.borderColor = broderLineColor.CGColor;
    manualIDView.layer.borderWidth = 1;
    
    [manualPhotoView addSubview:manualIDView];
    
    
    
    UILabel *manualIDNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 100*KWIDTH,75 , 22*KWIDTH)];
    manualIDNumLabel.text = @"身份证号:";
    manualIDNumLabel.textColor = labelLightBlackColor;
    manualIDNumLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:manualIDNumLabel];
    
    UIView *manualIDNumView = [[UIView alloc] initWithFrame:CGRectMake(15, 135*KWIDTH, screen_width-30, 55*KWIDTH)];
    manualIDNumView.layer.borderColor = broderLineColor.CGColor;
    manualIDNumView.layer.borderWidth = 1;
    
    [manualPhotoView addSubview:manualIDNumView];

    
    UITextField *IdLabel = [[UITextField alloc] initWithFrame:CGRectMake(12, 2, screen_width-45, 50*KWIDTH)];
    
    IdLabel.backgroundColor = [UIColor clearColor];
    IdLabel.textColor = labelBlackColor;
    IdLabel.font = [UIFont systemFontOfSize:15];
    
    [manualIDNumView addSubview:IdLabel];
    
    
    UILabel *BankCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 200*KWIDTH,65 , 22*KWIDTH)];
    BankCardLabel.text = @"银行卡号:";
    BankCardLabel.textColor = labelLightBlackColor;
    BankCardLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:BankCardLabel];
    
    UIView *BankCardView = [[UIView alloc] initWithFrame:CGRectMake(15, 235*KWIDTH, screen_width-30, 55*KWIDTH)];
    BankCardView.layer.borderColor = broderLineColor.CGColor;
    BankCardView.layer.borderWidth = 1;
    
    [manualPhotoView addSubview:BankCardView];
    
    
    
    UILabel *licenseLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 300*KWIDTH,65 , 22*KWIDTH)];
    licenseLabel.text = @"银行卡号:";
    licenseLabel.textColor = labelLightBlackColor;
    licenseLabel.font = [UIFont systemFontOfSize:14];
    
    [manualPhotoView addSubview:licenseLabel];
    
    UIView *licenseView = [[UIView alloc] initWithFrame:CGRectMake(15, 335*KWIDTH, screen_width-30, 55*KWIDTH)];
    licenseView.layer.borderColor = broderLineColor.CGColor;
    licenseView.layer.borderWidth = 1;
    
    [manualPhotoView addSubview:licenseView];
    
    UIButton *postBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 412*KWIDTH, screen_width-30, 46*KWIDTH)];
    postBtn.backgroundColor = buttonBgColor;
    [postBtn setTitle:@"提  交" forState:UIControlStateNormal];
    postBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    postBtn.tag = 104;
    [postBtn addTarget:self action:@selector(postBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [manualPhotoView addSubview:postBtn];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 470*KWIDTH, screen_width-60, 50*KWIDTH)];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = labelBlackColor;
    tipLabel.numberOfLines = 0;
    tipLabel.font = [UIFont systemFontOfSize:14*KWIDTH];
    tipLabel.text = tipText;
    [manualPhotoView addSubview:tipLabel];

    
    
}

-(void)changeStyle:(UIButton *)btn
{
    switch (btn.tag) {
        case 100:
        {
            _bottomScrollView.contentOffset = CGPointMake(0, 0);
            [UIView animateWithDuration:0.5 animations:^{
            _lineImg.frame =CGRectMake(0, 63*KWIDTH, screen_width/2, 3);
            }];
        }
            break;
        case 101:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width, 0);
            [UIView animateWithDuration:0.5 animations:^{
                _lineImg.frame =CGRectMake(screen_width/2, 63*KWIDTH, screen_width/2, 3);
            }];
            
        }
            break;
        default:
  
            break;
    }
    NSLog(@"切换状态");
    
}

-(void)IdViewBtnClick
{
    NSLog(@"点击拍摄身份证");
}

-(void)BankCardBtnClick
{
    NSLog(@"点击拍摄银行卡");

}

-(void)licenseBtnClick
{
    NSLog(@"点击拍摄驾驶证");
    
}

- (BOOL)simpleVerifyIdentityCardNum:(NSString *)number {
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:number];
    
    if (!isMatch) {
        
        return NO;
        
    }
    return YES;
}



#pragma mark  提交验证
-(void)postBtnClick:(UIButton *)btn
{
    NSLog(@"postBtnClick");

    NSLog(@"%@,%@,%@,%@",_nameText.text,_IdLabel.text,_BankCardText.text,_liceText.text);
    NSString *name = _nameText.text;
    NSString *idName = _IdLabel.text;
    NSString *bankCard = _BankCardText.text;
    NSString *licenCard = _liceText.text;
    
    BOOL isIDNum = [self simpleVerifyIdentityCardNum:idName];
    
    if (name.length>0&&isIDNum == YES&&bankCard.length<=32&&licenCard.length==12) {
        
        LoginManager *loginManager = [[LoginManager alloc] init];
        [loginManager verificationBankFourInfo:name IDNum:idName bankCark:bankCard licenCark:licenCard block:^(NSDictionary *dictionary, NSError *error) {
            NSLog(@"dictionary=%@",dictionary);
            
            if ([dictionary[@"result"] integerValue] == 1) {
                [DisplayUtils alert:@"认证成功"];
                [[SavaInfoTools sharedInstance] saveBooleanValue:YES withKey:User_IsLogin];
                [[SavaInfoTools sharedInstance] saveObjectValue:name withKey:User_Name];
                [[SavaInfoTools sharedInstance] saveObjectValue:idName withKey:User_Userid];
                
                [[SavaInfoTools sharedInstance] saveObjectValue:bankCard withKey:User_Bankno];
                [[SavaInfoTools sharedInstance] saveObjectValue:licenCard withKey:User_Driver_license];
                
                LineApplyDCVController *lineApplyVC = [[LineApplyDCVController alloc] init];
                lineApplyVC.fromType = @"申请";
                [self.navigationController pushViewController:lineApplyVC animated:YES];
                
            } else
            {
                [[SavaInfoTools sharedInstance] saveBooleanValue:NO withKey:User_IsLogin];
                NSArray *msgArr = dictionary[@"data"];
                if (msgArr.count>0) {
                    NSDictionary   *msg = [msgArr objectAtIndexWithCheck:0];
                    NSString *msgSting = msg[@"msg"];
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"验证失败"
                                                                    message:msgSting
                                                                   delegate:self
                                                          cancelButtonTitle:@"Cancel"
                                                          otherButtonTitles:nil,nil];
                    [alert show];
                    
                }else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"验证失败"
                                                                    message:nil
                                                                   delegate:self
                                                          cancelButtonTitle:@"Cancel"
                                                          otherButtonTitles:nil,nil];
                    [alert show];
                }
                
            }
            
        }];
    } else
    {
        [DisplayUtils alert:@"请填写正确的相关信息"];

    }

  

//    if (btn.tag==103) {
//        [self.navigationController pushViewController:[AuthSuccessController new] animated:YES];
//        
//    } else
//    {
//        [self.navigationController pushViewController:[AuthFailViewController new] animated:YES];
//    }
    
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
