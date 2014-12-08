//
//  HomePage.h
//  WanDou
//
//  Created by xyooyy on 14/12/6.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePage : UIView
<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UITabBarDelegate>
{
    UIScrollView *m_scrollView;
    UICollectionView *m_collectionView;
    UITableView *m_tableView;
    UIScrollView *m_tabbarScrollView;
}
@property(nonatomic ,retain) UIButton *selected;
@property(nonatomic ,retain) UIButton *follow;
//@property(nonatomic ,strong) UIScrollView * tabbarScrollView;
-(id)init:(UIView*)view;
@end
