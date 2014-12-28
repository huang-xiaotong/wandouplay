//
//  JmTVViewController.m
//  WanDou
//
//  Created by xyooyy on 14/12/15.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmTVViewController.h"
#import "JmNavigationBar.h"
#import "JmFavouritesViewController.h"
#import "JmHistoryViewController.h"
#import "JmTV.h"
#import "RecipeCollectionHeaderView.h"
#define buttonWide 80
@interface JmTVViewController ()
<UIScrollViewDelegate,TablebarViewDelegate>
@end

@implementation JmTVViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getNavigationBar];
    [self getScrollview];
    // Do any additional setup after loading the view.
}
-(void)getScrollview
{
    TVTabbar = [[JmTV alloc]init:self];
    TVTabbar.frame = CGRectMake(0, 60, 320, self.view.bounds.size.height);
    TVTabbar.delegate = self;
    [self.view addSubview:TVTabbar];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == TVTabbar.choiceTableview)
    {
        return 110.0f;
    }
    else if (tableView == TVTabbar.classifyTableview)
    {
        return 80;
    }
        else
    return 50.0f;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    TVTabbar.line.frame = CGRectMake(buttonWide * (scrollView.contentOffset.x / 320) + 2.0f , TVTabbar.line.frame.origin.y, buttonWide - 3.0f, TVTabbar.line.frame.size.height);
    if (scrollView.contentOffset.x >= 960) {
        TVTabbar.scrollViewButton.contentOffset = CGPointMake(80, 0);
    }
    else
        TVTabbar.scrollViewButton.contentOffset = CGPointMake(0, 0);
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
-(void)tablebarViewDelegate:(NSInteger)tag
{ 
    switch (tag) {
        case 2003:
        {
            TVTabbar.scrollView.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 2004:
        {
            TVTabbar.scrollView.contentOffset = CGPointMake(320, 0);
        }
            break;
            case 2005:
        {
            TVTabbar.scrollView.contentOffset = CGPointMake(640, 0);
        }
            break;
            case 2006:
        {
            TVTabbar.scrollView.contentOffset = CGPointMake(960, 0);
        }
            break;
            case 2007:
        {
            TVTabbar.scrollView.contentOffset = CGPointMake(1280, 0);
        }
            break;
        default:
            break;
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
    [self presentViewController:favouriersViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;   // return NO to not become first responder
{
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar   // called when text starts editing
{
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
