//
//  BaseViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "BaseViewController.h"
#import "SavaInfoTools.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardDidHide) name:UIKeyboardWillHideNotification object:nil];
    _keyboardIsVisible = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardDidShow
{
    _keyboardIsVisible = YES;
}

- (void)keyboardDidHide
{
    _keyboardIsVisible = NO;
}


-(void)initWithWiFi
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    NSString *remoteHostName = @"www.baidu.com";
    NSString *remoteHostLabelFormatString = NSLocalizedString(@"Remote Host: %@", @"Remote host label format string");
    
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
    [self updateInterfaceWithReachability:self.hostReachability];
    
    
    
}


- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    if (reachability == self.hostReachability)
    {
        
        [self reachability:reachability];
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
        NSString* baseLabelText = @"";
        
        if (connectionRequired)
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
        }
        else
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
        }
    }
    
    if (reachability == self.internetReachability)
    {
        [self reachability:reachability];
    }
    
    if (reachability == self.wifiReachability)
    {
        [self reachability:reachability];
    }
    
}

- (void)reachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            NSLog(@"没有网络信号");
            [self initNotReachableView];
            
            [[SavaInfoTools sharedInstance]saveObjectValue:@"没有网络" withKey:User_WIFiType];
            connectionRequired = NO;
            
            break;
        }
            
        case ReachableViaWWAN:        {
            NSLog(@"手机网络信号");
            [[SavaInfoTools sharedInstance]saveObjectValue:@"流量网络" withKey:User_WIFiType];

            statusString = NSLocalizedString(@"Reachable WWAN", @"");
            if ([self.notReachableView superview]) {
                [self.notReachableView removeFromSuperview];
            }            
            self.notReachableView = nil;
            break;
        }
        case ReachableViaWiFi:        {
            NSLog(@"wifi信号");
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            if ([self.notReachableView superview]) {
                [self.notReachableView removeFromSuperview];
            }
            [[SavaInfoTools sharedInstance]saveObjectValue:@"WIFI网络" withKey:User_WIFiType];

            self.notReachableView = nil;
            break;
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
}


- (void)initNotReachableView
{
    if (self.notReachableView ==nil)
    {
        self.notReachableView = [[UIView alloc]initWithFrame:CGRectMake(0, Content_Y, screen_width, Content_Height )];
        self.notReachableView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        [self.view addSubview:self.notReachableView];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(notReachableViewTapGesture)];
        [self.notReachableView addGestureRecognizer:gesture];
        
        int height = self.notReachableView.frame.size.height / 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NOWIFI"]];
        image.frame = CGRectMake(screen_width/2 - 50, height - 189 , 100, 100);
        [self.notReachableView addSubview:image];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"网络不给力";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor lightGrayColor];
        title.font = [UIFont systemFontOfSize:14];
        title.frame = CGRectMake(screen_width/2 - 100, image.frame.origin.y + image.frame.size.height + 20, 200, 24);
        [self.notReachableView addSubview:title];
        
        UILabel *leftLabel=[[UILabel alloc] init];
        
        leftLabel.textColor=[UIColor lightGrayColor];
        leftLabel.font=[UIFont systemFontOfSize:13];
        leftLabel.text=@"请检查您的手机";
        [self.notReachableView addSubview:leftLabel];
        
        [self.notReachableView updateConstraints];
        
        [self.view addSubview:self.notReachableView];
    }
}


//- (void)initNotReachableView
//{
//    if (!_notReachableView)
//    {
//        _notReachableView = [[UIView alloc]initWithFrame:CGRectMake(0, Content_Y, screen_width, Content_Height )];
//        _notReachableView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
//        [self.view addSubview:_notReachableView];
//        
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(notReachableViewTapGesture)];
//        [_notReachableView addGestureRecognizer:gesture];
//        
//        int height = _notReachableView.frame.size.height / 2;
//        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wifiNew"]];
//        image.frame = CGRectMake(screen_width/2 - 50, height - 189 , 100, 100);
//        [_notReachableView addSubview:image];
//        
//        UILabel *title = [[UILabel alloc]init];
//        title.text = @"网络不给力";
//        title.textColor = [UIColor lightGrayColor];
//        title.font = [UIFont systemFontOfSize:18];
//        title.frame = CGRectMake(screen_width/2 - 41, image.frame.origin.y + image.frame.size.height + 20, 90, 24);
//        [_notReachableView addSubview:title];
//        
//        UILabel *leftLabel=[[UILabel alloc] init];
//        
//        leftLabel.textColor=[UIColor lightGrayColor];
//        leftLabel.font=[UIFont systemFontOfSize:13];
//        leftLabel.text=@"请检查您的手机";
//        [_notReachableView addSubview:leftLabel];
//        
//
//        [_notReachableView updateConstraints];
//    }
//}
//
//
//
//- (void)handleNotReachable:(NSNotification *)notify
//{
//    _curReach = [notify object];
//    NetworkStatus status = [_curReach currentReachabilityStatus];
//    
//    if (status == NotReachable) //无网络
//    {
//        [self initNotReachableView];
//    }else{ //有网络
//        if ([_notReachableView superview]) {
//            [_notReachableView removeFromSuperview];
//        }
//        _notReachableView = nil;
//    }
//
//}



@end
