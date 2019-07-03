//
//  NotifySetting.m
//  ZouShow
//
//  Created by Amoson on 16/1/13.
//
//

#import "NotifySetting.h"
#import "BPush.h"
#define API_KEY @"YafMMHeXRjkyutk00q3R6WeR"
#define SECRET_KEY @"iXBaiDQloRInfVM9KWj6lEyaWwq6fvCn"

@implementation NotifySetting


+(BOOL)isAllowedNotification
{
    UIDevice *device = [UIDevice currentDevice];
    float sysVersion = [[device systemVersion]floatValue];
    if (sysVersion>=8.0f) {
        
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone != setting.types)
        {
            return YES;
            
        }
    }else
    {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if(UIRemoteNotificationTypeNone != type)
            return YES;
    }
    

    return NO;
}


+(void)regiestNotification
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *tmpArray = defaults.dictionaryRepresentation.allKeys;
    if ([tmpArray containsObject:@"receiveNotify"]) {
        BOOL status = [[defaults objectForKey:@"receiveNotify"] boolValue];
        if (!status) {
            
            [[UIApplication sharedApplication] unregisterForRemoteNotifications];
        }else{
        
            [self registerNotify];
        }
    }else{//第一次 默认开启
        
        [self registerNotify];
        
        [defaults setObject:[NSNumber numberWithBool:YES] forKey:@"receiveNotify"];
        [defaults synchronize];
    }

}

/* 注册通知 */
+ (void)registerNotify
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED>=80000
        UIUserNotificationType myTypes = UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeNone | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:myTypes categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
#endif
    }else{
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         UIRemoteNotificationTypeNone
         | UIRemoteNotificationTypeAlert
         | UIRemoteNotificationTypeSound
         | UIRemoteNotificationTypeBadge];
    }
}

@end
