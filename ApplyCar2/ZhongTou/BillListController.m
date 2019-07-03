//
//  BillListController.m
//  ZhongTou
//
//  Created by Jone on 2017/11/6.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "BillListController.h"
#import "SignListNameCell.h"
//#import "BillDetailController.h"
#import "MineManager.h"
#import "ApplyListModel.h"
#import "MainViewController.h"
#import "Reachability.h"
//#import "BillDetailPayController.h"
//#import "PickCarDetailController.h"
#import "signListCarCell.h"


@interface BillListController ()<UITableViewDelegate,UITableViewDataSource>



@property(nonatomic,strong)NSArray *listArray;

@property (nonatomic,strong)UIScrollView *bottomScrollView;

@property (strong, nonatomic) UIView *firstNoView;

@property (strong, nonatomic) UIView *twoNoView;

@property (strong, nonatomic) UIView *threeNoView;

@property (strong, nonatomic) UIView *fourNoView;

@property (strong, nonatomic) UIView *fiveNoView;

@property (strong, nonatomic) UIView *sixNoView;


/**
 全部
 */
@property (strong, nonatomic) UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(assign,nonatomic)int PageNum;

@property (nonatomic,assign)BOOL isLoad;


/**
 待审核
 */
@property (strong, nonatomic) UITableView *waitSignTableView;


@property(nonatomic,strong)NSMutableArray *waitSignArray;

@property(assign,nonatomic)int waitSignPageNum;

@property (nonatomic,assign)BOOL waitSignIsLoad;


/**
 签约成功
 */
@property (strong, nonatomic) UITableView *didSignTableView;


@property(nonatomic,strong)NSMutableArray *didSignArray;

@property(assign,nonatomic)int didSignPageNum;

@property (nonatomic,assign)BOOL didSignIsLoad;

/**
 付款
 */
@property (strong, nonatomic) UITableView *payTableView;

@property(nonatomic,strong)NSMutableArray *payArray;

@property(assign,nonatomic)int payPageNum;

@property (nonatomic,assign)BOOL payIsLoad;

/**
 提车
 */
@property (strong, nonatomic) UITableView *pickTableView;
@property(nonatomic,strong)NSMutableArray *pickArray;
@property(assign,nonatomic)int pickPageNum;
@property (nonatomic,assign)BOOL pickIsLoad;


/**
 结束
 */
@property (strong, nonatomic) UITableView *endTableView;

@property(nonatomic,strong)NSMutableArray *endArray;

@property(assign,nonatomic)int endPageNum;
@property (nonatomic,assign)BOOL endIsLoad;



//全部按钮
@property(nonatomic,strong)UIButton *allBtn;
//审核
@property(nonatomic,strong)UIButton *checkBtn;
//签约
@property(nonatomic,strong)UIButton *signBtn;
//付款
@property(nonatomic,strong)UIButton *payBtn;
//提车
@property(nonatomic,strong)UIButton *pickUpBtn;
//结束
@property(nonatomic,strong)UIButton *endBtn;



@property(nonatomic,strong)UIButton *selectBtn;

@property(nonatomic,strong)NSString *selectString;


@property (strong, nonatomic) UIView *lineView;

@end

@implementation BillListController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    
    return self;
}

-(UIScrollView *)bottomScrollView
{
    if (!_bottomScrollView) {
        _bottomScrollView = [[UIScrollView alloc]init];
        _bottomScrollView.scrollsToTop = NO;
        _bottomScrollView.frame = CGRectMake(0, 64+44*KWIDTH, screen_width, screen_height-64-44*KWIDTH);
        _bottomScrollView.backgroundColor = [UIColor clearColor];
        _bottomScrollView.contentSize = CGSizeMake(screen_width * 6, 0);
        _bottomScrollView.pagingEnabled = YES;
        _bottomScrollView.delegate = self;
        _bottomScrollView.bounces = NO;
        _bottomScrollView.showsHorizontalScrollIndicator = NO;
        _bottomScrollView.showsVerticalScrollIndicator = NO;

    }
    return _bottomScrollView;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, screen_width, screen_height-64-44*KWIDTH)];
        _tableView.backgroundColor = buyDetailBackColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
        _tableView.scrollEnabled = YES;
        
    }
    return _tableView;
}

