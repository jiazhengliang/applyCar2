//
//  SavaInfoTools.h
//  ZhongTou
//
//  Created by Jone on 2017/10/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>

#define User_IsAgreeLocation @"User_IsAgreeLocation"


#define User_latitude @"User_latitude"
#define User_longitude @"User_longitude"
#define User_PhoneNum @"User_PhoneNum"
#define User_UDID @"User_UDID"
#define User_IsLogin @"User_IsLogin"


#define User_IsFirstLogin @"User_IsFirstLogin"


#define User_Name @"User_Name"

#define User_Userid @"User_Userid"

#define User_id @"User_id"

#define User_Bankno @"User_Bankno"
#define User_Driver_license @"User_Driver_license"

#define User_WIFiType @"User_WIFiType"



@interface SavaInfoTools : NSObject
//获取单例句柄
+(SavaInfoTools *)sharedInstance;

//保存bool
- (void)saveBooleanValue:(BOOL)boolean withKey:(NSString *)key;
//获取bool
- (BOOL)getBooleaValueFromKey:(NSString *)key;


//保存Object
- (void)saveObjectValue:(NSString *)token withKey:(NSString *)key;
//获取Object
- (NSString *)getObjectValueFromKey:(NSString *)key;
@end
