//
//  Utils.m
//  WineStore
//
//  Created by hexiao on 13-9-5.
//  Copyright (c) 2013年 hexiao. All rights reserved.
//

#import "DisplayUtils.h"
#import "MBProgressHUD.h"
#import "BaseViewController.h"

#import "LPPopup.h"

@interface DisplayUtils()

@property (nonatomic,strong) LPPopup *hud;

@end


@implementation DisplayUtils
@synthesize hud;

+ (DisplayUtils*)sharedView {
    static dispatch_once_t once;
    static DisplayUtils *sharedView;
    dispatch_once(&once, ^ { sharedView = [[DisplayUtils alloc] init]; });
    return sharedView;
}

/**
 * 显示文本
 * \param image 原始图
 * \param reSize 图片尺寸
 * \return 改变尺寸后的图
 */
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

/**
 * 显示文本
 * \param title 文本
 * \param viewController 视图
 */
+ (void)alert:(NSString*)title viewController:(BaseViewController*)viewController
{
//    if(![viewController isKindOfClass:[UIViewController class]])
//        return ;
    if (title.length == 0) {
        return ;
    }
    DisplayUtils *displayUtils = [DisplayUtils sharedView];
    [displayUtils.hud removeFromSuperview];
    displayUtils.hud = [LPPopup popupWithText:title];
    displayUtils.hud.popupColor = BlackCustomColor;

//    CGRect hudFrame = displayUtils.hud.frame;
    CGPoint center = viewController.view?viewController.view.center:[[[UIApplication sharedApplication] delegate] window].center;
    if ([viewController isKindOfClass:[BaseViewController class]] && [viewController keyboardIsVisible]){
        center.y +=10;
    }else
        center.y += 150;
    
    if(viewController.view)
    {
        [viewController.view bringSubviewToFront:displayUtils.hud];
    }
    [displayUtils.hud showInView:viewController.view?viewController.view:[DisplayUtils getTopWindow]
                   centerAtPoint:center duration:1 completion:nil];
}

+ (UIWindow *)getTopWindow{
    UIWindow *topWindow = [[UIApplication sharedApplication].windows lastObject];
    return topWindow;
}

//显示文本在window上
+ (void)alert:(NSString *)title
{
    [DisplayUtils alert:title viewController:nil];
}

//+ (void)alert:(NSString*)title view:(UIView *)view
//{
//    DisplayUtils *displayUtils = [DisplayUtils sharedView];
//    [displayUtils.hud removeFromSuperview];
//    displayUtils.hud = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
//    // Configure for text only and offset down
//    displayUtils.hud.mode = MBProgressHUDModeText;
//    displayUtils.hud.labelText = title;
//    displayUtils.hud.margin = 10.f;
//    
//    if ([viewController isKindOfClass:[BaseViewController class]] && [viewController keyboardIsVisible]) {
//        displayUtils.hud.yOffset = 10.f;
//    }else{
//        displayUtils.hud.yOffset = 150.f;
//    }
//    displayUtils.hud.removeFromSuperViewOnHide = YES;
//    [displayUtils.hud hide:YES afterDelay:1];
//}

@end
