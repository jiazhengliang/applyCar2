//
//  LoginManager.m
//  ZhongTou
//
//  Created by Jone on 2017/10/19.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "LoginManager.h"
#import "AFAppDotNetAPIClient.h"
#import "SvUDIDTools.h"
#import "AFNetworking.h"
#import "MD5.h"

@implementation LoginManager

-(void)getMessageCode:(NSString *)phoneNum block:(void (^)(NSDictionary *, NSError *))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    //手机系统 ios 10.1.1
    NSString *iphoneDevice = [SvUDIDTools app_phone_device];
    //    手机型号iphone 6
    NSString *iphoneType = [SvUDIDTools iphoneType];
    //网络地址
    NSString *ipAddress = [SvUDIDTools getIPAddress];
    //经度
    NSString *latitude = [[SavaInfoTools sharedInstance] getObjectValueFromKey:User_latitude];
    //纬度
    NSString *longitude =[[SavaInfoTools sharedInstance] getObjectValueFromKey:User_longitude];
    //uuid
    NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];
    
    NSDictionary *param = @{
                            @"app_imei":app_token,
                            @"app_version":app_version,
                            @"app_phone":phoneNum?phoneNum:@"",
                            @"app_system_version":iphoneDevice,
                            @"app_phone_device":iphoneType,
                            @"app_phone":phoneNum,
                            @"app_lat":latitude?latitude:@"",
                            @"app_lon":longitude?longitude:@"",
                            @"app_address_ip":ipAddress?ipAddress:@""
                            };
    
    [manager POST:getMessageCode parameters:param success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

}

-(void)loginNormal:(NSString *)Code phoneNum:(NSString *)phoneNum block:(void (^)(NSDictionary *dictionary, NSError *error))block
{

    NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];

    NSDictionary *param =@{
                           @"message_identifying_code":Code,
                           @"app_phone":phoneNum,
                           @"app_imei":app_token

                        };
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];

    [manager POST:loginNomal parameters:param success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

    
    
}

-(void)getMessageCodeModelblock:(void (^)(NSDictionary *, NSError *))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
//    [manager POST:modelList parameters:nil success:^(NSURLSessionDataTask *task, id JSON) {
//        block(JSON, nil);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        block(nil,error);
//    }];

}

-(void)verificationBankFourInfo:(NSString *)name IDNum:(NSString *)IDNum bankCark:(NSString *)bankNum licenCark:(NSString *)licenCarkNum block:(void (^)(NSDictionary *, NSError *))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    NSString *phoneNum = [[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    NSDictionary *param =@{
                           @"app_phone":phoneNum?phoneNum:@"",
                           @"app_name":name,
                           @"app_userid":IDNum,
                           @"app_bankno":bankNum,
                           @"app_driver_license":licenCarkNum

                           };

    [manager POST:verificationBankFourInfo parameters:param success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

}


/**
 * 上传图片
 * @param originalPicFile 原图
 * @param newPicFile 裁剪后的图片
 * @param block 回调
 */

- (void)uploadUIImge:(NSArray*)userIDArray certificate:(NSArray*)certificateArray   block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    NSLog(@"22222222");
    UIImage *idCarZImg = userIDArray[0];
    UIImage *idCarFImg = userIDArray[1];
    UIImage *bankZImg = userIDArray[2];
    UIImage *bankFImg = userIDArray[3];
    UIImage *driverZImg = userIDArray[4];
    UIImage *driverFImg = userIDArray[5];
    
    NSData *idCarZImgData = [self newimage:idCarZImg];
    NSData *idCarFImgData = [self newimage:idCarFImg];
    NSData *bankZImgData = [self newimage:bankZImg];
    NSData *bankFImgData = [self newimage:bankFImg];
    NSData *driverZImgData = [self newimage:driverZImg];
    NSData *driverFImgData = [self newimage:driverFImg];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //3.设置相应数据支持的类型
    
    NSLog(@"idCarZImgData==%@==%@=%@=%@==%@==%@",idCarFImgData,idCarZImgData,bankZImgData,bankFImgData,driverZImgData,driverFImgData);
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
    
    NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];
    
    NSString *sign = [MD5 MD5Encrypt:[NSString stringWithFormat:@"%@app_c_session",app_token]];
    NSLog(@"postion=====app_token==%@==sign==%@",app_token,sign);
    [manager.requestSerializer setValue:app_token forHTTPHeaderField:@"app_token"];
    [manager.requestSerializer setValue:sign forHTTPHeaderField:@"sign"];
    NSString *upDataURL = [NSString stringWithFormat:@"%@%@",AFAppDotNetAPIBaseURLString,upDataUIimage];
    [manager POST:upDataURL parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:idCarZImgData
                                    name:@"idCardZ"
                                fileName:@"idCardZ.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:idCarFImgData
                                    name:@"idCardF"
                                fileName:@"idCardF.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:bankZImgData
                                    name:@"bankNoZ"
                                fileName:@"bankNoZ.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:bankFImgData
                                    name:@"bankNoF"
                                fileName:@"bankNoF.jpg"
                                mimeType:@"image/jpg"];
        
        [formData appendPartWithFileData:driverZImgData
                                    name:@"driverZ"
                                fileName:@"driverZ.jpg"
                                mimeType:@"image/jpg"];
        
        [formData appendPartWithFileData:driverFImgData
                                    name:@"driverF"
                                fileName:@"driverF.jpg"
                                mimeType:@"image/jpg"];
        
        
        for (int i = 0; i<certificateArray.count; i++) {
            
            UIImage * certificate = certificateArray[i];
            NSData *certificateData = [self newimage:certificate];
            [formData appendPartWithFileData:certificateData
                                        name:[NSString stringWithFormat:@"certificate%d",i]
                                    fileName:[NSString stringWithFormat:@"certificate%d%@",i,@".jpg"]
                                    mimeType:@"image/jpg"];
            
            
        }
        NSLog(@"driverFImgData==%@",formData);
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            block(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            block(nil, error);
        }
    }];
    
    
}



