//
//  classViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/7/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "classViewController.h"
#import "AFAppDotNetAPIClient.h"
#import "UIScrollView+EmptyDataSet.h"
#import "NSObject+MJKeyValue.h"
#import "LargeCategeCell.h"
#import "NSArray+Check.h"
static NSString * const GET_ADVERT_LIST_GATEGORY       = @"adv/getAdvListByCategory";

@interface classViewController ()
@property(nonatomic,strong) UIScrollView *classifyRootView;
@property(nonatomic,strong) NSArray *largeCategeArray;
@property(nonatomic,strong) NSMutableArray *largeCategeViewArray;
@property (strong, nonatomic) UIButton *button;
@end

@implementation classViewController
- (NSMutableArray *)largeCategeViewArray
{
    if (_largeCategeViewArray == nil) {
        _largeCategeViewArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _largeCategeViewArray;
}
- (UIScrollView *)classifyRootView
{
    if (_classifyRootView == nil) {
        _classifyRootView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, Content_Y, screen_width, screen_height-Content_Y)];
        _classifyRootView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        _classifyRootView.contentSize = CGSizeMake(screen_width, screen_height*2);
        _classifyRootView.scrollsToTop = YES;
        
        _classifyRootView.backgroundColor = [UIColor grayColor];
//        _classifyRootView.emptyDataSetSource = self;
//        _classifyRootView.emptyDataSetDelegate = self;
           }
    return _classifyRootView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(30, 0, 50, 30)];
    [self.button setTitle:@"测试" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [self.button addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:@"test_button"];
    [self.view addSubview:self.button];
    [self.view addSubview:self.classifyRootView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self getGoodsCategoryV2:@"GoodsCategoryV5" type:@"women" block:^(NSDictionary *dictionary, NSError *error) {
        NSLog(@"%@",dictionary);
    }];
    // Do any additional setup after loading the view.
}
-(void)getGoodsCategoryV2:(NSString *)advListCode type:(NSString *)type block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    
    NSDictionary *param = @{@"advPlaceCode":advListCode,
                            @"category":type?type:@"default"};
    
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];

    __weak typeof(self) weakSelf = self;
    [manager POST:GET_ADVERT_LIST_GATEGORY parameters:param success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
//        NSString *jsonStr = [JsonUtils dictionaryToJson:dictionary];
//        [self saveCategoryCache:jsonStr category:@"categories"];
//        block(dictionary,nil);
        NSDictionary *dic = (NSDictionary *)JSON;
        if ([dic[@"errorCode"]intValue] == 0) {
            weakSelf.largeCategeArray = [[NSArray alloc]initWithArray:dic[@"advList"]];
        }

        NSLog(@"largeCategeArray==%@",_largeCategeViewArray);
        for (int i = 0 ;i < self.largeCategeArray.count ; i++) {
//            AdvVo *modelAdv = [AdvVo objectWithKeyValues:_largeCategeArray[i]];
//            [weakSelf initLargeCategeView:modelAdv index:i status:NO];
        }
        [weakSelf updateLargeCateView];
        
//        [_classifyRootView reloadEmptyDataSet];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
    
}
//初始化大分类视图
-(void)initLargeCategeView:(AdvVo*)data index:(NSInteger)index status:(BOOL)status
{
    LargeCategeCell *largeCategeCell = [[LargeCategeCell alloc]init];
    largeCategeCell.modelAdv = data;
    largeCategeCell.extended = status;
    largeCategeCell.index = index;
    [self.largeCategeViewArray addObject:largeCategeCell];
    [_classifyRootView addSubview:largeCategeCell];
    largeCategeCell.delegate = self;
    largeCategeCell.frame = CGRectMake(0, index*(BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6 +0.5), screen_width, BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6);
}

//更新大分类视图
-(void)updateLargeCateView
{
//    for (UIView *view in _classifyRootView.subviews) {
//
//        [view removeFromSuperview];
//    }
    
    
    for (int i=0; i<_largeCategeViewArray.count ; i++) {
        LargeCategeCell *cell  = [_largeCategeViewArray objectAtIndexWithCheck:i];
        [UIView animateWithDuration:1.0 animations:^{
            cell.frame = CGRectMake(0, cell.index*(BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6 +0.5), screen_width, BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6);
        }];
    }
    _classifyRootView.contentSize = CGSizeMake(screen_width, _largeCategeViewArray.count * (BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6 + 0.5));
    
       _button.selected = YES;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UIButton *button = (UIButton *)object;
    if (self.button == button && [@"selected" isEqualToString:keyPath]) {
        NSLog(@"self.button的enabled属性改变了%@",[change objectForKey:@"new"]);
    }
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