-(UITableView *)waitSignTableView
{
    if (!_waitSignTableView) {
        _waitSignTableView = [[UITableView alloc]initWithFrame:CGRectMake(screen_width,0, screen_width, screen_height-64-44*KWIDTH)];
        _waitSignTableView.backgroundColor = buyDetailBackColor;
        _waitSignTableView.delegate = self;
        _waitSignTableView.dataSource = self;
        _waitSignTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
        _waitSignTableView.scrollEnabled = YES;
        
    }
    return _waitSignTableView;
}
-(UITableView *)didSignTableView
{
    if (!_didSignTableView) {
        _didSignTableView = [[UITableView alloc]initWithFrame:CGRectMake(screen_width*2,0, screen_width, screen_height-64-44*KWIDTH)];
        _didSignTableView.backgroundColor = buyDetailBackColor;
        _didSignTableView.delegate = self;
        _didSignTableView.dataSource = self;
        _didSignTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _didSignTableView.scrollEnabled = YES;
        
    }
    return _didSignTableView;
}
-(UITableView *)payTableView
{
    if (!_payTableView) {
        _payTableView = [[UITableView alloc]initWithFrame:CGRectMake(screen_width*3,0, screen_width, screen_height-64-44*KWIDTH)];
        _payTableView.backgroundColor = buyDetailBackColor;
        _payTableView.delegate = self;
        _payTableView.dataSource = self;
        _payTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
        _payTableView.scrollEnabled = YES;
        
    }
    return _payTableView;
}
-(UITableView *)pickTableView
{
    if (!_pickTableView) {
        _pickTableView = [[UITableView alloc]initWithFrame:CGRectMake(screen_width*4,0, screen_width, screen_height-64-44*KWIDTH)];
        _pickTableView.backgroundColor = buyDetailBackColor;
        _pickTableView.delegate = self;
        _pickTableView.dataSource = self;
        _pickTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
        _pickTableView.scrollEnabled = YES;
        
    }
    return _pickTableView;
}
-(UITableView *)endTableView
{
    if (!_endTableView) {
        _endTableView = [[UITableView alloc]initWithFrame:CGRectMake(screen_width*5,0, screen_width, screen_height-64-44*KWIDTH)];
        _endTableView.backgroundColor = buyDetailBackColor;
        _endTableView.delegate = self;
        _endTableView.dataSource = self;
        _endTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
        _endTableView.scrollEnabled = YES;
        
    }
    return _endTableView;
}


-(UIView *)firstNoView
{
    if (_firstNoView ==nil)
    {
        _firstNoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, Content_Height-Content_Y)];
        _firstNoView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        int height = _firstNoView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [_firstNoView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [_firstNoView addSubview:title];
        
        UIButton  *leftLabel=[[UIButton alloc] init];
        
        leftLabel.frame = CGRectMake(screen_width/2 - 50*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 100*KWIDTH, 22*KWIDTH);
        
        [leftLabel setTitle:@"重新刷新" forState:UIControlStateNormal];
        leftLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.backgroundColor = BackGroundBlueColor;
        [leftLabel addTarget:self action:@selector(reflechData) forControlEvents:UIControlEventTouchUpInside];
        [_firstNoView addSubview:leftLabel];
    }
    return _firstNoView;
}

