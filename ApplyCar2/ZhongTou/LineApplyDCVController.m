

#import "LineApplyDCVController.h"
#import "LineApplyDCViewCell.h"
#import "LineApplyHeaderCell.h"
#import "LineApplyPictureCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import "LineApplyZhengXCell.h"
#import "LoginManager.h"
#import "BillListController.h"
#import "webViewController.h"
#import  "UIImageView+WebCache.h"
#import "MineManager.h"


@interface LineApplyDCVController ()<addPictureDelegate,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,addZhengxingDelegate,HXPhotoViewDelegate,UITextFieldDelegate>

@property (nonatomic,assign) BOOL  isOneOpen;

@property (nonatomic,assign) BOOL  isTwoOpen;

@property (nonatomic,assign) BOOL  isThreeOpen;

@property (nonatomic,assign) BOOL  isFourOpen;

@property (nonatomic,assign) BOOL  isFiveOpen;

@property (nonatomic,assign) BOOL  isSixOpen;

@property(strong,nonatomic)NSIndexPath *indexPath;

@property(assign,nonatomic)NSInteger num;

@property(strong,nonatomic)NSMutableArray *imageArray;

@property(strong,nonatomic)NSMutableArray *imageFileArray;


@property(strong,nonatomic)NSMutableArray *zhengXinArray;

@property(assign,nonatomic)CGFloat cellHight;

@property (nonatomic,assign) BOOL  iSIDLeft;

@property (nonatomic,assign) BOOL  iSIDRight;

@property (nonatomic,assign) BOOL  iSCardLeft;

@property (nonatomic,assign) BOOL  iSCardRight;

@property (nonatomic,assign) BOOL  iSLicseLeft;

@property (nonatomic,assign) BOOL  iSLicseRight;

@property (nonatomic,strong) UIImageView  *iSIDLeftImage;

@property (nonatomic,strong) UIImageView  *iSIDRightImage;

@property (nonatomic,strong) UIImageView  *iSCardLeftImage;

@property (nonatomic,strong) UIImageView  *iSCardRightImage;

@property (nonatomic,strong) UIImageView  *iSLicseLeftImage;

@property (nonatomic,strong) UIImageView  *iSLicseRightImage;

@property (nonatomic,assign) BOOL  iSZhengXing;


@property (nonatomic,assign) BOOL  isAgree;
@property (nonatomic,assign) BOOL  isSucessAgree;

//个人资料
@property(strong,nonatomic)NSArray *infoArray;

@property(strong,nonatomic)NSArray *infoNameArray;

@property(strong,nonatomic)NSArray *jigouArray;


@property(strong,nonatomic)UIView *bgView;

@property(strong,nonatomic)UITextField *textField;


@property(strong,nonatomic)UIButton * jicaiBtn;

@property(strong,nonatomic)UIButton * dicaiBtn;

@property(copy,nonatomic)NSString *seleString;

@property(copy,nonatomic)NSString *operaterId;

@property(copy,nonatomic)NSString *operaterName;


@property(copy,nonatomic)NSString *deptId;


@property(strong,nonatomic)UIButton *checkBtn;

@property(copy,nonatomic)NSString *contractNo;
@end

@implementation LineApplyDCVController


-(UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(screen_width-110*KWIDTH, 0, 80*KWIDTH, 34*KWIDTH)];
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.textColor = titleBuyDetail;
        _textField.placeholder = @"请输入机构代码";
        _textField.font = [UIFont fontWithName:fontPingFang size:11*KWIDTH];
        _textField.tag = 1001;
        _textField.returnKeyType = UIReturnKeyNext;
        [_textField addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
        _textField.delegate = self;
        
    }
    return  _textField;
}

-(void)nextOnKeyboard:(UITextField *)sender
{
    if (sender == _textField) {
        [_textField becomeFirstResponder];
    }
}

-(UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(200*KWIDTH, 0, screen_width-200*KWIDTH, 34*KWIDTH)];
        _bgView.tag = 1000;
        
        
        UIButton * jicaiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 7, 20, 20)];
        self.jicaiBtn = jicaiBtn;
        [jicaiBtn setImage:[UIImage imageNamed:@"round"] forState:UIControlStateNormal];
        [jicaiBtn setImage:[UIImage imageNamed:@"select-round"] forState:UIControlStateSelected];
        [jicaiBtn addTarget:self action:@selector(dicaiBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *jicaiLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 50, 34)];
        jicaiLabel.text = @"集采";
        jicaiLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        [_bgView addSubview:jicaiLabel];
        [_bgView addSubview:jicaiBtn];
        
        UIButton * dicaiBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 7, 20, 20)];
        self.dicaiBtn = dicaiBtn;
        [dicaiBtn setImage:[UIImage imageNamed:@"round"] forState:UIControlStateNormal];
        [dicaiBtn setImage:[UIImage imageNamed:@"select-round"] forState:UIControlStateSelected];
        [dicaiBtn addTarget:self action:@selector(dicaiBtn:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *dicaiLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 50, 34)];
        dicaiLabel.text = @"地采";
        dicaiLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        [_bgView addSubview:dicaiLabel];
        [_bgView addSubview:dicaiBtn];
    }
    
    return _bgView;
}