/**
 
 @param userId userID 获取订单图片
 @param block 回调
 */
-(void)getApplyPictureListUserId:(NSString*)userId block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
        NSDictionary *parameters = @{@"userId":userId};
    [manager POST:getApplyPictureList parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
}


-(void)uploadPictureString:(NSDictionary*)param block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager POST:upDataString parameters:param success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
}

/**
 在线申请
 
 @param userIDArray 身份证图片
 @param certificateArray 征信图片
 @param parameters 参数
 @param block 回调
 */
- (void)uploadPicture:(NSArray*)userIDArray certificate:(NSArray*)certificateArray Dic:(NSDictionary *)parameters  block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    NSLog(@"22222222");
    UIImage *idCarZImg = userIDArray[0];
    UIImage *idCarFImg = userIDArray[1];
    UIImage *bankZImg = userIDArray[2];
    UIImage *bankFImg = userIDArray[3];
    UIImage *driverZImg = userIDArray[4];
    UIImage *driverFImg = userIDArray[5];

    NSData *idCarZImgData = [self newimage:idCarZImg];
    NSData *idCarFImgData = [self newimage:idCarFImg];
    NSData *bankZImgData = [self newimage:bankZImg];
    NSData *bankFImgData = [self newimage:bankFImg];
    NSData *driverZImgData = [self newimage:driverZImg];
    NSData *driverFImgData = [self newimage:driverFImg];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //3.设置相应数据支持的类型

    NSLog(@"idCarZImgData==%@==%@=%@=%@==%@==%@",idCarFImgData,idCarZImgData,bankZImgData,bankFImgData,driverZImgData,driverFImgData);
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
    
    NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];
    
    NSString *sign = [MD5 MD5Encrypt:[NSString stringWithFormat:@"%@app_c_session",app_token]];
    NSLog(@"postion=====app_token==%@==sign==%@",app_token,sign);
    [manager.requestSerializer setValue:app_token forHTTPHeaderField:@"app_token"];
    [manager.requestSerializer setValue:sign forHTTPHeaderField:@"sign"];
        NSString *upDataURL = [NSString stringWithFormat:@"%@%@",AFAppDotNetAPIBaseURLString,upDataString];
    [manager POST:upDataURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:idCarZImgData
                                    name:@"idCardZ"
                                fileName:@"idCardZ.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:idCarFImgData
                                    name:@"idCardF"
                                fileName:@"idCardF.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:bankZImgData
                                    name:@"bankNoZ"
                                fileName:@"bankNoZ.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:bankFImgData
                                    name:@"bankNoF"
                                fileName:@"bankNoF.jpg"
                                mimeType:@"image/jpg"];
        
        [formData appendPartWithFileData:driverZImgData
                                    name:@"driverZ"
                                fileName:@"driverZ.jpg"
                                mimeType:@"image/jpg"];
        
        [formData appendPartWithFileData:driverFImgData
                                    name:@"driverF"
                                fileName:@"driverF.jpg"
                                mimeType:@"image/jpg"];
        
        
        for (int i = 0; i<certificateArray.count; i++) {
            
            UIImage * certificate = certificateArray[i];
            NSData *certificateData = [self newimage:certificate];
            [formData appendPartWithFileData:certificateData
                                        name:[NSString stringWithFormat:@"certificate%d",i]
                                    fileName:[NSString stringWithFormat:@"certificate%d%@",i,@".jpg"]
                                    mimeType:@"image/jpg"];

            
        }
        NSLog(@"driverFImgData==%@",formData);

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            block(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            block(nil, error);
        }
    }];

    
}
-(NSData *)newimage:(UIImage *)oldimage
{
    NSData *originalPicFileData = UIImageJPEGRepresentation(oldimage, 0.8);
//    //压缩图片最大2M
//    while (originalPicFileData.length/1024.0/1024.0>0.5) {
//        originalPicFileData = UIImageJPEGRepresentation(oldimage, 0.5);
//    }

    return originalPicFileData;
    

}

