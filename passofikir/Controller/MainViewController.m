//
//  MainViewController.m
//  PassoFikir
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 orcateam. All rights reserved.
//

#import "MainViewController.h"
#import <Masonry/View+MASAdditions.h>
#import "MainView.h"
#import "UIColor+AppColors.h"
#import "NotificationViewController.h"
@interface MainViewController ()
@property(nonatomic)MainView *mainView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView = [MainView new];
    [self.view addSubview:self.mainView];
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
   
    [self.mainView.passoPuan addTarget:self
                                            action:@selector(didTapPassoPuanButton)
                                  forControlEvents:UIControlEventTouchUpInside];
    

    
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didTapPassoPuanButton{
    NotificationViewController *notify = [NotificationViewController new];
    [self.navigationController pushViewController:notify
                                         animated:YES];
}

@end
