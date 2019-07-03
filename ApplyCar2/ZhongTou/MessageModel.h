//
//  MessageModel.h
//  ZhongTou
//
//  Created by Jone on 2017/10/26.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(nonatomic,copy) NSString *messaId;//: 1,

@property(nonatomic,copy) NSString *sendId;//: 1,

@property(nonatomic,copy) NSString *receiveId;//: 1,

//"sendName": "1",
//
//"receivePhone": "15910000001",

@property(nonatomic,copy) NSString *messageContentId;//": 1,

@property(nonatomic,assign) BOOL status;//: "0",

@property(nonatomic,copy) NSString *createTime;//": "2017-10-24 10:46:44",
//
//"lookTime": null,
//
//"messageStatus": "",
//
//"readStatus": null,
//
//"updateTime": null,
//
//"flag": null,
//
//"deptId": null,
//
//"operatorName": null,

@property(nonatomic,copy) NSString *messageContent;//: null
@end
