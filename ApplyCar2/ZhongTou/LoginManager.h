//
//  LoginManager.h
//  ZhongTou
//
//  Created by Jone on 2017/10/19.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
//static NSString * const loginNomal   = @"/ciguo-manager-web/openapi/appPhoneUser/loginPhone";
//static NSString * const getMessageCode   = @"/ciguo-manager-web/openapi/appPhoneUser/getMessageCode";
//static NSString * const verificationBankFourInfo   = @"/ciguo-manager-web/openapi/appPhoneUser/verificationBankFourInfo";

static NSString * const verificationBankFourInfo   = @"/openapi/appPhoneUser/verificationBankFourInfo";
static NSString * const loginNomal   = @"/openapi/appPhoneUser/loginPhone";
static NSString * const getMessageCode   = @"/openapi/appPhoneUser/getMessageCode";
static NSString * const getByDeptNo   = @"/openapi/emp/getByDeptNo";
static NSString * const getSignUrl   = @"/openapi/junzi/getAuthBookUrl";

static NSString * const PostPaySubmit   = @"/openapi/apply/paysubmit";

static NSString * const getApplyPictureList   = @"/openapi/apply/reqImagesList";



@interface LoginManager : NSObject

/**
 获取验证码

 @param phoneNum 电话号码
 @param block 回调
 */
-(void)getMessageCode:(NSString*)phoneNum block:(void (^)(NSDictionary *dictionary, NSError *error))block;

/**
 登录

 @param Code 验证码
 @param phoneNum 电话号码
 */
-(void)loginNormal:(NSString *)Code phoneNum:(NSString *)phoneNum block:(void (^)(NSDictionary *dictionary, NSError *error))block;


/**
 获取个人消息通知

 */
-(void)getMessageCodeModelblock:(void (^)(NSDictionary *dictionary, NSError *error))block;


/**
 四要素认证

 @param name 名字
 @param IDNum 身份证
 @param bankNum 银行卡
 @param licenCarkNum 驾照
 @param block 回调
 */
-(void)verificationBankFourInfo:(NSString *)name IDNum:(NSString *)IDNum bankCark:(NSString *)bankNum licenCark:(NSString *)licenCarkNum block:(void (^)(NSDictionary *dictionary, NSError *error))block;


- (void)uploadUIImge:(NSArray*)userIDArray certificate:(NSArray*)certificateArray   block:(void (^)(NSDictionary *dictionary, NSError *error))block;



/**
 获取验证码
 
 @param phoneNum 电话号码
 @param block 回调
 */
-(void)getApplyPictureListUserId:(NSString*)userId block:(void (^)(NSDictionary *dictionary, NSError *error))block;

/**
  在线申请

 @param param 参数
 @param block 回调
 */
-(void)uploadPictureString:(NSDictionary*)param block:(void (^)(NSDictionary *dictionary, NSError *error))block;

/**
 在线申请

 @param userIDArray 身份证图片
 @param certificateArray 征信图片
 @param parameters 参数
 @param block 回调
 */
- (void)uploadPicture:(NSArray*)userIDArray certificate:(NSArray*)certificateArray Dic:(NSDictionary *)parameters  block:(void (^)(NSDictionary *dictionary, NSError *error))block;


/**
 -根据机构代码查经办人信息

 @param Code 机构代码
 */
- (void)getHandlerCode:(NSString *)Code block:(void (^)(NSDictionary *dictionary, NSError *error))block;


/**
 授权书
 */
- (void)getSignUrl:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block;


/**
 支付提交资料生成订单
 */
- (void)postPaySubmit:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block;



/**
 支付提交订单
 */
- (void)postAppPaymentSubmit:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block;



/**
 -在线提车照片
 
 @param diction 参数
 @param block 回调
 */
-(void)getPickCarApplyList:(NSArray*)ImgeArray Dic:(NSDictionary *)parameters Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 -在线提车
 */
-(void)getPickCarInfoDic:(NSDictionary *)parameters Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 获取通讯录及手机信息
 */
- (void)postPhonePersonInfo:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block;


/**
 获取已签约的个人征信
 */
- (void)getHetongInfo:(NSDictionary *)parameters block:(void (^)(NSDictionary *dictionary, NSError *error))block;


@end
