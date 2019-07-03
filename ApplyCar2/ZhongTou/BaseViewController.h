//
//  BaseViewController.h
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface BaseViewController : UIViewController
//@property (nonatomic,retain) Reachability *curReach;

@property (strong,nonatomic) UIView *notReachableView;

@property (nonatomic,assign) BOOL keyboardIsVisible;

@property (nonatomic) Reachability *hostReachability;

@property (nonatomic) Reachability *internetReachability;

@property (nonatomic) Reachability *wifiReachability;

-(void)initWithWiFi;

- (void)keyboardDidShow;
       
- (void)keyboardDidHide;
@end