-(void)dicaiBtn:(UIButton*)button
{
    if (button==self.dicaiBtn) {
        self.dicaiBtn.selected =YES;
        self.jicaiBtn.selected=NO;
        NSLog(@"点击了第地采按钮");
        self.seleString= @"地采";
        
    }else {
        
        
        self.dicaiBtn.selected =NO;
        self.jicaiBtn.selected=YES;
        NSLog(@"点击了第集采按钮");
        self.seleString= @"集采";

    }

}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    
    return self;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64-85)];
        _tableView.backgroundColor = buyDetailBackColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.contentSize = CGSizeMake(screen_width, screen_height*2);
        
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 44*KWIDTH)];
        UIButton *checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(40*KWIDTH, 10, 24*KWIDTH, 24*KWIDTH)];
        [checkBtn setImage:[UIImage imageNamed:@"Select_box"] forState:UIControlStateNormal];
        [checkBtn setImage:[UIImage imageNamed:@"Select_box1"] forState:UIControlStateSelected];
        self.checkBtn = checkBtn;

//        self.checkBtn.enabled = NO;
//        [checkBtn addTarget:self action:@selector(chectBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        [v addSubview:checkBtn];
        
        UILabel *checkLabel = [[UILabel alloc] initWithFrame:CGRectMake(70*KWIDTH,0,  110*KWIDTH, 44*KWIDTH)];
        checkLabel.textColor = titleBuyDetail;
        checkLabel.font = [UIFont fontWithName:fontPingFang size:12];
    
        checkLabel.text = @"我已经阅读并同意";
        [v addSubview:checkLabel];
        
        UIButton *checkBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(175*KWIDTH, 0, 120*KWIDTH, 44*KWIDTH)];

        [checkBtn2 setTitle:@"《客户征信授权书》" forState:UIControlStateNormal];
        [checkBtn2 setTitleColor:TitleBlueColor forState:UIControlStateNormal];
        [checkBtn2 addTarget:self action:@selector(chect2BtnClick) forControlEvents:UIControlEventTouchUpInside];

        checkBtn2.titleLabel.font = [UIFont systemFontOfSize:12];
        

        [v addSubview:checkBtn2];

        
        UILabel *checkLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(290*KWIDTH,0,  120*KWIDTH, 44*KWIDTH)];
        checkLabel2.textColor = titleBuyDetail;
        checkLabel2.font = [UIFont fontWithName:fontPingFang size:12];
        checkLabel2.text = @"所述内容";
        [v addSubview:checkLabel2];

        v.backgroundColor = BackGroundColor;
        _tableView.tableFooterView = v;//绝妙的方法去掉多余的分割线
        
        _tableView.scrollEnabled = YES;
        
    }
    return _tableView;
}

#pragma mark 点击了同意授权书
-(void)chectBtnClick:(UIButton *)btn
{
 
    if (btn.selected) {
        self.isAgree = NO;
        btn.selected = NO;
    } else
    {
        self.isAgree = YES;
        btn.selected = YES;
    }
}

#pragma mark 点击了授权书
-(void)chect2BtnClick
{
    if (self.contractNo.length >0) {
            
        MineManager *manager = [[MineManager alloc] init];
        __weak __typeof(self)weakSelf = self;
        NSDictionary *param = @{@"applyNo":self.contractNo?self.contractNo:@""
                                };
        
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
        [manager GetJunziQueryByID:param Block:^(NSDictionary *dictionary, NSError *error) {
            [SVProgressHUD dismiss];
            NSLog(@"dictionary==%@",dictionary);
            
            if ([dictionary[@"result"] integerValue] ==1) {
                webViewController *webVC = [[webViewController alloc] init];
                NSDictionary *data = dictionary[@"data"];
                webVC.url = data[@"url"];
                webVC.hetongID = self.contractNo;
                [weakSelf.navigationController pushViewController:webVC animated:YES];
                
            } else
            {
                [DisplayUtils alert:dictionary[@"message"]];
            }
        }];


        
    } else
    {
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigtionBar];
    [self creatUI];
//    [self getDataInfo];
    // Do any additional setup after loading the view.
}
-(void)initNavigtionBar
{
    self.title = @"在线申请";
    
    self.barView.backgroundColor = navigationBarColor;
    [self.view bringSubviewToFront:self.barView];
    
    self.iSIDLeftImage = [[UIImageView alloc] init];
    self.iSIDRightImage = [[UIImageView alloc] init];
    self.iSCardLeftImage = [[UIImageView alloc] init];
    self.iSCardRightImage = [[UIImageView alloc] init];
    self.iSLicseLeftImage = [[UIImageView alloc] init];
    self.iSLicseRightImage = [[UIImageView alloc] init];
    
    self.isOneOpen = YES;
    self.isTwoOpen = YES;
    self.isThreeOpen = YES;
    self.isFourOpen = YES;

    self.isFiveOpen = YES;

    self.isSixOpen = YES;
    
    self.iSIDLeft = NO;
    self.iSIDRight = NO;
    
    self.iSCardLeft = NO;
    
    self.iSCardRight = NO;
    self.iSLicseLeft = NO;
    self.iSLicseRight = NO;
    self.iSZhengXing = NO;
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);

    [self.barView setLeftButton:buttonBack];
    
    UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [rightBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [rightBtn setTitle:@"跳过" forState:UIControlStateNormal];
    [self.barView setRightButton:rightBtn];
    
}
-(void)rightBtn
{
    [self pushViewController];
}

