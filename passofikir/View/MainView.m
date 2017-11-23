//
//  MainView.m
//  PassoFikir
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 orcateam. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import <Foundation/Foundation.h>
#import "MainView.h"
#import "View+MASAdditions.h"
#import "UIColor+AppColors.h"
#import "UIFont+AppFonts.h"
@interface MainView ()
@property(nonatomic)UIView *horizontal1;
@property(nonatomic)UIView *horizontal2;
@property(nonatomic)UILabel *passoPuanLabel;
@property(nonatomic)UILabel *passoHediyeLabel;
@property(nonatomic)UILabel *passoDavetiyeLabel;
- (void)setupConstraints;
@end

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.preservesSuperviewLayoutMargins = NO;
    self.layoutMargins = UIEdgeInsetsMake(30, 30, 0, 40);
    
    
    _passoPuan = [UIButton buttonWithType:UIButtonTypeSystem];
    [_passoPuan setBackgroundColor:[UIColor borderColor]];
    [_passoPuan setTitleColor:[UIColor confirmationButtonTextColor]
                         forState:UIControlStateNormal];
    [_passoPuan setTitle:@"Göster"
                    forState:UIControlStateNormal];
    _passoPuan.titleLabel.font = [UIFont primaryFontWithSize:20
                                                          weight:FontWeightMedium];
    _passoPuan.layer.cornerRadius = 10; // this value vary as per your desire
    _passoPuan.clipsToBounds = YES;

    
    
    _passoHediye = [UIButton buttonWithType:UIButtonTypeSystem];
    [_passoHediye setBackgroundColor:[UIColor borderColor]];
    [_passoHediye setTitleColor:[UIColor confirmationButtonTextColor]
                     forState:UIControlStateNormal];
    [_passoHediye setTitle:@"Göster"
                forState:UIControlStateNormal];
    _passoHediye.titleLabel.font = [UIFont primaryFontWithSize:20
                                                      weight:FontWeightMedium];
    _passoHediye.layer.cornerRadius = 10; // this value vary as per your desire
    _passoHediye.clipsToBounds = YES;

    _passoDavetiye = [UIButton buttonWithType:UIButtonTypeSystem];
    [_passoDavetiye setBackgroundColor:[UIColor borderColor]];
    [_passoDavetiye setTitleColor:[UIColor confirmationButtonTextColor]
                       forState:UIControlStateNormal];
    [_passoDavetiye setTitle:@"Göster"
                  forState:UIControlStateNormal];
    _passoDavetiye.titleLabel.font = [UIFont primaryFontWithSize:20
                                                        weight:FontWeightMedium];
    _passoDavetiye.layer.cornerRadius = 10; // this value vary as per your desire
    _passoDavetiye.clipsToBounds = YES;
    [self addSubview:_passoPuan];
    [self addSubview:_passoHediye];
    [self addSubview:_passoDavetiye];
    
    _horizontal1 = [UIView new];
    _horizontal1.backgroundColor = [UIColor darkTextColor];
    
    _horizontal2 = [UIView new];
    _horizontal2.backgroundColor = [UIColor darkTextColor];

    [self addSubview:_horizontal1];
    [self addSubview:_horizontal2];
    
    _passoPuanLabel = [UILabel new];
    _passoPuanLabel.text = @"PassoPuan";
    _passoPuanLabel.textColor = [UIColor darkTextColor];
    [_passoPuanLabel setFont:[UIFont primaryFontWithSize:20
                                                  weight:FontWeightMedium]];
    _passoPuanLabel.textAlignment = NSTextAlignmentCenter;

    _passoHediyeLabel = [UILabel new];
    _passoHediyeLabel.text = @"PassoHediye";
    _passoHediyeLabel.textColor = [UIColor darkTextColor];
    [_passoHediyeLabel setFont:[UIFont primaryFontWithSize:20
                                                  weight:FontWeightMedium]];
    _passoHediyeLabel.textAlignment = NSTextAlignmentCenter;

    _passoDavetiyeLabel = [UILabel new];
    _passoDavetiyeLabel.text = @"PassoDavetiye";
    _passoDavetiyeLabel.textColor = [UIColor darkTextColor];
    [_passoDavetiyeLabel setFont:[UIFont primaryFontWithSize:20
                                                    weight:FontWeightMedium]];
    _passoDavetiyeLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_passoPuanLabel];
    [self addSubview:_passoHediyeLabel];
    [self addSubview:_passoDavetiyeLabel];
    [self setupConstraints];
    return self;
}



- (void)setupConstraints {
    
    [_passoPuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [_passoPuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passoPuanLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);

    }];
    [_horizontal1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passoPuan.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@1);
    }];
    
    
    [_passoHediyeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horizontal1).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);

    }];
    [_passoHediye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passoHediyeLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);

    }];
    [_horizontal2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passoHediye.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@1);
    }];
    [_passoDavetiyeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horizontal2).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        
    }];
    [_passoDavetiye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passoDavetiyeLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        
    }];
}


@end

