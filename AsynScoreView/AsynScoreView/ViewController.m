//
//  ViewController.m
//  AsynScoreView
//
//  Created by 王剑石 on 2018/3/5.
//  Copyright © 2018年 wangjianshi. All rights reserved.
//

#import "ViewController.h"
#import "XWScoreView.h"

@interface ViewController ()<XWScoreViewDelegate>

@property (nonatomic, strong) XWScoreView *scoreView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUI{
    
    [self.view addSubview:self.scoreView];
    self.scoreView.canEdit = YES;
    self.scoreView.score = 4;
}

#pragma mark - Delegate

-(void)scoreView:(XWScoreView *)view didSelectScoreViewAtIndex:(NSInteger)score{
    
    self.scoreView.score = score;
}

-(XWScoreView *)scoreView{
    
    if (_scoreView == nil) {
        
        XWSourceMaker *maker = [[XWSourceMaker alloc] init];
        maker.defaultImage = @"goods_score_empt";
        maker.selectImage = @"goods_score_full";
        maker.space = 10;
        _scoreView = [[XWScoreView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 30) maker:maker];
        _scoreView.delegate = self;
    }
    return _scoreView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