-(UIView *)twoNoView
{
    if (_twoNoView ==nil)
    {
        _twoNoView = [[UIView alloc]initWithFrame:CGRectMake(screen_width, 0, screen_width, Content_Height-Content_Y )];
        _twoNoView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        int height = _twoNoView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [_twoNoView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [_twoNoView addSubview:title];
        
        UIButton  *leftLabel=[[UIButton alloc] init];
        
        leftLabel.frame = CGRectMake(screen_width/2 - 50*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 100*KWIDTH, 22*KWIDTH);
        
        [leftLabel setTitle:@"重新刷新" forState:UIControlStateNormal];
        leftLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.backgroundColor = BackGroundBlueColor;
        [leftLabel addTarget:self action:@selector(reflechData) forControlEvents:UIControlEventTouchUpInside];
        [_twoNoView addSubview:leftLabel];
    }
    return _twoNoView;
}
-(UIView *)threeNoView
{
    if (_threeNoView ==nil)
    {
        _threeNoView = [[UIView alloc]initWithFrame:CGRectMake(screen_width*2, 0, screen_width, Content_Height-Content_Y )];
        _threeNoView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        int height = _threeNoView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [_threeNoView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [_threeNoView addSubview:title];
        
        UIButton  *leftLabel=[[UIButton alloc] init];
        
        leftLabel.frame = CGRectMake(screen_width/2 - 50*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 100*KWIDTH, 22*KWIDTH);
        
        [leftLabel setTitle:@"重新刷新" forState:UIControlStateNormal];
        leftLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.backgroundColor = BackGroundBlueColor;
        [leftLabel addTarget:self action:@selector(reflechData) forControlEvents:UIControlEventTouchUpInside];
        [_threeNoView addSubview:leftLabel];
    }
    return _threeNoView;
}
-(UIView *)fourNoView
{
    if (_fourNoView ==nil)
    {
        _fourNoView = [[UIView alloc]initWithFrame:CGRectMake(screen_width*3, 0, screen_width, Content_Height-Content_Y )];
        _fourNoView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        int height = _fourNoView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [_fourNoView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [_fourNoView addSubview:title];
        
        UIButton  *leftLabel=[[UIButton alloc] init];
        
        leftLabel.frame = CGRectMake(screen_width/2 - 50*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 100*KWIDTH, 22*KWIDTH);
        
        [leftLabel setTitle:@"重新刷新" forState:UIControlStateNormal];
        leftLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.backgroundColor = BackGroundBlueColor;
        [leftLabel addTarget:self action:@selector(reflechData) forControlEvents:UIControlEventTouchUpInside];
        [_fourNoView addSubview:leftLabel];
    }
    return _fourNoView;
}

-(UIView *)fiveNoView
{
    if (_fiveNoView ==nil)
    {
        _fiveNoView = [[UIView alloc]initWithFrame:CGRectMake(screen_width*4, 0, screen_width, Content_Height-Content_Y )];
        _fiveNoView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        int height = _fiveNoView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [_fiveNoView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [_fiveNoView addSubview:title];
        
        UIButton  *leftLabel=[[UIButton alloc] init];
        
        leftLabel.frame = CGRectMake(screen_width/2 - 50*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 100*KWIDTH, 22*KWIDTH);
        
        [leftLabel setTitle:@"重新刷新" forState:UIControlStateNormal];
        leftLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.backgroundColor = BackGroundBlueColor;
        [leftLabel addTarget:self action:@selector(reflechData) forControlEvents:UIControlEventTouchUpInside];
        [_fiveNoView addSubview:leftLabel];
    }
    return _fiveNoView;
}

-(UIView *)sixNoView
{
    if (_sixNoView ==nil)
    {
        _sixNoView = [[UIView alloc]initWithFrame:CGRectMake(screen_width*5, 0, screen_width, Content_Height-Content_Y )];
        _sixNoView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        int height = _sixNoView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noData"]];
        image.frame = CGRectMake(screen_width/2 - 60*KWIDTH, height - 159*KWIDTH , 120*KWIDTH, 120*KWIDTH);
        [_sixNoView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"没有数据！";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100*KWIDTH, image.frame.origin.y + image.frame.size.height + 20*KWIDTH, 200*KWIDTH, 24*KWIDTH);
        [_sixNoView addSubview:title];
        
        UIButton  *leftLabel=[[UIButton alloc] init];
        
        leftLabel.frame = CGRectMake(screen_width/2 - 50*KWIDTH, image.frame.origin.y + image.frame.size.height + 70*KWIDTH, 100*KWIDTH, 22*KWIDTH);
        
        [leftLabel setTitle:@"重新刷新" forState:UIControlStateNormal];
        leftLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.backgroundColor = BackGroundBlueColor;
        [leftLabel addTarget:self action:@selector(reflechData) forControlEvents:UIControlEventTouchUpInside];
        [_sixNoView addSubview:leftLabel];
    }
    return _sixNoView;
}


-(void)removeFirstDataView
{

    [self.firstNoView removeFromSuperview];
    self.firstNoView = nil;

}

-(void)removetwoDataView
{
    [self.twoNoView removeFromSuperview];
    self.twoNoView = nil;
}

-(void)removeThreeDataView
{
  
    [self.threeNoView removeFromSuperview];
    self.threeNoView = nil;

}

-(void)removeFourDataView
{
    [self.fourNoView removeFromSuperview];

}

-(void)removeFiveDataView
{
    [self.fiveNoView removeFromSuperview];
    self.fiveNoView = nil;

}
-(void)removeSixDataView
{
    
    [self.sixNoView removeFromSuperview];
    self.sixNoView = nil;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self initNavigtionBar];
    
    [self reflechData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reflechData) name:knotificationRefleshListData object:nil];

    
    // Do any additional setup after loading the view.
}

-(void)reflechData
{
    [self getData:self.selectString pageNum:1];
}

-(void)initNavigtionBar
{
    self.title = @"单据列表";
    self.barView.backgroundColor = navigationBarColor;
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self setNavigationBarLeftButton:buttonBack];
    
}

-(void)creatUI{
    
    self.listArray = @[@"全部",@"审核",@"签约",@"付款",@"提车",@"结束"];
    self.dataArray = [NSMutableArray array];
    self.didSignArray = [NSMutableArray array];
    self.waitSignArray = [NSMutableArray array];
    self.pickArray = [NSMutableArray array];
    self.payArray = [NSMutableArray array];
    self.endArray = [NSMutableArray array];

    self.PageNum = 1;
    self.waitSignPageNum = 1;
    self.didSignPageNum = 1;
    self.pickPageNum = 1;
    self.payPageNum = 1;
    self.endPageNum = 1;
    self.selectString = @"全部";

    
    
    [self.view addSubview:self.bottomScrollView];

    [self.bottomScrollView addSubview:self.tableView];
    [self.bottomScrollView addSubview:self.waitSignTableView];
    [self.bottomScrollView addSubview:self.didSignTableView];
    [self.bottomScrollView addSubview:self.pickTableView];
    [self.bottomScrollView addSubview:self.payTableView];
    [self.bottomScrollView addSubview:self.endTableView];

    self.allBtn = [self creatHeaderListButton:self.listArray[0] num:0];
    
    self.allBtn.selected = YES;
    
    self.selectBtn = self.allBtn;
    
    self.checkBtn = [self creatHeaderListButton:self.listArray[1] num:1];
    
    self.signBtn = [self creatHeaderListButton:self.listArray[2] num:2];
    
    self.payBtn = [self creatHeaderListButton:self.listArray[3] num:3];
    
    self.pickUpBtn = [self creatHeaderListButton:self.listArray[4] num:4];
    
    self.endBtn = [self creatHeaderListButton:self.listArray[5] num:5];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+44*KWIDTH, screen_width/self.listArray.count, 2)];
    
    self.lineView.backgroundColor = titleHightColor;
    
    [self.view addSubview:self.lineView];
    
    [self.view addSubview:self.allBtn];
    
    [self.view addSubview:self.checkBtn];

    [self.view addSubview:self.signBtn];
    
    [self.view addSubview:self.payBtn];

    [self.view addSubview:self.pickUpBtn];
    
    [self.view addSubview:self.endBtn];

    [self creatlineListViewNum:1];
    
    [self creatlineListViewNum:2];
    
    [self creatlineListViewNum:3];
    
    [self creatlineListViewNum:4];
    
    [self creatlineListViewNum:5];
    
    [self addTableHeader:self.tableView];
    
    [self addTableFooter:self.tableView];
    
    [self addTableHeader:self.waitSignTableView];
    
    [self addTableFooter:self.waitSignTableView];

    
    [self addTableHeader:self.didSignTableView];
    [self addTableFooter:self.didSignTableView];

    [self addTableHeader:self.pickTableView];
    [self addTableFooter:self.pickTableView];

    [self addTableHeader:self.payTableView];
    [self addTableFooter:self.payTableView];

    [self addTableHeader:self.endTableView];
    [self addTableFooter:self.endTableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithWiFi];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *)creatHeaderListButton:(NSString *)title num:(int)num;
{
       UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(num*screen_width/self.listArray.count,64,screen_width/self.listArray.count, 44);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleHightColor forState:UIControlStateSelected];

        [btn setTitleColor:titleBuyDetail forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(changStyle:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+num;
    return btn;
}

-(void)creatlineListViewNum:(int)num
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(num*screen_width/self.listArray.count,69,1, 34)];
    line.backgroundColor = tableCellLineColor;
    [self.view addSubview:line];
}

