//
//  BillListController.h
//  ZhongTou
//
//  Created by Jone on 2017/11/6.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "CustomViewController.h"
typedef enum
{
    BillAllType=1,//全部
    BillWillWailSignType,//待审核
    BillWailSignType,//审核通过
    
    BillDidDiCaiSignType,//地采签约
    BillDidSignType,//签约
    BillDCBackGoundType,//地签约
    BillJCBackGoundSignType,//集签约

    BillBackGroundCheckType,//待审核
    BillZiLiaoLuQuType,//待客户资料录取

    BillPayType,//付款
    BillPickType,//提车
    BillRefusedCarEndType,//拒绝通过选择车辆
    BillRefusedEndType,//拒绝通过还未选择车辆
    BillEndType,//结束
}BillType;
@interface BillListController : CustomViewController


@end
