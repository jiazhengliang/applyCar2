//
//  SavaInfoTools.m
//  ZhongTou
//
//  Created by Jone on 2017/10/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "SavaInfoTools.h"

@implementation SavaInfoTools

+(SavaInfoTools *)sharedInstance
{
    static SavaInfoTools *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        
    });
    return _sharedInstance;
}

-(void)saveBooleanValue:(BOOL)boolean withKey:(NSString *)key
{
    if (key!=nil) {
        //保存key
        
        [[NSUserDefaults standardUserDefaults] setBool:boolean forKey:key];
        //强制同步
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
-(BOOL)getBooleaValueFromKey:(NSString *)key
{
    if (key!=nil) {
        return [[NSUserDefaults standardUserDefaults] boolForKey:key];
    }else
    {
        return NULL;
    }
}


//保存Object
- (void)saveObjectValue:(NSString *)token withKey:(NSString *)key;
{
    [[NSUserDefaults standardUserDefaults] setObject:token?token:@"" forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

//获取Object
- (NSString *)getObjectValueFromKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults]valueForKey:key];
}
@end
