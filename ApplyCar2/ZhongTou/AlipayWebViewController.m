////
////  AlipayWebViewController.m
////  ZouShow
////
////  Created by hexiao on 14-5-9.
////
////
//
//#import "AlipayWebViewController.h"
//#import "SVProgressHUD.h"
//
//@interface AlipayWebViewController ()<WKNavigationDelegate>
//
//@property (nonatomic,strong) XWebView *wv;
//@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;
//
//@end
//
//@implementation AlipayWebViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//        self.title=@"支付";
//        /** 返回 */
//        UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 25)];
//        buttonBack.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 20);
//        [buttonBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        [buttonBack setImage:[UIImage imageNamed:@"nav-back-nor"] forState:UIControlStateNormal];
//    [buttonBack setImage:[UIImage imageNamed:@"nav-back-foc"] forState:UIControlStateHighlighted];
//        UIBarButtonItem *itemBack=[[UIBarButtonItem alloc]initWithCustomView:buttonBack];
//        self.navigationItem.leftBarButtonItem=itemBack;
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    _wv=[[XWebView alloc]initByDefaultConfigWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
//    _wv.navigationDelegate=self;
//    //_wv.scalesPageToFit = YES;
//    [self.view addSubview:_wv];
//    NSURL *url=[NSURL URLWithString:_payUrl];
//    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
//   
//    [_wv loadRequest:request];
////    //webview 不本地缓存
////    CustomURLCache *urlCache = (CustomURLCache *)[NSURLCache sharedURLCache];
////    [urlCache removeCachedResponseForRequest:request];
//
//    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
//    
//    _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(130, screen_height/2-30, 60, 60)];
//    _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
//    _activityIndicator.hidesWhenStopped = YES;
//    _activityIndicator.color = [UIColor grayColor];
//    [_activityIndicator startAnimating];
//    [_wv addSubview:_activityIndicator];
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    //GA 流量跟踪
//    self.screenName = @"AlipayWebViewController";
//    //umeng流量跟踪
//    [MobClick beginLogPageView:@"AlipayWebViewController"];
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    //umeng流量跟踪
//    [MobClick endLogPageView:@"AlipayWebViewController"];
//}
//
//#pragma mark - WKNavigationDelegate
//
////针对一次action来决定是否允许跳转，允许与否都需要调用decisionHandler，比如decisionHandler(WKNavigationActionPolicyCancel);
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
//{
//    NSString *call_back_url=[NSString stringWithFormat:@"%@/order/paySuccess.html",HOST_M_XIU];
//    NSString *stringUrl=webView.URL.absoluteString;
//    NSRange range=[stringUrl rangeOfString:call_back_url];
//    if (range.length!=0) {
//        [self paySuccess];
//        decisionHandler(WKNavigationActionPolicyCancel);
//    }else {
//        decisionHandler(WKNavigationActionPolicyAllow);
//    }
//}
//
////开始加载，对应UIWebView的- (void)webViewDidStartLoad:(UIWebView *)webView;
//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
//{
//    [_activityIndicator startAnimating];
//}
//
////加载成功，对应UIWebView的- (void)webViewDidFinishLoad:(UIWebView *)webView;
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
//{
//    [_activityIndicator stopAnimating];
//}
//
////页面加载失败或者跳转失败，对应UIWebView的- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
//- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
//{
//    [_wv stopLoading];
//}
//
//- (void)paySuccess
//{
//    [self.navigationController popViewControllerAnimated:NO];
//    if (_delegate && [_delegate respondsToSelector:@selector(payFail)]) {
//        [_delegate paySuccess];
//    }
//}
//
//-(void)back
//{
//    [self.navigationController popViewControllerAnimated:NO];
//    if (_delegate && [_delegate respondsToSelector:@selector(payFail)]) {
//        [_delegate payFail];
//    }
//}
//
//@end
