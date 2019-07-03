//
//  AppDelegate.m
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomNavigationController.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "BPush.h"
#import "NotifySetting.h"
#import "LoginController.h"
#import "MainViewController.h"
#import <AddressBook/AddressBook.h>
#import <AlipaySDK/AlipaySDK.h>
#import "AlipayExtension.h"
#import "ZYHGuideViewController.h"
#define BUGLY_APP_ID @"c4d7936bc5"

@interface AppDelegate ()<UITabBarControllerDelegate>
{
}

@property (strong, nonatomic) LoginController *loginController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectStateChanged:) name:knotificationChangeVC object:nil];
    BOOL isFirstLogin=[[SavaInfoTools sharedInstance] getBooleaValueFromKey:User_IsFirstLogin];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    if (!isFirstLogin) {
        ZYHGuideViewController *guideVc = [[ZYHGuideViewController alloc] init];
        CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:guideVc];
        self.window.rootViewController = navController;

    } else
    {
        [self LoginView];

    }
    [self.window makeKeyAndVisible];
    


    return YES;
}




#pragma mark - BuglyDelegate
- (NSString *)attachmentForException:(NSException *)exception {
    NSLog(@"(%@:%d) %s %@",[[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__,exception);
    
    return @"This is an attachment";
}


-(void)LoginView{

    
    BOOL isLogin=[[SavaInfoTools sharedInstance] getBooleaValueFromKey:User_IsLogin];
    
    if (!isLogin) {
        
        self.loginController = [[LoginController alloc] init];
        CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:_loginController];
        self.window.rootViewController = navController;
        
    } else {
        
        MainViewController *mainVC = [[MainViewController alloc] init];
        
        //自定义导航控制器 把该控制器作为根视图控制器
        CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:mainVC];
        
        //导航条不透明
        navController.navigationBar.translucent = NO;
        
        //导航条样式：默认
        navController.navigationBar.barStyle = UIBarStyleDefault;
        
        self.window.rootViewController = navController;
        
    }
    

    //检查版本更新
    [self checkUpdateMessage];

}


#pragma mark - 检查版本更新
-(void)checkUpdateMessage{
    NSLog(@"检查版本更新");
}

#pragma mark -转换我的 和 登录
-(void)connectStateChanged:(NSNotification *)notification {

    NSString *object = notification.object;

    if ([object isEqualToString:@"0"]) {
        self.loginController = [[LoginController alloc] init];
        CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:_loginController];
        
        self.window.rootViewController = navController;
    } else
    {
        MainViewController *mainVC = [[MainViewController alloc] init];
        
        //自定义导航控制器 把该控制器作为根视图控制器
        CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:mainVC];
        
        //导航条不透明
        navController.navigationBar.translucent = NO;
        
        //导航条样式：默认
        navController.navigationBar.barStyle = UIBarStyleDefault;
        
        self.window.rootViewController = navController;
    }

    
}

-(void)BPushInit:(NSDictionary *)launchOptions
{
    
    [NotifySetting regiestNotification];
    

}

- (void)initTabBarController
{
    //初始化tabbar 和 navbar
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.delegate = self;
    
    [[UITabBar appearance] setTintColor:navbar_titletext_color];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:navbar_titletext_color forKey:NSForegroundColorAttributeName]];
    
    NSArray *vcNameArrays = @[@"ViewController",@"TableViewController",@"ViewController",@"ViewController",@"ViewController"];
    NSArray *tabTitleArray = @[@"首页",@"发现",@"秀客",@"分类",@"我的"];
    NSArray *norImageArray = @[@"tabbar-home-nor",@"tabbar-sale-nor",@"tabbar-showke-nor",@"tabbar-search-nor",@"tabbar-my-nor"];
    NSArray *selImageArray = @[@"tabbar-home-foc",@"tabbar-sale-foc",@"tabbar-showke-foc",@"tabbar-search-foc",@"tabbar-my-foc"];
    
    NSMutableArray *viewControllersArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < tabTitleArray.count ; i ++) {
        UINavigationController *navController = [self tabNavItem:vcNameArrays[i] title:tabTitleArray[i] normalImageName:norImageArray[i] selectedImageName:selImageArray[i]];
        [viewControllersArray addObject:navController];
    }
    self.tabBarController.viewControllers = viewControllersArray;
    
