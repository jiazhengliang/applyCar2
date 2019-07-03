//
//  myBuyDetailModel.h
//  ZhongTou
//
//  Created by Jone on 2017/11/29.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "TimeLogModel.h"
@interface myBuyDetailModel : NSObject
@property(copy,nonatomic)NSString *brandName;//": "本田",

@property(copy,nonatomic)NSString *carModel;//": "2013款 十周年纪念 1.8L 手动舒适版",
@property(copy,nonatomic)NSString *carNo;//": "",

@property(copy,nonatomic)NSString *orgCode;//": "001002",

@property(copy,nonatomic)NSString *firstPay;//": "0.01",

@property(copy,nonatomic)NSString *periodsNum;//": 36,

@property(copy,nonatomic)NSString *periodsPay;//": "2000.00"

@property(copy,nonatomic)NSString *wxId;// = 12179;

@property(copy,nonatomic)NSString *zlType;// = 2;

@property(copy,nonatomic)NSString *contractNo;

@property(strong,nonatomic)NSMutableArray *appLogList;//

@end