#pragma mark 获取数据
-(void)getData:(NSString *)selectString pageNum:(int)PageNum
{
    __weak typeof(self) weakSelf = self;

    NSString *name = self.selectBtn.titleLabel.text;
    MineManager *manager = [[MineManager alloc] init];
    /* auditStatus = 0;
     auditStatus = 0;
     bankNo = 6217007200028311572;
     brandId = 9;
     carBrand = "本田";
     carColor = "灰色";
     carFrame = LFMBEC4D9B0066331;
     carModel = "2013款 十周年纪念 1.8L 手动舒适版";
     createDate = "2017-11-10 00:00:00";
     creditLimit = "<null>";
     customerIdnumber = 432524198901307410;
     customerName = "康金玲";
     customerPhone = 13144806821;
     deptId = 2381;
     driverFilePath = "<null>";
     emission = 20T;
     empId = "<null>";
     id = 5080;
     modelNo = 15948;
     monthSalary = "<null>";
     operaterId = 11244;
     operaterName = "王小棽2";
     orgCode = 001002;
     packageId = 32;
     packageName = B;
     paymentMoney = "<null>";
     porductId = "<null>";
     profession = "<null>";
     status = 1;
     userId = 1016;
     uses = "<null>";
     vehcileId = 2451;
     vehicleDisposition = 20T;
     vehicleLicense = "粤B55126";*/
    NSMutableArray *tempArray = [NSMutableArray array];

    for (int i = 0; i < 5; i++){
        ApplyListModel *applyModel = [[ApplyListModel alloc ] init];
        applyModel.bankNo = @"6217007200028311570";
        applyModel.brandId = @(9+i);
        applyModel.carBrand = @"本田";
        applyModel.carColor = @"红色";
        applyModel.carFrame = @"LFMBEC4D9B0066331";
        applyModel.carModel = @"2013款 十周年纪念 1.8L 手动舒适版";
        applyModel.createDate = @"2017-11-10 00:00:00";
        applyModel.customerIdnumber = @"432524198901300000";
        applyModel.customerName = @"王保全";
        applyModel.customerPhone = @"13144806000";
        applyModel.deptId = @"2381";
        applyModel.driverFilePath = @"";
        applyModel.emission = @"20T";
        applyModel.modelNo = @"15948";
        applyModel.operaterId = @"11244";
        applyModel.operaterName = @"王小";
        applyModel.orgCode = @"001002";
        applyModel.packageId = @"2232";
        applyModel.packageName = @"B";
        applyModel.status = @1;
        applyModel.userId = @1016;
        applyModel.uses = @"<null>";
        applyModel.vehcileId = @"2451";
        applyModel.vehicleDisposition = @"20T";
        applyModel.vehicleLicense = @"湘4B55126";
        [tempArray addObject:applyModel];
    }
    
    if ([weakSelf.selectString isEqualToString:@"全部"]) {
        weakSelf.isLoad = YES;
        if (PageNum == 1) {
            [weakSelf.dataArray removeAllObjects];
        }
        if (tempArray.count>0) {
            [weakSelf.dataArray addObjectsFromArray:tempArray];
        }
        
        if (weakSelf.dataArray.count ==0) {
            [weakSelf.bottomScrollView addSubview:weakSelf.firstNoView];
        } else
        {
            [weakSelf removeFirstDataView];
            // 拿到当前的上拉刷新控件，结束刷新状态
            
        }
        [weakSelf.tableView reloadData];
        
        
    } else if ([weakSelf.selectString isEqualToString:@"审核"])
    {
        weakSelf.waitSignIsLoad = YES;
        
        if (PageNum == 1) {
            
            [weakSelf.waitSignArray removeAllObjects];
        }
        
        if (tempArray.count>0) {
            
            [weakSelf.waitSignArray addObjectsFromArray:tempArray];
            
        }
        
        if (weakSelf.waitSignArray.count ==0) {
            [weakSelf.bottomScrollView addSubview:weakSelf.twoNoView];
        } else
        {
            [weakSelf removetwoDataView];
            // 拿到当前的上拉刷新控件，结束刷新状态
        }
        [weakSelf.waitSignTableView reloadData];
        
        
        
    } else if ([weakSelf.selectString isEqualToString:@"签约"])
    {
        weakSelf.didSignIsLoad = YES;
        
        if (PageNum == 1) {
            
            [weakSelf.didSignArray removeAllObjects];
        }
        
        if (tempArray.count>0) {
            
            [weakSelf.didSignArray addObjectsFromArray:tempArray];
        }
        if (weakSelf.didSignArray.count ==0) {
            [weakSelf.bottomScrollView addSubview:weakSelf.threeNoView];
        } else
        {
            [weakSelf removeThreeDataView];
        }
        [weakSelf.didSignTableView reloadData];
        
        
    } else if ([weakSelf.selectString isEqualToString:@"付款"])
    {
        weakSelf.payIsLoad = YES;
        
        if (PageNum == 1) {
            
            [weakSelf.payArray removeAllObjects];
        }
        
        
        if (tempArray.count>0) {
            
            NSMutableArray *tempArray2 = [NSMutableArray array];
            
       
            [weakSelf.payArray addObjectsFromArray:tempArray2];
        }
        if (weakSelf.payArray.count ==0) {
            [weakSelf.bottomScrollView addSubview:weakSelf.fourNoView];
        } else
        {
            [weakSelf removeFourDataView];
        }
        [weakSelf.payTableView reloadData];
        
        
        
    } else if ([weakSelf.selectString isEqualToString:@"提车"])
    {
        weakSelf.pickIsLoad = YES;
        
        if (PageNum == 1) {
            
            [weakSelf.pickArray removeAllObjects];
        }
        
        if (tempArray.count>0) {
            
            NSMutableArray *tempArray2 = [NSMutableArray array];
            
            
            
            [weakSelf.pickArray addObjectsFromArray:tempArray2];
            
        }
        
        [weakSelf.pickTableView reloadData];
        
        if (weakSelf.pickArray.count ==0) {
            [weakSelf.bottomScrollView addSubview:weakSelf.fiveNoView];
        } else
        {
            [weakSelf removeFiveDataView];
        }
    }else if ([weakSelf.selectString isEqualToString:@"结束"])
    {
        weakSelf.endIsLoad = YES;
        
        if (PageNum == 1) {
            
            [weakSelf.endArray removeAllObjects];
        }
        
        if (tempArray.count>0) {
            
            [weakSelf.endArray addObjectsFromArray:tempArray];
        }
        
        if (weakSelf.endArray.count ==0) {
            [weakSelf.bottomScrollView addSubview:weakSelf.sixNoView];
        } else
        {
            [weakSelf removeSixDataView];
        }
        [weakSelf.endTableView reloadData];
        
    };
NSLog(@"name==%@",name);
}

