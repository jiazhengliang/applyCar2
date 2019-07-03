//
//  ApplyListModel.h
//  ZhongTou
//
//  Created by Jone on 2017/11/8.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface ApplyListModel : NSObject

/**

 auditStatus = 0;
 bankNo = 6217007200028311572;
 brandId = 9;
 carBrand = "\U672c\U7530";
 carColor = "\U7070\U8272";
 carFrame = LFMBEC4D9B0066331;
 carModel = "2013\U6b3e \U5341\U5468\U5e74\U7eaa\U5ff5 1.8L \U624b\U52a8\U8212\U9002\U7248";
 createDate = "2017-11-10 00:00:00";
 creditLimit = "<null>";
 customerIdnumber = 432524198901307410;
 customerName = "\U5eb7\U91d1\U73b2";
 customerPhone = 13144806821;
 deptId = 2381;
 driverFilePath = "<null>";
 emission = 20T;
 empId = "<null>";
 id = 5080;
 modelNo = 15948;
 monthSalary = "<null>";
 operaterId = 11244;
 operaterName = "\U738b\U5c0f\U68fd2";
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
 vehicleLicense = "\U7ca4B55126";
 */
@property (nonatomic,copy) NSString *driverFilePath;
@property (nonatomic,copy) NSString *auditStatus;// = 0;

//卡号
@property (nonatomic,copy) NSString *bankNo;// = 6217007200028311572;

@property (nonatomic,copy) NSString *carBrand;

@property (nonatomic,copy) NSString *carColor;

@property (nonatomic,copy) NSString *carModel;

@property (nonatomic,copy) NSString *carFrame;

@property (nonatomic,copy) NSString *createDate; //= "2017-11-08 00:00:00";


//身份证
@property (nonatomic,copy) NSString *customerIdnumber; //= 432524198901307410;
//姓名
@property (nonatomic,copy) NSString *customerName;// = "\U5eb7\U91d1\U73b2";

//电话号码
@property (nonatomic,copy) NSString *customerPhone;// = 13144806821;
@property (nonatomic,copy) NSString *deptId;// = 2381;

@property (nonatomic,copy) NSString * modelId;//= 4071;

@property (nonatomic,copy) NSString * operaterId;//= 11240;
//经办人
@property (nonatomic,copy) NSString *operaterName;//= "\U6768\U5fb7\U67972";
//机构代码
@property (nonatomic,copy) NSString *orgCode; //= 001002;
//集采 是 1和地采 是2
@property (nonatomic,copy) NSString *status; //= 1;

@property (nonatomic,assign) int userId; // = 26;

@property (nonatomic,copy) NSString *brandId;

@property (nonatomic,copy) NSString *emission;


@property (nonatomic,copy) NSString *modelNo;

@property (nonatomic,copy) NSString *packageId;

@property (nonatomic,copy) NSString *packageName;

@property (nonatomic,copy) NSString *vehicleLicense;

@property (nonatomic,copy) NSString *uses;

@property (nonatomic,copy) NSString *vehcileId;

@property (nonatomic,copy) NSString *vehicleDisposition;

@property (nonatomic,copy) NSString *applyId;

@property (nonatomic,copy) NSString *contractNo;

@property (nonatomic,copy) NSString *deposit;

@property (nonatomic,strong) NSString *images;

@end
@interface images : NSObject
@property(copy,nonatomic)NSString *carZName;

@property(copy,nonatomic)NSString *groupImgPath;

@property(copy,nonatomic)NSString *carZPath;

@property(copy,nonatomic)NSString *groupImgName;

@property(copy,nonatomic)NSString *carImgName;

@property(copy,nonatomic)NSString *carImgPath;
@end

