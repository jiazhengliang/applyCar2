//
//  AlipayExtension.m
//  ZouShow
//
//  Created by hexiao on 4/11/14.
//
//

#import "AlipayExtension.h"
//#import "AlixPayOrder.h"
#import "AlipayWebViewController.h"
#import "AFAppDotNetAPIClient.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+OAURLEncodingAdditions.h"
#import <AlipaySDK/AlipaySDK.h>
#import "APRSASigner.h"
#import "APAuthInfo.h"
#import "APOrderInfo.h"


@interface AlipayExtension()<NSXMLParserDelegate>

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *elementName;

@end

@implementation AlipayExtension


static AlipayExtension *instance = nil;
+ (AlipayExtension *)instance{
    @synchronized(self) {
        if(instance == nil) {
           instance = [[[self class] alloc] init];
        }
    }
    return instance;
}

+ (AlipayExtension*)newInstance
{
    instance = nil;
    return [AlipayExtension instance];
}



- (void)handlePayResult:(NSDictionary *)resultDic
{
    if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(paySuccess)]) {
            [self.delegate paySuccess];
        }
    }else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(payFail)]) {
            [self.delegate payFail];
        }
    }
}

- (void)payment:(NSString*)orderString delegate:(id<PayResultDelegate>)delegate
{
    self.delegate=delegate;
    [self daAlipay:orderString];
    
}

-(void)daAlipay:(NSString *)infoSting
{


    [[AlipaySDK defaultService] payOrder:infoSting fromScheme:ALIPAY_PAY_SCHEME callback:^(NSDictionary *resultDic) {
        NSLog(@"reslut = %@",resultDic);
    }];

}



@end
