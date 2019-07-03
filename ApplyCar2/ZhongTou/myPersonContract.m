//
//  myPersonContract.m
//  ZhongTou
//
//  Created by Jone on 2017/11/30.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "myPersonContract.h"

@implementation myPersonContract
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"appPersonContractList" : @"appPersonContractList"
             };
}
@end
@implementation appPersonContractList
+(NSDictionary *)replacedKeyFromPropertyName
{
    
    return @{@"heTongId":@"id",
             @"operation":@"operator"
             };
}
@end
