//
//  LineApplyZhengXCell.m
//  ZhongTou
//  征信cell
//  Created by Jone on 2017/10/30.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "LineApplyZhengXCell.h"
    // 竖间距
@interface LineApplyZhengXCell()<HXPhotoViewDelegate>
@end
@implementation LineApplyZhengXCell

- (HXPhotoManager *)oneManager {
    if (!_oneManager) {
        _oneManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _oneManager.photoMaxNum = 15;

        
    }
    return _oneManager;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.contentView.backgroundColor = [UIColor whiteColor];
        
        
//        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,screen_width, 150*KWIDTH)];
//        self.scrollView.alwaysBounceVertical = YES;
//        self.scrollView.backgroundColor = [UIColor greenColor];
//        [self.contentView addSubview:self.scrollView];
        self.array = [NSMutableArray array];
        self.onePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(kPhotoViewMargin, kPhotoViewMargin, screen_width - kPhotoViewMargin * 2, 0) WithManager:self.oneManager];
        self.onePhotoView.delegate = self;
        [self.contentView addSubview:self.onePhotoView];

    }
    return self;
}


- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    NSSLog(@"onePhotoView - %@",allList);
    [self.array removeAllObjects];
    
    
//    for (int i = 0; i < allList.count; i++) {
//        
//        [self.array addObject:model.thumbPhoto];
//        
//    }
    for (int i = 0; i < allList.count; i++){
        HXPhotoModel *otoModel = allList[i];
        [self.array addObject:otoModel.thumbPhoto];
        NSLog(@"%@",otoModel.thumbPhoto);
    }
     if ([_delegate respondsToSelector:@selector(didSelectedZhengxingDelegateArray:)])
     {
        
         [_delegate didSelectedZhengxingDelegateArray:self.array];

     }
    
    NSLog(@"array=%@",_array);
   // [_delegate didSelectedZhengxingDelegate:_index number:200 array:_array];
}

- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    
    NSLog(@"点击了图片");
    if ([_delegate respondsToSelector:@selector(didSelectedZhengxingDelegate:number:array:)]){
    [_delegate didSelectedZhengxingDelegate:frame.size.height+kPhotoViewMargin*2 number:200 array:_array];

    }


}


-(void)fillCellWithModel:(NSMutableArray *)array
{

    if (self.array.count) {
        NSInteger index = (self.array.count + 1) % 3;//余数
        NSInteger page = (self.array.count + 1) / 3;//商
        CGFloat margin=(screen_width-3*appvieww)/(3+1);
        
        CGFloat appviewy=margin+(margin+appviewh)*page;
       
        if (index>0) {

            self.onePhotoView.frame = CGRectMake(kPhotoViewMargin, kPhotoViewMargin, self.contentView.frame.size.width - kPhotoViewMargin * 2, appviewy+appviewh+margin);
        } else
        {
            self.onePhotoView.frame = CGRectMake(kPhotoViewMargin, kPhotoViewMargin, self.contentView.frame.size.width - kPhotoViewMargin * 2, appviewy);
        }
   }

}
//-(void)fillCellWithModel:(NSMutableArray *)array
//{
//    int totalloc=3;
//
//    for (UIView* subView in self.contentView.subviews)
//    {
//        [subView removeFromSuperview];
//    }
//    CGFloat margin=(screen_width-totalloc*appvieww)/(totalloc+1);
//
//    int count = (int)array.count;
//    for (int i=0 ; i<count; i++) {
//        int row=i/totalloc;//行号
//              //1/3=0,2/3=0,3/3=1;
//        int loc=i%totalloc;//列号
//        
//        CGFloat appviewx=margin+(margin+appvieww)*loc;
//        CGFloat appviewy=margin+(margin+appviewh)*row;
//        //创建uiview控件
//        UIView *appview=[[UIView alloc]initWithFrame:CGRectMake(appviewx, appviewy, appvieww, appviewh)];
//        [self.contentView addSubview:appview];
//        //创建uiview控件中的子视图
//        UIImageView *appimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, appvieww, appviewh-20*KWIDTH)];
//        appimageview.image=array[i];
//        [appimageview setContentMode:UIViewContentModeScaleAspectFit];
//        [appview addSubview:appimageview];
//       //创建文本标签
//        UILabel *applable=[[UILabel alloc]initWithFrame:CGRectMake(0, appviewh-20, appvieww, 20*KWIDTH)];
//        [applable setText:[NSString stringWithFormat:@"图片%d",i+1]];
//        [applable setTextAlignment:NSTextAlignmentCenter];
//        [applable setFont:[UIFont systemFontOfSize:12.0]];
//        [appview addSubview:applable];
//    
//             //创建按钮
//        UIButton *appbtn=[UIButton buttonWithType:UIButtonTypeCustom];
//        appbtn.frame= CGRectMake(0, 0, appvieww, appviewh);
//        appbtn.tag = i +100;
//        [appbtn addTarget:self action:@selector(appBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//        [appview addSubview:appbtn];
//    } ;
//    
//        int row=count/totalloc;//行号
//        //1/3=0,2/3=0,3/3=1;
//        int loc=count%totalloc;//列号
//        
//        CGFloat appviewx=margin+(margin+appvieww)*loc;
//        CGFloat appviewy=margin+(margin+appviewh)*row;
//        //创建uiview控件
//        UIView *appview=[[UIView alloc]initWithFrame:CGRectMake(appviewx, appviewy, appvieww, appviewh)];
//        [appview setBackgroundColor:[UIColor whiteColor]];
//        [self.contentView addSubview:appview];
//             //创建按钮
//        UIButton *appbtn=[UIButton buttonWithType:UIButtonTypeCustom];
//        appbtn.frame= CGRectMake(0, 0, appvieww, appviewh);
//        [appbtn setImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
//        appbtn.tag = 200;
//        [appbtn addTarget:self action:@selector(appBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        appbtn.titleLabel.font=[UIFont systemFontOfSize:12.0];
//        [appview addSubview:appbtn];
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)appBtnClick:(UIButton*)btn
{
    NSLog(@"appBtnClick==%ld",btn.tag);
    
//    if ([_delegate respondsToSelector:@selector(didSelectedZhengxingDelegate:number:)]) {
//        switch (btn.tag) {
//            case 200:
//            {
//                [_delegate didSelectedZhengxingDelegate:_index number:200];
//                NSLog(@"点击了左键");
//            }
//                break;
//                
//                
//            default:
//            {
//                int num = (int)btn.tag - 100;
//                [_delegate didSelectedZhengxingDelegate:self.index number:num];
//                NSLog(@"点击了右键");
//            }
//                break;
//        }
//    }

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
