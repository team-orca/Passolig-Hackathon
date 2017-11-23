//
//  NotificationViewController.m
//  PassoFikir
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 orcateam. All rights reserved.
//

#import "NotificationViewController.h"
#import <Masonry/View+MASAdditions.h>
#import "NotificationView.h"
#import "UIColor+AppColors.h"
#import "SCLAlertView.h"
@interface NotificationViewController ()
@property(nonatomic)NotificationView *notificationView;
@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notificationView = [NotificationView new];
    [self.view addSubview:self.notificationView];
    
    [self.notificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.sfProgressCounterView = [SFRoundProgressCounterView new];
    self.sfProgressCounterView.delegate = self;
    NSNumber* interval = [NSNumber numberWithLong:10000.0];
    self.sfProgressCounterView.intervals = @[interval];
    self.sfProgressCounterView.innerTrackColor = [UIColor blackColor];
    self.sfProgressCounterView.outerTrackColor = [UIColor blackColor];
    // set color of outer progress circles
    self.sfProgressCounterView.outerProgressColor = [UIColor blueBackgroundColor];
    
    // set color of inner progress circle
    
    // set color of counter label
    self.sfProgressCounterView.labelColor = [UIColor blackColor];
    self.sfProgressCounterView.outerCircleThickness = [NSNumber numberWithFloat:15.0];
    
    // thickness of inner circle
    self.sfProgressCounterView.innerCircleThickness = [NSNumber numberWithFloat:3.0];
    [self.view addSubview:_sfProgressCounterView];
    [self.sfProgressCounterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(25);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.width.height.equalTo(@80);
    }];
    [self.sfProgressCounterView start];
    
    UITapGestureRecognizer *lblAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lblClick:)];
    lblAction.delegate =self;
    lblAction.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *lblAction2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lblClick:)];
    lblAction.delegate =self;
    lblAction.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *lblAction4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lblClick:)];
    lblAction.delegate =self;
    lblAction.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *lblAction3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lblClick:)];
    lblAction.delegate =self;
    lblAction.numberOfTapsRequired = 1;
    
    [self.notificationView.choice1 setUserInteractionEnabled:YES];
    [self.notificationView.choice1 addGestureRecognizer:lblAction];
    
    [self.notificationView.choice2 setUserInteractionEnabled:YES];
    [self.notificationView.choice2 addGestureRecognizer:lblAction2];
    
    [self.notificationView.choice4 setUserInteractionEnabled:YES];
    [self.notificationView.choice4 addGestureRecognizer:lblAction4];
    
    [self.notificationView.choice3 setUserInteractionEnabled:YES];
    [self.notificationView.choice3 addGestureRecognizer:lblAction3];
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)countdownDidEnd:(SFRoundProgressCounterView*)progressCounterView{
    [self showErrorPop];
}
-(void)showErrorPop{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showError:self title:@"Süren doldu :(" subTitle:@"Daha hızlı olmalısın" closeButtonTitle:@"Kapat" duration:0.0f];
    [alert alertIsDismissed:^{
        NSLog(@"Kapat");
    }];
}
-(void)showWrongPop{
    [_sfProgressCounterView stop];
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showError:self title:@"Yanlış cevap :(" subTitle:@"Yine bekleriz" closeButtonTitle:@"Kapat" duration:0.0f];
    [alert alertIsDismissed:^{
        NSLog(@"Kapat");
    }];
    
}
- (void)lblClick:(UITapGestureRecognizer *)tapGesture {
    UIView *label = (UIView *)tapGesture.view;
    label.backgroundColor = [UIColor redColor];
    [self showWrongPop];
}



@end
