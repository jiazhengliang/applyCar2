//
//  LineApplyDCVController.h
//  ZhongTou
//
//  Created by Jone on 2017/10/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "CustomViewController.h"

@interface LineApplyDCVController : CustomViewController
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *imgArray;

@property (nonatomic,strong) NSArray *userInfoArray;
@property (nonatomic,strong) NSArray *typeArray;

@property(copy,nonatomic)NSString  *fromType;

@end
