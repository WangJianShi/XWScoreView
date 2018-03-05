//
//  XWScoreView.h
//  XWNewWidgetDemo
//
//  Created by serein on 2017/11/21.
//  Copyright © 2017年 wangjianshi. All rights reserved.
//

#import "YYLabel.h"
#import "XWSourceMaker.h"


@interface XWScoreView : YYLabel

@property (nonatomic,strong) XWSourceMaker *maker;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic,assign) BOOL canEdit;


-(instancetype)initWithFrame:(CGRect)frame maker:(XWSourceMaker *)maker;


@end
