//
//  ScrollView.m
//  WanDou
//
//  Created by xyooyy on 14/11/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmHomePage.h"
#import "SGFocusImageFrame.h"
#define STEP 2
#define buttonwide ([UIScreen mainScreen].bounds.size.width)/STEP
#define scrollview_hight 420
#define buttonhight 40
@implementation JmHomePage
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init :(id)Delegate
{
    self = [super init];
    if (self) {
        [self creatScrollviewButton];
        [self creatScrollerView];
        [self setupViews:Delegate];
        _scrollView.delegate = Delegate;
        _collectionView.delegate = Delegate;
        _collectionView.dataSource = Delegate;
        m_tableView.delegate = Delegate;
        m_tableView.dataSource = Delegate;
    }
    return self;
}
-(UIScrollView *)creatScrollerView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, buttonhight, 320, scrollview_hight)];
    _scrollView.contentSize  = CGSizeMake(640, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    [self creatTableView];
    [self creatCollectionView];
    return _scrollView;
}
-(UIView*)creatCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, scrollview_hight) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_collectionView];
    return _collectionView;
}
- (void)setupViews :(id)focusDelegate
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageNamed:@"banner1"] tag:0];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageNamed:@"banner2"] tag:1];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageNamed:@"banner3"] tag:2];
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:@"title4" image:[UIImage imageNamed:@"banner4"] tag:4];
    SGFocusImageFrame *bottomImageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 5, 320, 100.0) delegate:focusDelegate focusImageItems:item1, item2, item3, item4, nil];
    bottomImageFrame.autoScrolling = YES;
    [_collectionView addSubview:bottomImageFrame];
}

-(UIView *)creatTableView
{
    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, scrollview_hight) style:UITableViewStylePlain];
    [_scrollView addSubview:m_tableView];
    return m_tableView;
}

-(UIScrollView *)creatScrollviewButton
{
    _scrollViewButton = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, buttonhight)];
    _scrollViewButton.contentOffset = CGPointMake(0, 0);
    _scrollViewButton.contentSize = CGSizeMake(320, 0);
    _scrollViewButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:_scrollViewButton];
    [self buttonarray];
    [self showLineWithButtonWidth:160];
    return _scrollViewButton;
}
- (void)showLineWithButtonWidth:(CGFloat)width
{
    _line = [[UIView alloc] initWithFrame:CGRectMake(2.0f, 40 - 3.0f, width - 4.0f, 3.0f)];
    _line.backgroundColor = [UIColor colorWithRed:20.0f/255 green:80.0f/255 blue:200.0f/255 alpha:0.7];
    [_scrollViewButton addSubview:_line];
}
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString *)buttontitle :(int)buttontag :(UIView *)view :(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonframe;
    [button setTitle:buttontitle forState:UIControlStateNormal];
    button.tag = buttontag;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)buttonarray
{
    _button1 = [self creatButton:CGRectMake(buttonwide * 0, 0, buttonwide, buttonhight) :@"精选" :2003 :_scrollViewButton :@selector(buttonPress:)];
    _button2 = [self creatButton:CGRectMake(buttonwide * 1, 0, buttonwide, buttonhight) :@"追追看" :2004 :_scrollViewButton :@selector(buttonPress:)];
    }
-(void)buttonPress:(UIButton *)buttonTag
{
    [delegate tablebarViewDelegate:buttonTag.tag];
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
