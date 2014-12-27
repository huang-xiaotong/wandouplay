//
//  JmTV.h
//  WanDou
//
//  Created by xyooyy on 14/12/17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TablebarViewDelegate <NSObject>
-(void)tablebarViewDelegate:(NSInteger)tag;
@end
@interface JmTV : UIView
{
    id viewDelegate;
}
@property(nonatomic ,strong) id<TablebarViewDelegate>delegate;
@property (nonatomic, strong) UITableView *classifyTableview;
@property (nonatomic, strong) UITableView *choiceTableview;
@property (nonatomic, strong) UITableView *AmericandramaTableview;
@property (nonatomic, strong) UITableView *koreanTableview;
@property (nonatomic, strong) UICollectionView *followCollection;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *scrollViewButton;
@property (nonatomic, strong) UIView *line;
-(id)init :(id)viewdelegate;
- (void)showLineWithButtonWidth:(CGFloat)width;
@end