-(void)creatUI{
    
    
    NSString *name =[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_Name];
    NSMutableString *userId = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_Userid];
    NSMutableString *bankNo = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_Bankno];
    NSMutableString *license = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    self.infoNameArray = @[@"姓名",@"身份证",@"电话号码",@"银行卡号"];
    self.jigouArray = @[@"机构代码",@"经办人"];
    self.infoArray = @[name?name:@"",userId?userId:@"",license?license:@"",bankNo?bankNo:@""];
    UIImage *idcard1 = [UIImage imageNamed:@"idcard1"];
    UIImage *idcard2 = [UIImage imageNamed:@"idcard2"];
    UIImage *bank1 = [UIImage imageNamed:@"bank1"];
    UIImage *bank2 = [UIImage imageNamed:@"bank2"];
    UIImage *driver1 = [UIImage imageNamed:@"driver1"];
    UIImage *driver2 = [UIImage imageNamed:@"driver2"];
    NSArray *array = @[idcard1, idcard2, bank1,bank2, driver1,driver2];
    self.imageArray = [[NSMutableArray alloc] initWithArray:array];

    self.zhengXinArray = [NSMutableArray array];
    self.dataArray = @[@"客户资料",@"身份证",@"银行卡号",@"驾驶证",@"人行征信报告或征信授权书（二选一）",@"机构选择"];
    self.imgArray = @[@"my",@"ic-card",@"bankcard",@"driver-card",@"creditinvestigation",@"mechanism"];
    self.userInfoArray = @[@"姓名",@"身份证号",@"电话号码",@"银行卡号"];
    self.typeArray =@[@"机构代码",@"经办人",@"业务类型"];
    
    [self.view addSubview:self.tableView];
    
    UIButton *upBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, screen_height-65, screen_width-40, 45)];
    upBtn.backgroundColor = buttonBgColor;
    upBtn.layer.cornerRadius = 5;
    [upBtn setTitle:@"在线申请" forState:UIControlStateNormal];
    [upBtn addTarget:self action:@selector(upBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upBtn];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BackGroundColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)refleshUI
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
        
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"2-------%@",[NSThread currentThread]);
        });
    });
    

}

