//
// Created by Ahmet Karalar on 02/09/16.
// Copyright (c) 2016 Ahmet Karalar. All rights reserved.
//

#import "UIViewController+Alert.h"


@implementation UIViewController (Alert)

+ (UIAlertController *)errorAlertWithMessage:(NSString *)message {
    NSString *title = NSLocalizedString(@"Hata", nil);
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"Tamam", nil)
                                                      style:UIAlertActionStyleCancel
                                                    handler:nil];
    [controller addAction:action];
    return controller;
}

@end
