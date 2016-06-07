//
//  ViewController.m
//  jotaoneTest
//
//  Created by jota on 16/6/3.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ViewController.h"
#import "AnimationUtil.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *upLabel;
@property (weak, nonatomic) IBOutlet UILabel *downLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineConstraint;
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _upLabel.transform =  CGAffineTransformMakeTranslation(0, -200);
    _downLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _iconView.transform = CGAffineTransformMakeTranslation(-200, 0);
    _bottomLineConstraint.constant = 0;
    _tf.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [AnimationUtil labelAnimationWithLabel:_upLabel withView:self.view];
    [AnimationUtil labelAnimationWithLabel:_downLabel withView:self.view];
    [AnimationUtil iconViewAnimationWithLabel:_iconView withView:self.view];
    [AnimationUtil bottomLineAnimationWithConstrint:_bottomLineConstraint withView:self.view];
//    [AnimationUtil buttonAnimationWithButton:_loginButton view:self.view progress:0];
    [AnimationUtil tipsMaskAnimationWithView:_topTipsLabel beginTime:0];
    [AnimationUtil tipsMaskAnimationWithView:_bottomView beginTime:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
//    if (_tf.text.length == 11) {
//        _loginButton.userInteractionEnabled = YES;
//    } else {
//        _loginButton.userInteractionEnabled = NO;
//    }
//    CGFloat progress = _tf.text.length / 11.0;
//    [AnimationUtil buttonAnimationWithButton:_loginButton view:self.view progress:progress];
    
    return YES;
}


#pragma mark - override view method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
