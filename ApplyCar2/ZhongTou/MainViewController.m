//
//  MainViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/10/13.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "MainViewController.h"
#import "MineViewCell.h"
#import "WPhotoViewController.h"
#import "LineApplyDCVController.h"
//#import "PayRecordController.h"
#import "BillListController.h"
//#import "SignContractController.h"
//#import "PickCarDetailController.h"
//#import "testController.h"
//#import "OnLinePayController.h"
#import "adderess.h"
#import "LoginManager.h"
#import "webViewController.h"
//#import "OnLinePayController.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *imageArray;

@end

@implementation MainViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.barView.backgroundColor =[UIColor clearColor];

//    [self getAddressDic];
    
    [self creatUI];
}

-(void)creatUI
{
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 185*KWIDTH)];
    bgImg.image = [UIImage imageNamed:@"mine_bgImg"];
    [self.view addSubview:bgImg];
    

    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 35, 25*KWIDTH, 25*KWIDTH)];

    [setBtn setImage:[UIImage imageNamed:@"set"] forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(personControllerClick) forControlEvents:UIControlEventTouchUpInside];
    setBtn.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:setBtn];
    
    UIButton *newsBtn = [[UIButton alloc] initWithFrame:CGRectMake(screen_width-28-25*KWIDTH, 35, 25*KWIDTH, 25*KWIDTH)];
    
    [newsBtn setImage:[UIImage imageNamed:@"contact"] forState:UIControlStateNormal];
    newsBtn.backgroundColor = [UIColor clearColor];
    [newsBtn addTarget:self action:@selector(newsBtnControllerClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:newsBtn];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, screen_width-200, 44*KWIDTH)];
    
    titleLabel.font =[UIFont fontWithName:fontPingFang size:15*KWIDTH];
    titleLabel.text = @"我的账号";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:titleLabel];
    
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2+40*KWIDTH, 145*KWIDTH, screen_width-(screen_width/2+40*KWIDTH), 34*KWIDTH)];
    
    phoneLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
  
    NSString *phone =[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    phoneLabel.text = phone?phone:@"";
    phoneLabel.textColor = [UIColor whiteColor];
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:phoneLabel];
    

    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake((screen_width-80*KWIDTH)/2, 145*KWIDTH, 80*KWIDTH, 80*KWIDTH)];

    headImage.image = [UIImage imageNamed:@"logo2"];
    
    [self.view addSubview:headImage];

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 228*KWIDTH, screen_width, 43*8*KWIDTH)];
    self.tableView.backgroundColor = BackGroundColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.tableFooterView = v;//绝妙的方法去掉多余的分割线

    self.tableView.scrollEnabled = NO;
     self.titleArray = @[@"我的购买",@"在线支付",@"我的单据",@"我的还款",@"我的合同",@"签章查询",@"公告动态",@"帮助与反馈"];
    self.imageArray = @[@"buy",@"Image",@"danju",@"huankuan",@"hetong",@"qianzhang",@"gonggao",@"fankui"];
    [self.view addSubview:self.tableView];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (228+345)*KWIDTH+18, screen_width, 22)];
    versionLabel.font = [UIFont fontWithName:fontPingFang size:15*KWIDTH];
    versionLabel.text = [NSString stringWithFormat:@"版本号:%@",app_version];
    versionLabel.textColor = titleMeColor;
    versionLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:versionLabel];
    
    UIView *footView  = [[UIView alloc] initWithFrame:CGRectMake(0, screen_height-50*KWIDTH, screen_width, 50*KWIDTH)];
    footView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:footView];

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 1)];
    lineView.backgroundColor = tableCellLineColor;
    [footView addSubview:lineView];
    
    UIButton *applyBtn = [self creatButton:@"在线申请" imageName:@"online" hightImgaName:@"online_hight"];
    applyBtn.frame = CGRectMake(0, 1,screen_width/2,  50*KWIDTH-1);
    [applyBtn addTarget:self action:@selector(applyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:applyBtn];
    
    UIButton *mineBtn = [self creatButton:@"我的" imageName:@"my" hightImgaName:@"my_hight"];
    mineBtn.frame = CGRectMake(screen_width/2, 1,screen_width/2,  50*KWIDTH-1);

    [footView addSubview:mineBtn];
    
    mineBtn.selected = YES;
 

}

