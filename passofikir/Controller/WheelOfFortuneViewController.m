//
//  WheelOfFortuneViewController.m
//  PassoFikir
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 OrcaTeam. All rights reserved.
//

#import "WheelOfFortuneViewController.h"
#import <Masonry/View+MASAdditions.h>
#import <QuartzCore/QuartzCore.h>
#import "UIColor+AppColors.h"
#import "UIFont+AppFonts.h"
@interface WheelOfFortuneViewController ()
@property(nonatomic) UIImageView *fedon;
@property(nonatomic) UIImageView *cevir;
@property(nonatomic) CABasicAnimation *rotation;
@property(nonatomic)int fa;
@property(nonatomic)NSString *t;
@property(nonatomic)UILabel *congrat;
@property(nonatomic)UILabel *congratHead;

@property(nonatomic)UIView *bottomBack;

typedef void(^myCompletion)(BOOL);

@end

@implementation WheelOfFortuneViewController
-(int) generateRandomNumberWithlowerBound:(int)lowerBound
                               upperBound:(int)upperBound
{
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _fa=0;
    UIImageView *img = [UIImageView new];
    img.image = [UIImage imageNamed:@"background_splash"];
    img.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:img];
    
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _bottomBack = [UIView new];
    _bottomBack.backgroundColor = [UIColor blueBackgroundColor];
    [_bottomBack.layer setCornerRadius:10.0f];
    _bottomBack.clipsToBounds = YES;
    [self.view addSubview:_bottomBack];
    
    
    _fedon = [UIImageView new];
    _fedon.image = [UIImage imageNamed:@"fortune_wheel"];
    _fedon.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_fedon];
    
    _congrat = [UILabel new];
    _congrat.textAlignment = NSTextAlignmentCenter;
    _congrat.font = [UIFont primaryFontWithSize:20 weight:FontWeightRegular];
    _congrat.numberOfLines = 0;
    [self.bottomBack addSubview:_congrat];
    
    _congratHead = [UILabel new];
    _congratHead.textAlignment = NSTextAlignmentCenter;
    _congratHead.text = @"Tebrikler!";
    _congratHead.textColor = [UIColor confirmationButtonDisabledColor];
    _congratHead.font = [UIFont primaryFontWithSize:30 weight:FontWeightMedium];
    [self.bottomBack addSubview:_congratHead];
    
    _cevir = [UIImageView new];
    _cevir.image = [UIImage imageNamed:@"cevir"];
    [self.view addSubview:_cevir];
    
    UITapGestureRecognizer *lblAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnIt)];
    lblAction.delegate =self;
    lblAction.numberOfTapsRequired = 1;
    [self.cevir setUserInteractionEnabled:YES];
    [self.cevir addGestureRecognizer:lblAction];
    
    [_fedon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-120);
        make.height.width.equalTo(@300);
    }];
    [_cevir mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-120);
        make.height.width.equalTo(@150);
    }];

    [_bottomBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@150);
        make.width.equalTo(@175);
        make.top.equalTo(self.fedon.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
    [_congratHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bottomBack);
        make.top.equalTo(self.bottomBack.mas_top).offset(10);
    }];
    [_congrat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.bottomBack.mas_leading).offset(30);
        make.trailing.equalTo(self.bottomBack.mas_trailing).offset(-30);
        make.top.equalTo(self.bottomBack.mas_top).offset(70);
    }];
    [_congratHead setHidden:YES];
    _congrat.text =@"Hediyeni görmek için çarkı çevir!";

}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
}
-(void)turnIt{
    [_congratHead setHidden:YES];
    _congrat.text =@"Hediyen hazırlanıyor...";
    int ra =[self generateRandomNumberWithlowerBound:1800 upperBound:2160];
    
    _rotation.additive = NO;
    _rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    _rotation.duration = 1;
    _rotation.fromValue = [NSNumber numberWithFloat:0];
    _rotation.toValue = [NSNumber numberWithFloat: (ra-_fa)* 0.0174533];
    _rotation.repeatCount = 1; // Repeat forever. Can be a finite number.
  


    [self.fedon.layer addAnimation:_rotation forKey:@"Spin"];
    self.fedon.transform =  CGAffineTransformRotate(self.fedon.transform, (ra-_fa)* 0.0174533);
    NSLog(@"%d", ra -1800);
    NSLog(@"%d", _fa);
    
    int test = ra-1800;
    if(40<=test && test <=101){
        _t=@"Takımına özel mağazalarda atkılarda %10 indirim kazandın!";
    }
    else if(103<=test && test <=152){
        _t=@"Maç sonrası formda kal, anlaşmalı spor salonlarında %15 indirim!";
    }
    else if(154<=test && test <=220){
        _t=@"Bir sonraki maçı VIP'den izlemek için çekiliş hakkı kazandınız!";
    }
    else if(222<=test && test <=271){
        _t=@"Takımına özel mağazalarda formalarda %7 indirim kazandın!";
    }
    else if(274<=test && test <=336){
        _t=@"Uber ile 10 liralık kullanım kodun maç öncesi cebinde!";
        
    }
    else if(37>=test || test>= 339){
        _t=@"Köfteci Yusuf'tan maç öncesi %10 yemek indirimi kazandın!";
    }
    else{
        _t=@"Çok şanslısın, imkansızı başardın hiç bir şey kazanamadın";
    }
    _fa=test;

    [self performSelector:@selector(logi) withObject:self afterDelay:1.0 ];

   
}
-(void)logi{
    [_congratHead setHidden:NO];
    _congrat.text = _t;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
