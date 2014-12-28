//
//  JmTV.m
//  WanDou
//
//  Created by xyooyy on 14/12/17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmTV.h"
#define scrollview_hight 40
#define STEP 4
#define buttonwide ([UIScreen mainScreen].bounds.size.width)/STEP
#define buttonhight 40
#define view_hight 460
@implementation JmTV
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                // Initialization code
    }
    return self;
}
-(id)init :(id)viewdelegate
{
    self = [super init];
    if (self) {
        [self creatViewScrollView];
        [self creatTabbarScrollview];
        _classifyTableview.delegate = viewdelegate;
        _classifyTableview.dataSource = viewdelegate;
        _choiceTableview.delegate = viewdelegate;
        _choiceTableview.dataSource = viewdelegate;
        _followCollection.dataSource = viewdelegate;
        _followCollection.delegate = viewdelegate;
        _scrollView.delegate = viewdelegate;
    }
    return self;
}
-(UIScrollView *)creatViewScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, 320, view_hight)];
    _scrollView.contentSize = CGSizeMake(1600, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    [self creatClassifyTableview];
    [self creatchoiceTableview];
    [self creatfollowplayTableview];
    [self creatkoreanTableview];
    [self creatAmericandramaTableview];
    return _scrollView;
}
-(UITableView *)creatClassifyTableview
{
    _classifyTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, view_hight) style:UITableViewStylePlain];
    _classifyTableview.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_classifyTableview];
    return _classifyTableview;
}
-(UITableView *)creatchoiceTableview
{
    _choiceTableview = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, view_hight) style:UITableViewStylePlain];
    [_scrollView addSubview:_choiceTableview];
    return _choiceTableview;
}
-(UITableView *)creatAmericandramaTableview
{
    _AmericandramaTableview = [[UITableView alloc]initWithFrame:CGRectMake(640, 0, 320, view_hight) style:UITableViewStylePlain];
    [_scrollView addSubview:_AmericandramaTableview];
    return _AmericandramaTableview;
}
-(UITableView *)creatkoreanTableview
{
    _koreanTableview = [[UITableView alloc]initWithFrame:CGRectMake(960, 0, 320, view_hight) style:UITableViewStylePlain];
    [_scrollView addSubview:_koreanTableview];
    return _koreanTableview;
}
-(UICollectionView *)creatfollowplayTableview
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _followCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(1280, 0, 320, view_hight) collectionViewLayout:layout];
    _followCollection.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_followCollection];
    return _followCollection;
}
-(UIScrollView *)creatTabbarScrollview
{
    _scrollViewButton = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, scrollview_hight)];
    _scrollViewButton.contentOffset = CGPointMake(0, 0);
    _scrollViewButton.contentSize = CGSizeMake(400, 0);
    _scrollViewButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:_scrollViewButton];
    [self buttonarray];
    [self showLineWithButtonWidth:buttonwide];
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
    UIButton *button1 = [self creatButton:CGRectMake(buttonwide * 0, 0, buttonwide, buttonhight) :@"分类" :2003 :_scrollViewButton :@selector(buttonPress:)];
    UIButton *button2 = [self creatButton:CGRectMake(buttonwide * 1, 0, buttonwide, buttonhight) :@"精选" :2004 :_scrollViewButton :@selector(buttonPress:)];
    UIButton *button3 = [self creatButton:CGRectMake(buttonwide * 2, 0, buttonwide, buttonhight) :@"美剧" :2005 :_scrollViewButton :@selector(buttonPress:)];
    UIButton *button4 = [self creatButton:CGRectMake(buttonwide * 3, 0, buttonwide, buttonhight) :@"韩剧" :2006 :_scrollViewButton :@selector(buttonPress:)];
    UIButton *button5 = [self creatButton:CGRectMake(buttonwide * 4, 0, buttonwide, buttonhight) :@"追新剧" :2007 :_scrollViewButton :@selector(buttonPress:)];
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
