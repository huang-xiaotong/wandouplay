//
//  JmFavouritesViewController.m
//  WanDou
//
//  Created by xyooyy on 14/12/5.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmFavouritesViewController.h"

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
    navigationBar = [[UINavigationBar alloc]init];
    navigationBar.frame = CGRectMake(0, 0, 320, 60);
    navigationBar.backgroundColor = [UIColor greenColor];
    [self.view addSubview:navigationBar];
    [self creatButton];
    [self creatLabel];
    // Do any additional setup after loading the view.
}
-(UILabel *)creatLabel
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 30, 100, 20)];
    titleLabel.text = @"我的视频";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    [navigationBar addSubview:titleLabel];
    return titleLabel;
}
-(UIButton *)creatButton
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 40, 20)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [navigationBar addSubview:button];
    return button;
}
-(void)pressButton:(id)sender
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