#pragma mark 获取合同
-(void)getDataHetongInfo{
    NSString *phoneNum = [[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    LoginManager *manager = [LoginManager new];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
    __weak __typeof(self)weakSelf = self;
    NSDictionary *param= @{
                           @"mobile":phoneNum?phoneNum:@""
                           };
    [manager getHetongInfo:param block:^(NSDictionary *dictionary, NSError *error) {
        NSLog(@"dictionary==%@",dictionary);
        [SVProgressHUD dismiss];
        
        if ([dictionary[@"result"] intValue] ==1) {
            
            NSDictionary *data = dictionary[@"data"];
            
            weakSelf.contractNo = data[@"contractNo"];
            if (weakSelf.contractNo.length >0) {
                weakSelf.isAgree = YES;
                weakSelf.isSucessAgree = YES;
                weakSelf.checkBtn.selected = YES;
                
            }
        }
        [weakSelf.tableView reloadData];

    }];
}

#pragma mark UITableViewDelegate对于的cell view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        static NSString *IDENTITY2=@"LineApplyHeaderCell";
        
        LineApplyHeaderCell *headerCell=[tableView dequeueReusableCellWithIdentifier:IDENTITY2];
        if (headerCell==nil) {
            [tableView registerClass:[LineApplyHeaderCell class] forCellReuseIdentifier:IDENTITY2];
            headerCell=[tableView dequeueReusableCellWithIdentifier:IDENTITY2 forIndexPath:indexPath];
        }
        
        headerCell.imagView.image = [UIImage imageNamed:self.imgArray[indexPath.section]];
        
        headerCell.titleLabel.text = self.dataArray[indexPath.section];
        
        NSString *upDownImg;
        if (indexPath.section == 0) {
            upDownImg=  _isOneOpen?@"up":@"down";
        } else if (indexPath.section == 1)
        {
            upDownImg=  _isTwoOpen?@"up":@"down";
        }else if (indexPath.section == 2)
        {
            upDownImg=  _isThreeOpen?@"up":@"down";
        }else if (indexPath.section == 3)
        {
            upDownImg=  _isFourOpen?@"up":@"down";
        }else if (indexPath.section == 4)
        {
            upDownImg=  _isFiveOpen?@"up":@"down";
        }else if (indexPath.section == 5)
        {
            upDownImg=  _isSixOpen?@"up":@"down";
        }
        headerCell.upDownView.image = [UIImage imageNamed:upDownImg];

        headerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return headerCell;
        
    } else {
        
        if (indexPath.section == 1||indexPath.section == 2||indexPath.section == 3) {
            static NSString *IDENTITY3=@"LineApplyPictureCell";
            LineApplyPictureCell *cell3=[tableView dequeueReusableCellWithIdentifier:IDENTITY3];
            if (cell3==nil) {
                [tableView registerClass:[LineApplyPictureCell class] forCellReuseIdentifier:IDENTITY3];
                cell3=[tableView dequeueReusableCellWithIdentifier:IDENTITY3 forIndexPath:indexPath];
            }
            UIImage *leftImg ;
            UIImage *rightImg ;
            if (indexPath.section == 1) {
                leftImg = [self.imageArray objectAtIndexWithCheck:0];
                rightImg = [self.imageArray objectAtIndexWithCheck:1];
                if (_iSIDLeft==YES) {
                    cell3.leftDeletBtn.hidden = NO;
                } else
                {
                    cell3.leftDeletBtn.hidden = YES;
                }
                if (_iSIDRight==YES) {
                    cell3.rightDeleBtn.hidden = NO;
                } else
                {
                    cell3.rightDeleBtn.hidden = YES;
                }
  
//           (_iSIDLeft==YES)&&(_iSIDRight == YES)&&(_iSCardLeft == YES) &&(_iSCardRight == YES) &&(_iSLicseLeft == YES) && (_iSLicseRight == YES

            } else if (indexPath.section == 2) {
                leftImg = [self.imageArray objectAtIndexWithCheck:2];

                rightImg = [self.imageArray objectAtIndexWithCheck:3];
                
                if (_iSCardLeft==YES) {
                    cell3.leftDeletBtn.hidden = NO;
                } else
                {
                    cell3.leftDeletBtn.hidden = YES;
                }
                if (_iSCardRight==YES) {
                    cell3.rightDeleBtn.hidden = NO;
                } else
                {
                    cell3.rightDeleBtn.hidden = YES;
                }
   
            }else if (indexPath.section == 3) {
                leftImg = [self.imageArray objectAtIndexWithCheck:4];

                rightImg = [self.imageArray objectAtIndexWithCheck:5];
                
                if (_iSLicseLeft==YES) {
                    cell3.leftDeletBtn.hidden = NO;
                } else
                {
                    cell3.leftDeletBtn.hidden = YES;
                }
                if (_iSLicseRight==YES) {
                    cell3.rightDeleBtn.hidden = NO;
                } else
                {
                    cell3.rightDeleBtn.hidden = YES;
                }
                
            }


            
            cell3.leftImagView.image = leftImg;
            cell3.rightImagView.image = rightImg;
          
            cell3.delegate = self;
            cell3.index = indexPath;
            return cell3;

        } else if(indexPath.section == 4){
            static NSString *IDENTITY4=@"LineApplyZhengXCell";
            LineApplyZhengXCell *cell4=[tableView dequeueReusableCellWithIdentifier:IDENTITY4];
            if (cell4==nil) {
                [tableView registerClass:[LineApplyZhengXCell class] forCellReuseIdentifier:IDENTITY4];
                cell4=[tableView dequeueReusableCellWithIdentifier:IDENTITY4 forIndexPath:indexPath];
            }

            [cell4 fillCellWithModel:self.zhengXinArray];
            cell4.delegate = self;
            cell4.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell4;

        } else {
            static NSString *IDENTITY=@"LineApplyDCViewCell";
            LineApplyDCViewCell *cell=[tableView dequeueReusableCellWithIdentifier:IDENTITY];
            if (cell==nil) {
                [tableView registerClass:[LineApplyDCViewCell class] forCellReuseIdentifier:IDENTITY];
                cell=[tableView dequeueReusableCellWithIdentifier:IDENTITY forIndexPath:indexPath];
            }
            for (UIView* subView in cell.contentView.subviews)
            {

                if (subView.tag == 1000||subView.tag == 1001) {
                    [subView removeFromSuperview];
                }
                
            }
            cell.detailLabel.text = @"";

            if (indexPath.section == 0) {
                cell.titleLabel.text = self.infoNameArray[indexPath.row-1];
                cell.detailLabel.text = self.infoArray[indexPath.row-1];
            } else if(indexPath.section == 5 && indexPath.row == 3 )
            {
                cell.titleLabel.text = @"业务类型";

                [cell.contentView addSubview:self.bgView];

              
            }else if(indexPath.section == 5 &&  indexPath.row == 2)
            {
                cell.titleLabel.text = self.jigouArray[1];
                cell.detailLabel.text = self.operaterName?self.operaterName:@"";
 
            }else if(indexPath.section == 5 && indexPath.row == 1)
            {
                cell.titleLabel.text = self.jigouArray[0];
                [cell.contentView addSubview:self.textField];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
        
    }
    return nil;
}



#pragma mark 返回多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.isOneOpen ? 5:1;
    } else if (section==1){
        return self.isTwoOpen ? 2:1;
    } else if (section==2){
        return self.isThreeOpen ? 2:1;
    } else if (section==3){
        return self.isFourOpen ? 2:1;
    } else if (section==4){
        return self.isFiveOpen ? 2:1;
    } else {
        return self.isSixOpen ? 4:1;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 55*KWIDTH;
    } else
    {
        if (indexPath.section == 1||indexPath.section == 2||indexPath.section == 3) {
            return 170*KWIDTH;
        } else if(indexPath.section == 4)
        {

            if (_cellHight >0) {
                
                 return    _cellHight;
           
            } else
            {
               return 140*KWIDTH;
            }
            
        }
        return 34*KWIDTH;
    }
}