- (void)getHandlerCode:(NSString *)Code block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];
    
    NSDictionary *param =@{
                           @"deptNo":Code,
                           };
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager POST:getByDeptNo parameters:param success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

}

- (void)getSignUrl:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
 
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager POST:getSignUrl parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

}

- (void)postPaySubmit:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager POST:PostPaySubmit parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

}

- (void)postAppPaymentSubmit:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block

{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager POST:PostAppPaySubmit parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
}


/**
 正面照片：carZ
 交车照片：carImg
 合影照片：groupImg*/

-(void)getPickCarApplyList:(NSArray*)ImgeArray Dic:(NSDictionary *)parameters Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    UIImage *idCarZImg = ImgeArray[0];
    UIImage *idCarFImg = ImgeArray[1];
    UIImage *bankZImg = ImgeArray[2];
    
    NSData *idCarZImgData = [self newimage:idCarZImg];
    NSData *idCarFImgData = [self newimage:idCarFImg];
    NSData *bankZImgData = [self newimage:bankZImg];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //3.设置相应数据支持的类型
    
    NSLog(@"idCarZImgData==%@==%@=%@=",idCarFImgData,idCarZImgData,bankZImgData);
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
    
    NSString *app_token = [NSString stringWithFormat:@"%@",[SvUDIDTools UDID]];
    
    NSString *sign = [MD5 MD5Encrypt:[NSString stringWithFormat:@"%@app_c_session",app_token]];
    NSLog(@"postion=====app_token==%@==sign==%@",app_token,sign);
    
    //提车接口
//    NSString *upDataURL = [NSString stringWithFormat:@"%@%@",AFAppDotNetAPIBaseURLString,pickUPCar];
    //提车照片接口
    NSString *upDataURL = [NSString stringWithFormat:@"%@%@",AFAppDotNetAPIBaseURLString,upDataUIimage];

    
    [manager.requestSerializer setValue:app_token forHTTPHeaderField:@"app_token"];
    [manager.requestSerializer setValue:sign forHTTPHeaderField:@"sign"];
    
    [manager POST:upDataURL parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:idCarZImgData
                                    name:@"groupImg"
                                fileName:@"groupImg.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:idCarFImgData
                                    name:@"carZ"
                                fileName:@"carZ.jpg"
                                mimeType:@"image/jpg"];
        [formData appendPartWithFileData:bankZImgData
                                    name:@"carImg"
                                fileName:@"carImg.jpg"
                                mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        if (responseObject) {
            block(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            block(nil, error);
        }
    }];
}


/**
 在线提车

 @param parameters 参数
 @param block 回调
 */
-(void)getPickCarInfoDic:(NSDictionary *)parameters Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    NSString *upDataURL = [NSString stringWithFormat:@"%@%@",AFAppDotNetAPIBaseURLString,pickUPCar];

    [manager POST:upDataURL parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
}

- (void)postPhonePersonInfo:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager POST:PostAppPhoneInfo parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
}

- (void)getHetongInfo:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFAppDotNetAPIClient *manager=[AFAppDotNetAPIClient shareClient];
    
    [manager GET:getZhengXingHetongInfo parameters:parameters success:^(NSURLSessionDataTask *task, id JSON) {
        block(JSON, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
}


@end
