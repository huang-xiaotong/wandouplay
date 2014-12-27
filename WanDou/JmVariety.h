//
//  JmVariety.h
//  WanDou
//
//  Created by xyooyy on 14/12/18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TablebarViewDelegate <NSObject>
-(void)tablebarViewDelegate:(NSInteger)tag;
@end
@interface JmVariety : UIView
{
    UIScrollView *m_scrollViewButton;
}
@property(nonatomic ,strong) id<TablebarViewDelegate>delegate;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;


@end
