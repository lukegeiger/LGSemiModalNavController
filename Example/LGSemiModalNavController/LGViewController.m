//
//  LGViewController.m
//  LGSemiModalNavController
//
//  Created by Luke Geiger on 06/13/2015.
//  Copyright (c) 2014 Luke Geiger. All rights reserved.
//

#import "LGViewController.h"
#import "LGSemiModalNavViewController.h"

@interface LGViewController ()
@property (nonatomic, assign) LGViewControllerFormat format;
@end

@implementation LGViewController

#pragma mark - Life

-(id)initWithFormat:(LGViewControllerFormat)format{
    
    self = [super init];
    if (self) {
        _format = format;
    }
    return self;
}


- (void)loadView {
    [super loadView];
    
    self.navigationItem.title = @"LGSemiModal";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((self.view.frame.size.width-280)/2, (self.view.frame.size.height-40)/2, 280, 40);
    button.clipsToBounds = YES;
    button.layer.cornerRadius = 2;
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0].CGColor;
    [button setTitleColor:[UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0] forState:UIControlStateNormal];
    
    if (_format == LGViewControllerFormatTapMe) {
        [button addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"TAP ME" forState:UIControlStateNormal];
    }
    else{
        [button addTarget:self action:@selector(dismissViewControllerWasPressed) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"GO BACK" forState:UIControlStateNormal];
    }
    
    [self.view addSubview:button];
}


#pragma mark Actions

-(void)buttonWasPressed{
    LGViewController *lgVC = [[LGViewController alloc]initWithFormat:LGViewControllerFormatGoBack];
    LGSemiModalNavViewController *semiModal = [[LGSemiModalNavViewController alloc]initWithRootViewController:lgVC];
    semiModal.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 400);
    
    semiModal.backgroundShadeColor = [UIColor blackColor];
    semiModal.animationSpeed = 0.35f;
    semiModal.tapDismissEnabled = YES;
    semiModal.backgroundShadeAlpha = 0.4;
    semiModal.scaleTransform = CGAffineTransformMakeScale(.94, .94);
    
    [self presentViewController:semiModal animated:YES completion:nil];
}

-(void)dismissViewControllerWasPressed{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
