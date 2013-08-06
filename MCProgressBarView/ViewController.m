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

@implementation ViewController

- (void)addProgressBarAtRect:(CGRect)rect taperOff:(BOOL)taperOff progress:(double)progress
{
    UIImage * backgroundImage = [[UIImage imageNamed:@"progress-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    UIImage * foregroundImage = [[UIImage imageNamed:@"progress-fg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    
    MCProgressBarView * progressBarView = [[MCProgressBarView alloc] initWithFrame:rect
                                                 backgroundImage:backgroundImage
                                                 foregroundImage:foregroundImage];

    if (taperOff) {
        progressBarView.offsetForZero = 10.0;
    }
    progressBarView.progress = progress;
    
    [self.view addSubview:progressBarView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self addProgressBarAtRect:CGRectMake(60, 110, 240, 20) taperOff:NO progress:0.0];
    [self addProgressBarAtRect:CGRectMake(60, 135, 240, 20) taperOff:NO progress:0.02];
    [self addProgressBarAtRect:CGRectMake(60, 160, 240, 20) taperOff:NO progress:0.5];
    [self addProgressBarAtRect:CGRectMake(60, 185, 240, 20) taperOff:NO progress:0.98];
    [self addProgressBarAtRect:CGRectMake(60, 210, 240, 20) taperOff:NO progress:1.0];
    
    [self addProgressBarAtRect:CGRectMake(60, 280, 240, 20) taperOff:YES progress:0.0];
    [self addProgressBarAtRect:CGRectMake(60, 305, 240, 20) taperOff:YES progress:0.02];
    [self addProgressBarAtRect:CGRectMake(60, 330, 240, 20) taperOff:YES progress:0.5];
    [self addProgressBarAtRect:CGRectMake(60, 355, 240, 20) taperOff:YES progress:0.98];
    [self addProgressBarAtRect:CGRectMake(60, 380, 240, 20) taperOff:YES progress:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
