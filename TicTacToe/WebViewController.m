//
//  WebViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/16/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"I have loaded!");
    // Do any additional setup after loading the view.
    
    [self loadURLWithString:@"en.wikipedia.org/wiki/Tic-tac-toe"];
}


-(void)loadURLWithString:(NSString *)string
{
    NSURL* url = [NSURL URLWithString:string];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}


@end


