//
//  JmSettingViewController.m
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmSettingViewController.h"
#import "JmSetting.h"
@interface JmSettingViewController ()

@end

@implementation JmSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getSettingView];
    // Do any additional setup after loading the view.
}
-(void)getSettingView
{
    UIView *settingView = [[JmSetting alloc]initWithFrame:CGRectMake(0, 60, 320, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:settingView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