#pragma mark  返回
-(void)backClick
{
    if ([self.fromType isEqualToString:@"申请"]) {
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:knotificationChangeVC object:@"1"];


    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark  在线申请
-(void)upBtnClick
{
    
    NSLog(@"在线申请");
    if ((_iSIDLeft==YES)&&(_iSIDRight == YES)&&(_iSCardLeft == YES) &&(_iSCardRight == YES) &&(_iSLicseLeft == YES) && (_iSLicseRight == YES)) {
        
        if (_operaterName ==NO) {
            [DisplayUtils alert:@"请选择经办人"];
            return;
        }
        if (_isAgree == NO) {
            [DisplayUtils alert:@"请同意客户授权书"];
            return;
        }
        if ([_seleString isEqualToString:@"地采"]||[_seleString isEqualToString:@"集采"])
        {
        }
        else
        {
            [DisplayUtils alert:@"请选择业务类型"];
            return;
        }
        
        LoginManager *manager = [[LoginManager alloc] init];
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];

            __weak __typeof(self)weakSelf = self;
        [manager uploadUIImge:self.imageArray certificate:self.zhengXinArray block:^(NSDictionary *dictionary, NSError *error) {
            NSLog(@"%@",dictionary);
            
            if ([dictionary[@"result"] intValue] ==1) {
                NSString *data = dictionary[@"data"];
                [weakSelf updatePicture:data];
            }
        }];
    } else
    {
        [DisplayUtils alert:@"请全部添加图片"];
        [SVProgressHUD dismiss];


    }
    
}

-(void)updatePicture:(NSString *)Image
{
    LoginManager *manager = [[LoginManager alloc] init];
    NSString *name =[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_Name];
    NSMutableString *customerIdnumber = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_Userid];
    NSMutableString *userId = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_id];
    
    NSMutableString *bankNo = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_Bankno];
    NSMutableString *phoneNum = (NSMutableString*)[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    int   status ;
    if ([_seleString isEqualToString:@"地采"]) {
        status = 2;
    } else if ([_seleString isEqualToString:@"集采"])
    {
        status = 1;
    } else
    {
        return;
    }
    
    __weak __typeof(self)weakSelf = self;
    NSDictionary *parameters = @{
                                 @"customerName":name?name:@"",
                                 @"customerPhone":phoneNum?phoneNum:@"",
                                 @"customerIdnumber":customerIdnumber?customerIdnumber:@"",
                                 @"userId":userId?userId:@"",
                                 @"bankNo":bankNo?bankNo:@"",
                                 @"orgCode":_textField.text?_textField.text:@"",
                                 @"status":@(status),
                                 
                                 @"deptId":_deptId?_deptId:@"",
                                 @"operaterName":_operaterName?_operaterName:@"",
                                 @"operaterId":_operaterId?_operaterId:@"",
                                 @"signContractNo":_contractNo?_contractNo:@"",
                                 @"images":Image?Image:@""
                                 };
//    [manager uploadPicture:self.imageArray certificate:self.zhengXinArray Dic:parameters block:^(NSDictionary *dictionary, NSError *error) {
//        NSLog(@"dictionary==%@",dictionary);
//        if ([dictionary[@"result"] intValue] ==1) {
//            [DisplayUtils alert:@"申请成功"];
//            [SVProgressHUD dismiss];
//            [weakSelf performSelector:@selector(pushViewController) withObject:nil afterDelay:0.8f];
//
//        } else
//        {
//            [DisplayUtils alert:@"申请失败" viewController:self];
//
//        }
//    }];
    [manager uploadPictureString:parameters block:^(NSDictionary *dictionary, NSError *error) {
        NSLog(@"dictionary==%@",dictionary);
        [SVProgressHUD dismiss];

        if ([dictionary[@"result"] intValue] ==1) {
            [DisplayUtils alert:@"申请成功"];
            [weakSelf performSelector:@selector(pushViewController) withObject:nil afterDelay:0.8f];
            
        } else
        {
            [DisplayUtils alert:@"申请失败" viewController:self];
            
        }
    }];
    
}