#pragma mark 切换标题按钮
-(void)changStyle:(UIButton *)btn
{
    self.selectBtn.enabled = YES;
    self.selectBtn.selected = NO;
    self.selectBtn = btn;
    
    self.selectBtn.enabled = NO;
    self.selectBtn.selected = YES;

    CGFloat BtnframeX = btn.frame.origin.x;
    CGRect lineFrame = self.lineView.frame;
    lineFrame.origin.x = BtnframeX;
    self.lineView.frame =lineFrame;
    switch (btn.tag) {
        case 100:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width*0, 0);
            self.selectString = @"全部";

            if (_isLoad == NO) {

                [self getData:@"全部" pageNum:self.PageNum];

            }
            NSLog(@"点击了全部");
        }
            break;
        case 101:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width*1, 0);
            self.selectString = @"审核";

            if (self.waitSignIsLoad == NO) {

                [self getData:@"审核" pageNum:self.waitSignPageNum];

            }

            NSLog(@"点击了审核");
        }
            break;
        case 102:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width*2, 0);
            self.selectString = @"签约";

            if (self.didSignIsLoad == NO) {

                [self getData:@"签约" pageNum:self.didSignPageNum];
            }

            NSLog(@"点击了签约");
        }
            break;
        case 103:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width*3, 0);
            self.selectString = @"付款";

            if (self.payIsLoad == NO) {

                [self getData:@"付款" pageNum:self.payPageNum];

            }

            NSLog(@"点击了付款");
        }
            break;
        case 104:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width*4, 0);
            self.selectString = @"提车";

            if (self.pickIsLoad == NO) {

                [self getData:@"提车" pageNum:self.pickPageNum];
            }

            NSLog(@"点击了提车");
        }
            break;
        case 105:
        {
            _bottomScrollView.contentOffset = CGPointMake(screen_width*5, 0);
            self.selectString = @"结束";
            if (self.endIsLoad == NO) {

                [self getData:@"结束" pageNum:self.endPageNum];
            }

            NSLog(@"点击了结束");
        }
            break;
        default:
            break;
    }
    
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //这是防止事件冲突的重要代码
    if ([scrollView isKindOfClass:[UITableView class]]) {
        return;
    }

    NSInteger index=scrollView.contentOffset.x/screen_width;

    if (index == 0) {
        [self changStyle:self.allBtn];
    } else if (index == 1) {
        [self changStyle:self.checkBtn];
    } else if (index == 2) {
        [self changStyle:self.signBtn];
    } else if (index == 3) {
        [self changStyle:self.payBtn];
    } else if (index == 4) {
        [self changStyle:self.pickUpBtn];
    } else if (index == 5) {
        [self changStyle:self.endBtn];
    }
    
    
}


