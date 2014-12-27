//
//  JmNavigationBar.m
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmNavigationBar.h"

@implementation JmNavigationBar
@synthesize searchBar;
@synthesize historyButton;
@synthesize favouriteButton;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init :(UIView *)view :(id)target :(SEL)historyPress :(SEL)favouritePress :(id)searchBarDeleget
{
    self = [super init];
    if (self) {
        [self creatNavigationBar:view :target :historyPress :favouritePress];
        m_searchBar.delegate = searchBarDeleget;
    }
    return self;
}
-(UINavigationBar *)creatNavigationBar :(UIView *)view :(id)target :(SEL)historyPress :(SEL)favouritePress
{
    navigationBar = [[UINavigationBar alloc]init];
    navigationBar.frame = CGRectMake(0, 0, 320, 60);
    navigationBar.tintColor = [UIColor colorWithRed:59.0/255 green:120.0/255 blue:220.0/255 alpha:1];
    navigationBar.backgroundColor = [UIColor greenColor];
    [view addSubview:navigationBar];
    [self creatSearchBar:target :historyPress :favouritePress];
    return navigationBar;
}
-(UIView *)creatSearchBar :(id)target :(SEL)historyPress :(SEL)favouritePress
{
    m_searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(35, 0, 250, 40)];
    m_searchBar.searchBarStyle = UISearchBarStyleMinimal;
    m_searchBar.placeholder = @"搜索";
     searchBar = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 40)];
    [searchBar addSubview:m_searchBar];
    [navigationBar addSubview:searchBar];
    [searchBar addSubview:[self historybutton:target :historyPress]];
    [searchBar addSubview:[self favouritebutton:target :favouritePress]];
    return searchBar;
}
-(UIButton *)historybutton :(id)target :(SEL)historyPress
{
    historyButton = [self creatButton:CGRectMake(0, 10, 40, 20) :@"记录" :searchBar :target :historyPress];
    return historyButton;
}
-(UIButton *)favouritebutton :(id)target :(SEL)favouritePress
{
    self.favouriteButton = [self creatButton:CGRectMake(280, 10, 40, 20) :@"收藏" :searchBar :target :favouritePress];
    return self.favouriteButton;
}
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString*)title :(UIView *)view :(id)target :(SEL)buttonPress
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonframe;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:buttonPress forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return button;
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
