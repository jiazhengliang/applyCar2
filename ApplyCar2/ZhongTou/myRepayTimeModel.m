//
//  myRepayTimeModel.m
//  ZhongTou
//
//  Created by Jone on 2017/11/29.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "myRepayTimeModel.h"

@implementation myRepayTimeModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"repayList" : @"repayList"
             };
}
@end
@implementation repayList
+(NSDictionary *)replacedKeyFromPropertyName
{
    
    return @{@"heTongId":@"id",
             @"operation":@"operator"
             };
}
@end