-(void)backClick
{
   
    [SVProgressHUD dismiss];

    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[MainViewController class]]) {
            [self.navigationController popToViewController:controller animated:YES];
            return;
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:knotificationChangeVC object:@"1"];
}



-(void)addTableHeader:(UITableView *)tableView
{
    
    __weak typeof (self)weakSelf = self;
    
    if (tableView.mj_footer.isRefreshing) {
        return;
    }
    if ([tableView isEqual:_tableView]) {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.PageNum = 1;
            [weakSelf getData:self.selectString pageNum:self.PageNum];
        }];
    } else if ([tableView isEqual:_waitSignTableView])
    {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.waitSignPageNum = 1;
            [weakSelf getData:self.selectString pageNum:self.waitSignPageNum];
        }];
    } else if ([tableView isEqual:_didSignTableView])
    {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.didSignPageNum = 1;
            [weakSelf getData:self.selectString pageNum:self.didSignPageNum];
        }];
    } else if ([tableView isEqual:_payTableView])
    {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.payPageNum = 1;
            [weakSelf getData:self.selectString pageNum:self.payPageNum];
        }];
    } else if ([tableView isEqual:_pickTableView])
    {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.pickPageNum = 1;
            [weakSelf getData:self.selectString pageNum:self.pickPageNum];
        }];
    } else if ([tableView isEqual:_endTableView])
    {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.endPageNum = 1;
            [weakSelf getData:self.selectString pageNum:self.endPageNum];
        }];
    }

    
}


