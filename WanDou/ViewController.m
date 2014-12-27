//
//  ViewController.m
//  WanDou
//
//  Created by xyooyy on 14/11/28.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//http://blog.sina.com.cn/s/blog_a7c44c880101dzcl.html tableview and scrollview属性
//

#import "ViewController.h"
#import "JmHomePage.h"
#import "JmHistoryViewController.h"
#import "JmFavouritesViewController.h"
#import "RecipeCollectionHeaderView.h"
#define buttonWide 160
#define m_scrollView_y 100
@interface ViewController ()
<UIScrollViewDelegate,TablebarViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getNavigationBar];
    [self getScrollviewButton];
//    [self creatScrollerView:self.view];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setupViews
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageNamed:@"banner1"] tag:0];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageNamed:@"banner2"] tag:1];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageNamed:@"banner3"] tag:2];
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:@"title4" image:[UIImage imageNamed:@"banner4"] tag:4];
    
    SGFocusImageFrame *bottomImageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100.0) delegate:self focusImageItems:item1, item2, item3, item4, nil];
    bottomImageFrame.autoScrolling = YES;
    [homePage.collectionView addSubview:bottomImageFrame];
    }
#pragma mark - SGFocusImageFrameDelegate

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%@ tapped", item.title);
    
    if (item.tag == 1004) {
        [imageFrame removeFromSuperview];
    }
}
-(BOOL)getNavigationBar
{
    navigationBar = [[JmNavigationBar alloc]init:self.view :self :@selector(leftButtonPress:) :@selector(rightButtonPress:) :self];
    [self.view addSubview:navigationBar];
    return YES;
}
-(void)leftButtonPress:(id)sender
{
    JmHistoryViewController *historyViewController = [[JmHistoryViewController alloc]init];
    [self presentViewController:historyViewController animated:YES completion:nil];
}
-(void)rightButtonPress:(id)sender
{
    JmFavouritesViewController *favouriersViewController = [[JmFavouritesViewController alloc]init];
    UINavigationController *favNavCtrl = [[UINavigationController alloc]initWithRootViewController:favouriersViewController];
    [self presentViewController:favNavCtrl animated:YES completion:nil];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;   // return NO to not become first responder
{
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{          // called when text starts editing
   navigationBar.historyButton.hidden = YES;
    navigationBar.favouriteButton.hidden = YES;
    [searchBar setShowsCancelButton:YES animated:YES];   //  动画显示取消按钮
    searchBar.frame = CGRectMake(0, 0, 310, 40);
}
//search按钮被按下
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{        // called when cancel button pressed
    [searchBar setShowsCancelButton:NO animated:NO];    // 取消按钮回收
    [searchBar resignFirstResponder];                                // 取消第一响应值,键盘回收,搜索结束
    [self getNavigationBar];
}
-(void)getScrollviewButton
{
    homePage = [[JmHomePage alloc]init:self];
    homePage.frame = CGRectMake(0, 60, 320, self.view.frame.size.height - 60);
    [self.view addSubview:homePage];
}
-(void)tablebarViewDelegate:(NSInteger)tag
{
    switch (tag) {
        case 2003:
        {
            homePage.scrollView.contentOffset = CGPointMake(0, 0);
            NSLog(@"%f",homePage.scrollView.contentOffset.x);
        }
            break;
        case 2004:
        {homePage.scrollView.contentOffset = CGPointMake(320, 0);
            NSLog(@"%f",homePage.scrollView.contentOffset.x);
}
            break;
        default:
            break;
    }
    
}

//-(UIScrollView *)creatScrollerView :(UIView*)view
//{
//    m_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, m_scrollView_y, self.view.bounds.size.width, self.view.bounds.size.height)];
//    m_scrollView.contentSize  = CGSizeMake(640, 0);
//    m_scrollView.alwaysBounceVertical = NO;
//    m_scrollView.pagingEnabled = YES;
//    m_scrollView.bounces = NO;
//    m_scrollView.delegate = self;
//    [view addSubview:m_scrollView];
//    [self creatTableView];
//    [self creatCollectionView];
//    return m_scrollView;
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    homePage.line.frame = CGRectMake(buttonWide * (scrollView.contentOffset.x / 320) + 2.0f , homePage.line.frame.origin.y, buttonWide - 3.0f, homePage.line.frame.size.height);
}
//-(UIView*)creatCollectionView
//{
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    m_collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
//    m_collectionView.delegate = self;
//    m_collectionView.dataSource = self;
//    m_collectionView.backgroundColor = [UIColor whiteColor];
//    [self setupViews];
//    [m_scrollView addSubview:m_collectionView];
//    return m_collectionView;
//}
//
#pragma mark - Collection View Data Source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }
    else
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
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"HeaderView%d",indexPath.section];
    [collectionView registerClass:[RecipeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier];
    RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                   UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [self creatLabel:CGRectMake(10, 0, 80, 30) :[NSString stringWithFormat:@"header #%i", indexPath.section] :headerView];
    [self creatButton:CGRectMake(250, 0, 60, 30) :@"查看更多" :nil :headerView];
    return headerView;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={320,30};
    return size;
}
//-(UIView *)creatTableView
//{
//    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
//    m_tableView.delegate = self;
//    m_tableView.dataSource = self;
//    [m_scrollView addSubview:m_tableView];
//    return m_tableView;
//}
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
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString*)title :(SEL)press :(UIView *)view
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonframe;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:press forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return button;
}
-(UILabel *)creatLabel :(CGRect)labelFrame :(NSString *)labelText :(UIView *)view
{
    UILabel *label = [[UILabel alloc]initWithFrame:labelFrame];
    label.text = labelText;
    [view addSubview:label];
    return label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
