//
// Created by Ahmet Karalar on 01/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import "StyleKit.h"
#import "UIColor+AppColors.h"
#import "UIFont+AppFonts.h"
#import "UIImage+Additions.h"

@implementation StyleKit

+ (void)setupAppearance {
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName: [UIColor navigationTitleColor],
        NSFontAttributeName: [UIFont primaryFontWithSize:20
                                                  weight:FontWeightMedium]
    };
    [[UINavigationBar appearance]
        setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];

    UIImage *navBarImage = [UIImage imageWithColor:[UIColor whiteColor] andSize:CGSizeMake(10, 10)];
    navBarImage = [navBarImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [[UINavigationBar appearance]
        setBackgroundImage:navBarImage
             forBarMetrics:UIBarMetricsDefault];

    UIImage *backImage = [UIImage imageNamed:@"iconBackDark"];
    [UINavigationBar appearance].tintColor = [UIColor navigationTitleColor];
    [UINavigationBar appearance].backIndicatorImage = backImage;
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = backImage;
    [[UIBarButtonItem appearance]
        setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0)
                               forBarMetrics:UIBarMetricsDefault];
}

@end


