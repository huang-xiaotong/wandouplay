//
//  ViewController.h
//  WanDou
//
//  Created by xyooyy on 14/11/28.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JmNavigationBar.h"
#import "JmHomePage.h"
#import "SGFocusImageFrame.h"
#define ViewNumber 3
@interface ViewController : UIViewController
<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,SGFocusImageFrameDelegate,TablebarViewDelegate>
{
    JmNavigationBar *navigationBar;
    JmHomePage *homePage;
}
@end