-(void)addTableFooter:(UITableView *)tableView

{
    __weak typeof (self)weakSelf = self;
    if (tableView.mj_header.isRefreshing) {
        return;
    }
    if ([tableView isEqual:_tableView]) {

    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.PageNum ++;
        [weakSelf getData:self.selectString pageNum:self.PageNum];
    }];

    } else if ([tableView isEqual:_waitSignTableView])
    {
        
     tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.waitSignPageNum ++;
            [weakSelf getData:self.selectString pageNum:self.waitSignPageNum];
        }];
    } else if ([tableView isEqual:_didSignTableView])
    {

        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.didSignPageNum ++;
            [weakSelf getData:self.selectString pageNum:self.didSignPageNum];
        }];
    } else if ([tableView isEqual:_payTableView])
    {
        
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.payPageNum ++;
            [weakSelf getData:self.selectString pageNum:self.payPageNum];
        }];
    } else if ([tableView isEqual:_pickTableView])
    {
        
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.pickPageNum ++;
            [weakSelf getData:self.selectString pageNum:self.pickPageNum];
        }];
    } else if ([tableView isEqual:_endTableView])
    {
        
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.endPageNum ++;
            [weakSelf getData:self.selectString pageNum:self.endPageNum];
        }];
    }
}

#pragma mark-------------UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ApplyListModel *model;
    if ( tableView == self.tableView) {
        model = [self.dataArray objectAtIndexWithCheck:indexPath.section];
    } else if (tableView == self.waitSignTableView)
    {
        model = [self.waitSignArray objectAtIndexWithCheck:indexPath.section];
    } else if (tableView == self.didSignTableView)
    {
        model = [self.didSignArray objectAtIndexWithCheck:indexPath.section];
    } else if (tableView == self.pickTableView)
    {
        model = [self.pickArray objectAtIndexWithCheck:indexPath.section];
    } else if (tableView == self.payTableView)
    {
        model = [self.payArray objectAtIndexWithCheck:indexPath.section];
    }else if (tableView == self.endTableView)
    {
        model = [self.endArray objectAtIndexWithCheck:indexPath.section];
    };
    
    static NSString *IDENTITY2=@"SignListNameCell";
    SignListNameCell *cell2=[tableView dequeueReusableCellWithIdentifier:IDENTITY2];
    if (cell2==nil) {
        [tableView registerClass:[SignListNameCell class] forCellReuseIdentifier:IDENTITY2];
        cell2=[tableView dequeueReusableCellWithIdentifier:IDENTITY2 forIndexPath:indexPath];
    }
    
    [cell2 fillCellWithModel:model];
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell2;
    
}

