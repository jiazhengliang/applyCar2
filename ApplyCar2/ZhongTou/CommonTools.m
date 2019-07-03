//
//  CommonTools.m
//  ZhongTou
//
//  Created by Jone on 2017/10/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools
+ (BOOL)isLocationServiceOpen {
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {

            return YES;
        }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        return NO;
    } else
    {
        return YES;

    }
    
}

+(NSString *)timeChangeSting:(NSString *)time

{
    long between = [time longLongValue]/1000;
    long day1 = between / (24 * 3600);
    int hour1 = between % (24 * 3600) / 3600;
    int minute1 = between % 3600 / 60;
    int second1 = between % 60;
    return [NSString stringWithFormat:@"总耗时: %ld天%d小时%d分%d秒",day1,hour1,minute1,second1];
}
@end
