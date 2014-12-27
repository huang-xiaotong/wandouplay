//
//  JmTVViewController.h
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JmNavigationBar.h"
#import "JmTV.h"
@interface JmTVViewController : UIViewController
<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    UINavigationBar *m_navigationBar;
    JmNavigationBar *navigationBar;
    JmTV *TVTabbar;
}
@end
