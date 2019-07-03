//
//  Macro.h
//  ZhongTou
//
//  Created by Jone on 2017/10/23.
//  Copyright © 2017年 Jone. All rights reserved.
//

#ifndef Macro_h
#define Macro_h
#import "DisplayUtils.h"
#import "SVProgressHUD.h"
#import "NSArray+Check.h"
#import "NSArray+Log.h"
#import "AFAppDotNetAPIClient.h"

/*背景颜色
 蓝色：#5677fc
 白色：#ffffff
 背景颜色：#f5f5f5
 a/4：是除法，求的是商
 a％4：叫做模运算，求的是余，
 比如(int)13/4，结果是3；而13%4，结果就是1（余1）
 */
#define BackGroundBlueColor    HexRGBAlpha(0x5677fc,1)

#define BackGroundWhileColor    HexRGBAlpha(0xffffff,1)

#define BackGroundColor    HexRGBAlpha(0xf5f5f5,1)

#define BackGroundBlackColor    HexRGBAlpha(0x060608,0.6)

//字体颜色：

//蓝色：#5677fc
#define TitleBlueColor    HexRGBAlpha(0x5677fc,1)

//白色：#ffffff
#define TitleWhileColor    BackGroundWhileColor

//浅浅灰：#747272
#define TitleLightGrayColor    HexRGBAlpha(0x747272,1)

//浅灰：#2d2b2b
#define TitleGrayColor    HexRGBAlpha(0x2d2b2b,1)

//深灰：#0a0909
#define TitleDaryGrayColor    HexRGBAlpha(0xa0909,1)


//字体大小:
//ios:

//31px
#define FondTitle31PX   15.5

//29px
#define FondTitle29PX   14.5

//27px
#define FondTitle27PX   13.5

//24px*/
#define FondTitle24PX   12

#define BlackCustomColor    HexRGBAlpha(0x464646,1)
#define labelLightBlackColor    HexRGBAlpha(0xb5babc,1)
#define broderLineColor    HexRGBAlpha(0xebebeb,1)
#define labelBlackColor    HexRGBAlpha(0x616161,1)
#define numberColor    HexRGBAlpha(0x5677fc,1)
#define titleHightColor    HexRGBAlpha(0x5677fc,1)
#define titleNomalColor    HexRGBAlpha(0x8a8a8a,1)

#define labelInformationColor    HexRGBAlpha(0x333333,1)
#define labelInformationLightColor    HexRGBAlpha(0x5f5d5d,1)
#endif /* Macro_h */
