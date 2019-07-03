//
//  BrandModel.h
//  ZhongTou
//
//  Created by Jone on 2017/11/9.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface BrandModel : NSObject

@property(copy,nonatomic)NSString *modelId;
//"id": 1,
@property(copy,nonatomic)NSString *brandNo;//": 1,


@property(copy,nonatomic)NSString *brandId;

@property(copy,nonatomic)NSString *brandName;//": "大众",

@property(copy,nonatomic)NSString *brandType;//": null,

@property(copy,nonatomic)NSString *status;//": "1",

@property(copy,nonatomic)NSString *createDate;//": "2017-09-18 10:55:30",

@property(copy,nonatomic)NSString *creator;//": "sysadmin",

@property(copy,nonatomic)NSString *modelNo;//": 25374,

@property(copy,nonatomic)NSString *modelName;//": "速迈 2014款 1.6T 旗舰版 国V",

@property(copy,nonatomic)NSString *vehicleBrand;//": "3",

@property(copy,nonatomic)NSString *vehicleModels;//": "115",

@property(copy,nonatomic)NSString *vehicleDisposition;//": "10",

@property(copy,nonatomic)NSString *vehicleEmissions;//": "1.8",

@property(copy,nonatomic)NSString *carColor;//": "15",

@property(copy,nonatomic)NSString *vehicleLicense;//": "粤B999999",

@property(copy,nonatomic)NSString *carFrameNo;//": "10000000011111111",

//"brandName": "福特",
//"modelName": "2004款 4.5 CIMA",
@property(copy,nonatomic)NSString *colorName;//": "棕色"


//"modifyDate": "2017-09-29 17:29:32",
//"operator": "sysadmin",
//"supplierId": null,
@property(copy,nonatomic)NSString *deptId;//": 1
@end