#pragma mark 返回多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if ( tableView == self.tableView) {
        return self.dataArray.count;
    } else if (tableView == self.waitSignTableView)
    {
        return self.waitSignArray.count;
    } else if (tableView == self.didSignTableView)
    {
        return self.didSignArray.count;
    } else if (tableView == self.pickTableView)
    {
        return self.pickArray.count;
    } else if (tableView == self.payTableView)
    {
        return self.payArray.count;
    }else{
        return self.endArray.count;
    };
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return  0.01*KWIDTH;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    return  0.1*KWIDTH;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    ApplyListModel *model;
//    if ( tableView == self.tableView) {
//        model = [self.dataArray objectAtIndexWithCheck:indexPath.section];
//    } else if (tableView == self.waitSignTableView)
//    {
//        model = [self.waitSignArray objectAtIndexWithCheck:indexPath.section];
//    } else if (tableView == self.didSignTableView)
//    {
//        model = [self.didSignArray objectAtIndexWithCheck:indexPath.section];
//    } else if (tableView == self.pickTableView)
//    {
//        model = [self.pickArray objectAtIndexWithCheck:indexPath.section];
//    } else if (tableView == self.payTableView)
//    {
//        model = [self.payArray objectAtIndexWithCheck:indexPath.section];
//    }else if (tableView == self.endTableView)
//    {
//        model = [self.endArray objectAtIndexWithCheck:indexPath.section];
//    };
    
//    if ([model.auditStatus isEqualToString:@"0"]||[model.auditStatus isEqualToString:@"1"]||([model.auditStatus isEqualToString:@"-1"]&&model.carBrand.length==0)) {
//
//        return 273*KWIDTH;
//
//    } else{
    
        return 235*KWIDTH;

//    }
    
}


- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:knotificationRefleshListData object:nil];

}





@end
