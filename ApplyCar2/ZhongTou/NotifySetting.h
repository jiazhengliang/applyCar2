//
//  NotifySetting.h
//  ZouShow
//
//  Created by Amoson on 16/1/13.
//
//

#import <Foundation/Foundation.h>

@interface NotifySetting : NSObject

/*
 *是否允许推送通知
 */
+(BOOL)isAllowedNotification;




+(void)regiestNotification;

@end
