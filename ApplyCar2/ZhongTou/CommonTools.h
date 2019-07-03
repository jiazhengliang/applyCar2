//
//  CommonTools.h
//  ZhongTou
//
//  Created by Jone on 2017/10/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CommonTools : NSObject
+(BOOL)isLocationServiceOpen;

+(NSString *)timeChangeSting:(NSString *)time;
@end
