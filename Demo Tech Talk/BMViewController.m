//
//  BMViewController.m
//  Demo Tech Talk
//
//  Created by Dmitry Klimkin on 5/11/13.
//  Copyright (c) 2013 Dmitry Klimkin. All rights reserved.
//

#import "BMViewController.h"

@import AVFoundation;

#define LIKES_BUTTON_FRAME CGRectMake(0, 0, 43, 36)

@interface BMViewController ()

@property (nonatomic, strong) UIButton *heartButton;
    
@end

@implementation BMViewController

@synthesize heartButton = _heartButton;
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.heartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.heartButton.frame = LIKES_BUTTON_FRAME;
    self.heartButton.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    self.heartButton.backgroundColor = [UIColor clearColor];
    
    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"btn_like_white"] forState:UIControlStateNormal];
    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"btn_like_selected"] forState:UIControlStateSelected];
    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"btn_like_selected"] forState:UIControlStateHighlighted];

    [self.heartButton addTarget:self action:@selector(onLikeButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.heartButton setContentVerticalAlignment: UIControlContentVerticalAlignmentCenter];
    [self.heartButton setContentHorizontalAlignment: UIControlContentHorizontalAlignmentCenter];

    [self.view addSubview: self.heartButton];
}
    
- (void)onLikeButtonTap: (UIButton *)sender {
    [self simpleLikeAction];
    //[self expandingLikeAction];
    //[self bounceLikeAction];
    //[self bounceFadingLikeAction];
    //[self bounceFadingWithShakeLikeAction];
}
    
- (void)simpleLikeAction {
    self.heartButton.selected = !self.heartButton.selected;
}
    
- (void)expandingLikeAction {
    UIImageView *heartView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_like_selected"]];
    
    heartView.frame = LIKES_BUTTON_FRAME;
    
    heartView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [self.view addSubview: heartView];

    [UIView animateWithDuration:0.7
                          delay:0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         [heartView setTransform:(CGAffineTransformMakeScale(7, 7))];
                         heartView.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [heartView removeFromSuperview];
                     }];
    
    self.heartButton.selected = !self.heartButton.selected;
}

- (void)bounceLikeAction {
    UIImageView *heartView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_like_selected"]];
    
    heartView.frame = LIKES_BUTTON_FRAME;
    
    heartView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [self.view addSubview: heartView];
    
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [heartView setTransform:(CGAffineTransformMakeScale(2, 2))];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.1
                                               delay:0.0
                                             options: UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              [heartView setTransform:(CGAffineTransformMakeScale(1, 1))];
                                          }
                                          completion:^(BOOL finished) {
                                              [heartView removeFromSuperview];
                                          }];
                     }];
    
    self.heartButton.selected = !self.heartButton.selected;
}
    
- (void)bounceFadingLikeAction {
    
    UIImageView *heartView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_like_selected"]];
    
    heartView.frame = LIKES_BUTTON_FRAME;

    heartView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [self.view addSubview: heartView];
    
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [heartView setTransform:(CGAffineTransformMakeScale(4.5, 4.5))];
                         heartView.alpha = 0.1;
                     }
                     completion:^(BOOL finished){
                         
                         heartView.image = [UIImage imageNamed:@"btn_like_selected"];
                         
                         [UIView animateWithDuration:0.3
                                               delay:0.0
                                             options: UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              [heartView setTransform:(CGAffineTransformMakeScale(1.0, 1.0))];
                                              heartView.alpha = 1.0;
                                          }
                                          completion:^(BOOL finished){
                                              [heartView removeFromSuperview];
                                          }];
                     }];
    self.heartButton.selected = !self.heartButton.selected;
}

- (void)bounceFadingWithShakeLikeAction {
    
    UIImageView *heartView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_like_selected"]];
    
    heartView.frame = LIKES_BUTTON_FRAME;
    
    heartView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [self.view addSubview: heartView];
    
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [heartView setTransform:(CGAffineTransformMakeScale(4.5, 4.5))];
                         heartView.alpha = 0.1;
                     }
                     completion:^(BOOL finished){
                         
                         heartView.image = [UIImage imageNamed:@"btn_like_selected"];
                         
                         [UIView animateWithDuration:0.3
                                               delay:0.0
                                             options: UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              [heartView setTransform:(CGAffineTransformMakeScale(1.0, 1.0))];
                                              heartView.alpha = 1.0;
                                          }
                                          completion:^(BOOL finished){
                                              [heartView removeFromSuperview];
                                              
                                              [self shakeView: self.heartButton];
                                          }];
                     }];
    self.heartButton.selected = !self.heartButton.selected;
}
    
-(void)shakeView: (UIView *)viewToShake {
    
    // Recording doesn't allow to buzz
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    CGFloat t = 5.0;
    CGAffineTransform translateRight = CGAffineTransformTranslate(CGAffineTransformIdentity, t, t);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, -t);
    
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^ {
                viewToShake.transform = CGAffineTransformIdentity;
            }
                             completion: nil];
        }
    }];
}

@end
