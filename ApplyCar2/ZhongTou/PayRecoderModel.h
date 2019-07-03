//
//  PayRecoderMOdel.h
//  ZhongTou
//
//  Created by Jone on 2017/12/7.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface PayRecoderModel : NSObject

@property(copy,nonatomic)NSString * billAddress;// = "<null>";
//    callbackParam = "{subject=\U9996\U4ed8\U6b3e/\U5b9a\U91d1, buyer_logon_id=132****6920, auth_app_id=2017112000062837, notify_type=trade_status_sync, out_trade_no=17120102163021001n, point_amount=0.00, version=1.0, fund_bill_list=[{\"amount\":\"0.01\",\"fundChannel\":\"ALIPAYACCOUNT\"}], buyer_id=2088312854595103, total_amount=0.01, trade_no=2017120121001004100523402795, notify_time=2017-12-01 14:16:53, charset=utf-8, invoice_amount=0.01, trade_status=TRADE_SUCCESS, gmt_payment=2017-12-01 14:16:53, gmt_create=2017-12-01 14:16:52, buyer_pay_amount=0.01, receipt_amount=0.01, app_id=2017112000062837, seller_id=2088821619951930, notify_id=b0ce259dcd3b428fc8809b886249e13grx, seller_email=ztga@ci-guoan.com}";
@property(copy,nonatomic)NSString *deptId;// = 2381;
@property(copy,nonatomic)NSString *deptName;// = "<null>";
@property(copy,nonatomic)NSString *expressPrice;// = "<null>";
@property(copy,nonatomic)NSString *goodsAmount;// = "<null>";
@property(copy,nonatomic)NSString *goodsName;// = "\U9996\U4ed8\U6b3e/\U5b9a\U91d1";
@property(copy,nonatomic)NSString *goodsPrice;// = "0.01";
@property(copy,nonatomic)NSString *goodsTotal;// = "<null>";
//    goodsWeight = "<null>";
@property(copy,nonatomic)NSString *payId;// = 2034;
@property(copy,nonatomic)NSString *orderNo;// = 20171201141630217;
@property(copy,nonatomic)NSString *orderStatus;// = "<null>";
@property(copy,nonatomic)NSString *orderTime;// = "2017-12-01 14:16:30";
@property(copy,nonatomic)NSString *orderTotal;// = "0.01";
@property(copy,nonatomic)NSString *payBusiness;// = 100;
@property(copy,nonatomic)NSString *payStatus;// = 2;
@property(copy,nonatomic)NSString *payTime;// = "2017-12-01 14:16:53";
@property(copy,nonatomic)NSString *payType;// = 2;
@property(copy,nonatomic)NSString *personId;// = 13266546920;
@property(copy,nonatomic)NSString *personName;// = "\U8d3e\U6b63\U4eae";
@property(copy,nonatomic)NSString *purchaseOrderNo;// = 17120102163021001n;
@property(copy,nonatomic)NSString *reqFrom;// = 2;

@end


