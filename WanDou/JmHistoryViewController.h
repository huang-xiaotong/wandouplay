//
//  JmHistoryViewController.h
//  WanDou
//
//  Created by xyooyy on 14/12/5.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JmHistoryViewController : UIViewController
<UIScrollViewDelegate>
{
    UINavigationBar *navigationBar;
    NSTimer *myTimer;
}
@property (nonatomic, strong) UIScrollView *readCannelScrollView;
@property (nonatomic, strong) UILabel *pageOneView;
@property (nonatomic, strong) UILabel *pageTwoView;
@property (nonatomic, strong) UILabel *pageThreeView;
@end
