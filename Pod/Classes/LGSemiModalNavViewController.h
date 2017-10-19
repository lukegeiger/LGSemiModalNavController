//
//  LGSemiModalNavViewController.h
//  6th Man Apps LLC
//
//  Created by Luke Geiger on 7/13/15.
//  Copyright (c) 2016 6th Man Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGSemiModalTransition.h"

@interface LGSemiModalNavViewController : UINavigationController <UIViewControllerTransitioningDelegate>

/**
 Switch this to YES to enable tapping on the background to dismiss the semi modal.
 */
@property (nonatomic, assign, getter = isTapDismissEnabled) BOOL tapDismissEnabled;

/**
 The speed at which the semi modal appears
 */
@property (nonatomic, assign) NSTimeInterval animationSpeed;

/**
 The background shade color.
 */
@property (nonatomic, strong) UIColor *backgroundShadeColor;

/**
 The transform that gets applied to the view controller underneath the semi modal
 */
@property (nonatomic, assign) CGAffineTransform scaleTransform;

/**
 Spring damping for the semi modal transition
 */
@property (nonatomic, assign) CGFloat springDamping;

/**
 Spring Velocity for the semi modal transition
 */
@property (nonatomic, assign) CGFloat springVelocity;

/**
 The background shade alpha of the view underneath the semi modal
 */
@property (nonatomic, assign) CGFloat backgroundShadeAlpha;

/**
 * An optional block to be invoked when controller dismission completion.
 */
@property (nonatomic, strong) void(^dismissionBlock)(void);

/**
 Dismisses the view controller
 */
- (void)dismissWasTapped;

@end
