//
//  HomePageScrollView.h
//  WanDou
//
//  Created by xyooyy on 14/12/6.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageScrollView : UIScrollView
<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *m_scrollView;
    UICollectionView *m_collectionView;
    UITableView *m_tableView;
    
    
}
-(id)init:(UIView *)View;
@end
