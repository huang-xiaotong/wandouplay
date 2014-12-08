//
//  ScrollView.m
//  WanDou
//
//  Created by xyooyy on 14/11/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "TablebarView.h"
#define kScreenHeight  (kIsIphone5 ? 548 : 460)
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define STEP 2
#define BarSection ([UIScreen mainScreen].bounds.size.width)/STEP
@implementation TablebarView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        //button是按照从左到右的顺序排列的
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(0, 0,BarSection, 44);
        [_button1 addTarget:self action:@selector(tableBarDelegate:) forControlEvents:UIControlEventTouchUpInside];
        _button1.tag = 2013;
        [self addSubview:_button1];
        
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button2.frame = CGRectMake(BarSection, 0,BarSection, 44);
        [_button2 addTarget:self action:@selector(tableBarDelegate:) forControlEvents:UIControlEventTouchUpInside];
        _button2.tag = 2014;
        [self addSubview:_button2];
        
        // Initialization code
    }
    return self;
}
-(void)tableBarDelegate:(UIButton *)buttonTag
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
