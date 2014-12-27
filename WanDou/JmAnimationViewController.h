//
//  JmAnimationViewController.h
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JmNavigationBar.h"

@interface JmAnimationViewController : UIViewController
<UIScrollViewDelegate>
{
    UINavigationBar *m_navigationBar;
    JmNavigationBar *navigationBar;
}
@end
