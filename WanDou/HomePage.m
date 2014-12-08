//
//  HomePage.m
//  WanDou
//
//  Created by xyooyy on 14/12/6.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "HomePage.h"
#import "TablebarView.h"
#define m_scrollView_y 104
//@interface ()
//<UIScrollViewDelegate,TablebarViewDelegate>
//@end
@implementation HomePage
@synthesize selected;
@synthesize follow;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init:(UIView*)view
{
    self = [super init];
    if (self) {
        [self creatScrollerView:view];
        [self creattabberscrollview:view];
    }
    return self;
}
-(UIScrollView *)creattabberscrollview:(UIView *)view
{
    m_tabbarScrollView = [[UIScrollView alloc]init];
    m_tabbarScrollView.frame = CGRectMake(0, 60, 320, 44);
    m_tabbarScrollView.contentSize = CGSizeMake(320, 0);
    m_tabbarScrollView.contentOffset = CGPointMake(0, 0);
//    m_tabbarScrollView.showsVerticalScrollIndicator = NO;
    m_tabbarScrollView.backgroundColor = [UIColor blueColor];
    [view addSubview:m_tabbarScrollView];
    [self creatSelectedButton:m_tabbarScrollView];
    [self creattabberscrollview:m_tabbarScrollView];
    return m_tabbarScrollView;
}
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonframe;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
-(UIButton *)creatSelectedButton:(UIView *)view
{
    selected = [self creatButton:CGRectMake(0, 0, 160, 44) :@"精选"];
    selected.backgroundColor = [UIColor redColor];
    [view addSubview:selected];
    return selected;
}
-(UIButton *)creatFollowButton:(UIView*)view
{
    follow = [self creatButton:CGRectMake(160, 0, 160, 44) :@"追追看"];
    [view addSubview:follow];
    return follow;
}
-(void)selectedPress:(id)sender
{
    m_scrollView.contentOffset = CGPointMake(0, 0);
}
-(void)followPress:(id)sender
{
    m_scrollView.contentOffset = CGPointMake(320, 0);
}
-(UIScrollView *)creatScrollerView :(UIView*)view
{
    m_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, m_scrollView_y, 320, 460)];
    m_scrollView.contentSize  = CGSizeMake(640, 0);
    m_scrollView.alwaysBounceVertical = NO;
    m_scrollView.pagingEnabled = YES;
    m_scrollView.bounces = NO;
    [view addSubview:m_scrollView];
    [self creatTableView];
    [self creatCollectionView];
    return m_scrollView;
}
-(UIView*)creatCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //    layout.headerReferenceSize = CGSizeMake(320, 30);
    m_collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
    m_collectionView.delegate = self;
    m_collectionView.dataSource = self;
    m_collectionView.backgroundColor = [UIColor whiteColor];
    [m_scrollView addSubview:m_collectionView];
    return m_collectionView;
}
-(UIView *)creatTableView
{
    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [m_scrollView addSubview:m_tableView];
    return m_tableView;
}
#pragma mark - Collection View Data Source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 190);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    [m_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor lightTextColor];
    }
    return cell;
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
