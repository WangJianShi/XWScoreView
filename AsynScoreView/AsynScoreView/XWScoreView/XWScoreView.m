//
//  XWScoreView.m
//  XWNewWidgetDemo
//
//  Created by 王剑石 on 2017/11/21.
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
    
     __weak typeof(self) weakSelf = self;
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:0];
    for (int i = 0; i < self.maker.maxValue; i++) {
        
        UIImage *image = [UIImage imageNamed:self.maker.defaultImage];
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeLeft attachmentSize:CGSizeMake(image.size.width , image.size.height) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        
        [text appendAttributedString:attachText];
        [text appendAttributedString:[self creatEmptyAttributeString:self.maker.space]];
        [text yy_setTextHighlightRange:NSMakeRange(MAX(0, i*2), 1) color:nil backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {

            if (weakSelf.canEdit && weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(scoreView:didSelectScoreViewAtIndex:)]) {
                [weakSelf.delegate scoreView:weakSelf didSelectScoreViewAtIndex:range.location/2 + 1];
            }
        }];
    }
    
    self.attributedText = text;
    
}

-(NSMutableAttributedString *)creatEmptyAttributeString:(CGFloat)width{
    
    NSMutableAttributedString *spaceText = [NSMutableAttributedString yy_attachmentStringWithContent:[[UIImage alloc]init] contentMode:UIViewContentModeScaleToFill attachmentSize:CGSizeMake(width, 0.001) alignToFont:[UIFont systemFontOfSize:0] alignment:YYTextVerticalAlignmentCenter];
    
    return spaceText;
    
}



-(void)setScore:(NSInteger)score{
    
    if (_score == score){return;}
    _score = score;
    //获取图片资源
    NSArray *attachments =  self.textLayout.attachments;
    for (int i = 0; i < attachments.count; i+=2) {
        YYTextAttachment *attachment = attachments[i];
        attachment.content = [UIImage imageNamed:i <= (_score - 1) * 2 ? self.maker.selectImage : self.maker.defaultImage];
    }

}

@end
