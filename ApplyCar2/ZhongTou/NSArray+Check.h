//
//  NSArray+Check.h
//  Zoshow
//
//  Created by Bob on 15-4-8.
//  Copyright (c) 2015年 Xiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Check)

/**
 *  通过数组索引获取对象，同时会规避数组为空、索引越界等异常。
 *
 *  @param index 数组索引
 *
 *  @return 返回数组索引位置处的对象。
 */
- (id)objectAtIndexWithCheck:(NSUInteger)index;

+(NSArray *)sortedArrayUsing:(NSMutableArray *)tempArray;


@end
