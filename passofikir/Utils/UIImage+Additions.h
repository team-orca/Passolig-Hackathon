//
// Created by Ahmet Karalar on 02/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Additions)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
+ (UIImage *)resizableImageWithColor:(UIColor *)color;
+ (UIImage *)image:(UIImage *)image filledWithColor:(UIColor *)color;
@end
