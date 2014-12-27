//
//  JmMovieViewController.m
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmMovieViewController.h"
#import "JmNavigationBar.h"
#import "JmFavouritesViewController.h"
#import "JmHistoryViewController.h"
#import "JmMovie.h"
@interface JmMovieViewController ()
<UIScrollViewDelegate,TablebarViewDelegate>

@end

@implementation JmMovieViewController

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
    [self getNavigationBar];
    [self getScrollviewButton];

    // Do any additional setup after loading the view.
}
-(void)getScrollviewButton
{
    JmMovie *movieTabbar = [[JmMovie alloc]initWithFrame:CGRectMake(0, 60, 400, 44)];
    movieTabbar.delegate = self;
    [self.view addSubview:movieTabbar];
}
-(void)tablebarViewDelegate:(NSInteger)tag
{
    switch (tag) {
        case 2003:
        {
            self.view.backgroundColor = [UIColor whiteColor];
        }
            break;
        case 2004:
        {self.view.backgroundColor = [UIColor grayColor];}
            break;
        case 2005:
        {self.view.backgroundColor = [UIColor yellowColor];}
            break;
        case 2006:
        {self.view.backgroundColor = [UIColor purpleColor];}
            break;
        case 2007:
        {self.view.backgroundColor = [UIColor blueColor];}
            break;
            case 2008:
        {
            self.view.backgroundColor = [UIColor brownColor];
        }
            break;
        default:
            break;
    }
    
}

-(BOOL)getNavigationBar
{
    navigationBar = [[JmNavigationBar alloc]init:self.view :self :@selector(leftButtonPress:) :@selector(rightButtonPress:) :self];
    [self.view addSubview:navigationBar];
    return YES;
}
-(void)leftButtonPress:(id)sender
{
    JmHistoryViewController *historyViewController = [[JmHistoryViewController alloc]init];
    [self presentViewController:historyViewController animated:YES completion:nil];
}
-(void)rightButtonPress:(id)sender
{
    JmFavouritesViewController *favouriersViewController = [[JmFavouritesViewController alloc]init];
    [self presentViewController:favouriersViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;   // return NO to not become first responder
{
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar   // called when text starts editing
{
    navigationBar.historyButton.hidden = YES;
    navigationBar.favouriteButton.hidden = YES;
    [searchBar setShowsCancelButton:YES animated:YES];   //  动画显示取消按钮
    searchBar.frame = CGRectMake(0, 0, 310, 40);
}
//search按钮被按下
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{        // called when cancel button pressed
    [searchBar setShowsCancelButton:NO animated:NO];    // 取消按钮回收
    [searchBar resignFirstResponder];                                // 取消第一响应值,键盘回收,搜索结束
    [self getNavigationBar];
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
