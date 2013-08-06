//
//  MCProgressBarView.m
//  MCProgressBarView
//
//  Created by Baglan on 12/29/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "MCProgressBarView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MCProgressBarView {
    UIImageView * _backgroundImageView;
    UIImageView * _foregroundImageView;
    CGFloat _minimumForegroundWidth;
    CGFloat _availableWidth;
    CALayer * _maskLayer;
}

- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage foregroundImage:(UIImage *)foregroundImage
{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.image = backgroundImage;
        [self addSubview:_backgroundImageView];
        
        _foregroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _foregroundImageView.image = foregroundImage;
        [self addSubview:_foregroundImageView];
        
        _maskLayer = [CALayer layer];
        _maskLayer.contents = (id)[self generateMaskImageFromImage:foregroundImage forSize:frame.size].CGImage;
        _maskLayer.frame = (CGRect){CGPointZero, frame.size};
        _foregroundImageView.layer.mask = _maskLayer;
        
        UIEdgeInsets capInsets = foregroundImage.capInsets;
        self.offsetForZero = capInsets.left + capInsets.right;
        self.progress = 0.5;
    }
    return self;
}

- (UIImage *)generateMaskImageFromImage:(UIImage *)image forSize:(CGSize)size
{
    CGFloat scale = image.scale;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    UIImage *outImage = [UIImage imageWithCGImage:cgImage scale:scale orientation:UIImageOrientationUp];
    
    CGImageRelease(cgImage);
    UIGraphicsEndImageContext();
    
    return outImage;
}

- (void)setOffsetForZero:(CGFloat)offsetForZero
{
    _offsetForZero = offsetForZero;
    self.progress = self.progress;
}

- (void)setProgress:(double)progress
{
    _progress = progress;
    CGRect frame = _maskLayer.frame;
    frame.origin.x = (frame.size.width - _offsetForZero) * (_progress - 1.0);
    _maskLayer.frame = frame;
}

@end