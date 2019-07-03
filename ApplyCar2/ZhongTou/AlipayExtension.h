//
//  AlipayExtension.h
//  ZouShow
//
//  Created by hexiao on 4/11/14.
//
//

#import <Foundation/Foundation.h>

#define ALIPAY_PAY_SCHEME     @"ZYHAlipayPay"


@protocol PayResultDelegate;

@interface AlipayExtension : NSObject<UIAlertViewDelegate>

/** 支付结果回调协议 */
@property (nonatomic,weak) id<PayResultDelegate> delegate;


+ (AlipayExtension*)instance;

+ (AlipayExtension*)newInstance;//多用户登录、绑定解绑时用

- (void)login;

- (void)payment:(NSString*)orderString delegate:(id<PayResultDelegate>)delegate;

- (void)handlePayResult:(NSDictionary *)resultDic;

@end

/** 支付回调协议 */
@protocol PayResultDelegate <NSObject>

@required

/**
 * 支付成功回调
 */
- (void)paySuccess;

/**
 * 支付失败回调
 */
- (void)payFail;

@end



