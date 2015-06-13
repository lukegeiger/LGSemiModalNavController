//
//  LGViewController.h
//  LGSemiModalNavController
//
//  Created by Luke Geiger on 06/13/2015.
//  Copyright (c) 2014 Luke Geiger. All rights reserved.
//

@import UIKit;

typedef enum : NSUInteger {
    LGViewControllerFormatTapMe,
    LGViewControllerFormatGoBack,
} LGViewControllerFormat;

@interface LGViewController : UIViewController

-(id)initWithFormat:(LGViewControllerFormat)format;

@end

