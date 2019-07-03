//
//  MineManager.h
//  ZhongTou
//
//  Created by Jone on 2017/10/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface MineManager : NSObject
//消息中心
-(void)getMessageCenter:(void(^)(NSDictionary *dictionary,NSError *error))block;

//申请列表
-(void)getOpenapiApplyList:(int)pageNumber auditStatus:(NSString *)auditStatus block:(void(^)(NSDictionary *dictionary,NSError *error))block;

//关闭申请
-(void)getCloseApplyList:(NSDictionary *)param block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 品牌搜索

 @param brandName 品牌名
 @param pageNumber 第几页
 @param block block escription
 */
-(void)getBrandList:(NSString *)brandName pageNumber:(int)pageNumber block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 车型搜索

 @param model 车型
 @param brandName 品牌
 @param pageNumber 第几页
 @param block 回调
 */
-(void)getModelList:(NSString *)model brandName:(NSString *)brandName pageNumber:(int)pageNumber block:(void(^)(NSDictionary *dictionary,NSError *error))block;
//车辆属性列表
/**
 车辆属性列表

 @param brandName 通过车牌名
 @param pageNumber 第几页
 @param block 回调
 */
-(void)getInfoList:(NSString *)brandName orgCode:(NSString *)orgCode pageNumber:(int)pageNumber block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 颜色搜索

 @param block 回调
 */
-(void)getColorlListBlock:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 更新消息中心状态

 @param brandName 消息ID
 */
-(void)getUpMessageBrandName:(NSString *)brandName block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 产品包

 @param param 品牌ID
 @param block 回调

 */
-(void)getPackageByBrandid:(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 车辆选择提交

 @param diction 参数
 @param block 回调
 */
-(void)PostCarSelectApply:(NSDictionary *)diction Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 电子签约合同列表
 
 @param param 参数
 @param block 回调
 */
-(void)contractlist:(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;



/**
 电子签约合同
 
 @param param 参数
 @param block 回调
 */
-(void)Getcontractlist :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 电子签约合同
 
 @param param 参数
 @param block 回调
 */
-(void)GetcontractNoByID :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 电子授权书合同
 
 @param param 参数
 @param block 回调
 */
-(void)GetJunziQueryByID :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 更新合同状态
 
 @param param 参数
 @param block 回调
 */
-(void)QueryListSignStatue :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 合同签约完成确定
 
 @param param 参数
 @param block 回调
 */
-(void)UpdatasignPassListSignList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 根据list单号来查询合同
 
 @param param 参数
 @param block 回调
 */
-(void)getContractByListId :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 我的购买
 
 @param param 参数
 @param block 回调
 */
-(void)getyMyBuyList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;



/**
 我的还款计划
 
 @param param 参数
 @param block 回调
 */
-(void)getMyRepayList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 我的付款记录
 
 @param param 参数
 @param block 回调
 */
-(void)getPayRecoderList :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;


/**
 我的合同
 
 @param param 参数
 @param block 回调
 */
-(void)getPersonContract :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 获取gps
 
 @param param 参数
 @param block 回调
 */
-(void)getCarGPS :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 获取还款明细
 
 @param param 参数
 @param block 回调
 */
-(void)getPayTimeLog :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

/**
 查询订单审批流程日志
 
 @param param 参数
 @param block 回调
 */
-(void)getOrderApprovalLog :(NSDictionary *)param Block:(void(^)(NSDictionary *dictionary,NSError *error))block;

@end
