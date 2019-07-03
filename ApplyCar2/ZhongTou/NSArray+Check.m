//
//  NSArray+Check.m
//  Zoshow
//
//  Created by Bob on 15-4-8.
//  Copyright (c) 2015年 Xiu. All rights reserved.
//

#import "NSArray+Check.h"
#import <objc/runtime.h>

@implementation NSArray (Check)

//+(void)load
//{
//    SEL originalSelector = @selector(objectAtIndex:);
//    SEL swizzledSelector = @selector(objectAtIndexWithCheck2:);
//    Method originalMethod = class_getInstanceMethod(self, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
//    class_addMethod(self,
//                    originalSelector,
//                    class_getMethodImplementation(self, originalSelector),
//                    method_getTypeEncoding(originalMethod));
//    class_addMethod(self,
//                    swizzledSelector,
//                    class_getMethodImplementation(self, swizzledSelector),
//                    method_getTypeEncoding(swizzledMethod));
//    method_exchangeImplementations(originalMethod, swizzledMethod);
//}

/**
 *  通过数组索引获取对象，同时会规避数组为空、索引越界等异常。
 *
 *  @param index 数组索引
 *
 *  @return 返回数组索引位置处的对象。
 */
- (id)objectAtIndexWithCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

+(NSArray *)sortedArrayUsing:(NSMutableArray *)tempArray
{
    NSComparator finderSort = ^(id string1,id string2){
        
        if ([string1 integerValue] > [string2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }else if ([string1 integerValue] < [string2 integerValue]){
            return (NSComparisonResult)NSOrderedAscending;
        }
        else
            return (NSComparisonResult)NSOrderedSame;
    };
    
    //数组排序：
    NSArray *resultArray = [tempArray sortedArrayUsingComparator:finderSort];
    NSLog(@"第一种排序结果：%@",resultArray);
    return resultArray;
}
@end
