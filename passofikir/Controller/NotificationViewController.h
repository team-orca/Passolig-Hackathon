//
//  NotificationViewController.h
//  PassoFikir
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 orcateam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFRoundProgressCounterView.h"

@interface NotificationViewController : UIViewController<SFRoundProgressCounterViewDelegate, UIGestureRecognizerDelegate>
@property(nonatomic)SFRoundProgressCounterView *sfProgressCounterView;
@end
