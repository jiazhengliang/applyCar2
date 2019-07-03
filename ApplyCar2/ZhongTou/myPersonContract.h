//
//  myPersonContract.h
//  ZhongTou
//
//  Created by Jone on 2017/11/30.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJExtension.h"

@interface myPersonContract : NSObject
@property(copy,nonatomic)NSString *applyId;// = "\U94c3\U6728";
@property(copy,nonatomic)NSString *contractNo;// = "2006\U6b3e 0.8L \U5feb\U4e50\U738b\U5b50";
@property(copy,nonatomic)NSString *brandName;// = "\U7ca4B453121";
@property(copy,nonatomic)NSString *carModel;// = ACZL2017112703;
@property(copy,nonatomic)NSString *carNo;// = "123.00";
@property(copy,nonatomic)NSString *orgCode;// = 001002;
@property(copy,nonatomic)NSString *firstPay;// = 12;
@property(copy,nonatomic)NSString *periodsNum;// = "213.00";
@property(copy,nonatomic)NSString *repayList;// = "213.00";

@property(strong,nonatomic)NSMutableArray *appPersonContractList;//
@end
@interface appPersonContractList : NSObject

@property(copy,nonatomic)NSString *heTongId;// = ACZL2017112703;
@property(copy,nonatomic)NSString *contractCode;// = "<null>";
@property(copy,nonatomic)NSString *contractType;// = 1;
@property(copy,nonatomic)NSString *contractKind;// = "<null>";
@property(copy,nonatomic)NSString *contractName;// = "<null>";
@property(copy,nonatomic)NSString *contractLevel;// = "<null>";
@property(copy,nonatomic)NSString *createTime;// = "<null>";
@property(copy,nonatomic)NSString *updateTime;// = 3669;
@property(copy,nonatomic)NSString *fileType;// = "\U5eb7\U91d1\U73b2";
@property(copy,nonatomic)NSString *fileUrl;// = "<null>";
@property(copy,nonatomic)NSString *deptId;// = "<null>";
@property(copy,nonatomic)NSString *operation;// = "<null>";
@property(copy,nonatomic)NSString *status;// = "<null>";
@property(copy,nonatomic)NSString *contractFlag;// = "<null>";
@property(copy,nonatomic)NSString *empId;// = "<null>";
@property(copy,nonatomic)NSString *deptNo;// = 12;
@property(copy,nonatomic)NSString *pdfUrl;// = "<null>";
@property(copy,nonatomic)NSString *userId;// = 213;
@property(copy,nonatomic)NSString *templateId;// = "2017-12-27 16:38:01";
@property(copy,nonatomic)NSString *contractNo;// = 1;
@property(copy,nonatomic)NSString *applyId;// = "\U6b63\U5e38\U672a\U7ed3\U6e05";

@end
