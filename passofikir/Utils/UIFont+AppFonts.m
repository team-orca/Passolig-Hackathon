//
// Created by Ahmet Karalar on 02/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import "UIFont+AppFonts.h"



static NSString *const kBrixSansRegular = @"BrixSansRegular";
static NSString *const kBrixSansMedium = @"BrixSansMedium";
static NSString *const kBrixSansLight = @"BrixSansLight";

static NSString *const kMarkProBold = @"MarkPro-Bold";
static NSString *const kMarkProRegular = @"MarkPro";
static NSString *const kMarkProMedium = @"MarkPro-Medium";

@implementation UIFont (AppFonts)

+ (UIFont *)primaryFontWithSize:(CGFloat)size weight:(FontWeight)weight {
    NSString *fontName = nil;
    switch (weight) {
        case FontWeightLight: {
            fontName = kBrixSansLight;
            break;
        }
        case FontWeightMedium:{
            fontName = kBrixSansMedium;
            break;
        }
        case FontWeightRegular:{
            fontName = kBrixSansRegular;
            break;
        }
        case FontWeightBold:{
            NSAssert(false, @"Can not have bold primary font");
            break;
        }
    }
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)secondaryFontWithSize:(CGFloat)size weight:(FontWeight)weight {
    NSString *fontName = nil;
    switch (weight) {
        case FontWeightLight: {
            NSAssert(false, @"Can not have light secondary font");
            break;
        }
        case FontWeightMedium:{
            fontName = kMarkProMedium;
            break;
        }
        case FontWeightRegular:{
            fontName = kMarkProRegular;
            break;
        }
        case FontWeightBold:{
            fontName = kMarkProBold;
            break;
        }
    }
    return [UIFont fontWithName:fontName size:size];
}

@end
