//
//  AFAppDotNetAPIClient.h
//  HengTaiXinGolf
//
//  Created by Jone on 2017/7/13.
//  Copyright © 2017年 HengTaiXinGolf. All rights reserved.
//
#import "AFHTTPSessionManager.h"


/**
 http://c.ci-zyh.cn       //C端项目
 http://pay.ci-zyh.cn       //支付接口项目

*/



//测试环境
// static NSString * const AFAppDotNetAPIBaseURLString = @"http://119.136.19.94:8092";
//
// static NSString * const HelpAndBack  = @"http://119.136.19.93:8091/wxHelp/initIOSHelp.do";
//
// static NSString * const PostAppPaySubmit  = @"http://119.136.19.92:8093/alipayApp/alipay/app/payment";
//static NSString * const resignURL = @"http://119.136.19.93:8091/login/appRegister.do";
//
//static NSString * const ImageFillPath = @"http://119.136.19.93:8091";


//正式环境http://pay.ci-zyh.cn/alipay/
static NSString * const PostAppPaySubmit  = @"http://pay.ci-zyh.cn/alipay/alipay/app/payment";
static NSString * const HelpAndBack  = @"http://sys.ci-zyh.cn/wxHelp/initIOSHelp.do";

static NSString * const resignURL = @"http://c.ci-zyh.cn/login/appRegister.do";

static NSString * const ImageFillPath = @"http://c.ci-zyh.cn";

static NSString * const AFAppDotNetAPIBaseURLString = @"http://c.ci-zyh.cn";



static NSString * const upDataUIimage = @"/openapi/common/file/upload";


static NSString * const upDataString = @"/openapi/apply/create";

static NSString * const pickUPCar = @"/openapi/applyinfo/getCar";

static NSString * const PostAppPhoneInfo  = @"/openapi/phoneinfo/insertOrUpdateInfo";

static NSString * const getZhengXingHetongInfo  = @"/openapi/apply/getSignContractNo";

static NSString * const querySignURL  = @"http://www.ebaoquan.org/mobile/query";

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

+(instancetype)shareClient;

@end
