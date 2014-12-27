//
//  JmSetting.m
//  WanDou
//
//  Created by xyooyy on 14/12/21.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmSetting.h"
#define labelAndButton_hight 40
#define labelAndButton_wide 300
@implementation JmSetting
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self SettingViewLabel];
        [self SettingViewButton];
        // Initialization code
    }
    return self;
}
-(BOOL)SettingViewLabel
{
    UILabel *trafficPrompt = [self creatLabel:CGRectMake(10, 15, labelAndButton_wide, labelAndButton_hight) :@"使用流量时提醒我" :self :16];
    trafficPrompt.backgroundColor = [UIColor whiteColor];
    UISwitch *trafficSwitch = [self creatSwitch:CGRectMake(230, 5, 50, 30) :trafficPrompt];
    UILabel *voluntarilyBuffer = [self creatLabel:CGRectMake(10, 55, labelAndButton_wide, labelAndButton_hight) :@"自动离线缓存最新剧集" :self :16];
    voluntarilyBuffer.backgroundColor = [UIColor whiteColor];
    UISwitch *buffer = [self creatSwitch:CGRectMake(230, 5, 50, 30) :voluntarilyBuffer];
    [buffer addTarget:self action:@selector(fjld:) forControlEvents:UIControlEventEditingChanged];
    UILabel *wifiVoluntarilyBuffer = [self creatLabel:CGRectMake(10, 95, labelAndButton_wide, labelAndButton_hight) :@"连接Wi-Fi时自动离线缓存最新剧集" :self :14];
    wifiVoluntarilyBuffer.textColor = [UIColor lightGrayColor];
    wifiVoluntarilyBuffer.textAlignment = NSTextAlignmentCenter;
    UILabel *space = [self creatLabel:CGRectMake(10, 180, labelAndButton_wide, labelAndButton_hight) :@"离线缓存0B  设备空间剩余14.5GB" :self :14];
    space.textAlignment = NSTextAlignmentCenter;
    space.textColor = [UIColor lightGrayColor];
    UILabel *version = [self creatLabel:CGRectMake(10, 385, labelAndButton_wide, labelAndButton_hight) :@"豌豆荚出品 版本2.0.0" :self :14];
    version.textAlignment = NSTextAlignmentCenter;
    version.textColor = [UIColor lightGrayColor];
    return YES;
}
-(void)fjld:(id)sender
{

}
-(UISwitch *)creatSwitch :(CGRect)switframe :(UIView *)view
{
    UISwitch *swit = [[UISwitch alloc]initWithFrame:switframe];
    swit.on = YES;
    [view addSubview:swit];
    return swit;
}
-(void)SettingViewButton
{
    UIButton *clearBuffer = [self creatButton:CGRectMake(10, 140, labelAndButton_wide, labelAndButton_hight) :@"清除所有视频缓存" :2011 :self :@selector(buttonPress:)];
    UIButton *feedback = [self creatButton:CGRectMake(10, 225, labelAndButton_wide, labelAndButton_hight) :@"意见反馈" :2012 :self :@selector(buttonPress:)];
    UIButton *functionDeclaration = [self creatButton:CGRectMake(10, 265, labelAndButton_wide, labelAndButton_hight) :@"视频功能声明" :2013 :self :@selector(buttonPress:)];
    UIButton *UserAgreement = [self creatButton:CGRectMake(10, 305, labelAndButton_wide, labelAndButton_hight) :@"用户协议" :2014 :self :@selector(buttonPress:)];
    UIButton *Appraisal = [self creatButton:CGRectMake(10, 345, labelAndButton_wide, labelAndButton_hight) :@"前往App Store评分" :2015 :self :@selector(buttonPress:)];
    
}
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString *)buttontitle :(int)buttontag :(UIView *)view :(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonframe;
    [button setTitle:buttontitle forState:UIControlStateNormal];
    button.tag = buttontag;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(UILabel *)creatLabel :(CGRect)labelFrame :(NSString *)labelText :(UIView *)view :(int)fontsize
{
    UILabel *label = [[UILabel alloc]initWithFrame:labelFrame];
    label.text = labelText;
    label.font = [UIFont systemFontOfSize:fontsize];
    [view addSubview:label];
    return label;
}
-(void)buttonPress:(UIButton *)buttonTag
{
    [delegate tablebarViewDelegate:buttonTag.tag];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
