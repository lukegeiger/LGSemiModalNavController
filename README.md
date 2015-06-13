# LGSemiModalNavController

[![Version](https://img.shields.io/cocoapods/v/LGSemiModalNavController.svg?style=flat)](http://cocoapods.org/pods/LGSemiModalNavController)
[![License](https://img.shields.io/cocoapods/l/LGSemiModalNavController.svg?style=flat)](http://cocoapods.org/pods/LGSemiModalNavController)
[![Platform](https://img.shields.io/cocoapods/p/LGSemiModalNavController.svg?style=flat)](http://cocoapods.org/pods/LGSemiModalNavController)

<p align="center">
  <img src="https://raw.githubusercontent.com/lukegeiger/LGSemiModalNavController/master/lukegeiger-semi-modal.png">
  </p>

<p align="center">
  <img src="https://raw.githubusercontent.com/lukegeiger/LGSemiModalNavController/master/lukegeiger-semi-modal-cocoapod.gif">
</p>

## Purpose

The purpose of the LGSemiModalNavController is to allow you to show a view controller a dynamically set height over another view controller.

## Under The Hood
There are two classes that play together to make this happen. the LGSemiModalNavViewController and the LGSemiModalTransition.
The LGSemiModalNavViewController subscribes to the UIViewControllerTransitioningDelegate. The LGSemiModalTransition subscribes to UIViewControllerAnimatedTransitioning.

```objective-c
// LGSemiModalNavViewController.m

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [self transitionPresenting:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [self transitionPresenting:NO];
}

-(LGSemiModalTransition*)transitionPresenting:(BOOL)presenting{
    LGSemiModalTransition *animator = [LGSemiModalTransition new];
    animator.presenting = presenting;
    animator.tapDismissEnabled = _tapDismissEnabled;
    animator.animationSpeed = _animationSpeed;
    animator.backgroundShadeColor = _backgroundShadeColor;
    animator.scaleTransform = _scaleTransform;
    animator.springDamping = _springDamping;
    animator.springVelocity = _springVelocity;
    animator.backgroundShadeAlpha = _backgroundShadeAlpha;
    return animator;
}
```

## Example
```objective-c
    //This is an example.
    LGViewController *lgVC = [[LGViewController alloc]initWithFormat:LGViewControllerFormatGoBack];
    
    //This is the nav controller
    LGSemiModalNavViewController *semiModal = [[LGSemiModalNavViewController alloc]initWithRootViewController:lgVC];
    //Make sure to set a height on the view controller here.
    semiModal.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 400);
    
    //Selected customization properties, see more in the header of the LGSemiModalNavViewController
    semiModal.backgroundShadeColor = [UIColor blackColor];
    semiModal.animationSpeed = 0.35f;
    semiModal.tapDismissEnabled = YES;
    semiModal.backgroundShadeAlpha = 0.4;
    semiModal.scaleTransform = CGAffineTransformMakeScale(.94, .94);
    
    [self presentViewController:semiModal animated:YES completion:nil];

```

## Customization
-Tap To Dismiss

-Animation Spped

-Background Color

-Transform

-Spring Damping

-Spring Velocity

-Background Alpha


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

LGSemiModalNavController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LGSemiModalNavController"
```

## Authors

Luke Geiger, @lukejgeiger

Mathew Piccinato

## License

LGSemiModalNavController is available under the MIT license. See the LICENSE file for more info.
