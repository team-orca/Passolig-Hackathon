//
// Created by Ahmet Karalar on 02/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import "UIImage+Additions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (Additions)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size {
    //Create a context of the appropriate size
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    //Build a rect of appropriate size at origin 0,0
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);

    //Set the fill color
    CGContextSetFillColorWithColor(currentContext, color.CGColor);

    //Fill the color
    CGContextFillRect(currentContext, fillRect);

    //Snap the picture and close the context
    UIImage *retVal = UIGraphicsGetImageFromCurrentImageContext();
    //UIImage *retval = UIGraphicsGetImageFromCurrentImageContext(void);
    UIGraphicsEndImageContext();

    return retVal;
}

+ (UIImage *)resizableImageWithColor:(UIColor *)color {
    return [[UIImage imageWithColor:color
                            andSize:CGSizeMake(3, 3)]
        resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
}


+ (UIImage *)image:(UIImage *)image filledWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);

    CGContextRef context = UIGraphicsGetCurrentContext();

    [color setFill];

    CGImageRef imageRef = [image CGImage];
    CGRect targetRect = CGRectMake(0.0, 0.0, image.size.width, image.size.height);

    CGContextTranslateCTM(context, 0.0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, targetRect, imageRef);
    CGContextClipToMask(context, targetRect, imageRef);
    CGContextAddRect(context, targetRect);
    CGContextDrawPath(context, kCGPathFill);

    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return finalImage;
}

@end
