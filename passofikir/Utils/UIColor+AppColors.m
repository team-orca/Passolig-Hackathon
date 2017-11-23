//
// Created by Ahmet Karalar on 02/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import "UIColor+AppColors.h"
#import "Colours.h"

@implementation UIColor (AppColors)

+ (UIColor *)blueBackgroundColor {
    return [UIColor colorFromHexString:@"F1F5F7"];
}

+ (UIColor *)lightBackgroundColor {
    return [UIColor whiteColor];
}

+ (UIColor *)navigationTitleColor {
    return [UIColor colorFromHexString:@"3780F8"];
}

+ (UIColor *)darkTextColor {
    return [UIColor colorFromHexString:@"555555"];
}

+ (UIColor *)paleTextColor {
    return [UIColor colorFromHexString:@"999999"];
}

+ (UIColor *)confirmationButtonEnabledColor {
    return [UIColor colorFromHexString:@"#5C0006"];
}

+ (UIColor *)confirmationButtonDisabledColor {
    return [UIColor colorFromHexString:@"#38BA6D"];
}

+ (UIColor *)confirmationButtonTextColor {
    return [UIColor whiteColor];
}

+ (UIColor *)borderColor {
    return [UIColor colorFromHexString:@"DDDDDD"];
}

+ (UIColor *)followButtonBorderColor {
    return [UIColor colorFromHexString:@"ffa07a"];
}

+ (UIColor *)statSeparatorColor {
    return [UIColor colorFromHexString:@"eeeeee"];
}

+ (UIColor *)priceBackgroundColor {
    return [UIColor colorFromHexString:@"DEF7FF"];
}


@end
