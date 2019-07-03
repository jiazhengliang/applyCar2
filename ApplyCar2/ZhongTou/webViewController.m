//
//  webViewController.m
//  ZhongTou
//
//  Created by Jone on 2017/11/16.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "webViewController.h"

#import "MineManager.h"
@interface webViewController ()<UIWebViewDelegate>
{
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicator;
}


@end

@implementation webViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigtionBar];
    // Do any additional setup after loading the view.
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    [webView loadRequest:request];
    
}

-(void)getData{
    
}


-(void)initNavigtionBar
{
    self.title = self.headerTitle;
    self.barView.backgroundColor = navigationBarColor;
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    buttonBack.exclusiveTouch = YES;
    [buttonBack addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self setNavigationBarLeftButton:buttonBack];
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getQuerylistSignStatue
{
    MineManager *manager = [MineManager new];
        __weak __typeof(self)weakSelf = self;
    NSDictionary *param = @{
                            @"id":self.hetongID?self.hetongID:@""
                            };
    [manager QueryListSignStatue:param Block:^(NSDictionary *dictionary, NSError *error) {
        [weakSelf backClick];
        
        NSLog(@"getQuerylistSignStatue==%@",dictionary);
        if ([weakSelf.delegate respondsToSelector:@selector(webViewSignDelegateResult:)]){
            [weakSelf.delegate webViewSignDelegateResult:[NSString stringWithFormat:@"%@",dictionary[@"result"]]];
        }
    }];
    
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@",webView.request.URL];
    
    if ([self.type isEqualToString:@"2"]) {
        if ([urlString hasPrefix:@"http://sandbox.junziqian.com/login/proxylogin"]||[urlString hasPrefix:@"http://i.sandbox.junziqian.com/login/proxylogin"]) {
            [self getQuerylistSignStatue];
        }
    }

    //创建UIActivityIndicatorView背底半透明View
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    [view setTag:108];
    [view setBackgroundColor:[UIColor blackColor]];
    //    [view setBackgroundColor:[UIColor whiteColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    [activityIndicator setCenter:view.center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    dispatch_async(dispatch_get_main_queue(), ^{
        [view addSubview:activityIndicator];
    });
    [activityIndicator startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [activityIndicator stopAnimating];
    UIView *view = (UIView *)[self.view viewWithTag:108];
    [view removeFromSuperview];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [activityIndicator stopAnimating];
    UIView *view = (UIView *)[self.view viewWithTag:108];
    [view removeFromSuperview];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
