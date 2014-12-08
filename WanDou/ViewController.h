//
//  ViewController.h
//  WanDou
//
//  Created by xyooyy on 14/11/28.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ViewNumber 3
@interface ViewController : UIViewController
<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *m_collectionView;
    UITableView *m_tableView;
    UIScrollView *m_scrollView;
    UISearchBar *m_searchBar;
    UIButton *leftButton;
    UIButton *rightButton;
    UIView *m_homePage;
}
    @property(nonatomic ,strong) UIButton * btn1;
    @property(nonatomic ,strong) UIButton * btn2;
    @property(nonatomic ,strong) UIScrollView * tabbarScrollView;
@end