//    [self checkIsNeedToUpdateTabbarIcon];
}
#pragma mark - 初始化TabBar和NavBar

- (UINavigationController *)tabNavItem:(NSString *)viewControllerName
                                 title:(NSString *)title
                       normalImageName:(NSString *)normalImageName
                     selectedImageName:(NSString *)selectedImageName
{
    Class vcClass = NSClassFromString(viewControllerName);
    UIViewController *viewController = [[vcClass alloc] init];
    
    //自定义导航控制器 把该控制器作为根视图控制器
    CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:viewController];
    
    //导航条不透明
    navController.navigationBar.translucent = NO;
    
    //导航条样式：默认
    navController.navigationBar.barStyle = UIBarStyleDefault;
    
    UIImage *normalImage = [[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    
    navController.tabBarItem = tabBarItem;
    
    return navController;
}

// 此方法是 用户点击了通知，应用在前台 或者开启后台并且应用在后台 时调起
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    // 打印到日志 textView 中
    
    NSLog(@"********** iOS7.0之后 background **********");
    //杀死状态下，直接跳转到跳转页面。
    if (application.applicationState == UIApplicationStateInactive)
    {
;
        NSLog(@"applacation is unactive ===== %@",userInfo);
        /*
         // 根视图是普通的viewctr 用present跳转
         [_tabBarCtr.selectedViewController presentViewController:skipCtr animated:YES completion:nil]; */
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"收到消息" message:userInfo[@"aps"][@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    // 应用在后台。当后台设置aps字段里的 content-available 值为 1 并开启远程通知激活应用的选项
    if (application.applicationState == UIApplicationStateBackground) {
        NSLog(@"background is Activated Application ");
        // 此处可以选择激活应用提前下载邮件图片等内容。
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"收到一条消息" message:userInfo[@"aps"][@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    
}

// 在 iOS8 系统中，还需要添加这个方法。通过新的 API 注册推送服务
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    
    [application registerForRemoteNotifications];
    
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"test:%@",deviceToken);
    [BPush registerDeviceToken:deviceToken];
    [BPush bindChannelWithCompleteHandler:^(id result, NSError *error) {

        // 需要在绑定成功后进行 settag listtag deletetag unbind 操作否则会失败
        // 网络错误
        if (error) {
            return ;
        }
        if (result) {
            // 确认绑定成功
            if ([result[@"error_code"]intValue]!=0) {
                return;
            }
            [BPush setTag:@"Mytag" withCompleteHandler:^(id result, NSError *error) {
                if (result) {
                    NSLog(@"设置tag成功");
                }
            }];
        }
    }];
    
 
    
    
}

// 当 DeviceToken 获取失败时，系统会回调此方法
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"DeviceToken 获取失败，原因：%@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // App 收到推送的通知
    [BPush handleNotification:userInfo];
    NSLog(@"********** ios7.0之前 **********");
    // 应用在前台 或者后台开启状态下，不跳转页面，让用户选择。
    if (application.applicationState == UIApplicationStateActive || application.applicationState == UIApplicationStateBackground) {
        NSLog(@"acitve or background");
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"收到一条消息" message:userInfo[@"aps"][@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    else//杀死状态下，直接跳转到跳转页面。
    {

    }
    
    
    NSLog(@"%@",userInfo);
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"接收本地通知啦！！！");
    [BPush showLocalNotificationAtFront:notification identifierKey:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


#pragma mark 应用即将被杀死

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self removeURLCache];
}

#pragma mark 支付宝微信回调

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    NSString *scheme = [url scheme];

    if([scheme isEqualToString:ALIPAY_PAY_SCHEME]){
        [self alipayProcessPayResult:url];
    }
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    NSString *scheme = [url scheme];
    
    if([scheme isEqualToString:ALIPAY_PAY_SCHEME]){
        [self alipayProcessPayResult:url];
    }

        return YES;
}

#pragma mark - 处理支付宝支付结果
-(void)alipayProcessPayResult:(NSURL *)url{
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            [[AlipayExtension instance]handlePayResult:resultDic];
        }];
    }
}



- (void)removeURLCache
{
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
}


@end
