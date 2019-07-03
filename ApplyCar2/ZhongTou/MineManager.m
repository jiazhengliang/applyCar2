//
//  MineManager.m
//  ZhongTou
//
//  Created by Jone on 2017/10/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "MineManager.h"
static NSString * const MSG_CENTER = @"/openapi/appMessage/queryMessage";//消息中心首页


static NSString * const UP_MSG_CENTER = @"/openapi/appMessage/updateMessageStatus";//消息中心首页

static NSString * const ApplyList = @"/openapi/apply/list";//申请列表

static NSString * const CloseList = @"/openapi/apply/close";//品牌查询

static NSString * const brandList = @"/openapi/brand/list";//品牌查询

static NSString * const modelList = @"/openapi/model/list";//品牌查询


static NSString * const colorList = @"/openapi/carcolor/list";//品牌查询

static NSString * const carInfoList = @"/openapi/info/list";//车辆属性查询


static NSString  * const packageList                          = @"/openapi/productmanagement/queryPackageByBrandModel";//产品包


static NSString  * const CarSeletApply                          = @"/openapi/apply/submitApply";//车辆选择申请

static NSString  * const contractList                          = @"/openapi/contract/list";//申请合同列表


static NSString  * const getContractListURL                          = @"/openapi/junzi/getSignUrl";//签约合同


static NSString  * const getContractURLByID                          = @"/openapi/junzi/querySignUrl";//查询合同




static NSString  * const getJunziQueryByID                          = @"/openapi/junzi/querySignStatue";//查询授权书合同

static NSString  * const queryListSignStatueL                          = @"/openapi/junzi/queryListSignStatue";//更新合同状态

static NSString  * const signPassList                          = @"/openapi/applyinfo/signPass";//合同签约完成确定


static NSString  * const getContractByListID                          = @"/openapi/contract/getContractByApplyId";//合同签约完成确定
static NSString  * const getMyBuyList                          = @"/openapi/myBuy/myBuyList";//我的购买确定

static NSString  * const getMyRepayTimeList                          = @"/openapi/myBuy/myRepayList";//我的还款计划

static NSString  * const getPersonContract                          = @"/openapi/applyinfo/selectVehicleAndPersonContract";//我的购买确定

static NSString  * const payQueryOrderPaymentByPhone                          = @"/openapi/applyinfo/queryOrderPaymentByPhone";//我的付款记录

static NSString  * const getCarGPS                      = @"/openapi/common/getGPS";//车辆位置

static NSString  * const getPayTimeLog                      = @"/openapi/repayment/list";//获取还款明细


static NSString  * const getOrderApprovalLog                      = @"/openapi/loginfo/selectOrderApprovalLog";//日志


@implementation MineManager
-(void)getMessageCenter:(void (^)(NSDictionary *, NSError *))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    NSString *phoneNum = [[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    NSDictionary *param = @{@"receive_phone":phoneNum? phoneNum:@""
    };
    [manager GET:MSG_CENTER parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);

    }];
}

/*
 -3 ： 支付未成功（地采）
 
 -2：审核不通过
 
 -1：关闭
 
 0：待审核
 
 1：审核通过（待客户录入车辆）
 
 2：待客户资料录入(客户已提交车辆信息)
 
 3 ： 支付成功（地采） 待提车(集采)
 
 n0 ：待签约
 
 n1 :签约完成(集采)
 
 n7:   客户在线提车确认（待提车）
 
 n71: 地采待提车
 
 n8:   结束
 
 p3: 签约完成后准备支付(集采)
 
 n71dc_10061 财务全款支付
 
 dc_1007 地采采购发车确认
 
 dc_1008
 */
/**
 申请列表

 @param pageNumber 当前页码
 @param block 返回的数据
 */
