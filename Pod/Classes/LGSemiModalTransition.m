//
//  LGSemiModalTransition.m
//  6th Man Apps LLC
//
//  Created by Luke Geiger on 7/13/15.
//  Copyright (c) 2016 6th Man Apps LLC. All rights reserved.
//

#import "LGSemiModalTransition.h"
#import "LGSemiModalNavViewController.h"

@interface LGSemiModalTransition ()

@end

@implementation LGSemiModalTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.animationSpeed;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect modalViewFinalFrame = CGRectMake(0, transitionContext.containerView.frame.size.height - toViewController.view.frame.size.height, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
    CGRect modalViewInitialFrame = modalViewFinalFrame;
    modalViewInitialFrame.origin.y = transitionContext.containerView.frame.size.height;
    
    UIView* backgroundView = [[[[transitionContext containerView] subviews] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"tag = 99"]] lastObject];
    if(!backgroundView){
        backgroundView = [[UIView alloc] initWithFrame:transitionContext.containerView.bounds];
        backgroundView.alpha = 0;
        backgroundView.tag = 99;
        backgroundView.backgroundColor = _backgroundShadeColor;
        
        if (self.tapDismissEnabled) {
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:toViewController action:@selector(dismissWasTapped)];
            [backgroundView addGestureRecognizer:tap];
            backgroundView.userInteractionEnabled = YES;
        }
    }
    
    fromViewController.view.userInteractionEnabled = NO;
    toViewController.view.userInteractionEnabled = NO;
    
    if (self.presenting) {
        UIImage* image =  [self viewAsImage:fromViewController.view];
        [transitionContext.containerView insertSubview:[[UIImageView alloc] initWithImage:image] atIndex:0];
        fromViewController.view.hidden = YES;
        
        [transitionContext.containerView insertSubview:backgroundView belowSubview:toViewController.view];
        
        toViewController.view.frame = modalViewInitialFrame;
        [transitionContext.containerView addSubview:toViewController.view];
        
        CGRect navBarFrame = ((LGSemiModalNavViewController*)toViewController).navigationBar.frame;
        ((LGSemiModalNavViewController*)toViewController).navigationBar.frame = CGRectMake(navBarFrame.origin.x, 0, navBarFrame.size.width, navBarFrame.size.height);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             backgroundView.alpha = _backgroundShadeAlpha;
                            [(UIView*)[transitionContext.containerView.subviews objectAtIndex:0] setTransform:_scaleTransform];
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] + .2
                              delay:0
             usingSpringWithDamping:_springDamping
              initialSpringVelocity:_springVelocity
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             toViewController.view.frame = modalViewFinalFrame;
                         }
                         completion:^(BOOL finished) {
                             fromViewController.view.userInteractionEnabled = YES;
                             toViewController.view.userInteractionEnabled = YES;
                             [transitionContext completeTransition:YES];
                         }];
    }
    else {
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             [(UIView*)[transitionContext.containerView.subviews objectAtIndex:0] setTransform:CGAffineTransformMakeScale(1, 1)];
                             fromViewController.view.frame = modalViewInitialFrame;
                             backgroundView.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             fromViewController.view.userInteractionEnabled = YES;
                             toViewController.view.userInteractionEnabled = YES;
                             toViewController.view.hidden = NO;
                             [transitionContext completeTransition:YES];
                         }];
    }
}

- (UIImage*)viewAsImage:(UIView*)view {
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
