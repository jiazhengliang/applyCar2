//
//  LargeCategeCell.h
//  ZouShow
//
//  Created by Yingbo on 15/10/17.
//
//

#import <UIKit/UIKit.h>
@class AdvVo;

#define BIG_IMAGE_HEIGHT 150//图片展示高度

@protocol LargeCategeClickDelegate <NSObject>

- (void)largeCategeClickAction:(NSInteger)section;

@end

@interface LargeCategeCell : UIView

@property(nonatomic,strong) AdvVo *modelAdv;

@property(nonatomic,assign) BOOL extended;//展开状态 YES - 展开  NO 合上

@property(nonatomic,assign) NSInteger index; //索引 

@property(nonatomic,assign) id<LargeCategeClickDelegate> delegate;

@end