//申请列表
-(void)getOpenapiApplyList:(int)pageNumber auditStatus:(NSString *)auditStatus block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    NSString *phoneNum = [[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];
    NSString *states;
    if ([auditStatus isEqualToString:@"全部"]) {
        auditStatus = @"";
    } else if ([auditStatus isEqualToString:@"审核"])
    {
        auditStatus = @"'0','1'";
    }else if ([auditStatus isEqualToString:@"签约"])
    {
        auditStatus = @"'n0'";

    }else if ([auditStatus isEqualToString:@"付款"])
    {
        auditStatus = @"'p3','2'";
        

    }else if ([auditStatus isEqualToString:@"提车"])
    {
        auditStatus = @"'n7','n71','3','z71'";

    }else if ([auditStatus isEqualToString:@"结束"])
    {
        auditStatus = @"'n8','n7dc_1009','-1','-2'";
    }

    NSDictionary *param = @{@"pageNumber":@(pageNumber),
                            @"pageSize":@(50),
                            @"customerPhone":phoneNum? phoneNum:@"",
                            @"auditStatus":auditStatus
                            };
    [manager GET:ApplyList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}

-(void)getCloseApplyList:(NSDictionary *)param block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];

    [manager POST:CloseList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}

-(void)getBrandList:(NSString *)brandName pageNumber:(int)pageNumber block:(void(^)(NSDictionary *dictionary,NSError *error))block;
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    
    NSDictionary *param = @{@"pageNumber":@(pageNumber),
                            @"pageSize":@(50),
                            @"brandName":brandName
                            };
    [manager GET:brandList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}

-(void)getModelList:(NSString *)model brandName:(NSString *)brandName pageNumber:(int)pageNumber block:(void (^)(NSDictionary *, NSError *))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    
    NSDictionary *param = @{@"pageNumber":@(pageNumber),
                            @"pageSize":@(50),
                            @"brandNo":brandName,
                            @"modelName":model
                            };
    [manager GET:modelList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}

-(void)getInfoList:(NSString *)brandName orgCode:(NSString *)orgCode pageNumber:(int)pageNumber block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient]; 
    
    NSDictionary *param = @{@"pageNumber":@(pageNumber),
                            @"pageSize":@(50),
                            @"vehicleLicense":brandName,
                            @"orgCode":orgCode?orgCode:@""
                            };
    [manager GET:carInfoList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
}

-(void)getColorlListBlock:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    
    [manager GET:colorList parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}

-(void)getUpMessageBrandName:(NSString *)messId block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    
    NSString *phoneNum = [[SavaInfoTools sharedInstance] getObjectValueFromKey:User_PhoneNum];

    NSDictionary *param = @{
                            @"id":messId,
                            @"receive_phone":phoneNum,
                            @"status":@"1"
                            };
    
    [manager GET:UP_MSG_CENTER parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}


-(void)getPackageByBrandid:(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{

    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager GET:packageList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}

-(void)PostCarSelectApply:(NSDictionary *)diction Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{

    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:CarSeletApply parameters:diction progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              block(nil,error);
    }];
    
}


//1：交车资料
//
//2：签约合同
//
//3：采购合同
//
//4：其他合同
-(void)contractlist:(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    

    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];

    [manager POST:contractList parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];

}


-(void)Getcontractlist:(NSDictionary *)param Block:(void (^)(NSDictionary *, NSError *))block
{

    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getContractListURL parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}



-(void)GetcontractNoByID :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getContractURLByID parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}

-(void)GetJunziQueryByID :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getJunziQueryByID parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}


-(void)QueryListSignStatue :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:queryListSignStatueL parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}


-(void)UpdatasignPassListSignList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:signPassList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}


-(void)getContractByListId :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getContractByListID parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}

-(void)getyMyBuyList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getMyBuyList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}

-(void)getMyRepayList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getMyRepayTimeList parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}


-(void)getPayRecoderList:(NSDictionary *)param Block:(void (^)(NSDictionary *, NSError *))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:payQueryOrderPaymentByPhone parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];

}

-(void)getPersonContract :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getPersonContract parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}


-(void)getCarGPS :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getCarGPS parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
}

-(void)getPayTimeLog :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getPayTimeLog parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
        
    }];
    
}

-(void)getOrderApprovalLog :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block
{
    AFAppDotNetAPIClient *manager = [AFAppDotNetAPIClient shareClient];
    [manager POST:getOrderApprovalLog parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
}

@end
