//
//  XWScoreView.m
//  XWNewWidgetDemo
//
//  Created by serein on 2017/11/21.
//  Copyright © 2017年 wangjianshi. All rights reserved.
//

#import "XWScoreView.h"
#import <UIKit/UIKit.h>
#import "YYImage.h"
#import "NSAttributedString+YYText.h"

@interface XWScoreView ()

@end

@implementation XWScoreView

-(instancetype)initWithFrame:(CGRect)frame maker:(XWSourceMaker *)maker{
    
    if (self = [super initWithFrame:frame]) {
        
        self.maker = maker;
        self.displaysAsynchronously = YES;
        self.fadeOnAsynchronouslyDisplay = NO;
        [self creatScoreAttr];
    }
    return self;
}



#pragma mark - private

-(void)creatScoreAttr{
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:0];
    for (int i = 0; i < self.maker.maxValue; i++) {
        
        UIImage *image = [UIImage imageNamed:self.maker.defaultImage];
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeLeft attachmentSize:CGSizeMake(image.size.width + self.maker.space, image.size.height) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        
        [text appendAttributedString:attachText];
    }
    
    self.attributedText = text;
    
}

#pragma mark -
#pragma mark   添加点击事件管理
-(void)addTapAction{
    
    __weak typeof(&*self) weakSelf = self;
    YYTextHighlight *highlight = [YYTextHighlight new];

    highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        
        
        NSLog(@"%ld-%ld",range.location,range.length);
        
         weakSelf.score = arc4random() % 5;
    };
    [(NSMutableAttributedString *)self.attributedText yy_setTextHighlight:highlight range:self.attributedText.yy_rangeOfAll];

}

-(void)removeTapAction{
    
     [(NSMutableAttributedString *)self.attributedText yy_setTextHighlight:nil range:self.attributedText.yy_rangeOfAll];
}


#pragma mark -
#pragma mark   set/get

-(void)setCanEdit:(BOOL)canEdit{
    
    _canEdit = canEdit;
    if (_canEdit) {
        
        [self addTapAction];
    }else{
        
        [self removeTapAction];
    }
    
}

-(void)setScore:(NSInteger)score{
    
    if (_score == score)
    {
        return;
    }
    _score = score;
    //获取图片资源
    NSArray *attachments =  self.textLayout.attachments;
    for (int i = 0; i < attachments.count; i++) {
        YYTextAttachment *attachment = attachments[i];
        attachment.content = [UIImage imageNamed:i < _score ? self.maker.selectImage : self.maker.defaultImage];
    }

}

@end