-(void)pushViewController{
    BillListController *bookViewVc = [BillListController  new];
    [self.navigationController pushViewController:bookViewVc animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSLog(@"点击了按钮");
        if (indexPath.section == 4) {
            self.isFiveOpen = !self.isFiveOpen;
            [tableView reloadData];
            return;

        }

      [self tapExtensionAction:indexPath];
        
    } else  if (indexPath.row == 2 && indexPath.section == 5)
    {
        
        if (_textField.text.length>=1) {

        }
        
        
    }
}

#pragma mark 查看经办人的回调
-(void)didSelectedhandleName:(NSString *)name deptId:(NSString *)deptId operterName:(NSString *)opername;
{
    NSLog(@"%@",name);
    self.operaterName = [NSString stringWithFormat:@"%@",opername];
    self.operaterId = [NSString stringWithFormat:@"%@",name];
    
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:5];

    self.deptId = [NSString stringWithFormat:@"%@",deptId];
    NSArray <NSIndexPath *> *indexPathArray = @[indexPath2];
    [_tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];

}


#pragma mark 显示和关闭cell
-(void)tapExtensionAction:(NSIndexPath *)indexPath
{
       NSString *upDownImg;
       if (indexPath.section == 0) {
        self.isOneOpen = !self.isOneOpen;
        upDownImg=  _isOneOpen?@"up":@"down";

        NSArray *array = @[
                              [NSIndexPath indexPathForRow:1 inSection:0],
                              [NSIndexPath indexPathForRow:2 inSection:0],
                              [NSIndexPath indexPathForRow:3 inSection:0],
                              [NSIndexPath indexPathForRow:4 inSection:0],
                              ];
    if (self.isOneOpen) {
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
    else{
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
           
    } else  if (indexPath.section == 1) {
        self.isTwoOpen = !self.isTwoOpen;
        upDownImg=  _isTwoOpen?@"up":@"down";

        NSArray *array = @[
                           [NSIndexPath indexPathForRow:1 inSection:1],
                           ];
        if (self.isTwoOpen) {
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        else{
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        
    }else  if (indexPath.section == 2) {
        self.isThreeOpen = !self.isThreeOpen;
        upDownImg=  _isThreeOpen?@"up":@"down";

        NSArray *array = @[
                           [NSIndexPath indexPathForRow:1 inSection:2],
                           ];
        if (self.isThreeOpen) {
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        else{
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        
    }else  if (indexPath.section == 3) {
        self.isFourOpen = !self.isFourOpen;
        upDownImg=  _isFourOpen?@"up":@"down";

        NSArray *array = @[
                           [NSIndexPath indexPathForRow:1 inSection:3],
                           ];
        if (self.isFourOpen) {
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        else{
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        
    }else  if (indexPath.section == 4) {
        self.isFiveOpen = !self.isFiveOpen;
        upDownImg=  _isFiveOpen?@"up":@"down";

        NSArray *array = @[
                           [NSIndexPath indexPathForRow:1 inSection:4],
                           ];
        if (self.isFiveOpen) {
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        else{
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        
    }else  if (indexPath.section == 5) {
        self.isSixOpen = !self.isSixOpen;
        upDownImg=  _isSixOpen?@"up":@"down";

        NSArray *array = @[
                           [NSIndexPath indexPathForRow:1 inSection:5],
                           [NSIndexPath indexPathForRow:2 inSection:5],
                           [NSIndexPath indexPathForRow:3 inSection:5],
                           ];
        if (self.isSixOpen) {
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        else{
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        
    }
  
    LineApplyHeaderCell *cell = (LineApplyHeaderCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.upDownView.image = [UIImage imageNamed:upDownImg];
    


}

#pragma mark征信授权成功
-(void)signZhengxingDelegateNumber:(NSString *)num
{
    NSLog(@"征信授权成功");
    self.contractNo = num;
    self.isAgree = YES;
    self.isSucessAgree = YES;
    self.checkBtn.selected = YES;

}

#pragma mark 添加图片
-(void)takePicture:(NSInteger)num
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    [actionSheet showInView:self.view];

}

-(void)didSelectedAddPicture:(NSIndexPath *)indexPath number:(NSInteger)num
{
    NSLog(@"indexPath==%d,num=%ld",(int)indexPath.section,num);
    self.indexPath = indexPath;

    if (num == 3&& indexPath.section == 1) {
//        身份证
        UIImage *idcard1 = [UIImage imageNamed:@"idcard1"];
        self.num = 1;
        [self delereLoadRowsAtIndexPaths:idcard1];
    } else if (num == 4&& indexPath.section == 1)
    {
//        身份证
        UIImage *idcard2 = [UIImage imageNamed:@"idcard2"];
        self.num = 2;
        [self delereLoadRowsAtIndexPaths:idcard2];
    } else if (num == 3&& indexPath.section == 2)
    {
//        银行卡
        UIImage *bank1 = [UIImage imageNamed:@"bank1"];
        self.num = 1;
        [self delereLoadRowsAtIndexPaths:bank1];
    } else if (num == 4&& indexPath.section == 2)
    {
//        银行卡
        UIImage *bank2 = [UIImage imageNamed:@"bank2"];
        self.num = 2;
        [self delereLoadRowsAtIndexPaths:bank2];
    } else if (num == 3&& indexPath.section == 3)
    {
//        驾驶证
        UIImage *driver1 = [UIImage imageNamed:@"driver1"];
        self.num = 1;
        [self delereLoadRowsAtIndexPaths:driver1];
    } else if (num == 4&& indexPath.section == 3)
    {
//    驾驶证
        UIImage *driver2 = [UIImage imageNamed:@"driver2"];
        self.num = 2;
        [self delereLoadRowsAtIndexPaths:driver2];
    }  else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [actionSheet addButtonWithTitle:@"拍照"];
        [actionSheet addButtonWithTitle:@"从手机相册选择"];
        //同时添加一个取消按钮
        [actionSheet addButtonWithTitle:@"取消"];
        actionSheet.tag = 200;
        //将取消按钮的index设置成我们刚添加的那个按钮，这样在delegate中就可以知道是那个按钮
        actionSheet.destructiveButtonIndex = actionSheet.numberOfButtons - 1;
        [actionSheet showInView:self.view];
        
        self.num = num;

    }
    
    
    
    
}

-(void)didSelectedZhengxingDelegateArray:(NSMutableArray *)array
{
    self.zhengXinArray = array;
    if (_zhengXinArray.count>0) {
        _iSZhengXing = YES;
    } else
    {
         _iSZhengXing = NO;
    }

}


-(void)didSelectedZhengxingDelegate:(CGFloat)height number:(NSInteger)num array:(NSMutableArray *)array
{
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:4];

    _cellHight = height;
    
    self.indexPath = indexPath1;
    
    self.num = num;

   [self.tableView reloadData];
    return;
//ios原代码
//    if (num == 200) {
//        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//        [actionSheet addButtonWithTitle:@"拍照"];
//        [actionSheet addButtonWithTitle:@"从手机相册选择"];
//        //同时添加一个取消按钮
//        [actionSheet addButtonWithTitle:@"取消"];
//        actionSheet.tag = 201;
//        //将取消按钮的index设置成我们刚添加的那个按钮，这样在delegate中就可以知道是那个按钮
//        actionSheet.destructiveButtonIndex = actionSheet.numberOfButtons - 1;
//        [actionSheet showInView:self.view];
//     
//    } else
//    {
//        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"删除该图片" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//        [actionSheet addButtonWithTitle:@"确定"];
//        //同时添加一个取消按钮
//        [actionSheet addButtonWithTitle:@"取消"];
//        actionSheet.tag = 202;
//        //将取消按钮的index设置成我们刚添加的那个按钮，这样在delegate中就可以知道是那个按钮
//        actionSheet.destructiveButtonIndex = actionSheet.numberOfButtons - 1;
//        [actionSheet showInView:self.view];
//
//    }
}

#pragma mark判断号码是否到11位数
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@",string);
    [self didSelectedhandleName:nil deptId:@"" operterName:@""];

        return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{//重写textField这个方法
    NSLog(@"开始编辑");
//    CGFloat offset = 150*KWIDTH;
//    NSLog(@"偏移高度为 --- %f",offset);
     CGFloat offset =textField.frame.size.height;
    
    [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.tableView.frame;
            frame.origin.y = -offset;
            self.tableView.frame = frame;
        }];
    [self.view bringSubviewToFront:self.barView];
    [self.view sendSubviewToBack:self.tableView];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{//重写textField这个方法
    NSLog(@"将要结束编辑");
    

    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.tableView.frame;
        frame.origin.y = 64;
        self.tableView.frame = frame;
    }];
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.textField resignFirstResponder];
    
}

#pragma mark - UIAlertViewDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (actionSheet.tag == 202) {
        
        if (buttonIndex == 0){
            NSLog(@"确认删除");
            
            [self.zhengXinArray removeObjectAtIndex:self.num];
            [self.tableView reloadData];
            
            
        } else{
            NSLog(@"取消删除");
        }
        
    } else
    {
        if (buttonIndex == 0) {
            //拍照
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus == AVAuthorizationStatusDenied||authStatus == AVAuthorizationStatusRestricted) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请在“设置”－“隐私”－“相机”中更改" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }else{
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                    picker.delegate = self;
                    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    picker.allowsEditing = YES;
                    [self presentViewController:picker animated:YES completion:nil];
            }else{
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"您的设备不支持拍照功能" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    [alertView show];
                }
            }
        }else if(buttonIndex == 1){
            //相册选择
            ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
            if (status == ALAuthorizationStatusRestricted||status == ALAuthorizationStatusDenied) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请在“设置”－“隐私”－“照片”中更改" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }else{
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                    picker.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
                    picker.delegate = self;
                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    [self presentViewController:picker animated:YES completion:nil];
                }
            }
        }
    
    }

}





