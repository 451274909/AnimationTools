//
//  AnimationUtil.m
//  jotaoneTest
//
//  Created by jota on 16/6/3.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "AnimationUtil.h"

static CGFloat const kBottomLineWidth = 200.0;

@implementation AnimationUtil

+ (void)labelAnimationWithLabel:(UILabel *)theLabel withView:(UIView *)theView {

    [UIView animateWithDuration:1.5 animations:^{
        theLabel.transform = CGAffineTransformIdentity;
    }];
}

+ (void)bottomLineAnimationWithConstrint:(NSLayoutConstraint *)constrint withView:(UIView *)view {
    
    constrint.constant = kBottomLineWidth;
    [UIView animateWithDuration:1.5 animations:^{
        [view layoutIfNeeded];
    }];
}

+ (void)iconViewAnimationWithLabel:(UIImageView *)theIcon withView:(UIView *)theView {
    
    [UIView animateWithDuration:1.5 animations:^{
        theIcon.transform = CGAffineTransformIdentity;
    }];
}

+ (void)buttonAnimationWithButton:(UIButton *)button view:(UIView *)view progress:(CGFloat)progress {

    static CAShapeLayer *layer = nil;
    if (button.layer.mask == nil) {
        layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds) * progress, CGRectGetHeight(button.bounds))].CGPath;
        layer.fillColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
        button.layer.mask = layer;
    } else {
        CGPathRef path = (__bridge CGPathRef)([UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds) * progress, CGRectGetHeight(button.bounds))]);
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.duration = 0.25;
        animation.fromValue = (__bridge id _Nullable)(layer.path);
        animation.toValue = (__bridge id _Nullable)(path);
        animation.removedOnCompletion = YES;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
        layer.path = path;
    }
}

+ (void)tipsMaskAnimationWithView:(UIView *)view beginTime:(NSTimeInterval)beginTime {
    
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(view.bounds))].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds))].CGPath;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    view.layer.mask = layer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (__bridge id _Nullable)(layer.path);
    animation.toValue = (__bridge id _Nullable)(endPath);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];
}

@end
