//
//  NotificationView.m
//  PassoFikir
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 OrcaTeam. All rights reserved.
//

#import "NotificationView.h"
#import <QuartzCore/QuartzCore.h>
#import "View+MASAdditions.h"
#import "UIColor+AppColors.h"
#import "UIFont+AppFonts.h"
@interface NotificationView()
@property(nonatomic)UIView *topBack;
@property(nonatomic)UIView *bottomBack;
@property(nonatomic)UIView *questionBack;
@property(nonatomic)UIImageView *avatar;
@property(nonatomic)UIImageView *star;
@property(nonatomic)UILabel *name;
@property(nonatomic)UILabel *question;
@property(nonatomic)UILabel *answer1;
@property(nonatomic)UILabel *answer2;
@property(nonatomic)UILabel *answer3;
@property(nonatomic)UILabel *answer4;
@property(nonatomic)UILabel *questionText;
@property(nonatomic)UILabel *questionPoint;
@property(nonatomic)UILabel *questionAbout;
@property(nonatomic)UIImageView *questionStar;
@end
@implementation NotificationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.preservesSuperviewLayoutMargins = NO;
    self.layoutMargins = UIEdgeInsetsMake(30, 30, 0, 40);
    self.backgroundColor = [UIColor blueBackgroundColor];
    _topBack = [UIView new];
    _topBack.backgroundColor = [UIColor confirmationButtonEnabledColor];
    [self addSubview:_topBack];
    
    _bottomBack = [UIView new];
    _bottomBack.backgroundColor = [UIColor confirmationButtonEnabledColor];
    [self addSubview:_bottomBack];
    
    _questionBack = [UIView new];
    _questionBack.backgroundColor=[UIColor whiteColor];
    [self addSubview:_questionBack];
    // border radius
    [_questionBack.layer setCornerRadius:10.0f];
    _questionBack.clipsToBounds = YES;
    
    
    _avatar = [UIImageView new];
    _avatar.image = [UIImage imageNamed:@"avatar"];
    [self addSubview:_avatar];
    
    _star = [UIImageView new];
    _star.image = [UIImage imageNamed:@"star"];
    [self addSubview:_star];
    
    _name = [UILabel new];
    _name.text = @"Fedon";
    _name.textColor = [UIColor whiteColor];
    [self addSubview:_name];
    
    
    _choice1 = [UIView new];
    _choice1.backgroundColor = [UIColor whiteColor];
    [self addSubview:_choice1];
    
    _choice2 = [UIView new];
    _choice2.backgroundColor = [UIColor whiteColor];
    [self addSubview:_choice2];

    _choice3 = [UIView new];
    _choice3.backgroundColor = [UIColor whiteColor];
    [self addSubview:_choice3];
    
    _choice4 = [UIView new];
    _choice4.backgroundColor = [UIColor whiteColor];
    [self addSubview:_choice4];
    
    [_choice1.layer setCornerRadius:10.0f];
    _choice1.clipsToBounds = YES;
    
    [_choice2.layer setCornerRadius:10.0f];
    _choice2.clipsToBounds = YES;
    
    [_choice3.layer setCornerRadius:10.0f];
    _choice3.clipsToBounds = YES;
    
    [_choice4.layer setCornerRadius:10.0f];
    _choice4.clipsToBounds = YES;
    
    _answer1 = [UILabel new];
    _answer1.text = @"Bobo";
    [self.choice1 addSubview:_answer1];
    
    _answer2 = [UILabel new];
    _answer2.text = @"Stancu";
    [self.choice2 addSubview:_answer2];
    
    _answer3 = [UILabel new];
    _answer3.text = @"Pancu";
    [self.choice3 addSubview:_answer3];
    
    _answer4 = [UILabel new];
    _answer4.text = @"Lucescu";
    [self.choice4 addSubview:_answer4];
    
    _questionText = [UILabel new];
    _questionText.text = @"Kadıköy panteri olarak bilinen Beşiktaşlı efsane oyuncunun adı nedir?";
    _questionText.numberOfLines = 0;
    [self.questionBack addSubview:_questionText];
    _points = [UILabel new];
    _points.text = @"935";
    _points.textColor = [UIColor whiteColor];
    [self.topBack addSubview:_points];
    
    _questionPoint = [UILabel new];
    _questionPoint.text = @"15";
    [self.questionBack addSubview:_questionPoint];
    
    _questionAbout = [UILabel new];
    _questionAbout.text = @"Kategori: Beşiktaş";
    [self.questionBack addSubview:_questionAbout];
    
    _questionStar = [UIImageView new];
    _questionStar.image = [UIImage imageNamed:@"startrack"];
    [self.questionBack addSubview:_questionStar];
    
    [self setupConstraints];

    return self;
}
- (void)setupConstraints {
    
    [_topBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self);
        make.height.equalTo(@200);
        
    }];
    [_bottomBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.equalTo(@100);
        
    }];
    [_questionBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topBack.mas_bottom).offset(-10);
        make.height.equalTo(@150);
        make.width.equalTo(@175);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [_choice1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.questionBack.mas_bottom).offset(20);
        make.height.equalTo(@150);
        make.width.equalTo(@175);
        make.left.equalTo(self.mas_left).offset(20);
    }];
    [_choice2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.questionBack.mas_bottom).offset(20);
        make.height.equalTo(@150);
        make.width.equalTo(@175);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [_choice3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.choice1.mas_bottom).offset(20);
        make.height.equalTo(@150);
        make.width.equalTo(@175);
        make.left.equalTo(self.mas_left).offset(20);
    }];
    [_choice4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.choice2.mas_bottom).offset(20);
        make.height.equalTo(@150);
        make.width.equalTo(@175);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@60);
        make.left.equalTo(self.mas_left).offset(20);
        make.top.equalTo(self.mas_top).offset(25);
    }];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatar.mas_right).offset(5);
        make.centerY.equalTo(self.avatar.mas_centerY).offset(-20);
    }];
    [_star mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatar.mas_right).offset(5);
        make.top.equalTo(self.name.mas_bottom).offset(5);
        make.height.width.equalTo(@30);
    }];
    
    [_answer1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.choice1);
    }];
    
    
    [_answer2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.choice2);

    }];
    
    [_answer3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.choice3);

    }];
    
    [_answer4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.choice4);
    }];
    [_questionText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.questionBack.mas_top).offset(55);
        make.right.equalTo(self.questionBack.mas_right).offset(-30);
        make.left.equalTo(self.questionBack.mas_left).offset(30);
    }];
    [_questionStar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.questionBack.mas_top).offset(10);
        make.right.equalTo(self.questionBack.mas_right).offset(-30);
        make.height.width.equalTo(@20);
    }];
    [_points mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.star.mas_centerY);
        make.left.equalTo(self.star.mas_right).offset(1);
    }];
    [_questionPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.questionStar.mas_centerY);
        make.left.equalTo(self.questionStar.mas_right).offset(1);
    }];
    [_questionAbout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.questionStar.mas_centerY);
        make.left.equalTo(self.questionBack.mas_left).offset(30);
    }];
}
@end
