//
//  AFAppDotNetAPIClient.m
//  HengTaiXinGolf
//
//  Created by Jone on 2017/7/13.
//  Copyright © 2017年 HengTaiXinGolf. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"
#import "SavaInfoTools.h"
#import "SvUDIDTools.h"
#import "MD5.h"
@implementation AFAppDotNetAPIClient



+(instancetype)shareClient
{
    
    static AFAppDotNetAPIClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        
        sharedClient.requestSerializer.timeoutInterval = 30;
        sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html",@"text/plain",@"application/json",@"text/xml",@"text/javascript",@"text/json"]];
        
        NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];
        
        NSString *sign = [MD5 MD5Encrypt:[NSString stringWithFormat:@"%@app_c_session",app_token]];
        NSLog(@"postion=====app_token==%@==sign==%@",app_token,sign);
        [sharedClient.requestSerializer setValue:app_token forHTTPHeaderField:@"app_token"];
        [sharedClient.requestSerializer setValue:sign forHTTPHeaderField:@"sign"];
        
    });
    return sharedClient;

}

@end
