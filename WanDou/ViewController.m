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
    [self getScrollview];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - SGFocusImageFrameDelegate

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%d",item.tag);
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
-(void)getScrollview
{
    homePage = [[JmHomePage alloc]init:self];
    homePage.frame = CGRectMake(0, 60, 320, self.view.frame.size.height - 60);
    homePage.delegate = self;
    [self.view addSubview:homePage];
}
-(void)tablebarViewDelegate:(NSInteger)tag
{
    switch (tag) {
        case 2003:
        {
            homePage.scrollView.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 2004:
        {homePage.scrollView.contentOffset = CGPointMake(320, 0);
}
            break;
        default:
            break;
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    homePage.line.frame = CGRectMake(buttonWide * (scrollView.contentOffset.x / 320) + 2.0f , homePage.line.frame.origin.y, buttonWide - 3.0f, homePage.line.frame.size.height);
}
#pragma mark - Collection View Data Source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(320, 100);
    }
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
    if (section == 0) {
        CGSize size={0,0};
        return size;
    }
    CGSize size={320,30};
    return size;
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
