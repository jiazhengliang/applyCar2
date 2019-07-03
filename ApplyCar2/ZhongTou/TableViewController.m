//
//  TableViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/7/21.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "classViewController.h"
@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation TableViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Content_Y, screen_width, screen_height-Content_Y) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"分类"];
    // 消息
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(pushToSettingUpViewController) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"nav-news-nor"] forState:UIControlStateNormal];
    [buttonBack setImage:[UIImage imageNamed:@"nav_news_foc"] forState:UIControlStateHighlighted];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self setNavigationBarRightButton:buttonBack];
    //   设置按钮
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(0, 0, 44, 44);
    [settingBtn addTarget:self action:@selector(pushToClassViewController) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"nav-settings-nor"] forState:UIControlStateNormal];
    [settingBtn setImage:[UIImage imageNamed:@"nav-settings-foc"] forState:UIControlStateHighlighted];
    [self setNavigationBarLeftButton:settingBtn];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor yellowColor];
    self.tableView.backgroundColor = [UIColor darkGrayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}


-(void)pushToClassViewController
{
    classViewController *deVC = [[classViewController alloc] init];
    deVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:deVC animated:YES];

}
-(void)pushToSettingUpViewController
{
    DetailViewController *deVC = [[DetailViewController alloc] init];
    deVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:deVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 28;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"--%@ - ", indexPath.row % 2?@"push":@"modal"];
    
    return cell;
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
