//
//  XWScoreView.h
//  XWNewWidgetDemo
//
//  Created by 王剑石 on 2017/11/21.
//  Copyright © 2017年 wangjianshi. All rights reserved.
//

#import "YYLabel.h"
#import "XWSourceMaker.h"
@class XWScoreView;

@protocol XWScoreViewDelegate <NSObject>

-(void)scoreView:(XWScoreView *)view didSelectScoreViewAtIndex:(NSInteger)score;

@end


@interface XWScoreView : YYLabel

@property (nonatomic,strong) XWSourceMaker *maker;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic,assign) BOOL canEdit;

@property (nonatomic, weak) id<XWScoreViewDelegate> delegate;


-(instancetype)initWithFrame:(CGRect)frame maker:(XWSourceMaker *)maker;


@end
