//
//  AnimationUtil.h
//  jotaoneTest
//
//  Created by jota on 16/6/3.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationUtil : NSObject

+ (void)labelAnimationWithLabel:(UILabel *)theLabel withView:(UIView *)theView;
+ (void)bottomLineAnimationWithConstrint:(NSLayoutConstraint *)constrint withView:(UIView *)view;
+ (void)iconViewAnimationWithLabel:(UIImageView *)theIcon withView:(UIView *)theView;
+ (void)tipsMaskAnimationWithView:(UIView *)view beginTime:(NSTimeInterval)beginTime;
+ (void)buttonAnimationWithButton:(UIButton *)button view:(UIView *)view progress:(CGFloat)progress;

@end
