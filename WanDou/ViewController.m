//
//  ViewController.m
//  WanDou
//
//  Created by xyooyy on 14/11/28.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//http://blog.sina.com.cn/s/blog_a7c44c880101dzcl.html tableview and scrollview属性
//

#import "ViewController.h"
#import "TablebarView.h"
#import "HomePage.h"
#import "HomePageScrollView.h"
#import "JmHistoryViewController.h"
#import "JmFavouritesViewController.h"
#define buttonwide 50
#define m_scrollView_y 44
@interface ViewController ()
<UIScrollViewDelegate,TablebarViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setToolbarHidden:NO];
    [self creatSearchBar];
    [self creatScrollerView:self.view];
//    [self getScrollView];
//    m_scrollView.contentOffset = CGPointMake(320, 65);
//    [self getHomePageView];
    [self toolBarItems];
    [self creatTabbarscrollView:self.view];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)getHomePageView
{
    m_homePage = [[HomePage alloc]init:self.view];
    [self.view addSubview:m_homePage];
    HomePage *homepage = [[HomePage alloc]init];
    [homepage.selected addTarget:self action:@selector(selectedPress:) forControlEvents:UIControlEventTouchDragInside];
    [homepage.follow addTarget:self action:@selector(followPress:) forControlEvents:UIControlEventTouchDragInside];
}
-(void)selectedPress:(id)sender
{
    m_scrollView.contentOffset = CGPointMake(0, 0);
}
-(void)followPress:(id)sender
{
    m_scrollView.contentOffset = CGPointMake(320, 0);
}
-(UIBarButtonItem*)creatLeftBarButtonItem
{
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(doClickLeftButton:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    return leftBarButtonItem;
}
-(void)doClickLeftButton:(id)sender
{
    
}
-(UISearchBar *)creatSearchBar
{
    m_searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(25, 0, 250, 40)];
    m_searchBar.searchBarStyle = UISearchBarStyleMinimal;
    m_searchBar.placeholder = @"搜索";
    m_searchBar.delegate = self;
    UIView* searchBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 310, 40)];
    [searchBar addSubview:m_searchBar];
    self.navigationItem.titleView = searchBar;
    leftButton = [self creatButton:CGRectMake(0, 10, 20, 20) :@"sa" :@selector(leftButtonPress:)];
    rightButton = [self creatButton:CGRectMake(280, 10, 20, 20) :@"ve" :@selector(rightButtonPress:)];
    [searchBar addSubview:rightButton];
    [searchBar addSubview:leftButton];
    return m_searchBar;
}
-(void)leftButtonPress:(id)sender
{
    leftButton.highlighted = YES;
    JmHistoryViewController *historyViewController = [[JmHistoryViewController alloc]init];
    [self presentViewController:historyViewController animated:YES completion:nil];
}
-(void)rightButtonPress:(id)sender
{
    JmFavouritesViewController *favouriersViewController = [[JmFavouritesViewController alloc]init];
    [self presentViewController:favouriersViewController animated:YES completion:nil];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;   // return NO to not become first responder
{
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{          // called when text starts editing
    leftButton.hidden = YES;
    rightButton.hidden = YES;
    [m_searchBar setShowsCancelButton:YES animated:YES];   //  动画显示取消按钮
    m_searchBar.frame = CGRectMake(0, 0, 310, 40);
//    m_searchBar.showsScopeBar =YES;
//    m_searchBar.selectedScopeButtonIndex = 3;
//    m_searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"iOS",@"Android",@"iPhone",nil];
}
//search按钮被按下
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{        // called when cancel button pressed
    [m_searchBar setShowsCancelButton:NO animated:NO];    // 取消按钮回收
    [m_searchBar resignFirstResponder];                                // 取消第一响应值,键盘回收,搜索结束
    [self creatSearchBar];
}
-(UIScrollView *)creatTabbarscrollView:(UIView *)view
{
    _tabbarScrollView = [[UIScrollView alloc]init];
    _tabbarScrollView.frame = CGRectMake(0, 60, 320, 44);
    _tabbarScrollView.contentSize = CGSizeMake(320, 0);
    _tabbarScrollView.delegate=self;
    [view addSubview:_tabbarScrollView];
    [self editTableBar:_tabbarScrollView];
    return _tabbarScrollView;
}
-(BOOL)editTableBar:(UIView *)view
{
    //给滚动视图添加tableBar
    TablebarView * tableBar = [[TablebarView alloc]init];
    tableBar.frame = CGRectMake(0, 0, 380, 44);
    tableBar.button1.backgroundColor = [UIColor purpleColor];
    [tableBar.button1 setTitle:@"精选" forState:UIControlStateNormal];
    tableBar.button2.backgroundColor = [UIColor blueColor];
    [tableBar.button2 setTitle:@"追追看" forState:UIControlStateNormal];
    tableBar.delegate = self;
    [view addSubview:tableBar];
    return YES;
}
-(void)tablebarViewDelegate:(NSInteger)tag
{
    switch (tag) {
        case 2013:
        {
            m_scrollView.contentOffset = CGPointMake(0, -65);
        }
            break;
        case 2014:
        {m_scrollView.contentOffset = CGPointMake(320, -65);}
            break;
        default:
            break;
    }
    
}
-(UIScrollView *)creatScrollerView :(UIView*)view
{
    m_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, m_scrollView_y, self.view.bounds.size.width, self.view.bounds.size.height)];
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
    m_collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
    m_collectionView.delegate = self;
    m_collectionView.dataSource = self;
    m_collectionView.backgroundColor = [UIColor whiteColor];
    [m_scrollView addSubview:m_collectionView];
    return m_collectionView;
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
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
//        label.text = [[NSString alloc]initWithFormat:@"Recipe Group #%i", indexPath.section + 1];
//        [headerView addSubview:label];
//    return headerView;
//}
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    NSString *reuseIdentifier = @"headercell";
//    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
//        label.text = [NSString stringWithFormat:@"这是header:%d",indexPath.section];
//        [view addSubview:label];
//        
//    }
//        return view;
//}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={320,45};
    return size;
}
//返回头footerView的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    CGSize size={320,45};
//    return size;
//}
-(UIView *)creatTableView
{
    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [m_scrollView addSubview:m_tableView];
    return m_tableView;
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

-(BOOL)toolBarItems
{
    UIButton *homePage = [self creatButton:CGRectMake(0, 0, buttonwide, 30) :@"首页" :@selector(homePagePress:)];
    UIButton *TV = [self creatButton:CGRectMake(buttonwide, 0, buttonwide, 30) :@"电视剧" :@selector(TVPress:)];
    UIButton *movie = [self creatButton:CGRectMake(buttonwide*2, 0, buttonwide, 30) :@"电影" :@selector(moviePress:)];
    UIButton *animation = [self creatButton:CGRectMake(buttonwide*3, 0, buttonwide, 30) :@"动漫" :@selector(animationPress:)];
    UIButton *variety = [self creatButton:CGRectMake(buttonwide*4, 0, buttonwide, 30) :@"综艺" :@selector(varietyPress:)];
    UIBarButtonItem *homePageButton = [[UIBarButtonItem alloc]initWithCustomView:homePage];
    UIBarButtonItem *TVButton = [[UIBarButtonItem alloc]initWithCustomView:TV];
    UIBarButtonItem *movieButton = [[UIBarButtonItem alloc]initWithCustomView:movie];
    UIBarButtonItem *animationButton = [[UIBarButtonItem alloc]initWithCustomView:animation];
    UIBarButtonItem *varietyButton = [[UIBarButtonItem alloc]initWithCustomView:variety];
    [self setToolbarItems:[NSArray arrayWithObjects: homePageButton, TVButton, movieButton, animationButton, varietyButton, nil]];
    return YES;
}
-(void)homePagePress:(id)sender
{

}
-(void)TVPress:(id)sender
{

}
-(void)moviePress:(id)sender
{

}
-(void)animationPress:(id)sender
{

}
-(void)varietyPress:(id)sender
{

}
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString*)title :(SEL)press
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonframe;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:press forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(BOOL)showsVerticalScrollIndicator:(UIScrollView*)scrollView
{
    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