#pragma mark - UIImagePickerControllerDelegate获取图片
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image;
        UIImage *imge2;
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
             imge2=[self reSizeImage:image toSize:CGSizeMake(580 , 380)];
            
        }else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){
            image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
         
            imge2 =[self reSizeImage:image toSize:CGSizeMake(580 , 380)];

        }
        
        [self reloadRowsAtIndexPaths:imge2];

    }];
}


- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return reSizeImage;
    
}

#pragma mark 刷新对应的cell 图片
-(void)reloadRowsAtIndexPaths:(UIImage *)image;
{
    if (self.indexPath.section == 1||self.indexPath.section == 2 ||self.indexPath.section == 3) {
        
        if (self.num == 1 ) {
            [self.imageArray removeObjectAtIndex:self.indexPath.section*2-2];
            [self.imageArray insertObject:image atIndex:self.indexPath.section*2-2];

        } else
        {
            [self.imageArray removeObjectAtIndex:self.indexPath.section*2-1];
            [self.imageArray insertObject:image atIndex:self.indexPath.section*2-1];
        }
    }
    
    if (self.indexPath.section == 1) {
        if (self.num == 1 ) {
            self.iSIDLeft = YES;
        }else
        {
            self.iSIDRight = YES;
        }

    } else   if (self.indexPath.section == 2) {
        if (self.num == 1 ) {
            self.iSCardLeft = YES;
        }else
        {
            self.iSCardRight = YES;
        }
        
    }else  if (self.indexPath.section == 3) {
        if (self.num == 1 ) {
            self.iSLicseLeft = YES;
        }else
        {
            self.iSLicseRight = YES;
        }
        
    }else  if (self.indexPath.section == 4) {
        [self.zhengXinArray addObject:image];

        self.iSZhengXing = YES;
    }

    NSArray <NSIndexPath *> *indexPathArray = @[_indexPath];
    [_tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];

 }

