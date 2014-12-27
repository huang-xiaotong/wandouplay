//
//  JmFavouritesViewController.m
//  WanDou
//
//  Created by xyooyy on 14/12/5.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmFavouritesViewController.h"
#import "JmSettingViewController.h"
@interface JmFavouritesViewController ()

@end

@implementation JmFavouritesViewController

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
    self.title = @"我的视频";
    [self creatLeftAndRightButton];
    // Do any additional setup after loading the view.
}
-(void)creatLeftAndRightButton
{
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStyleDone target:self action:@selector(pressBackButton:)];
    self.navigationItem.leftBarButtonItem = backbutton;
    UIBarButtonItem *setButton = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(pressSetButton:)];
    self.navigationItem.rightBarButtonItem = setButton;
}
-(void)pressSetButton:(id)sender
{
    JmSettingViewController *settingViewController = [[JmSettingViewController alloc]init];
    [self.navigationController pushViewController:settingViewController animated:YES];
}
-(void)pressBackButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
