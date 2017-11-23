//
// Created by Ahmet Karalar on 02/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FontWeight) {
    FontWeightLight,
    FontWeightMedium,
    FontWeightRegular,
    FontWeightBold
};

@interface UIFont (AppFonts)
+ (UIFont *)primaryFontWithSize:(CGFloat)size weight:(FontWeight)weight;
+ (UIFont *)secondaryFontWithSize:(CGFloat)size weight:(FontWeight)weight;
@end
