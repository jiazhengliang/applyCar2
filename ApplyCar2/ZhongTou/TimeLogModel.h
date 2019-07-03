//
//  TimeLogModel.h
//  ZhongTou
//
//  Created by Jone on 2017/12/12.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

/**
 data =     (
 {
 showTime =             (
 {
 time = "\U7533\U8bf7\U65f6\U95f4: 2017-12-12 11:35:24";
 },
 {
 time = "\U5ba1\U6279\U65f6\U95f4: 2017-12-12 11:35:41";
 },
 {
 time = "";
 },
 {
 time = "\U4ed8\U6b3e\U65f6\U95f4: 2017-12-12 11:37:44";
 },
 {
 time = "";
 }
 );
 totalTime1 = 17000;
 totalTime2 = "<null>";
 totalTime3 = 140000;
 totalTime4 = "<null>";
 }
 );
 msg = "\U67e5\U8be2\U6210\U529f";
 result = 1;*/
@interface TimeLogModel : NSObject
@property(copy,nonatomic)NSString *totalTime1;
@property(copy,nonatomic)NSString *totalTime2;
@property(copy,nonatomic)NSString *totalTime3;
@property(copy,nonatomic)NSString *totalTime4;

@property(strong,nonatomic)NSMutableArray *showTime;//
@end
@interface showTime : NSObject
@property(copy,nonatomic)NSString *time;


@end
