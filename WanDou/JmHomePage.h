//
//  ScrollView.h
//  WanDou
//
//  Created by xyooyy on 14/11/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol TablebarViewDelegate <NSObject>
-(void)tablebarViewDelegate:(NSInteger)tag;
@end

@interface JmHomePage : UIView
{
//    UIScrollView *m_scrollView;
    UITableView *m_tableView;
}
@property(nonatomic ,strong) id<TablebarViewDelegate>delegate;
@property(nonatomic ,strong) UIButton * button1;
@property(nonatomic ,strong) UIButton * button2;
@property (nonatomic, strong) UIScrollView *scrollViewButton;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *line;
-(id)init :(id)Delegate;
@end