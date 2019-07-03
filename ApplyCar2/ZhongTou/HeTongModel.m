//
//  HeTongModel.m
//  ZhongTou
//
//  Created by Jone on 2017/11/20.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "HeTongModel.h"

@implementation HeTongModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    
    return @{@"heTongId":@"id",
             @"operation":@"operator"
             };
}
@end
