//
//  webViewController.h
//  ZhongTou
//
//  Created by Jone on 2017/11/16.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "CustomViewController.h"
@protocol resignDelegate <NSObject>

-(void)webViewSignDelegateResult:(NSString *)result;

@end
@interface webViewController : CustomViewController<UIWebViewDelegate,resignDelegate>

@property (nonatomic,copy) NSString * url;
//type类型：
//
//1：交车资料
//
//2：签约合同
//
//3：采购合同
//
//4：其他合同
@property (nonatomic,copy) NSString * type;

@property (nonatomic,copy) NSString * hetongID;

@property (weak, nonatomic) id<resignDelegate> delegate;

@property (nonatomic,copy) NSString * headerTitle;
@end