#pragma mark 刷新对应的cell 图片
-(void)delereLoadRowsAtIndexPaths:(UIImage *)image;
{
    if (self.indexPath.section == 1||self.indexPath.section == 2 ||self.indexPath.section == 3) {
        
        if (self.num == 1 ) {

            [self.imageArray removeObjectAtIndex:self.indexPath.section*2-2];
            [self.imageArray insertObject:image atIndex:self.indexPath.section*2-2];
            
        } else
        {

            [self.imageArray removeObjectAtIndex:self.indexPath.section*2-1];
            [self.imageArray insertObject:image atIndex:self.indexPath.section*2-1];
        }
    }
    
    if (self.indexPath.section == 1) {
        if (self.num == 1 ) {
            self.iSIDLeft = NO;
        }else
        {
            self.iSIDRight = NO;
        }
        
    } else   if (self.indexPath.section == 2) {
        if (self.num == 1 ) {
            self.iSCardLeft = NO;
        }else
        {
            self.iSCardRight = NO;
        }
        
    }else  if (self.indexPath.section == 3) {
        if (self.num == 1 ) {
            self.iSLicseLeft = NO;
        }else
        {
            self.iSLicseRight = NO;
        }
        
    }
    
    NSArray <NSIndexPath *> *indexPathArray = @[_indexPath];
    [_tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//#pragma mark 图片大小设置
//- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
//
//{
//    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
//    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
//    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return reSizeImage;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
