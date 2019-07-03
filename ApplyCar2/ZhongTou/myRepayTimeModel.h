//
//  myRepayTimeModel.h
//  ZhongTou
//
//  Created by Jone on 2017/11/29.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface myRepayTimeModel : NSObject
@property(copy,nonatomic)NSString *brandName;// = "\U94c3\U6728";
@property(copy,nonatomic)NSString *carModel;// = "2006\U6b3e 0.8L \U5feb\U4e50\U738b\U5b50";
@property(copy,nonatomic)NSString *carNo;// = "\U7ca4B453121";
@property(copy,nonatomic)NSString *contractNo;// = ACZL2017112703;
@property(copy,nonatomic)NSString *firstPay;// = "123.00";
@property(copy,nonatomic)NSString *orgCode;// = 001002;
@property(copy,nonatomic)NSString *periodsNum;// = 12;
@property(copy,nonatomic)NSString *periodsPay;// = "213.00";
@property(strong,nonatomic)NSMutableArray *repayList;//
@end
@interface repayList : NSObject

@property(copy,nonatomic)NSString *contractNo;// = ACZL2017112703;
@property(copy,nonatomic)NSString *createDate;// = "<null>";
@property(copy,nonatomic)NSString *currentPeriod;// = 1;
@property(copy,nonatomic)NSString *deptId;// = "<null>";
@property(copy,nonatomic)NSString *financingId;// = "<null>";
@property(copy,nonatomic)NSString *financingMoney;// = "<null>";
@property(copy,nonatomic)NSString *hasDeadline;// = "<null>";
@property(copy,nonatomic)NSString *rePayId;// = 3669;
@property(copy,nonatomic)NSString *name;// = "\U5eb7\U91d1\U73b2";
@property(copy,nonatomic)NSString *nohasDeadline;// = "<null>";
@property(copy,nonatomic)NSString *operation;// = "<null>";
@property(copy,nonatomic)NSString *overdueMoney;// = "<null>";
@property(copy,nonatomic)NSString *personalId;// = "<null>";
@property(copy,nonatomic)NSString *priorBalance;// = "<null>";
@property(copy,nonatomic)NSString *protocolNo;// = "<null>";
@property(copy,nonatomic)NSString *refundDeadline;// = 12;
@property(copy,nonatomic)NSString *remindStatus;// = "<null>";
@property(copy,nonatomic)NSString *shouldAmount;// = 213;
@property(copy,nonatomic)NSString *shouldDate;// = "2017-12-27 16:38:01";
@property(copy,nonatomic)NSString *status;// = 1;
@property(copy,nonatomic)NSString *statusName;// = "\U6b63\U5e38\U672a\U7ed3\U6e05";
@property(copy,nonatomic)NSString *totalPayedMoney;// = "<null>";
@property(copy,nonatomic)NSString *towingfee;// = "<null>";
@property(copy,nonatomic)NSString *withholding;// = "<null>";
@end