-(UIButton *)creatButton:(NSString *)titleLabel imageName:(NSString *)imageName hightImgaName:(NSString*)hightImgaName;
{
    UIButton *applyBtn = [[UIButton alloc] init];
    applyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    applyBtn.titleLabel.font = [UIFont systemFontOfSize:9];
    applyBtn.titleLabel.textColor = titleColor;
    
    [applyBtn setTitleColor:titleNomalColor forState:UIControlStateNormal];
    [applyBtn setTitleColor:titleHightColor forState:UIControlStateSelected];
    applyBtn.backgroundColor = [UIColor whiteColor];
    NSString *str = titleLabel;
    
    CGSize size1 = [str sizeWithFont:[UIFont systemFontOfSize:9] constrainedToSize:CGSizeMake(MAXFLOAT, applyBtn.titleLabel.frame.size.height)];
    
    UIImage *image = [UIImage imageNamed:imageName];
    applyBtn.titleEdgeInsets =UIEdgeInsetsMake(0.5*image.size.height, -0.5*image.size.width, -0.5*image.size.height, 0.5*image.size.width);
    applyBtn.imageEdgeInsets =UIEdgeInsetsMake(-0.5*size1.height, 0.5*size1.width, 0.5*size1.height, -0.5*size1.width);
    [applyBtn setTitle:str forState:UIControlStateNormal];
    applyBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [applyBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [applyBtn setImage:[UIImage imageNamed:hightImgaName] forState:UIControlStateSelected];

    return applyBtn;
}

-(void)personControllerClick
{
 
}

-(void)newsBtnControllerClick
{
    NSLog(@"通知中心");
//    WPhotoViewController *WphotoVC = [[WPhotoViewController alloc] init];
//    //选择图片的最大数
//    WphotoVC.selectPhotoOfMax = 3;
//    [WphotoVC setSelectPhotosBack:^(NSMutableArray *phostsArr) {
////        [_photosArr addObjectsFromArray:phostsArr];
////        [_tableView reloadData];
//    }];
//    [self presentViewController:WphotoVC animated:YES completion:nil];

}

-(void)applyBtnClick:(UIButton*)btn
{
//    btn.selected = !btn.selected;
    LineApplyDCVController *applyVC = [[LineApplyDCVController alloc] init];
    [self.navigationController pushViewController:applyVC animated:YES];
    
    NSLog(@"在线申请");
    
}


-(void)getAddressDic
{
    ABAuthorizationStatus authorizationStatus = ABAddressBookGetAuthorizationStatus();
    if (authorizationStatus != kABAuthorizationStatusAuthorized) {
        
        NSLog(@"没有授权");
        return;
    }
    
    // 2. 获取所有联系人
    ABAddressBookRef addressBookRef = ABAddressBookCreate();
    CFArrayRef arrayRef = ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    long count = CFArrayGetCount(arrayRef);
    
    
    NSMutableString *phoneAddString = [NSMutableString string];
    
    for (int i = 0; i < count; i++) {
        //获取联系人对象的引用
        ABRecordRef people = CFArrayGetValueAtIndex(arrayRef, i);
        
        //获取当前联系人名字
        NSString *firstName=(__bridge NSString *)(ABRecordCopyValue(people, kABPersonFirstNameProperty));
        
        //获取当前联系人姓氏
        NSString *lastName=(__bridge NSString *)(ABRecordCopyValue(people, kABPersonLastNameProperty));
        NSLog(@"--------------------------------------------------");
        NSLog(@"firstName=%@, lastName=%@", firstName, lastName);
        adderess *address =[adderess new];
        //获取当前联系人的电话 数组
        NSMutableArray *phoneArray = [[NSMutableArray alloc]init];
        NSMutableString *muPhone = [NSMutableString stringWithFormat:@"%@%@",firstName?firstName:@"",lastName?lastName:@""];
        ABMultiValueRef phones = ABRecordCopyValue(people, kABPersonPhoneProperty);
        for (NSInteger j=0; j<ABMultiValueGetCount(phones); j++) {
            NSString *phone = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(phones, j));
            
            [muPhone appendString:[NSString stringWithFormat:@"_%@",phone]];
        }
        address.phone = phoneArray;
        
        
        NSLog(@"muPhone===%@",muPhone);
        
        
        [phoneAddString appendString:[NSString stringWithFormat:@"%@,",muPhone]];
        
    }
    
    
    NSLog(@"====%@",phoneAddString);
    LoginManager *manager = [LoginManager new];
    NSString *phone = [[SavaInfoTools sharedInstance]getObjectValueFromKey:User_PhoneNum];
    
    NSDictionary *param = @{
                            @"appPhone":phone?phone:@"",
                            @"phoneContactInfo":phoneAddString?phoneAddString:@""
                            };
    
    [manager postPhonePersonInfo:param block:^(NSDictionary *dictionary, NSError *error) {
        NSLog(@"dictionary == %@",dictionary);
    }];
    
    
}

#pragma mark-------------UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
        return 43*KWIDTH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IDENTITY=@"MineViewCell";
    MineViewCell *cell=[tableView dequeueReusableCellWithIdentifier:IDENTITY];
    if (cell==nil) {
        [tableView registerClass:[MineViewCell class] forCellReuseIdentifier:IDENTITY];
        cell=[tableView dequeueReusableCellWithIdentifier:IDENTITY forIndexPath:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.titleLabel.text = _titleArray[indexPath.section];
    cell.imagView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArray[indexPath.section]]];
     return cell;

}

#pragma mark 返回多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 2)
    {
        
        BillListController *myContract = [[BillListController alloc] init];
        [self.navigationController pushViewController:myContract animated:YES];
        
    }else if(indexPath.section == 5)
    {

        webViewController *helpVC = [[webViewController alloc] init];
        helpVC.url = querySignURL;
        helpVC.headerTitle = @"签章查询";
        [self.navigationController pushViewController:helpVC animated:YES];
        
    }}

@end
