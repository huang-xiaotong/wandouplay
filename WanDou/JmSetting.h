//
//  JmSetting.h
//  WanDou
//
//  Created by xyooyy on 14/12/21.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TablebarViewDelegate <NSObject>
-(void)tablebarViewDelegate:(NSInteger)tag;
@end

@interface JmSetting : UIView
@property(nonatomic ,strong) id<TablebarViewDelegate>delegate;
@end
