//
//  ViewController.m
//  MCProgressBarView
//
//  Created by Baglan on 12/29/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "MCProgressBarView.h"

@interface ViewController ()

@end

@implementation ViewController {
    MCProgressBarView * _progressBarView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    UIImage * backgroundImage = [[UIImage imageNamed:@"progress-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    UIImage * foregroundImage = [[UIImage imageNamed:@"progress-fg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    _progressBarView = [[MCProgressBarView alloc] initWithFrame:CGRectMake(25, 100, 270, 20)
                                                backgroundImage:backgroundImage
                                                foregroundImage:foregroundImage];
    [self.view addSubview:_progressBarView];
    
    _progressBarView.progress = 0.25;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
