//
//  JmNavigationBar.h
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JmNavigationBar : UINavigationBar
{
    UISearchBar *m_searchBar;
    UINavigationBar *navigationBar;
    UIButton *historyButton;
    UIButton *favouriteButton;
    UIView* searchBar;
}
@property (nonatomic, retain) UIView *searchBar;
@property UIButton *historyButton;
@property UIButton *favouriteButton;
-(id)init :(UIView *)view :(id)target :(SEL)historyPress :(SEL)favouritePress :(id)searchBarDeleget;
//-(id)init :(id)target :(SEL)historyPress :(SEL)favouritePress;
//-(UIButton *)historybutton :(id)target :(SEL)historyPress;
//-(UIButton *)favouritebutton :(id)target :(SEL)favouritePress;
@end
