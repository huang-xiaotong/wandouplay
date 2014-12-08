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

@interface TablebarView : UIView
@property(nonatomic ,strong) id<TablebarViewDelegate>delegate;
@property(nonatomic ,strong) UIButton * button1;
@property(nonatomic ,strong) UIButton * button2;

@end