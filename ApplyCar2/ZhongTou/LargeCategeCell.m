//
//  LargeCategeCell.m
//  ZouShow
//
//  Created by Yingbo on 15/10/17.
//
//

#import "LargeCategeCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+JKPicker.h"
#define MARGIN 12
#import "NSArray+Check.h"

@interface LargeCategeCell()

@property(nonatomic,strong) UIImageView *imgLargeCatege ;

@property(nonatomic,strong) UILabel   *nameLab;
@property(nonatomic,strong) UILabel   *englishNameaLab;

@property(nonatomic,strong) UIView *coverView;//遮盖层

@property(nonatomic,strong) UIButton *clearBtn;

@property(nonatomic, assign) CGFloat parallaxRatio;

@property (nonatomic, strong) UIScrollView *parentScrollView;

@end

@implementation LargeCategeCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.parallaxRatio = 1.7;
        self.clipsToBounds = YES;
        
        _imgLargeCatege = [[UIImageView alloc]init];
        _imgLargeCatege.frame = CGRectMake(0, 0, screen_width, BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6);
        _imgLargeCatege.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_imgLargeCatege];
        
        _coverView = [[UIView alloc]init];
        _coverView.frame = CGRectMake(0, 0, screen_width, BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6);
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.4;
        [self addSubview:_coverView];
        
        _englishNameaLab = [[UILabel alloc]init];
        _englishNameaLab.frame = CGRectMake(MARGIN, (BIG_IMAGE_HEIGHT*SCREEN_RATIO_IPHONE6-38)/2.0, screen_width-2*MARGIN, 38);
        _englishNameaLab.textColor = [UIColor whiteColor];
        _englishNameaLab.backgroundColor = [UIColor clearColor];
        _englishNameaLab.font = [UIFont fontWithName:@"PingFangSC-Thin" size:31.0f];
        _englishNameaLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_englishNameaLab];
        //文字有投影效果
        _englishNameaLab.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _englishNameaLab.shadowOffset = CGSizeMake(1, 1);
        
        _nameLab = [[UILabel alloc]init];
        _nameLab.frame = CGRectMake(MARGIN, _englishNameaLab.bottom+2, screen_width-2*MARGIN, 16);
        _nameLab.textColor = [UIColor whiteColor];
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.font = [UIFont systemFontOfSize:15.0f];
        [self addSubview:_nameLab];
        //文字有投影效果
        _nameLab.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _nameLab.shadowOffset = CGSizeMake(1, 1);
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickEvent)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)setModelAdv:(AdvVo *)modelAdv
{
    _modelAdv = modelAdv;
    // [UIImage imageNamed:@"loadClassfiy"]
    _imgLargeCatege.backgroundColor =  HexRGBAlpha(0xf0f0f3,1) //RGBColor(240,240,243)
;
//    [_imgLargeCatege sd_setImageWithURL:[NSURL URLWithString:modelAdv.picPath] placeholderImage:nil];
//    
//    NSArray *array = [modelAdv.title componentsSeparatedByString:@","];
//    NSString *enName = [array objectAtIndexWithCheck:1];
//    NSString *chName = [array objectAtIndexWithCheck:0];
//    _nameLab.text = chName?chName:@"";
//    _englishNameaLab.text = enName?enName:@"";
}

- (void)setDelegate:(id<LargeCategeClickDelegate>)delegate
{
    _delegate = delegate;
}

- (void)clickEvent
{
    if (_delegate && [_delegate respondsToSelector:@selector(largeCategeClickAction:)]) {
        [_delegate largeCategeClickAction:_index];
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self safeRemoveObserver];
    UIView *v = newSuperview;
    while (v) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            self.parentScrollView = (UIScrollView *)v;
            break;
        }
        v = v.superview;
    }
    [self safeAddObserver];
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    [self safeRemoveObserver];
}

- (void)safeAddObserver {
    if (self.parentScrollView) {
        @try {
            [self.parentScrollView
             addObserver:self
             forKeyPath:@"contentOffset"
             options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
             context:nil];
        } @catch (NSException *exception) {
        }
    }
}

- (void)safeRemoveObserver {
    if (self.parentScrollView) {
        @try {
            [self.parentScrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
        } @catch (NSException *exception) {
        } @finally {
            self.parentScrollView = nil;
        }
    }
   }

- (void)dealloc {
    [self safeRemoveObserver];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.parallaxRatio = self.parallaxRatio;
}

- (void)setParallaxRatio:(CGFloat)parallaxRatio
{
    _parallaxRatio = MAX(parallaxRatio, 1.0f);
    _parallaxRatio = MIN(parallaxRatio, 2.0f);
    
    CGRect rect = self.bounds;
    rect.size.height = rect.size.height * parallaxRatio;
    self.imgLargeCatege.frame = rect;
    
    [self updateParallaxOffset];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        if (self.parallaxRatio == 1.0f) {
            return;
        }
        
        [self updateParallaxOffset];
    }
}

- (void)updateParallaxOffset
{
    CGFloat contentOffset = self.parentScrollView.contentOffset.y;
    CGFloat cellOffset = self.frame.origin.y - contentOffset;
    CGFloat percent = (cellOffset + self.frame.size.height) /
    (self.parentScrollView.frame.size.height + self.frame.size.height);
    CGFloat extraHeight = self.frame.size.height * (self.parallaxRatio - 1.0f);
    CGRect rect = self.imgLargeCatege.frame;
    rect.origin.y = -extraHeight * percent;
    self.imgLargeCatege.frame = rect;
    NSLog(@"rect===%@",self.imgLargeCatege);
    //NSLog(@"第%ld张图 frame= %@", (long)self.index, NSStringFromCGRect(rect));
    //NSLog(@"contentOffset = %f, cellOffset = %f, percent= %f, extraHeight = %f", contentOffset, cellOffset , percent, extraHeight);
}

@end
